//com.sulake.habbo.communication.messages.parser.game.lobby.GameAchievementData

package com.sulake.habbo.communication.messages.parser.game.lobby{
    public class GameAchievementData {

        private var _gameTypeId:int;
        private var _achievementId:int;
        private var _achievementName:String;
        private var _levels:int;

        public function GameAchievementData(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function get gameTypeId():int;

        public function get achievementId():int;

        public function get achievementName():String;

        public function get levels():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

