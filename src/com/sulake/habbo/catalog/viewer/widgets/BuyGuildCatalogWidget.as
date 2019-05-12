package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10645;
    import com.sulake.habbo.catalog.enum.CatalogType;

    public class BuyGuildCatalogWidget extends CatalogWidget
    {
        private var _button:IButtonWindow;

        public function BuyGuildCatalogWidget(k:IWindowContainer)
        {
            super(k);
            if (this._button)
            {
                this._button.removeEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._button = (window.findChildByName("start_guild_purchase") as IButtonWindow);
            this._button.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            return true;
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            if (HabboTracking.getInstance() != null)
            {
                HabboTracking.getInstance().trackGoogle("groupPurchase", "catalogBuyClicked");
            }
            page.viewer.catalog.connection.send(new _Str_10645());
            page.viewer.catalog.toggleCatalog(CatalogType.NORMAL);
        }
    }
}
