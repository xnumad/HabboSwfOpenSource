//com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2WeeklyLeaderboardParser extends Game2LeaderboardParser {

        private var _year:int;
        private var _week:int;
        private var _maxOffset:int;
        private var _currentOffset:int;
        private var _minutesUntilReset:int;

        public function Game2WeeklyLeaderboardParser();

        public function get year():int;

        public function get week():int;

        public function get maxOffset():int;

        public function get currentOffset():int;

        public function get minutesUntilReset():int;

        override public function flush():Boolean;

        override public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

