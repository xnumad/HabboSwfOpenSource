package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class BuilderLoyaltyCatalogWidget extends CatalogWidget implements IDisposable 
    {
        private var _catalog:HabboCatalog;

        public function BuilderLoyaltyCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function init():Boolean
        {
            var _local_4:IPurchasableOffer;
            var _local_5:IWindowContainer;
            if (!super.init())
            {
                return false;
            }
            _window.procedure = this._Str_2533;
            var k:IItemListWindow = (_window.findChildByName("loyalty_list") as IItemListWindow);
            var _local_2:IWindow = k.removeListItemAt(0);
            var _local_3:int;
            for each (_local_4 in page.offers)
            {
                _local_5 = (_local_2.clone() as IWindowContainer);
                _local_5.findChildByName("item_header").caption = _local_4.localizationName;
                this._catalog.utils._Str_6455((_local_5.findChildByName("item_cost_box") as IWindowContainer), _local_4);
                _local_5.findChildByName("item_buy").caption = _local_4.localizationDescription;
                _local_5.findChildByName("item_buy").id = _local_3;
                _local_3++;
                k.addListItem(_local_5);
            }
            return true;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (_arg_2.name == "item_buy")
            {
                this._catalog._Str_5649(page.offers[_arg_2.id], page.pageId);
            }
        }
    }
}
