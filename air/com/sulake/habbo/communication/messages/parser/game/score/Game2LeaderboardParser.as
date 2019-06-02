//com.sulake.habbo.communication.messages.parser.game.score.Game2LeaderboardParser

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2LeaderboardParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _leaderboard:Array;
        private var _totalListSize:int;

        public function Game2LeaderboardParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get gameTypeId():int;

        public function get leaderboard():Array;

        public function get totalListSize():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

