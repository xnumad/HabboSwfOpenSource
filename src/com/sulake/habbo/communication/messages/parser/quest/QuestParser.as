package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestParser implements IMessageParser 
    {
        private var _quest:QuestMessageData;


        public function flush():Boolean
        {
            this._quest = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._quest = new QuestMessageData(k);
            return true;
        }

        public function get quest():QuestMessageData
        {
            return this._quest;
        }
    }
}
