package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalEarnedPrizesParser;

    public class CommunityGoalEarnedPrizesMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function CommunityGoalEarnedPrizesMessageEvent(k:Function)
        {
            super(k, CommunityGoalEarnedPrizesParser);
        }

        public function getParser():CommunityGoalEarnedPrizesParser
        {
            return this._parser as CommunityGoalEarnedPrizesParser;
        }
    }
}
