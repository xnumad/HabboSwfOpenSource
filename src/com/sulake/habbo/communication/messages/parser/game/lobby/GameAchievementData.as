package com.sulake.habbo.communication.messages.parser.game.lobby
{
    public class GameAchievementData
    {
        private var _gameTypeId:int;
        private var _achievementId:int;
        private var _achievementName:String;
        private var _levels:int;

        public function GameAchievementData(k:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            this._gameTypeId = k;
            this._achievementId = _arg_2;
            this._achievementName = _arg_3;
            this._levels = _arg_4;
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get achievementName():String
        {
            return this._achievementName;
        }

        public function get levels():int
        {
            return this._levels;
        }
    }
}
