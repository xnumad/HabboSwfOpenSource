package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class BuilderAddonsCatalogWidget extends CatalogWidget implements IDisposable 
    {
        private var _catalog:HabboCatalog;

        public function BuilderAddonsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function init():Boolean
        {
            var _local_5:IPurchasableOffer;
            var _local_6:IWindowContainer;
            if (!super.init())
            {
                return false;
            }
            _window.procedure = this._Str_2533;
            var k:IItemListWindow = (_window.findChildByName("addons_list") as IItemListWindow);
            var _local_2:IWindow = k.removeListItemAt(0);
            var _local_3:int;
            var _local_4:* = (this._catalog._Str_10140 > 0);
            _window.findChildByName("trial_warning").visible = (!(_local_4));
            for each (_local_5 in page.offers)
            {
                _local_6 = (_local_2.clone() as IWindowContainer);
                _local_6.findChildByName("item_header").caption = _local_5.localizationName;
                _local_6.findChildByName("item_price").caption = _local_5.priceInCredits.toString();
                _local_6.findChildByName("item_buy").caption = _local_5.localizationDescription;
                _local_6.findChildByName("item_buy").id = _local_3;
                if (_local_5.priceInActivityPoints > 0)
                {
                    _local_6.findChildByName("diamonds_icon").visible = true;
                    _local_6.findChildByName("diamonds_price").visible = true;
                    _local_6.findChildByName("diamonds_price").caption = _local_5.priceInActivityPoints.toString();
                }
                if (!_local_4)
                {
                    IButtonWindow(_local_6.findChildByName("item_buy")).disable();
                }
                _local_3++;
                k.addListItem(_local_6);
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
