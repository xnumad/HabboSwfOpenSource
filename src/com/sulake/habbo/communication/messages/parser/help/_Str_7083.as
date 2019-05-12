package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7083 implements IMessageParser 
    {
        private var _Str_18898:int;
        private var _Str_8977:String;


        public function flush():Boolean
        {
            this._Str_18898 = -1;
            this._Str_8977 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18898 = k.readInteger();
            this._Str_8977 = k.readString();
            return true;
        }

        public function get _Str_23086():int
        {
            return this._Str_18898;
        }

        public function get _Str_17106():String
        {
            return this._Str_8977;
        }
    }
}
