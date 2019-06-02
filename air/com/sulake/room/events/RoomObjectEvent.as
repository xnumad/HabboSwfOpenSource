//com.sulake.room.events.RoomObjectEvent

package com.sulake.room.events{
    import flash.events.Event;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectEvent extends Event {

        private var _object:IRoomObject;

        public function RoomObjectEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get object():IRoomObject;

        public function get objectId():int;

        public function get objectType():String;


    }
}//package com.sulake.room.events

