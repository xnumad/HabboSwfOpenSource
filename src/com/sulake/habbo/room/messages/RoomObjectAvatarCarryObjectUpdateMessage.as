package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _itemType:int;
        private var _itemName:String;

        public function RoomObjectAvatarCarryObjectUpdateMessage(k:int, _arg_2:String)
        {
            this._itemType = k;
            this._itemName = _arg_2;
        }

        public function get _Str_2887():int
        {
            return this._itemType;
        }

        public function get _Str_20736():String
        {
            return this._itemName;
        }
    }
}
