package com.sulake.habbo.inventory.items
{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.data.StuffDataBase;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.assets.IAsset;

    public class CreditTradingItem extends GroupItem 
    {
        private static const INVENTORY_THUMB_CREDITS_XML:String = "inventory_thumb_credits_xml";

        private var _creditValue:int;
        private var _assets:IAssetLibrary;

        public function CreditTradingItem(k:FurniModel, _arg_2:IAssetLibrary, _arg_3:IRoomEngine, _arg_4:int)
        {
            var _local_5:BitmapData;
            this._creditValue = _arg_4;
            this._assets = _arg_2;
            _local_5 = this._Str_21010();
            super(k, type, category, _arg_3, false, new StuffDataBase(), _Str_2794, _local_5, false, "center");
        }

        override public function dispose():void
        {
            this._assets = null;
            super.dispose();
        }

        public function _Str_21010():BitmapData
        {
            if (!this._assets)
            {
                return null;
            }
            var k:IAsset = this._assets.getAssetByName("inventory_furni_icon_credits");
            return (k != null) ? (k.content as BitmapData).clone() : null;
        }

        public function _Str_22574():String
        {
            return "${purse_coins}";
        }

        public function _Str_21960():int
        {
            return this._creditValue;
        }

        override public function get isGroupable():Boolean
        {
            return true;
        }

        override public function getTotalCount():int
        {
            return this._Str_21960();
        }

        override public function getUnlockedCount():int
        {
            return this._Str_21960();
        }

        override protected function createWindow():void
        {
            _window = _Str_2307.createItemWindow(INVENTORY_THUMB_CREDITS_XML);
        }

        override public function getMinimumItemsToShowCounter():int
        {
            return 1;
        }
    }
}
