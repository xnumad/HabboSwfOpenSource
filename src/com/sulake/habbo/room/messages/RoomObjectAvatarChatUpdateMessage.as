package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarChatUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _numberOfWords:int;

        public function RoomObjectAvatarChatUpdateMessage(k:int)
        {
            this._numberOfWords = k;
        }

        public function get numberOfWords():int
        {
            return this._numberOfWords;
        }
    }
}
