//com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarExpressionUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _expressionType:int;

        public function RoomObjectAvatarExpressionUpdateMessage(k:int=-1);

        public function get expressionType():int;


    }
}//package com.sulake.habbo.room.messages

