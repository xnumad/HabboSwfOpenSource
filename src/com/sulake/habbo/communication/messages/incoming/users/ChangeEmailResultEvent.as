package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ChangeEmailResultParser;

    public class ChangeEmailResultEvent extends MessageEvent implements IMessageEvent
    {
        public function ChangeEmailResultEvent(k:Function)
        {
            super(k, ChangeEmailResultParser);
        }

        public function getParser():ChangeEmailResultParser
        {
            return _parser as ChangeEmailResultParser;
        }
    }
}
