package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SeasonalQuestsParser implements IMessageParser 
    {
        private var _quests:Array;


        public function flush():Boolean
        {
            this._quests = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._quests.push(new _Str_2455(k));
                _local_3++;
            }
            return true;
        }

        public function get quests():Array
        {
            return this._quests;
        }
    }
}
