//com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _isAdmin:Boolean;
        private var _rawData:String;

        public function RoomObjectAvatarFlatControlUpdateMessage(k:String);

        public function get isAdmin():Boolean;

        public function get rawData():String;


    }
}//package com.sulake.habbo.room.messages

