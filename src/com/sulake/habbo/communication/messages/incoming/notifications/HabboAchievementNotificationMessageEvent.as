package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;

    public class HabboAchievementNotificationMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function HabboAchievementNotificationMessageEvent(k:Function)
        {
            super(k, HabboAchievementNotificationMessageParser);
        }

        public function getParser():HabboAchievementNotificationMessageParser
        {
            return _parser as HabboAchievementNotificationMessageParser;
        }
    }
}
