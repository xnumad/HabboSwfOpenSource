package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CompetitionVotingInfoMessageParser;

    public class CompetitionVotingInfoMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CompetitionVotingInfoMessageEvent(k:Function)
        {
            super(k, CompetitionVotingInfoMessageParser);
        }

        public function getParser():CompetitionVotingInfoMessageParser
        {
            return _parser as CompetitionVotingInfoMessageParser;
        }
    }
}
