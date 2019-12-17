package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestCancelledParser;

    public class QuestCancelledMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestCancelledMessageEvent(k:Function)
        {
            super(k, QuestCancelledParser);
        }

        public function getParser():QuestCancelledParser
        {
            return _parser as QuestCancelledParser;
        }
    }
}
