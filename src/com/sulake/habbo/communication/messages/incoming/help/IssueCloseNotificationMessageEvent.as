package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.IssueCloseNotificationMessageParser;

    public class IssueCloseNotificationMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function IssueCloseNotificationMessageEvent(k:Function)
        {
            super(k, IssueCloseNotificationMessageParser);
        }

        public function getParser():IssueCloseNotificationMessageParser
        {
            return _parser as IssueCloseNotificationMessageParser;
        }
    }
}
