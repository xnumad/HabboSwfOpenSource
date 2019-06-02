//com.sulake.habbo.room.events.RoomEngineObjectEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectEvent extends RoomEngineEvent {

        public static const SELECTED:String;
        public static const DESELECTED:String;
        public static const ADDED:String;
        public static const REMOVED:String;
        public static const PLACED:String;
        public static const PLACED_ON_USER:String;
        public static const CONTENT_UPDATED:String;
        public static const REQUEST_MOVE:String;
        public static const REQUEST_ROTATE:String;
        public static const MOUSE_ENTER:String;
        public static const MOUSE_LEAVE:String;

        private var _objectId:int;
        private var _category:int;

        public function RoomEngineObjectEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get objectId():int;

        public function get category():int;


    }
}//package com.sulake.habbo.room.events

