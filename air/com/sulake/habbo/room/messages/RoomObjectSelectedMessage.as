//com.sulake.habbo.room.messages.RoomObjectSelectedMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectSelectedMessage extends RoomObjectUpdateStateMessage {

        private var _selected:Boolean;

        public function RoomObjectSelectedMessage(k:Boolean);

        public function get selected():Boolean;


    }
}//package com.sulake.habbo.room.messages

