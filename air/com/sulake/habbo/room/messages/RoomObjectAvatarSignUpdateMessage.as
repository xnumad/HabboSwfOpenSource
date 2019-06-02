//com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarSignUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _signType:int;

        public function RoomObjectAvatarSignUpdateMessage(k:int);

        public function get signType():int;


    }
}//package com.sulake.habbo.room.messages

