//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLobbyData {

        private var _gameId:int;
        private var _levelName:String;
        private var _gameType:int;
        private var _fieldType:int;
        private var _numberOfTeams:int;
        private var _maximumPlayers:int;
        private var _owningPlayerName:String;
        private var _levelEntryId:int;
        private var _players:Array;

        public function GameLobbyData(k:IMessageDataWrapper);

        public function get gameId():int;

        public function get gameType():int;

        public function get fieldType():int;

        public function get numberOfTeams():int;

        public function get maximumPlayers():int;

        public function get owningPlayerName():String;

        public function get levelEntryId():int;

        public function get players():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

