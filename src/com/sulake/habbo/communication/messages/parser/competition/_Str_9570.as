package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9570 implements IMessageParser 
    {
        private var _Str_8997:String;
        private var _Str_21095:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8997 = k.readString();
            this._Str_21095 = k.readInteger();
            return true;
        }

        public function get _Str_23288():String
        {
            return this._Str_8997;
        }

        public function get _Str_25497():int
        {
            return this._Str_21095;
        }
    }
}
