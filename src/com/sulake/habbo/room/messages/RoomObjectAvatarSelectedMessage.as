package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarSelectedMessage extends RoomObjectUpdateStateMessage 
    {
        private var _selected:Boolean;

        public function RoomObjectAvatarSelectedMessage(k:Boolean)
        {
            this._selected = k;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }
    }
}
