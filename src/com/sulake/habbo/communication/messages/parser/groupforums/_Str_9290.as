package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9290 implements IMessageParser 
    {
        private var _Str_7869:int;


        public function get _Str_9052():int
        {
            return this._Str_7869;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7869 = k.readInteger();
            return true;
        }
    }
}
