package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4838 
    {
        private var _Str_22032:int;
        private var _friendCount:int;
        private var _Str_19585:int;
        private var _Str_21862:String;
        private var _Str_20718:String;

        public function _Str_4838(k:IMessageDataWrapper)
        {
            this._Str_22032 = k.readInteger();
            this._friendCount = k.readInteger();
            this._Str_19585 = k.readInteger();
            this._Str_21862 = k.readString();
            this._Str_20718 = k.readString();
        }

        public function get _Str_24791():int
        {
            return this._Str_22032;
        }

        public function get friendCount():int
        {
            return this._friendCount;
        }

        public function get _Str_21077():int
        {
            return this._Str_19585;
        }

        public function get _Str_20359():String
        {
            return this._Str_21862;
        }

        public function get _Str_22960():String
        {
            return this._Str_20718;
        }
    }
}
