package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestDailyParser;

    public class QuestDailyMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestDailyMessageEvent(k:Function)
        {
            super(k, QuestDailyParser);
        }

        public function _Str_2273():QuestDailyParser
        {
            return _parser as QuestDailyParser;
        }
    }
}
