package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedParser;

    public class QuestCompletedMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestCompletedMessageEvent(k:Function)
        {
            super(k, QuestCompletedParser);
        }

        public function getParser():QuestCompletedParser
        {
            return _parser as QuestCompletedParser;
        }
    }
}
