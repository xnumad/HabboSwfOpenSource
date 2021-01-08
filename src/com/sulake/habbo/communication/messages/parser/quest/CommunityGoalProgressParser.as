package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalProgressParser implements IMessageParser 
    {
        private var _data:CommunityGoalData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new CommunityGoalData(k);
            return true;
        }

        public function get data():CommunityGoalData
        {
            return this._data;
        }
    }
}
