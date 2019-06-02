package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectModelDataUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _numberKey:String;
        private var _numberValue:int;

        public function RoomObjectModelDataUpdateMessage(k:String, _arg_2:int)
        {
            super(null, null);
            this._numberKey = k;
            this._numberValue = _arg_2;
        }

        public function get numberKey():String
        {
            return this._numberKey;
        }

        public function get numberValue():int
        {
            return this._numberValue;
        }
    }
}
