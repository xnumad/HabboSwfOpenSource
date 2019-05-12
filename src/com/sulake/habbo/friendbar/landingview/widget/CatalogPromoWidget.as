package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;

    public class CatalogPromoWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _targetCatalogPageName:String;
        private var _disposed:Boolean = false;

        public function CatalogPromoWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        protected function get xmlAssetName():String
        {
            return "catalog_promo";
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow(this.xmlAssetName));
            this._targetCatalogPageName = this._landingView.getProperty("landing.view.catalog.promo.target");
            var k:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(this._container.findChildByName("picture"));
            k.assetUri = this._landingView.getProperty("landing.view.catalog.promo.image.uri");
            this._container.findChildByName("open_page_button").addEventListener(WindowMouseEvent.CLICK, this._Str_24375);
            if (((this._targetCatalogPageName == "") && (k.assetUri == "")))
            {
                this._container.visible = false;
            }
            else
            {
                this._container.visible = true;
            }
            var _local_2:Map = new Map();
            _local_2.add("catalog_promo_caption", "landing.view.catalog.promo.caption");
            _local_2.add("catalog_promo_info", "landing.view.catalog.promo.info");
            _local_2.add("open_page_button", "landing.view.catalog.open.page");
            _local_2.add("catalog_promo_picture_text", "landing.view.catalog.promo.picture.text");
            _local_2.add("catalog_promo_title", "landing.view.catalog.promo.title");
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                this._Str_22932(_local_2.getKeys()[_local_3], _local_2.getValues()[_local_3], this._targetCatalogPageName);
                _local_3++;
            }
        }

        public function refresh():void
        {
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                this._landingView = null;
                if (this._container != null)
                {
                    this._container.dispose();
                    this._container = null;
                }
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_24375(k:WindowMouseEvent):void
        {
            this._landingView.catalog.openCatalogPage(this._targetCatalogPageName);
        }

        private function _Str_22932(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_5:IWindow;
            var _local_4:ILocalization = this._landingView.localizationManager.getLocalizationRaw(((_arg_2 + ".") + _arg_3));
            if (_local_4 != null)
            {
                _local_5 = this._container.findChildByName(k);
                if (_local_5 != null)
                {
                    _local_5.caption = (((("${" + _arg_2) + ".") + _arg_3) + "}");
                }
            }
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }
    }
}

