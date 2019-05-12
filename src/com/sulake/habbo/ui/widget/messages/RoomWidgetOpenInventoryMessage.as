package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_OPEN_INVENTORY:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
        public static const INVENTORY_EFFECTS:String = "inventory_effects";
        public static const INVENTORY_BADGES:String = "inventory_badges";
        public static const INVENTORY_CLOTHES:String = "inventory_clothes";
        public static const INVENTORY_FURNITURE:String = "inventory_furniture";

        private var _inventoryType:String;

        public function RoomWidgetOpenInventoryMessage(k:String)
        {
            super(RWGOI_MESSAGE_OPEN_INVENTORY);
            this._inventoryType = k;
        }

        public function get _Str_16732():String
        {
            return this._inventoryType;
        }
    }
}
