package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboAchievementNotificationMessageParser implements IMessageParser
    {
        private var _data:AchievementLevelUpData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new AchievementLevelUpData(k);
            return true;
        }

        public function get data():AchievementLevelUpData
        {
            return this._data;
        }
    }
}
