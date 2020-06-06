package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.extensions.purse.PurseClubArea;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import flash.external.ExternalInterface;
    import com.sulake.core.window.events.WindowEvent;

    public class PurseAreaExtension implements IDisposable 
    {
        private static const HELP:String = "HELP";

        private var _toolbar:HabboToolbar;
        private var _window:IWindowContainer;
        private var _clubArea:PurseClubArea;
        private var _catalog:IHabboCatalog;

        public function PurseAreaExtension(k:HabboToolbar, _arg_2:IHabboCatalog)
        {
            this._toolbar = k;
            this._window = (this._toolbar.windowManager.buildFromXML((k.assets.getAssetByName("purse_xml").content as XML)) as IWindowContainer);
            this._window.procedure = this.windowProcedure;
            this._clubArea = new PurseClubArea(k, (this._window as IWindowContainer));
            this._catalog = _arg_2;
            this._catalog.events.addEventListener(PurseEvent.CATALOG_PURSE_CREDIT_BALANCE, this._Str_24822);
            this._catalog.events.addEventListener(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, this._Str_23016);
            this._Str_25439();
            k.extensionView.attachExtension(ToolbarDisplayExtensionIds.PURSE, this._window, ExtensionFixedSlotsEnum._Str_16620);
            var _local_3:IWindow = this._window.findChildByName("credit_count");
            this._toolbar.windowManager.registerHintWindow("credit_count", _local_3);
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._clubArea.dispose();
            this._catalog = null;
            this._toolbar = null;
        }

        public function get disposed():Boolean
        {
            return this._toolbar == null;
        }

        public function _Str_20225():PurseClubArea
        {
            return this._clubArea;
        }
		
		public static function balanceToString(value:int):String
		{
			/*var suffix:String = "";
			var resultValue:int = value;
			if (value >= 1000000)
			{
				resultValue = Math.floor(resultValue / 1000000);
				suffix = "M";
			}
			else if (value >= 100000)
			{
				resultValue = Math.floor(resultValue / 1000);
				suffix = "K";
			}
			
			return "" + resultValue.toString() + suffix;*/

            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
		}

        private function _Str_25439():void
        {
            var _local_3:IWindow;
            var _local_4:IWindow;
            var _local_5:IItemListWindow;
            var k:IWindow = this._window.findChildByName("credit_count");
            if (k != null)
            {
                k.caption = balanceToString(this._catalog.getPurse().credits);
            }
            var _local_2:IWindow = this._window.findChildByName("ducket_count");
            if (_local_2 != null)
            {
                _local_2.caption = balanceToString(this._catalog.getPurse().getActivityPointsForType(ActivityPointTypeEnum.DUCKET));
            }
            if (this._toolbar.getBoolean("diamonds.enabled"))
            {
                _local_3 = this._window.findChildByName("diamond_count");
                if (_local_3)
                {
                    _local_3.caption = balanceToString(this._catalog.getPurse().getActivityPointsForType(ActivityPointTypeEnum.LOYALTY));
                }
            }
            else
            {
                _local_4 = this._window.findChildByName("diamond_count_button");
                _local_5 = (this._window.findChildByName("purse_itemlist") as IItemListWindow);
                if (((_local_4) && (_local_5)))
                {
                    _local_5.removeListItem(_local_4);
                }
            }
        }

        public function _Str_24822(k:PurseEvent):void
        {
            var _local_2:int = k.balance;
            var _local_3:IWindow = this._window.findChildByName("credit_count");
			var suffix:String = "";
            if (_local_3 != null)
            {
                _local_3.caption = balanceToString(_local_2);
            }
        }

        public function _Str_23016(k:PurseEvent):void
        {
            var _local_2:IWindow;
            var _local_3:String;
            switch (k.activityPointType)
            {
                case ActivityPointTypeEnum.DUCKET:
                    _local_2 = this._window.findChildByName("ducket_count");
                    break;
                case ActivityPointTypeEnum.LOYALTY:
                    _local_2 = this._window.findChildByName("diamond_count");
                    break;
            }
            if (_local_2 != null)
            {
                _local_2.caption = balanceToString(k.balance);
            }
        }

        public function getIconLocation(k:String):Rectangle
        {
            var _local_2:Rectangle;
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3)
            {
                _local_2 = _local_3.rectangle;
                _local_2.x = (_local_2.x + (this._window.desktop.width - this._window.width));
                _local_2.y = (_local_2.y + this._window.y);
            }
            return _local_2;
        }

        public function _Str_6621(k:String):IWindow
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            return _local_2;
        }

        private function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._toolbar.windowManager.hideMatchingHint(_arg_2.name);
            switch (_arg_2.name)
            {
                case "hc_join_button":
                    this._toolbar.catalog.openClubCenter();
                    return;
                case "help_button":
                    this._toolbar.toggleWindowVisibility(HELP);
                    return;
                case "settings_button":
                    this._toolbar._Str_14261();
                    return;
                case "credit_count_button":
                    this._catalog.openCreditsHabblet();
                    return;
                case "ducket_count_button":
                    this._catalog.openCatalogPage(CatalogPageName.DUCKET_INFO);
                    return;
                case "diamond_count_button":
                    this._catalog.openCatalogPage(CatalogPageName.LOYALTY_INFO);
                    return;
                case "logout_button":
                    if (ExternalInterface.available)
                    {
                        ExternalInterface.call("FlashExternalInterface.logout");
                    }
                    return;
            }
        }
    }
}
