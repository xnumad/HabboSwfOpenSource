//com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarPlayerValueUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _value:int;

        public function RoomObjectAvatarPlayerValueUpdateMessage(k:int);

        public function get value():int;


    }
}//package com.sulake.habbo.room.messages

