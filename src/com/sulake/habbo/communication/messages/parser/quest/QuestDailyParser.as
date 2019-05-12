package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestDailyParser implements IMessageParser 
    {
        private var _quest:_Str_2455;
        private var _Str_5292:int;
        private var _Str_5541:int;


        public function flush():Boolean
        {
            this._quest = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:Boolean = k.readBoolean();
            if (_local_2)
            {
                this._quest = new _Str_2455(k);
                this._Str_5292 = k.readInteger();
                this._Str_5541 = k.readInteger();
            }
            return true;
        }

        public function get quest():_Str_2455
        {
            return this._quest;
        }

        public function get _Str_20037():int
        {
            return this._Str_5292;
        }

        public function get _Str_19915():int
        {
            return this._Str_5541;
        }
    }
}
