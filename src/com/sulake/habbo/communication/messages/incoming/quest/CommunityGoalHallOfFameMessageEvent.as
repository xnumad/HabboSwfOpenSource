package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalHallOfFameParser;

    public class CommunityGoalHallOfFameMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function CommunityGoalHallOfFameMessageEvent(k:Function)
        {
            super(k, CommunityGoalHallOfFameParser);
        }

        public function getParser():CommunityGoalHallOfFameParser
        {
            return _parser as CommunityGoalHallOfFameParser;
        }
    }
}
