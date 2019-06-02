//com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _itemType:int;
        private var _itemName:String;

        public function RoomObjectAvatarCarryObjectUpdateMessage(k:int, _arg_2:String);

        public function get itemType():int;

        public function get itemName():String;


    }
}//package com.sulake.habbo.room.messages

