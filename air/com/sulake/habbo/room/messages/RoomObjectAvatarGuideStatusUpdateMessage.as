//com.sulake.habbo.room.messages.RoomObjectAvatarGuideStatusUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarGuideStatusUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _guideStatus:int;

        public function RoomObjectAvatarGuideStatusUpdateMessage(k:int);

        public function get guideStatus():int;


    }
}//package com.sulake.habbo.room.messages

