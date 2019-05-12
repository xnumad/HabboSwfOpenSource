package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9068 implements IMessageParser 
    {
        private var _Str_4271:String;
        private var _code:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_4271 = k.readString();
            this._code = k.readString();
            return true;
        }

        public function get _Str_18517():String
        {
            return this._Str_4271;
        }

        public function get code():String
        {
            return this._code;
        }
    }
}
