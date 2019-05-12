package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestParser implements IMessageParser 
    {
        private var _quest:_Str_2455;


        public function flush():Boolean
        {
            this._quest = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._quest = new _Str_2455(k);
            return true;
        }

        public function get quest():_Str_2455
        {
            return this._quest;
        }
    }
}
