package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9027 implements IMessageParser 
    {
        private static const _Str_17022:int = 0;
        private static const _Str_16537:int = 1;
        private static const _Str_22033:int = 2;

        private var _Str_13064:int = -1;


        public function flush():Boolean
        {
            this._Str_13064 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_13064 = k.readInteger();
            return true;
        }

        public function get _Str_5961():String
        {
            if (((this._Str_13064 == _Str_17022) || (this._Str_13064 == _Str_16537)))
            {
                return "valid";
            }
            return "invalid";
        }
    }
}
