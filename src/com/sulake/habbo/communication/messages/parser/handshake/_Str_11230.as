package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11230 implements IMessageParser 
    {
        private var _Str_7106:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7106 = k.readInteger();
            return true;
        }

        public function get _Str_17519():int
        {
            return this._Str_7106;
        }
    }
}
