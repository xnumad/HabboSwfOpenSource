//com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsEvent

package com.sulake.habbo.communication.messages.incoming.inventory.achievements{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementsEvent extends MessageEvent implements IMessageEvent {

        public function AchievementsEvent(k:Function);

        public function getParser():AchievementsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.achievements

