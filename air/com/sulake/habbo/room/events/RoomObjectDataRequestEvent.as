//com.sulake.habbo.room.events.RoomObjectDataRequestEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectDataRequestEvent extends RoomObjectEvent {

        public static const CURRENT_USER_ID:String;
        public static const URL_PREFIX:String;

        public function RoomObjectDataRequestEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.room.events

