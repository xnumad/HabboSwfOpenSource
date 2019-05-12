package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectItemDataUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _itemData:String;

        public function RoomObjectItemDataUpdateMessage(k:String)
        {
            super(null, null);
            this._itemData = k;
        }

        public function get _Str_18505():String
        {
            return this._itemData;
        }
    }
}
