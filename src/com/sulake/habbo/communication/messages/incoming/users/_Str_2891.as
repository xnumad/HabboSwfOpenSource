package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2891 
    {
        private static const _Str_18346:int = 0;
        private static const _Str_17015:int = 1;
        private static const _Str_20696:int = 2;
        private static const _Str_16330:int = 3;
        private static const _Str_18721:int = 4;

        private var _type:int;
        private var _userId:int;
        private var _userName:String;
        private var _figure:String;
        private var _Str_20370:String;

        public function _Str_2891(k:IMessageDataWrapper)
        {
            this._type = k.readInteger();
            this._userId = k.readInteger();
            this._userName = k.readString();
            this._figure = k.readString();
            this._Str_20370 = k.readString();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get admin():Boolean
        {
            return this._type == _Str_17015;
        }

        public function get owner():Boolean
        {
            return this._type == _Str_18346;
        }

        public function get member():Boolean
        {
            return !(this._type == _Str_16330);
        }

        public function get blocked():Boolean
        {
            return this._type == _Str_18721;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_20842():String
        {
            return this._Str_20370;
        }
    }
}
