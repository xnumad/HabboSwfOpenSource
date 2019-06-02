package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2WeeklyLeaderboardParser extends _Str_4574 
    {
        private var _year:int;
        private var _week:int;
        private var _maxOffset:int;
        private var _currentOffset:int;
        private var _minutesUntilReset:int;


        public function get year():int
        {
            return this._year;
        }

        public function get week():int
        {
            return this._week;
        }

        public function get maxOffset():int
        {
            return this._maxOffset;
        }

        public function get currentOffset():int
        {
            return this._currentOffset;
        }

        public function get minutesUntilReset():int
        {
            return this._minutesUntilReset;
        }

        override public function flush():Boolean
        {
            this._year = -1;
            this._week = -1;
            this._maxOffset = -1;
            this._currentOffset = -1;
            this._minutesUntilReset = -1;
            return super.flush();
        }

        override public function parse(k:IMessageDataWrapper):Boolean
        {
            this._year = k.readInteger();
            this._week = k.readInteger();
            this._maxOffset = k.readInteger();
            this._currentOffset = k.readInteger();
            this._minutesUntilReset = k.readInteger();
            return super.parse(k);
        }
    }
}
