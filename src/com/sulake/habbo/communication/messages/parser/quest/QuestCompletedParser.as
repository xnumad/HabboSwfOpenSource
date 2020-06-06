package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestCompletedParser implements IMessageParser 
    {
        private var _Str_8460:QuestMessageData;
        private var _Str_21098:Boolean;


        public function flush():Boolean
        {
            this._Str_8460 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8460 = new QuestMessageData(k);
            this._Str_21098 = k.readBoolean();
            return true;
        }

        public function get _Str_8257():QuestMessageData
        {
            return this._Str_8460;
        }

        public function get _Str_23243():Boolean
        {
            return this._Str_21098;
        }
    }
}
