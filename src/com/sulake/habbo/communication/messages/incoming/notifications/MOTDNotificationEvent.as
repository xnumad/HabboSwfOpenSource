package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.MOTDNotificationParser;

    public class MOTDNotificationEvent extends MessageEvent implements IMessageEvent
    {
        public function MOTDNotificationEvent(k:Function)
        {
            super(k, MOTDNotificationParser);
        }

        public function getParser():MOTDNotificationParser
        {
            return _parser as MOTDNotificationParser;
        }
    }
}
