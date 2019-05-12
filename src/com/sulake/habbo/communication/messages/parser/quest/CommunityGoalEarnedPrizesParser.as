package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_11620;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalEarnedPrizesParser implements IMessageParser 
    {
        private var _prizes:Array;


        public function flush():Boolean
        {
            this._prizes = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._prizes.push(new _Str_11620(k));
                _local_3++;
            }
            return true;
        }

        public function get prizes():Array
        {
            return this._prizes;
        }
    }
}
