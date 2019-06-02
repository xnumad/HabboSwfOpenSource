package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarMutedUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _isMuted:Boolean;

        public function RoomObjectAvatarMutedUpdateMessage(k:Boolean=false)
        {
            this._isMuted = k;
        }

        public function get isMuted():Boolean
        {
            return this._isMuted;
        }
    }
}
