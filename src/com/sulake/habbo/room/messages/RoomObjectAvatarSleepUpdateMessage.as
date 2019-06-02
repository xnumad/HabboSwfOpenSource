package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarSleepUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _isSleeping:Boolean;

        public function RoomObjectAvatarSleepUpdateMessage(k:Boolean=false)
        {
            this._isSleeping = k;
        }

        public function get isSleeping():Boolean
        {
            return this._isSleeping;
        }
    }
}
