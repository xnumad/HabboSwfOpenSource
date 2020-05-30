package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ClubGiftNotificationParser;

    public class ClubGiftNotificationEvent extends MessageEvent implements IMessageEvent
    {
        public function ClubGiftNotificationEvent(k:Function)
        {
            super(k, ClubGiftNotificationParser);
        }

        public function getParser():ClubGiftNotificationParser
        {
            return _parser as ClubGiftNotificationParser;
        }
    }
}
