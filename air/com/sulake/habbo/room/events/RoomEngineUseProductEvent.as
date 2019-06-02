//com.sulake.habbo.room.events.RoomEngineUseProductEvent

package com.sulake.habbo.room.events{
    public class RoomEngineUseProductEvent extends RoomEngineObjectEvent {

        public static const USE_PRODUCT_FROM_ROOM:String;
        public static const USE_PRODUCT_FROM_INVENTORY:String;

        private var _inventoryStripId:int;
        private var _furnitureTypeId:int;

        public function RoomEngineUseProductEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int=-1, _arg_6:int=-1, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get inventoryStripId():int;

        public function get furnitureTypeId():int;


    }
}//package com.sulake.habbo.room.events

