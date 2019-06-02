//com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarGestureUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _gesture:int;

        public function RoomObjectAvatarGestureUpdateMessage(k:int);

        public function get gesture():int;


    }
}//package com.sulake.habbo.room.messages

