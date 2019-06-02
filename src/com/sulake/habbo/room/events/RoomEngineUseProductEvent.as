package com.sulake.habbo.room.events
{
    public class RoomEngineUseProductEvent extends RoomEngineObjectEvent 
    {
        public static const ROSM_USE_PRODUCT_FROM_ROOM:String = "ROSM_USE_PRODUCT_FROM_ROOM";
        public static const ROSM_USE_PRODUCT_FROM_INVENTORY:String = "ROSM_USE_PRODUCT_FROM_INVENTORY";

        private var _inventoryStripId:int;
        private var _furnitureTypeId:int;

        public function RoomEngineUseProductEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int=-1, _arg_6:int=-1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8);
            this._inventoryStripId = _arg_5;
            this._furnitureTypeId = _arg_6;
        }

        public function get inventoryStripId():int
        {
            return this._inventoryStripId;
        }

        public function get furnitureTypeId():int
        {
            return this._furnitureTypeId;
        }
    }
}
