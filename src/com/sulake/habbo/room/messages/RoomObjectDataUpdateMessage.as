package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.IStuffData;

    public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _state:int;
        private var _data:IStuffData = null;
        private var _extra:Number = NaN;

        public function RoomObjectDataUpdateMessage(k:int, _arg_2:IStuffData, _arg_3:Number=NaN)
        {
            super(null, null);
            this._state = k;
            this._data = _arg_2;
            this._extra = _arg_3;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get data():IStuffData
        {
            return this._data;
        }

        public function get _Str_2794():Number
        {
            return this._extra;
        }
    }
}
