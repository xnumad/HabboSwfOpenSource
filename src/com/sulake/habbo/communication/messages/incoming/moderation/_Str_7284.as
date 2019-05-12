package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7284 
    {
        private var _userId:int;
        private var _userName:String;
        private var _rooms:Array;

        public function _Str_7284(k:IMessageDataWrapper)
        {
            this._rooms = new Array();
            super();
            this._userId = k.readInteger();
            this._userName = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._rooms.push(new ChatRecordData(k));
                _local_3++;
            }
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get rooms():Array
        {
            return this._rooms;
        }
    }
}
