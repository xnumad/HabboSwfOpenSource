//com.sulake.habbo.communication.messages.incoming.competition.CompetitionVotingInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CompetitionVotingInfoMessageParser;

    [SecureSWF(rename="true")]
    public class CompetitionVotingInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function CompetitionVotingInfoMessageEvent(k:Function);

        public function getParser():CompetitionVotingInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

