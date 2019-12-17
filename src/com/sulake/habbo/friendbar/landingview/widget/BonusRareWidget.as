package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_6906;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10281;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;

    public class BonusRareWidget implements ILandingViewWidget, IProductDataListener, ISettingsAwareWidget, IGetImageListener 
    {
        private var _habboLandingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _Str_3032:String;
        private var _Str_4261:int = -1;
        private var _Str_5859:int;
        private var _Str_7388:int;

        public function BonusRareWidget(k:HabboLandingView)
        {
            this._habboLandingView = k;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                this._habboLandingView.roomEngine.events.removeEventListener(RoomEngineEvent.ENGINE_INITIALIZED, this.onRoomEngineInitialized);
                this._habboLandingView.communicationManager.removeHabboConnectionMessageEvent(new _Str_6906(this._Str_21615));
                this._habboLandingView = null;
                this._container = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._habboLandingView.getXmlWindow("bonus_rare_promo"));
            this._container.findChildByName("buy_button").procedure = this._Str_25025;
            this._container.visible = false;
            this._habboLandingView.communicationManager.addHabboConnectionMessageEvent(new _Str_6906(this._Str_21615));
            this._habboLandingView.roomEngine.events.addEventListener(RoomEngineEvent.ENGINE_INITIALIZED, this.onRoomEngineInitialized);
            this._Str_19551();
        }

        private function _Str_19551():void
        {
            this._habboLandingView.communicationManager.connection.send(new _Str_10281());
        }

        public function refresh():void
        {
            this._Str_19551();
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function productDataReady():void
        {
            this.refreshContent();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            this.refreshContent();
        }

        public function imageFailed(k:int):void
        {
        }

        private function onRoomEngineInitialized(k:RoomEngineEvent):void
        {
            this.refreshContent();
        }

        private function refreshContent():void
        {
            if (this.disposed)
            {
                return;
            }
            this._container.visible = (!(this._Str_4261 == -1));
            var k:IProductData = this._habboLandingView.getProductData(this._Str_3032, this);
            if (k != null)
            {
                IStaticBitmapWrapperWindow(this._container.findChildByName("promo_image")).assetUri = this._habboLandingView.getProperty("landing.view.bonus.rare.image.uri");
                this._container.findChildByName("header").caption = this._habboLandingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.header", "", "rarename", k.name, "amount", this._Str_5859);
                this._container.findChildByName("status").caption = this._habboLandingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.status", "", "amount", this._Str_7388, "total", this._Str_5859);
                this._Str_11199((this._Str_5859 - this._Str_7388), this._Str_5859);
            }
        }

        private function _Str_21615(k:_Str_6906):void
        {
            this._Str_3032 = k.getParser().productType;
            this._Str_4261 = k.getParser().productClassId;
            this._Str_5859 = k.getParser()._Str_25710;
            this._Str_7388 = k.getParser()._Str_25484;
            this.refreshContent();
        }

        private function _Str_25025(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._habboLandingView.tracking.trackGoogle("landingView", "click_bonusRarePromoOpenCreditsPage");
                this._habboLandingView.catalog.openCreditsHabblet();
            }
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }

        private function _Str_11199(k:int, _arg_2:int):void
        {
            var _local_3:int = this._container.findChildByName("bar_a_bkg").width;
            var _local_4:int = this._container.findChildByName("bar_a_bkg").x;
            var _local_5:int = (Number((k / _arg_2)) * _local_3);
            this._container.findChildByName("bar_a_c").width = _local_5;
            this._container.findChildByName("bar_a_r").x = (_local_5 + _local_4);
        }
    }
}
