package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserGameAchievementsMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _achievements:AchievementsParser;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._achievements = new AchievementsParser();
            this._achievements.parse(k);
            return true;
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get achievements():Array
        {
            return this._achievements.achievements;
        }

        public function get defaultCategory():String
        {
            return this._achievements.defaultCategory;
        }
    }
}
