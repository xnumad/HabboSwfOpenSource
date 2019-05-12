package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPlayerValueUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _value:int;

        public function RoomObjectAvatarPlayerValueUpdateMessage(k:int)
        {
            this._value = k;
        }

        public function get value():int
        {
            return this._value;
        }
    }
}
