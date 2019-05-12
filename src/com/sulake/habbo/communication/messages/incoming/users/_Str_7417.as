package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9062;

    public class _Str_7417 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7417(k:Function)
        {
            super(k, _Str_9062);
        }

        public function get userId():int
        {
            return _Str_9062(_parser).userId;
        }
    }
}
