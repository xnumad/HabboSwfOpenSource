package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalProgressParser;

    public class CommunityGoalProgressMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function CommunityGoalProgressMessageEvent(k:Function)
        {
            super(k, CommunityGoalProgressParser);
        }

        public function getParser():CommunityGoalProgressParser
        {
            return _parser as CommunityGoalProgressParser;
        }
    }
}
