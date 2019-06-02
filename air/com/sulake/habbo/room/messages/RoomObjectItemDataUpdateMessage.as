//com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectItemDataUpdateMessage extends RoomObjectUpdateMessage {

        private var _itemData:String;

        public function RoomObjectItemDataUpdateMessage(k:String);

        public function get itemData():String;


    }
}//package com.sulake.habbo.room.messages

