//com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFameMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalHallOfFameMessageParser;

    [SecureSWF(rename="true")]
    public class CommunityGoalHallOfFameMessageEvent extends MessageEvent implements IMessageEvent {

        public function CommunityGoalHallOfFameMessageEvent(k:Function);

        public function getParser():CommunityGoalHallOfFameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

