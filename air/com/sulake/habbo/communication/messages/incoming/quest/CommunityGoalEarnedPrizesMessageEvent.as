//com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalEarnedPrizesMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalEarnedPrizesMessageParser;

    [SecureSWF(rename="true")]
    public class CommunityGoalEarnedPrizesMessageEvent extends MessageEvent implements IMessageEvent {

        public function CommunityGoalEarnedPrizesMessageEvent(k:Function);

        public function getParser():CommunityGoalEarnedPrizesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

