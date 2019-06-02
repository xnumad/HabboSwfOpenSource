//com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarDanceUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _danceStyle:int;

        public function RoomObjectAvatarDanceUpdateMessage(k:int=0);

        public function get danceStyle():int;


    }
}//package com.sulake.habbo.room.messages

