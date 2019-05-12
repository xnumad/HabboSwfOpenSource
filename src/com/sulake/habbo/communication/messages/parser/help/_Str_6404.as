package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6404 implements IMessageParser 
    {
        private var _Str_19490:Boolean;
        private var _Str_21721:int;
        private var _Str_21548:String;
        private var _Str_21391:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19490 = k.readBoolean();
            this._Str_21721 = k.readInteger();
            this._Str_21548 = k.readString();
            this._Str_21391 = k.readInteger();
            return true;
        }

        public function get _Str_23343():Boolean
        {
            return this._Str_19490;
        }

        public function get _Str_20566():int
        {
            return this._Str_21721;
        }

        public function get _Str_19914():String
        {
            return this._Str_21548;
        }

        public function get _Str_19737():int
        {
            return this._Str_21391;
        }
    }
}
