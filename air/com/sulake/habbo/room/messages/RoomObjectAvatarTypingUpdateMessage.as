//com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarTypingUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _isTyping:Boolean;

        public function RoomObjectAvatarTypingUpdateMessage(k:Boolean=false);

        public function get isTyping():Boolean;


    }
}//package com.sulake.habbo.room.messages

