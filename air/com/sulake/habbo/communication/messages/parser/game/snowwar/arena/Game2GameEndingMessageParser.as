//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameEndingMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameEndingMessageParser implements IMessageParser {

        private var _timeToNextState:int;
        private var _teams:Array;
        private var _teamScores:Array;
        private var _generalStats:Game2SnowWarGameStats;
        private var _gameResult:Game2GameResult;

        public function Game2GameEndingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get timeToNextState():int;

        public function get teams():Array;

        public function get teamScores():Array;

        public function get gameResult():Game2GameResult;

        public function get generalStats():Game2SnowWarGameStats;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

