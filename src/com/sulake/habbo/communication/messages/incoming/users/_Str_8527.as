package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9277;

    public class _Str_8527 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8527(k:Function)
        {
            super(k, _Str_9277);
        }

        public function get tags():Array
        {
            return (_parser as _Str_9277).tags;
        }

        public function get userId():int
        {
            return (_parser as _Str_9277).userId;
        }
    }
}
