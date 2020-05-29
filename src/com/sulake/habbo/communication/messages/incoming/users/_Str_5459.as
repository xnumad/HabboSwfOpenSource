package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.IgnoreResultMessageParser;

    public class _Str_5459 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5459(k:Function)
        {
            super(k, IgnoreResultMessageParser);
        }

        public function get result():int
        {
            return (_parser as IgnoreResultMessageParser).result;
        }

        public function get name():String
        {
            return (_parser as IgnoreResultMessageParser).name;
        }
    }
}
