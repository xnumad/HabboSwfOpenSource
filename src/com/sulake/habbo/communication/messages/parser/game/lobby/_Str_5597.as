package com.sulake.habbo.communication.messages.parser.game.lobby
{
    public class _Str_5597 
    {
        private var _gameTypeId:int;
        private var _achievementId:int;
        private var _Str_21038:String;
        private var _levels:int;

        public function _Str_5597(k:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            this._gameTypeId = k;
            this._achievementId = _arg_2;
            this._Str_21038 = _arg_3;
            this._levels = _arg_4;
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get _Str_25317():String
        {
            return this._Str_21038;
        }

        public function get levels():int
        {
            return this._levels;
        }
    }
}
