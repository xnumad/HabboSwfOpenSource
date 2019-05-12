package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9102 implements IMessageParser 
    {
        private var _Str_18965:int;


        public function flush():Boolean
        {
            this._Str_18965 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18965 = k.readInteger();
            return true;
        }

        public function get _Str_23730():int
        {
            return this._Str_18965;
        }
    }
}
