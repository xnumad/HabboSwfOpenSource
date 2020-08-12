package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.InfoFeedEnableMessageParser;

    public class InfoFeedEnableMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function InfoFeedEnableMessageEvent(k:Function)
        {
            super(k, InfoFeedEnableMessageParser);
        }

        public function get enabled():Boolean
        {
            return (_parser as InfoFeedEnableMessageParser).enabled;
        }
    }
}
