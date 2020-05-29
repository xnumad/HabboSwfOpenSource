package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.EmailStatusParser;

    public class EmailStatusResultEvent extends MessageEvent implements IMessageEvent
    {
        public function EmailStatusResultEvent(k:Function)
        {
            super(k, EmailStatusParser);
        }

        public function getParser():EmailStatusParser
        {
            return _parser as EmailStatusParser;
        }
    }
}
