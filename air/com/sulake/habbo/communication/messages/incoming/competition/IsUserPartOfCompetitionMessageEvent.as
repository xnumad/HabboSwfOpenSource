//com.sulake.habbo.communication.messages.incoming.competition.IsUserPartOfCompetitionMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.IsUserPartOfCompetitionMessageParser;

    [SecureSWF(rename="true")]
    public class IsUserPartOfCompetitionMessageEvent extends MessageEvent implements IMessageEvent {

        public function IsUserPartOfCompetitionMessageEvent(k:Function);

        public function getParser():IsUserPartOfCompetitionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

