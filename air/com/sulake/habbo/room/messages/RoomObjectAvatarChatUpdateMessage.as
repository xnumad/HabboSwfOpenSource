//com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarChatUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _numberOfWords:int;

        public function RoomObjectAvatarChatUpdateMessage(k:int);

        public function get numberOfWords():int;


    }
}//package com.sulake.habbo.room.messages

