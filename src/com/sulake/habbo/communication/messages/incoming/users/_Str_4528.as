package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4528 
    {
        private var _Str_19765:int;
        private var _Str_20486:String;
        private var _Str_19889:Number;
        private var _Str_22041:int;
        private var _Str_19415:int;
        private var _Str_20947:int;
        private var _Str_20409:int;
        private var _Str_19645:int;
        private var _Str_20509:int;

        public function _Str_4528(k:IMessageDataWrapper=null)
        {
            this._Str_19765 = k.readInteger();
            this._Str_20486 = k.readString();
            this._Str_19889 = k.readDouble();
            this._Str_22041 = k.readInteger();
            this._Str_19415 = k.readInteger();
            this._Str_20947 = k.readInteger();
            this._Str_20409 = k.readInteger();
            this._Str_19645 = k.readInteger();
            this._Str_20509 = k.readInteger();
        }

        public function get _Str_25314():int
        {
            return this._Str_19765;
        }

        public function get _Str_25452():String
        {
            return this._Str_20486;
        }

        public function get _Str_8404():Number
        {
            return this._Str_19889;
        }

        public function get _Str_26025():int
        {
            return this._Str_22041;
        }

        public function get _Str_26262():int
        {
            return this._Str_19415;
        }

        public function get _Str_21847():int
        {
            return this._Str_20947;
        }

        public function get _Str_14016():int
        {
            return this._Str_20409;
        }

        public function get _Str_19650():int
        {
            return this._Str_19645;
        }

        public function get _Str_20889():int
        {
            return this._Str_20509;
        }
    }
}
