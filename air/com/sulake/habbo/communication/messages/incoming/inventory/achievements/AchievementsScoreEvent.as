//com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsScoreEvent

package com.sulake.habbo.communication.messages.incoming.inventory.achievements{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementsScoreEvent extends MessageEvent implements IMessageEvent {

        public function AchievementsScoreEvent(k:Function);

        public function getParser():AchievementsScoreMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.achievements

