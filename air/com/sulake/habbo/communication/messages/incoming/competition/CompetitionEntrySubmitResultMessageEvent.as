//com.sulake.habbo.communication.messages.incoming.competition.CompetitionEntrySubmitResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CompetitionEntrySubmitResultMessageParser;

    [SecureSWF(rename="true")]
    public class CompetitionEntrySubmitResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function CompetitionEntrySubmitResultMessageEvent(k:Function);

        public function getParser():CompetitionEntrySubmitResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

