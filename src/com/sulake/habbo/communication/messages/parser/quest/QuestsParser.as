package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestsParser implements IMessageParser 
    {
        private var _quests:Array;
        private var _Str_14850:Boolean;


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
            this._Str_14850 = k.readBoolean();
            return true;
        }

        public function get quests():Array
        {
            return this._quests;
        }

        public function get _Str_2826():Boolean
        {
            return this._Str_14850;
        }
    }
}
