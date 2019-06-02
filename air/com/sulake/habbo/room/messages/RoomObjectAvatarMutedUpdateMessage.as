//com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarMutedUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _isMuted:Boolean;

        public function RoomObjectAvatarMutedUpdateMessage(k:Boolean=false);

        public function get isMuted():Boolean;


    }
}//package com.sulake.habbo.room.messages

