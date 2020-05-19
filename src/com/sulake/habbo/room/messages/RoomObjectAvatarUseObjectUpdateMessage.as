package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarUseObjectUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _itemType:int;

        public function RoomObjectAvatarUseObjectUpdateMessage(k:int)
        {
            this._itemType = k;
        }

        public function get itemType():int
        {
            return this._itemType;
        }
    }
}
