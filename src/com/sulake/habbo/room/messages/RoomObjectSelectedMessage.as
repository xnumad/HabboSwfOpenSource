package com.sulake.habbo.room.messages
{
    public class RoomObjectSelectedMessage extends RoomObjectUpdateStateMessage 
    {
        private var _selected:Boolean;

        public function RoomObjectSelectedMessage(k:Boolean)
        {
            this._selected = k;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }
    }
}
