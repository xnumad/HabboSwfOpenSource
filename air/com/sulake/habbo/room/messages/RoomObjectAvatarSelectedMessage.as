//com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarSelectedMessage extends RoomObjectUpdateStateMessage {

        private var _selected:Boolean;

        public function RoomObjectAvatarSelectedMessage(k:Boolean);

        public function get selected():Boolean;


    }
}//package com.sulake.habbo.room.messages

