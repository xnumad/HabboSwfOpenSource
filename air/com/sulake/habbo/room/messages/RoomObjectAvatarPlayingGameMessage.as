//com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarPlayingGameMessage extends RoomObjectUpdateStateMessage {

        private var _isPlayingGame:Boolean;

        public function RoomObjectAvatarPlayingGameMessage(k:Boolean=false);

        public function get isPlayingGame():Boolean;


    }
}//package com.sulake.habbo.room.messages

