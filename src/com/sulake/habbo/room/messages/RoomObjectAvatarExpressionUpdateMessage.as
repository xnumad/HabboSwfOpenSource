package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarExpressionUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _expressionType:int = -1;

        public function RoomObjectAvatarExpressionUpdateMessage(k:int=-1)
        {
            this._expressionType = k;
        }

        public function get expressionType():int
        {
            return this._expressionType;
        }
    }
}
