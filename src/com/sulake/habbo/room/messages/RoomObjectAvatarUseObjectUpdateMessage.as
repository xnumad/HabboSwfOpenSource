package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarUseObjectUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _itemType:int;

        public function RoomObjectAvatarUseObjectUpdateMessage(k:int)
        {
            this._itemType = k;
        }

        public function get _Str_2887():int
        {
            return this._itemType;
        }
    }
}
