package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2LeaderboardParser implements IMessageParser
    {
        private var _gameTypeId:int;
        private var _leaderBoard:Array;
        private var _totalListSize:int;


        public function flush():Boolean
        {
            this._gameTypeId = -1;
            this._leaderBoard = null;
            this._totalListSize = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._leaderBoard = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._leaderBoard.push(new LeaderboardEntry(k));
                _local_3++;
            }
            this._totalListSize = k.readInteger();
            this._gameTypeId = k.readInteger();
            return true;
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get leaderboard():Array
        {
            return this._leaderBoard;
        }

        public function get _Str_26158():int
        {
            return this._totalListSize;
        }
    }
}
