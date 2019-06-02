//com.sulake.room.events.RoomContentLoadedEvent

package com.sulake.room.events{
    import flash.events.Event;

    public class RoomContentLoadedEvent extends Event {

        public static const CONTENT_LOAD_SUCCESS:String;
        public static const CONTENT_LOAD_FAILURE:String;
        public static const CONTENT_LOAD_CANCEL:String;

        private var _contentType:String;

        public function RoomContentLoadedEvent(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get contentType():String;


    }
}//package com.sulake.room.events

