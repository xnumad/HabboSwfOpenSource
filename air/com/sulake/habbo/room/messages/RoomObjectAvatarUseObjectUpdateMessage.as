//com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarUseObjectUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _itemType:int;

        public function RoomObjectAvatarUseObjectUpdateMessage(k:int);

        public function get itemType():int;


    }
}//package com.sulake.habbo.room.messages

