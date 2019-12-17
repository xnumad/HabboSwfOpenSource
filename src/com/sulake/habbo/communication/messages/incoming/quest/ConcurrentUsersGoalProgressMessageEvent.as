package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.ConcurrentUsersGoalProgressParser;

    public class ConcurrentUsersGoalProgressMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function ConcurrentUsersGoalProgressMessageEvent(k:Function)
        {
            super(k, ConcurrentUsersGoalProgressParser);
        }

        public function getParser():ConcurrentUsersGoalProgressParser
        {
            return _parser as ConcurrentUsersGoalProgressParser;
        }
    }
}
