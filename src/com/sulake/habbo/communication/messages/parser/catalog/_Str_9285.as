package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9285 implements IMessageParser 
    {
        private var _Str_11781:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_11781 = k.readInteger();
            return true;
        }

        public function get _Str_10882():int
        {
            return this._Str_11781;
        }
    }
}
