//com.sulake.habbo.communication.messages.parser.game.directory.Game2GameDirectoryStatusMessageParser

package com.sulake.habbo.communication.messages.parser.game.directory{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameDirectoryStatusMessageParser implements IMessageParser {

        public static const STATUS_OK:int;
        public static const STATUS_FAILED_REASON_UNKNOWN:int;
        public static const STATUS_FAILED_REASON_GAME_DIRECTORY_IS_NOT_AVAILABLE:int;
        public static const STATUS_FAILED_REASON_HOTEL_IS_CLOSED:int;

        private var _status:int;
        private var _blockLength:int;
        private var _gamesPlayed:int;
        private var _freeGamesLeft:int;

        public function Game2GameDirectoryStatusMessageParser();

        public function get status():int;

        public function get blockLength():int;

        public function get gamesPlayed():int;

        public function get freeGamesLeft():int;

        public function get hasUnlimitedGames():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.directory

