//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLobbyPlayerData {

        public static var totalScoreComparator:Function;
        public static var skillLevelComparator:Function;

        private var _userId:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _teamId:int;
        private var _skillLevel:int;
        private var _totalScore:int;
        private var _scoreToNextLevel:int;

        public function GameLobbyPlayerData(k:IMessageDataWrapper);

        private static function comparePlayersByTotalScore(k:GameLobbyPlayerData, _arg_2:GameLobbyPlayerData):Number;

        private static function comparePlayersBySkillLevel(k:GameLobbyPlayerData, _arg_2:GameLobbyPlayerData):Number;


        public function get userId():int;

        public function get name():String;

        public function get figure():String;

        public function get gender():String;

        public function get teamId():int;

        public function get skillLevel():int;

        public function get totalScore():int;

        public function get scoreToNextLevel():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

