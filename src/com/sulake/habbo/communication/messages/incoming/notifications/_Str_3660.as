package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;

    public class _Str_3660 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3660(k:Function)
        {
            super(k, HabboAchievementNotificationMessageParser);
        }

        public function getParser():HabboAchievementNotificationMessageParser
        {
            return _parser as HabboAchievementNotificationMessageParser;
        }
    }
}
