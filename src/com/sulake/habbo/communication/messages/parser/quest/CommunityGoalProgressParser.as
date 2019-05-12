package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgress;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalProgressParser implements IMessageParser 
    {
        private var _data:CommunityGoalProgress;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new CommunityGoalProgress(k);
            return true;
        }

        public function get data():CommunityGoalProgress
        {
            return this._data;
        }
    }
}
