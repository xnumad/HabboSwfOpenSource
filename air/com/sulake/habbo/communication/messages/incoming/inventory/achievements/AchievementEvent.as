//com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementEvent

package com.sulake.habbo.communication.messages.incoming.inventory.achievements{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementMessageParser;

    [SecureSWF(rename="true")]
    public class AchievementEvent extends MessageEvent implements IMessageEvent {

        public function AchievementEvent(k:Function);

        public function getParser():AchievementMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.achievements

