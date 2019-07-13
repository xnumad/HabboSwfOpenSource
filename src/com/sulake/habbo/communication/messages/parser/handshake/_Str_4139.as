package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4139 implements IMessageParser 
    {
        private var _id:int;
        private var _name:String;
        private var _figure:String;
        private var _Str_4037:String;
        private var _Str_7867:String;
        private var _realName:String;
        private var _Str_21976:Boolean;
        private var _Str_7278:int;
        private var _Str_3437:int;
        private var _Str_3973:int;
        private var _Str_21322:Boolean;
        private var _Str_20853:String;
        private var _Str_7394:Boolean;
        private var _Str_9602:Boolean = false;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._name = k.readString();
            this._figure = k.readString();
            this._Str_4037 = k.readString();
            this._Str_7867 = k.readString();
            this._realName = k.readString();
            this._Str_21976 = k.readBoolean();
            this._Str_7278 = k.readInteger();
            this._Str_3437 = k.readInteger();
            this._Str_3973 = k.readInteger();
            this._Str_21322 = k.readBoolean();
            this._Str_20853 = k.readString();
            this._Str_7394 = k.readBoolean();
            this._Str_9602 = k.readBoolean();
            return true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_3344():String
        {
            return this._Str_4037;
        }

        public function get _Str_3073():String
        {
            return this._Str_7867;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get _Str_26317():Boolean
        {
            return this._Str_21976;
        }

        public function get _Str_10295():int
        {
            return this._Str_7278;
        }

        public function get petRespectLeft():int
        {
            return this._Str_3437;
        }

        public function get _Str_2985():int
        {
            return this._Str_3973;
        }

        public function get _Str_26272():Boolean
        {
            return this._Str_21322;
        }

        public function get _Str_26222():String
        {
            return this._Str_20853;
        }

        public function get _Str_11198():Boolean
        {
            return this._Str_7394;
        }

        public function get _Str_21338():Boolean
        {
            return this._Str_9602;
        }
    }
}
