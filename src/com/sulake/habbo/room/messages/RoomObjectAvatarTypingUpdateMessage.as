package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarTypingUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _isTyping:Boolean;

        public function RoomObjectAvatarTypingUpdateMessage(k:Boolean=false)
        {
            this._isTyping = k;
        }

        public function get _Str_7319():Boolean
        {
            return this._isTyping;
        }
    }
}
