//com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _postureType:String;
        private var _parameter:String;

        public function RoomObjectAvatarPostureUpdateMessage(k:String, _arg_2:String="");

        public function get postureType():String;

        public function get parameter():String;


    }
}//package com.sulake.habbo.room.messages

