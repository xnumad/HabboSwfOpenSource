package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_11993;

    public class _Str_8667 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8667(k:Function)
        {
            super(k, _Str_11993);
        }

        public function get link():String
        {
            return (_parser as _Str_11993).link;
        }
    }
}
