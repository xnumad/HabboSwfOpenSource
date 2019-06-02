//com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;

    [SecureSWF(rename="true")]
    public class HabboAchievementNotificationMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboAchievementNotificationMessageEvent(k:Function);

        public function getParser():HabboAchievementNotificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

