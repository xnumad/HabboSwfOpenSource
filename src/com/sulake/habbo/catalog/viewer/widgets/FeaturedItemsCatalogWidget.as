package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.catalog.FrontPageItem;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.events.WindowEvent;

    public class FeaturedItemsCatalogWidget extends CatalogWidget
    {
        private var _catalog:HabboCatalog;
        private var _itemListWindow:IItemListWindow;
        private var _template:IWindowContainer;

        public function FeaturedItemsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._catalog = null;
                this._itemListWindow.dispose();
                this._itemListWindow = null;
                this._template.dispose();
                this._template = null;
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._itemListWindow = (window.findChildByName("itemlist_featured") as IItemListWindow);
            this._template = (this._itemListWindow.getListItemByName("featured_item_template") as IWindowContainer);
            this._itemListWindow.removeListItems();
            if (((this._catalog.frontPageItems == null) || (this._catalog.frontPageItems.length == 0)))
            {
                return true;
            }
            var k:IWindowContainer = (_window.findChildByName("firstitem") as IWindowContainer);
            this._Str_15147(this._catalog.frontPageItems[0], k);
            var _local_2:int = 1;
            while (_local_2 < Math.min(4, this._catalog.frontPageItems.length))
            {
                this._itemListWindow.addListItem(this._Str_23881(this._catalog.frontPageItems[_local_2]));
                _local_2++;
            }
            return true;
        }

        private function _Str_23881(k:FrontPageItem):IWindowContainer
        {
            return this._Str_15147(k, (this._template.clone() as IWindowContainer));
        }

        private function _Str_15147(k:FrontPageItem, _arg_2:IWindowContainer):IWindowContainer
        {
            var _local_5:String;
            var _local_6:IStaticBitmapWrapperWindow;
            var _local_3:ITextWindow = (_arg_2.findChildByName("item_title") as ITextWindow);
            _local_3.text = k.itemName;
            if (((!(k.itemPromoImage == null)) && (!(k.itemPromoImage == ""))))
            {
                _local_5 = this._catalog.context.configuration.getProperty("image.library.url");
                _local_6 = (_arg_2.findChildByName("item_image") as IStaticBitmapWrapperWindow);
                _local_6.assetUri = (_local_5 + k.itemPromoImage);
            }
            var _local_4:IWindow = _arg_2.getChildByName("event_catcher_region");
            if (_local_4 != null)
            {
                _local_4.procedure = this._Str_5162;
            }
            return _arg_2;
        }

        private function _Str_5162(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:FrontPageItem;
            if (k.type == WindowMouseEvent.DOWN)
            {
                _local_3 = this._itemListWindow.getListItemIndex(_arg_2.parent);
                _local_3 = ((_local_3 < 0) ? 0 : (_local_3 + 1));
                _local_4 = this._catalog.frontPageItems[_local_3];
                switch (_local_4.type)
                {
                    case FrontPageItem._Str_13638:
                        if (_local_4.cataloguePageLocation == CatalogPageName.ROOM_BUNDLES_MOBILE)
                        {
                            return this._catalog.openCatalogPage(CatalogPageName.ROOM_BUNDLES, CatalogType.NORMAL);
                        }
                        if (_local_4.cataloguePageLocation == CatalogPageName.MOBILE_SUBSCRIPTIONS)
                        {
                            return this._catalog.openCatalogPage(CatalogPageName.HC_MEMBERSHIP, CatalogType.NORMAL);
                        }
                        this._catalog.openCatalogPage(_local_4.cataloguePageLocation, CatalogType.NORMAL);
                        return;
                    case FrontPageItem._Str_15225:
                        this._catalog.openCatalogPageByOfferId(_local_4._Str_24645, CatalogType.NORMAL);
                        return;
                }
            }
        }
    }
}
