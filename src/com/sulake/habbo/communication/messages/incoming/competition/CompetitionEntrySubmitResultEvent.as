package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CompetitionEntrySubmitResultMessageParser;

    public class CompetitionEntrySubmitResultEvent extends MessageEvent implements IMessageEvent 
    {
        public function CompetitionEntrySubmitResultEvent(k:Function)
        {
            super(k, CompetitionEntrySubmitResultMessageParser);
        }

        public function getParser():CompetitionEntrySubmitResultMessageParser
        {
            return _parser as CompetitionEntrySubmitResultMessageParser;
        }
    }
}
