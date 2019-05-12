package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5768 implements IMessageParser 
    {
        public static const _Str_16052:int = 0;
        public static const _Str_20580:int = 1;

        private var _status:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = k.readInteger();
            return true;
        }

        public function get status():int
        {
            return this._status;
        }
    }
}
