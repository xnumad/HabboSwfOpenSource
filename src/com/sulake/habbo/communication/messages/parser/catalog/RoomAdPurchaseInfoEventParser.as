package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.RoomEntryData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomAdPurchaseInfoEventParser implements IMessageParser
    {
        private var _isVip:Boolean;
        private var _rooms:Array;


        public function flush():Boolean
        {
            return false;
        }

        public function get rooms():Array
        {
            return this._rooms;
        }

        public function get _Str_12313():Boolean
        {
            return this._isVip;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:String;
            var _local_6:Boolean;
            var _local_7:RoomEntryData;
            this._rooms = new Array();
            this._isVip = k.readBoolean();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readString();
                _local_6 = k.readBoolean();
                _local_7 = new RoomEntryData(_local_4, _local_5, _local_6);
                this._rooms.push(_local_7);
                _local_3++;
            }
            return true;
        }
    }
}
