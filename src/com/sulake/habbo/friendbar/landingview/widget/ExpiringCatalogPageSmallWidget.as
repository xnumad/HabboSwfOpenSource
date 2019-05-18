package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7618;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_7384;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_4625;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;

    public class ExpiringCatalogPageSmallWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {
        private static const _Str_3981:Number = (30 * 1000);//30000

        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _pageName:String = "";
        private var _lastRequestTime:Date;
        private var _secondsToExpiry:int;

        public function ExpiringCatalogPageSmallWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("expiring_catalog_page_small"));
            this._container.findChildByName("open_catalog_button").procedure = this._Str_9063;
            this._container.visible = false;
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new _Str_7618(this._Str_11267));
        }

        public function refresh():void
        {
            if (((this._lastRequestTime == null) || ((this._lastRequestTime.time + _Str_3981) < new Date().time)))
            {
                this._landingView.send(new _Str_7384());
                this._lastRequestTime = new Date();
            }
        }

        private function refreshContent():void
        {
            if (this._pageName == "")
            {
                this._container.visible = false;
                return;
            }
            this._container.visible = true;
            this._container.findChildByName("page_header_txt").caption = this.getText((("landing.view.pageexpiry.page." + this._pageName) + ".header"));
            this._container.findChildByName("page_desc_txt").caption = this.getText((("landing.view.pageexpiry.page." + this._pageName) + ".desc"));
            var k:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(this._container.findChildByName("promo_bitmap"));
            k.assetUri = (("${image.library.url}reception/catalog_teaser_" + this._pageName) + ".png");
            this._Str_11106();
        }

        private function getText(k:String):String
        {
            return ("${" + k) + "}";
        }

        private function _Str_9063(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.catalog.openCatalogPage(this._pageName);
                this._landingView.tracking.trackGoogle("landingView", "click_goToExpiringCatalogPage");
            }
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function _Str_11106():void
        {
            var k:IWidgetWindow = IWidgetWindow(this._container.findChildByName("countdown_widget"));
            var _local_2:_Str_2961 = _Str_2961(k.widget);
            _local_2.seconds = this._secondsToExpiry;
        }

        private function _Str_11267(k:IMessageEvent):void
        {
            var _local_2:_Str_4625 = _Str_4625(k.parser);
            this._pageName = _local_2.pageName;
            this._secondsToExpiry = _local_2._Str_17123;
            this.refreshContent();
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }
    }
}




