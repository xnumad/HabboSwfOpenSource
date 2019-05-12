package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9156;

    public class _Str_5459 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5459(k:Function)
        {
            super(k, _Str_9156);
        }

        public function get result():int
        {
            return (_parser as _Str_9156).result;
        }

        public function get name():String
        {
            return (_parser as _Str_9156).name;
        }
    }
}
