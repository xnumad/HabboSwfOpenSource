//com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalProgressMessageParser;

    [SecureSWF(rename="true")]
    public class CommunityGoalProgressMessageEvent extends MessageEvent implements IMessageEvent {

        public function CommunityGoalProgressMessageEvent(k:Function);

        public function getParser():CommunityGoalProgressMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

