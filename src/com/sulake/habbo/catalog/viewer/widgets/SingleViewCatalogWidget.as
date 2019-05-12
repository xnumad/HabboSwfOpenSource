package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;

    public class SingleViewCatalogWidget extends ProductViewCatalogWidget
    {
        public function SingleViewCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k, _arg_2);
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            return true;
        }

        public function _Str_3393(k:_Str_3308):void
        {
            if (page.offers.length == 0)
            {
                return;
            }
            var _local_2:IPurchasableOffer = page.offers[0];
            events.dispatchEvent(new SelectProductEvent(_local_2));
        }
    }
}
