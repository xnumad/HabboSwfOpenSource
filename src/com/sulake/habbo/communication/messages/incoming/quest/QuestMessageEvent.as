package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestParser;

    public class QuestMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestMessageEvent(k:Function)
        {
            super(k, QuestParser);
        }

        public function getParser():QuestParser
        {
            return _parser as QuestParser;
        }
    }
}
