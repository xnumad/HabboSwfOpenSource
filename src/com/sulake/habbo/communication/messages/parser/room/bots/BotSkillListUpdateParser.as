package com.sulake.habbo.communication.messages.parser.room.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotSkillListUpdateParser implements IMessageParser 
    {
        private var _botId:int;
        private var _skillList:Array;


        public function get skillList():Array
        {
            return this._skillList;
        }

        public function get _Str_5455():int
        {
            return this._botId;
        }

        public function flush():Boolean
        {
            this._botId = -1;
            this._skillList = new Array(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._botId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._skillList.push(new _Str_6169(k));
                _local_3++;
            }
            return true;
        }
    }
}
