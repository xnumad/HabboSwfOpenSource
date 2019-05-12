package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6257 implements _Str_4106 
    {
        private var _userId:int;
        private var _userName:String;
        private var _figure:String;
        private var _rank:int;
        private var _Str_11456:int;

        public function _Str_6257(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._userName = k.readString();
            this._figure = k.readString();
            this._rank = k.readInteger();
            this._Str_11456 = k.readInteger();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get rank():int
        {
            return this._rank;
        }

        public function get _Str_7605():int
        {
            return this._Str_11456;
        }
    }
}
