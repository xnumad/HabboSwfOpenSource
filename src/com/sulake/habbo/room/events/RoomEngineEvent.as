package com.sulake.habbo.room.events
{
    import flash.events.Event;

    public class RoomEngineEvent extends Event 
    {
        public static const ENGINE_INITIALIZED:String = "REE_ENGINE_INITIALIZED";
        public static const INITIALIZED:String = "REE_INITIALIZED";
        public static const DISPOSED:String = "REE_DISPOSED";
        public static const GAME_MODE:String = "REE_GAME_MODE";
        public static const NORMAL_MODE:String = "REE_NORMAL_MODE";
        public static const OBJECTS_INITIALIZED:String = "REE_OBJECTS_INITIALIZED";
        public static const ROOM_ZOOMED:String = "REE_ROOM_ZOOMED";

        private var _roomId:int;

        public function RoomEngineEvent(k:String, roomId:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._roomId = roomId;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
