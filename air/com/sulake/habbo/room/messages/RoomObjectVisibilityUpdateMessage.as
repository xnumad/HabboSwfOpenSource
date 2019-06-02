//com.sulake.habbo.room.messages.RoomObjectVisibilityUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectVisibilityUpdateMessage extends RoomObjectUpdateMessage {

        public static const ENABLED:String;
        public static const DISABLED:String;

        private var _type:String;

        public function RoomObjectVisibilityUpdateMessage(k:String);

        public function get type():String;


    }
}//package com.sulake.habbo.room.messages

