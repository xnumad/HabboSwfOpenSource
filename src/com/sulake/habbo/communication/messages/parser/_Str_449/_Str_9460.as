package com.sulake.habbo.communication.messages.parser._Str_449
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9460 implements IMessageParser 
    {
        private var _Str_18491:int;
        private var _Str_19995:int;
        private var _millisecondsToAllowProcessReset:int;


        public function get _Str_24357():int
        {
            return this._Str_18491;
        }

        public function get _Str_24164():int
        {
            return this._Str_19995;
        }

        public function get millisecondsToAllowProcessReset():int
        {
            return this._millisecondsToAllowProcessReset;
        }

        public function flush():Boolean
        {
            this._Str_18491 = -1;
            this._millisecondsToAllowProcessReset = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18491 = k.readInteger();
            this._Str_19995 = k.readInteger();
            this._millisecondsToAllowProcessReset = k.readInteger();
            return true;
        }
    }
}
