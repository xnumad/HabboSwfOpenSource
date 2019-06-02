package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarSignUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _signType:int;

        public function RoomObjectAvatarSignUpdateMessage(k:int)
        {
            this._signType = k;
        }

        public function get signType():int
        {
            return this._signType;
        }
    }
}
