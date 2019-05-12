package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8206 implements IMessageParser 
    {
        private var _Str_20485:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_20485 = k.readInteger();
            return true;
        }

        public function get _Str_22745():int
        {
            return this._Str_20485;
        }
    }
}
