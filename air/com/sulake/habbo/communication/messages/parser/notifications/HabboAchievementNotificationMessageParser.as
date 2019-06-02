//com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboAchievementNotificationMessageParser implements IMessageParser {

        private var _data:AchievementLevelUpData;

        public function HabboAchievementNotificationMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():AchievementLevelUpData;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

