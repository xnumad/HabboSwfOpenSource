package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.utils.Timer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class SpinnerCatalogWidget extends CatalogWidget
    {
        private static const _Str_18462:int = 75;
        private static const _Str_14344:int = 35;

        private var _catalog:HabboCatalog;
        private var _value:int = 1;
        private var _minValue:int = 1;
        private var _maxValue:int = 100;
        private var _spinTimer:Timer;
        private var _moreButtonDown:Boolean = false;
        private var _lessButtonDown:Boolean = false;
        private var _ignoreNextClickEvent:Boolean = false;
        private var _holdStartedAt:int = 1;
        private var _skipSteps:Array;
        private var _promoInfo:IWindow;

        public function SpinnerCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            this._skipSteps = new Array(0);
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._spinTimer != null)
                {
                    this._spinTimer.stop();
                    this._spinTimer = null;
                }
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_RESET, this._Str_21604);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_SHOW, this._Str_10637);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_HIDE, this._Str_10890);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_SET_MAX, this._Str_19953);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_SET_MIN, this._Str_20928);
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.SPINNER);
            window.visible = false;
            if (!this._catalog._Str_7593)
            {
                return true;
            }
            window.procedure = this._Str_24619;
            var k:ITextFieldWindow = (window.findChildByName("text_value") as ITextFieldWindow);
            if (k)
            {
                k.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_22259);
            }
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_RESET, this._Str_21604);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_SHOW, this._Str_10637);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_HIDE, this._Str_10890);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_SET_MAX, this._Str_19953);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_SET_MIN, this._Str_20928);
            this._spinTimer = new Timer(_Str_18462);
            this._spinTimer.addEventListener(TimerEvent.TIMER, this._Str_22918);
            this._promoInfo = window.findChildByName("promo.info");
            return true;
        }

        private function refresh():void
        {
            var k:int;
            this._value = Math.max(this._value, this._minValue);
            this._value = Math.min(this._value, this._maxValue);
            events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._value));
            this._Str_23729(this._value.toString());
            if (this._promoInfo)
            {
                k = this._catalog.utils._Str_20487(this._value);
                window.findChildByName("discountContainer").visible = (k > 0);
                this._catalog.localization.registerParameter("catalog.bundlewidget.discount", "amount", k.toString());
            }
        }

        private function _Str_21604(k:CatalogWidgetSpinnerEvent):void
        {
            this._value = k.value;
            if (k._Str_21173 != null)
            {
                this._skipSteps = k._Str_21173;
            }
            this.refresh();
        }

        private function _Str_10637(k:CatalogWidgetSpinnerEvent):void
        {
            window.visible = true;
        }

        private function _Str_10890(k:CatalogWidgetSpinnerEvent):void
        {
            window.visible = false;
        }

        private function _Str_19953(k:CatalogWidgetSpinnerEvent):void
        {
            this._maxValue = k.value;
        }

        private function _Str_20928(k:CatalogWidgetSpinnerEvent):void
        {
            this._minValue = k.value;
        }

        private function _Str_22918(k:TimerEvent):void
        {
            if (disposed)
            {
                return;
            }
            this._ignoreNextClickEvent = true;
            if (this._moreButtonDown)
            {
                this._Str_18793();
                if ((this._value - this._holdStartedAt) > _Str_14344)
                {
                    this._Str_18793();
                }
            }
            if (this._lessButtonDown)
            {
                this._Str_15984();
                if ((this._holdStartedAt - this._value) > _Str_14344)
                {
                    this._Str_15984();
                }
            }
            this.refresh();
        }

        private function _Str_18793():void
        {
            var k:int = (this._value + 1);
            while (this._skipSteps.indexOf(k) != -1)
            {
                k++;
            }
            this._value = k;
        }

        private function _Str_15984():void
        {
            var k:int = (this._value - 1);
            while (this._skipSteps.indexOf(k) != -1)
            {
                k--;
            }
            this._value = k;
        }

        private function _Str_23729(k:String):void
        {
            if (_window == null)
            {
                return;
            }
            if ((_window.findChildByName("text_value") is ITextFieldWindow))
            {
                if (_window.findChildByName("text_value").caption.length > 0)
                {
                    _window.findChildByName("text_value").caption = k;
                }
            }
            else
            {
                _window.findChildByName("text_value").caption = k;
            }
        }

        private function _Str_24619(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (!k)
            {
                return;
            }
            if (((((!(k.type == WindowMouseEvent.CLICK)) && (!(k.type == WindowMouseEvent.DOWN))) && (!(k.type == WindowMouseEvent.UP))) && (!(k.type == WindowMouseEvent.UP_OUTSIDE))))
            {
                return;
            }
            switch (k.target.name)
            {
                case "button_less":
                    switch (k.type)
                    {
                        case WindowMouseEvent.DOWN:
                            this._lessButtonDown = true;
                            this._holdStartedAt = this._value;
                            this._spinTimer.start();
                            break;
                        case WindowMouseEvent.UP:
                        case WindowMouseEvent.UP_OUTSIDE:
                            this._lessButtonDown = false;
                            this._spinTimer.stop();
                            break;
                        case WindowMouseEvent.CLICK:
                            if (!this._ignoreNextClickEvent)
                            {
                                this._Str_15984();
                            }
                            this.refresh();
                            this._ignoreNextClickEvent = false;
                            break;
                    }
                    return;
                case "button_more":
                    switch (k.type)
                    {
                        case WindowMouseEvent.DOWN:
                            this._moreButtonDown = true;
                            this._holdStartedAt = this._value;
                            this._spinTimer.start();
                            break;
                        case WindowMouseEvent.UP:
                        case WindowMouseEvent.UP_OUTSIDE:
                            this._moreButtonDown = false;
                            this._spinTimer.stop();
                            break;
                        case WindowMouseEvent.CLICK:
                            if (!this._ignoreNextClickEvent)
                            {
                                this._Str_18793();
                            }
                            this.refresh();
                            this._ignoreNextClickEvent = false;
                            break;
                    }
                    return;
            }
        }

        private function _Str_22259(k:WindowKeyboardEvent):void
        {
            this._value = parseInt(k.target.caption);
            this.refresh();
        }
    }
}
