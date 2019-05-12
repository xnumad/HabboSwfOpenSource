package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4574 implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _leaderBoard:Array;
        private var _Str_16831:int;


        public function flush():Boolean
        {
            this._gameTypeId = -1;
            this._leaderBoard = null;
            this._Str_16831 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._leaderBoard = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._leaderBoard.push(new _Str_3326(k));
                _local_3++;
            }
            this._Str_16831 = k.readInteger();
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
            return this._Str_16831;
        }
    }
}
