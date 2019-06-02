//com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarSleepUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _isSleeping:Boolean;

        public function RoomObjectAvatarSleepUpdateMessage(k:Boolean=false);

        public function get isSleeping():Boolean;


    }
}//package com.sulake.habbo.room.messages

