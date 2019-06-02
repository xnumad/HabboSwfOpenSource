//com.sulake.habbo.communication.messages.parser.game.directory.Game2AccountGameStatusMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2AccountGameStatusMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _freeGamesLeft:int;
        private var _gamesPlayedTotal:int;

        public function Game2AccountGameStatusMessageParser();

        public function get gameTypeId():int;

        public function get freeGamesLeft():int;

        public function get gamesPlayedTotal():int;

        public function get hasUnlimitedGames():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

