package com.sulake.habbo.ui.widget.effects
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class _Str_4860 
    {
        private const _Str_25685:int = 1000;

        private var _widget:EffectsWidget;
        private var _window:IWindowContainer;
        private var _effect:IWidgetAvatarEffect;
        private var _bar:IWindow;
        private var _maxWidth:Number;
        private var _timeLeftField:ITextWindow;
        private var _timer:Timer;
        private var _hilite:IWindow;

        public function _Str_4860(k:EffectsWidget, _arg_2:IWidgetAvatarEffect)
        {
            this._effect = _arg_2;
            this._widget = k;
            this._timer = new Timer(this._Str_25685);
            this._timer.addEventListener(TimerEvent.TIMER, this.onUpdate);
            this.update();
        }

        public function get effect():IWidgetAvatarEffect
        {
            return this._effect;
        }

        public function dispose():void
        {
            if (this._timer != null)
            {
                this._timer.stop();
                this._timer.removeEventListener(TimerEvent.TIMER, this.onUpdate);
                this._timer = null;
            }
            this._widget = null;
            this._effect = null;
            this._bar = null;
            this._timeLeftField = null;
            this._hilite = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        private function onUpdate(k:Event=null):void
        {
            var _local_2:Number;
            if (this._bar == null)
            {
                this._timer.stop();
                return;
            }
            if (this._effect.isActive)
            {
                _local_2 = (this._effect._Str_3709 / Number(this._effect.duration));
                this._bar.width = (_local_2 * this._maxWidth);
            }
            else
            {
                this._bar.width = 0;
                this._timer.stop();
            }
            this.setTimeLeft();
        }

        private function setTimeLeft():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            if (this._timeLeftField == null)
            {
                this._timeLeftField = (this._window.findChildByName("time_left") as ITextWindow);
                if (this._timeLeftField == null)
                {
                    return;
                }
            }
            if (!this._effect.isActive)
            {
                this._timeLeftField.caption = "${widgets.memenu.effects.activate}";
                return;
            }
            if (this._effect._Str_3709 > ((60 * 60) * 24))
            {
                this._timeLeftField.caption = "${widgets.memenu.effects.active.daysleft}";
                k = this._timeLeftField.text;
                _local_2 = Math.floor((this._effect._Str_3709 / ((60 * 60) * 24)));
                k = k.replace("%days_left%", _local_2);
            }
            else
            {
                this._timeLeftField.caption = "${widgets.memenu.effects.active.timeleft}";
                k = this._timeLeftField.text;
                _local_3 = this._effect._Str_3709;
                _local_4 = Math.floor((_local_3 / (60 * 60)));
                _local_5 = (Math.floor((_local_3 / 60)) % 60);
                _local_6 = (_local_3 % 60);
                _local_7 = ((_local_4 < 10) ? "0" : "");
                _local_8 = ((_local_5 < 10) ? "0" : "");
                _local_9 = ((_local_6 < 10) ? "0" : "");
                if (_local_4 > 0)
                {
                    k = k.replace("%time_left%", (((((((_local_7 + _local_4) + ":") + _local_8) + _local_5) + ":") + _local_9) + _local_6));
                }
                else
                {
                    k = k.replace("%time_left%", ((((_local_8 + _local_5) + ":") + _local_9) + _local_6));
                }
            }
            this._timeLeftField.text = k;
        }

        public function update():void
        {
            var k:XmlAsset;
            var _local_7:IWindow;
            var _local_8:IButtonWindow;
            if (!this._window)
            {
                this._window = (this._widget.windowManager.createWindow("", "", WindowType.WINDOW_TYPE_CONTAINER, HabboWindowStyle.DEFAULT, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) as IWindowContainer);
            }
            while (this._window.numChildren > 0)
            {
                _local_7 = this._window.removeChildAt(0);
                _local_7.dispose();
            }
            this._bar = null;
            this._hilite = null;
            this._timeLeftField = null;
            var _local_2:String = "";
            if (this._effect._Str_3222)
            {
                _local_2 = "memenu_effect_selected";
            }
            else
            {
                if (this._effect.isActive)
                {
                    _local_2 = "memenu_effect_unselected";
                }
                else
                {
                    _local_2 = "memenu_effect_inactive";
                }
            }
            k = (this._widget.assets.getAssetByName(_local_2) as XmlAsset);
            var _local_3:IWindowContainer = (this._widget.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            this._window.addChild(_local_3);
            var _local_4:ITextWindow = (this._window.findChildByName("effect_name") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.caption = ((("$" + "{fx_") + this._effect.type) + "}");
            }
            var _local_5:ITextWindow = (this._window.findChildByName("effect_amount") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.caption = (this._effect._Str_4225 + "");
            }
            var _local_6:IWindowContainer = (this._window.findChildByName("effect_amount_bg1") as IWindowContainer);
            if (this._effect._Str_4225 < 2)
            {
                if (_local_6 != null)
                {
                    _local_6.visible = false;
                }
            }
            if (_local_2 == "memenu_effect_inactive")
            {
                _local_8 = (this._window.findChildByName("activate_effect") as IButtonWindow);
                if (_local_8 != null)
                {
                    _local_8.addEventListener(WindowMouseEvent.CLICK, this.onMouseEvent);
                }
            }
            else
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onMouseEvent);
                if (this._effect.isActive)
                {
                    _local_3.addEventListener(WindowMouseEvent.OVER, this.onMouseEvent);
                    _local_3.addEventListener(WindowMouseEvent.OUT, this.onMouseEvent);
                }
                if (this._effect._Str_3222)
                {
                    this.setElementImage("effect_hilite", "memenu_fx_pause");
                }
                else
                {
                    this.setElementImage("effect_hilite", "memenu_fx_play");
                }
                this._hilite = this._window.findChildByName("effect_hilite");
                this._hilite.visible = false;
            }
            this.setTimeLeft();
            this._bar = this._window.findChildByName("loader_bar");
            if (this._bar != null)
            {
                this._maxWidth = this._bar.width;
                this._timer.start();
                this.onUpdate();
            }
            if (this._effect.icon)
            {
                this.setElementBitmap("effect_icon", this._effect.icon);
            }
            this._window.rectangle = _local_3.rectangle;
        }

        private function setElementBitmap(k:String, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_3 != null)
            {
                if (_local_3.bitmap)
                {
                    _local_3.bitmap.dispose();
                }
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            }
            else
            {
                Logger.log(("Could not find element: " + k));
            }
        }

        private function onMouseEvent(k:WindowMouseEvent):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.OVER:
                    if (this._hilite != null)
                    {
                        this._hilite.visible = true;
                    }
                    return;
                case WindowMouseEvent.OUT:
                    if (this._hilite != null)
                    {
                        this._hilite.visible = false;
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    this._widget._Str_25077(this._effect.type, this._effect._Str_3222);
                    return;
            }
        }

        private function setElementImage(k:String, _arg_2:String):void
        {
            var _local_3:BitmapDataAsset = (this._widget.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            this.setElementBitmap(k, _local_4);
        }
    }
}
