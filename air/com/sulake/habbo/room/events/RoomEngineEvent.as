//com.sulake.habbo.room.events.RoomEngineEvent

package com.sulake.habbo.room.events{
    import flash.events.Event;

    public class RoomEngineEvent extends Event {

        public static const ROOM_ENGINE_INITIALIZED:String;
        public static const ROOM_INITIALIZED:String;
        public static const ROOM_DISPOSED:String;
        public static const ROOM_ENGINE_GAME_MODE:String;
        public static const ROOM_ENGINE_NORMAL_MODE:String;
        public static const ROOM_OBJECTS_INITIALIZED:String;
        public static const ROOM_WALKING_TO:String;
        public static const ROOM_WALKING_PRIORITIZED:String;
        public static const ROOM_PICKING_PRIORITIZED:String;

        private var _roomId:int;

        public function RoomEngineEvent(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get roomId():int;


    }
}//package com.sulake.habbo.room.events

