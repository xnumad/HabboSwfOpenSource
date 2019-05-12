package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3742 
    {
        private var _Str_2914:int;
        private var _Str_6234:String;
        private var _Str_6967:int;
        private var _Str_3704:String;

        public function _Str_3742(k:IMessageDataWrapper)
        {
            this._Str_2914 = k.readInteger();
            this._Str_6234 = k.readString();
            this._Str_3704 = k.readString();
            this._Str_6967 = this._Str_2914;
        }

        public function get _Str_2951():int
        {
            return this._Str_2914;
        }

        public function get _Str_6445():String
        {
            return this._Str_6234;
        }

        public function get _Str_7048():int
        {
            return this._Str_6967;
        }

        public function get _Str_4217():String
        {
            return this._Str_3704;
        }
    }
}
