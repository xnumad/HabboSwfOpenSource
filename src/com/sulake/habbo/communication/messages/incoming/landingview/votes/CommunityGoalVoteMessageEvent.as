package com.sulake.habbo.communication.messages.incoming.landingview.votes
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.landingview.votes._Str_8895;

    public class CommunityGoalVoteMessageEvent extends MessageEvent
    {
        public function CommunityGoalVoteMessageEvent(k:Function)
        {
            super(k, _Str_8895);
        }

        public function getParser():_Str_8895
        {
            return _parser as _Str_8895;
        }
    }
}
