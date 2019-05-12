package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFameData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalHallOfFameParser implements IMessageParser 
    {
        private var _data:CommunityGoalHallOfFameData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new CommunityGoalHallOfFameData(k);
            return true;
        }

        public function get data():CommunityGoalHallOfFameData
        {
            return this._data;
        }
    }
}
