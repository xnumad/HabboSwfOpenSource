package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.navigation.ICatalogNode;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_4201;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import __AS3__.vec.*;

    public class SoldLtdItemsCatalogWidget extends CatalogWidget
    {
        private var _catalog:HabboCatalog;

        public function SoldLtdItemsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.SOLD_LTD_ITEMS);
            window.visible = false;
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
            return true;
        }

        private function _Str_4806(k:SelectProductEvent):void
        {
            var _local_2:Vector.<ICatalogNode>;
            var _local_3:ICatalogNode;
            if ((((k == null) || (k.offer == null)) || (k.offer.product == null)))
            {
                return;
            }
            if (page.mode == CatalogPage._Str_7035)
            {
                _local_2 = this._catalog._Str_3361._Str_5719(k.offer.offerId);
                if (!_local_2)
                {
                    _local_2 = new Vector.<ICatalogNode>(0);
                }
                for each (_local_3 in _local_2)
                {
                    if (_local_3.pageName.indexOf(CatalogPageName.LIMITED_SOLD) > -1)
                    {
                        window.visible = true;
                        events.dispatchEvent(new _Str_4201(CatalogWidgetEnum.PURCHASE, false));
                        return;
                    }
                }
            }
            if (page.layoutCode == "sold_ltd_items")
            {
                window.visible = true;
                events.dispatchEvent(new _Str_4201(CatalogWidgetEnum.PURCHASE, false));
                return;
            }
            if (((k.offer.product.isUniqueLimitedItem) && (k.offer.product.uniqueLimitedItemsLeft == 0)))
            {
                window.visible = true;
                events.dispatchEvent(new _Str_4201(CatalogWidgetEnum.PURCHASE, false));
            }
            else
            {
                window.visible = false;
                events.dispatchEvent(new _Str_4201(CatalogWidgetEnum.PURCHASE, true));
            }
        }
    }
}
