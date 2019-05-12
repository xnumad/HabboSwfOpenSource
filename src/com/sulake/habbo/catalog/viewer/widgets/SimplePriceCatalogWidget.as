package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class SimplePriceCatalogWidget extends CatalogWidget
    {
        private var _catalog:HabboCatalog;
        private var _priceWidget:IWindow;

        public function SimplePriceCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            return true;
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            this._priceWidget = this._catalog.utils._Str_7075(k.offer, (_window as IWindowContainer), this._priceWidget, _window.findChildByName("fake_productimage"), 0, true, 0);
        }
    }
}
