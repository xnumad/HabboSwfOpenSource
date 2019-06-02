//com.sulake.habbo.room.events.RoomEngineObjectInsertInitializedEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectInsertInitializedEvent extends RoomEngineObjectEvent {

        public static const TYPE:String;

        private var _objectPlacementSource:String;

        public function RoomEngineObjectInsertInitializedEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean=false, _arg_7:Boolean=false);

        public function get objectPlacementSource():String;


    }
}//package com.sulake.habbo.room.events

