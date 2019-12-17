package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8320;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_9801;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;

    public class NextLimitedRareCountdownWidget implements ILandingViewWidget, IProductDataListener, ISettingsAwareWidget 
    {
        private static const _Str_3981:Number = (30 * 1000);//30000

        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _appearsInSeconds:int = 0;
        private var _pageId:int;
        private var _offerId:int;
        private var _productType:String;
        private var _lastRequestTime:Date;
        private var _modeSwitchTimer:Timer;

        public function NextLimitedRareCountdownWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._modeSwitchTimer != null)
                {
                    this._modeSwitchTimer.stop();
                    this._modeSwitchTimer = null;
                }
                this._landingView = null;
                this._container = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("next_ltd_available"));
            this._container.findChildByName("get").procedure = this._Str_9063;
            this._container.findChildByName("catalogue_button").procedure = this._Str_9063;
            this._container.visible = false;
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new _Str_8320(this._Str_23091));
            this._Str_17444(null);
        }

        private function _Str_17444(k:TimerEvent):void
        {
            if (!this._landingView.getBoolean("next.limited.rare.countdown.widget.disabled"))
            {
                this._landingView.communicationManager.connection.send(new _Str_9801());
            }
        }

        public function refresh():void
        {
            if (((this._lastRequestTime == null) || ((this._lastRequestTime.time + _Str_3981) < new Date().time)))
            {
                this._Str_17444(null);
                this._lastRequestTime = new Date();
            }
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function productDataReady():void
        {
            this.refreshContent();
        }

        private function refreshContent():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._landingView.getProductData(this._productType, this) != null)
            {
                this._container.findChildByName("get").caption = this._landingView.getProductData(this._productType, this).name;
            }
            if (this._pageId >= 0)
            {
                this._container.visible = true;
                this._container.findChildByName("get").visible = true;
                this._container.findChildByName("countdown").visible = false;
            }
            else
            {
                if (this._appearsInSeconds > 0)
                {
                    this._container.visible = true;
                    this._container.findChildByName("get").visible = false;
                    this._container.findChildByName("countdown").visible = true;
                }
                else
                {
                    this._container.visible = false;
                }
            }
            this._Str_11106();
        }

        private function _Str_11106():void
        {
            var k:IWidgetWindow = IWidgetWindow(this._container.findChildByName("countdown"));
            var _local_2:_Str_2961 = _Str_2961(k.widget);
            _local_2.seconds = this._appearsInSeconds;
            _local_2.running = true;
        }

        private function _Str_24349(k:int):void
        {
            if (k <= 0)
            {
                return;
            }
            if (this._modeSwitchTimer != null)
            {
                this._modeSwitchTimer.stop();
                this._modeSwitchTimer = null;
            }
            this._modeSwitchTimer = new Timer(((k + 1) * 1000), 1);
            this._modeSwitchTimer.addEventListener(TimerEvent.TIMER, this._Str_17444);
            this._modeSwitchTimer.start();
        }

        private function _Str_23091(k:_Str_8320):void
        {
            this._appearsInSeconds = k.getParser()._Str_23051;
            this._pageId = k.getParser().pageId;
            this._offerId = k.getParser().offerId;
            this._productType = k.getParser().productType;
            this.refreshContent();
            this._Str_24349(this._appearsInSeconds);
        }

        private function _Str_9063(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.catalog.openCatalogPageById(this._pageId, this._offerId, CatalogType.NORMAL);
                this._landingView.tracking.trackGoogle("landingView", "click_goToNextLimitedCatalogPage");
            }
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }
    }
}
