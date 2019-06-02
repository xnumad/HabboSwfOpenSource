//com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarPetGestureUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _gesture:String;

        public function RoomObjectAvatarPetGestureUpdateMessage(k:String);

        public function get gesture():String;


    }
}//package com.sulake.habbo.room.messages

