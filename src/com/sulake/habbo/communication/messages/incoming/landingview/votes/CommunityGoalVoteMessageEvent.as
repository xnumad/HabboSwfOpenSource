package com.sulake.habbo.communication.messages.incoming.landingview.votes
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.landingview.votes.CommunityVoteReceivedParser;

    public class CommunityGoalVoteMessageEvent extends MessageEvent
    {
        public function CommunityGoalVoteMessageEvent(k:Function)
        {
            super(k, CommunityVoteReceivedParser);
        }

        public function getParser():CommunityVoteReceivedParser
        {
            return _parser as CommunityVoteReceivedParser;
        }
    }
}
