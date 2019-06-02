//com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectPlacedOnUserEvent extends RoomEngineObjectEvent {

        private var _droppedObjectId:int;
        private var _droppedObjectCategory:int;

        public function RoomEngineObjectPlacedOnUserEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get droppedObjectId():int;

        public function get droppedObjectCategory():int;


    }
}//package com.sulake.habbo.room.events

