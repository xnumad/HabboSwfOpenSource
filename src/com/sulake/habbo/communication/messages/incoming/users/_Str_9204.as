package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ChangeEmailResultParser;

    public class _Str_9204 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9204(k:Function)
        {
            super(k, ChangeEmailResultParser);
        }

        public function getParser():ChangeEmailResultParser
        {
            return _parser as ChangeEmailResultParser;
        }
    }
}
