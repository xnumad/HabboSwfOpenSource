package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2AccountGameStatusMessageParser implements IMessageParser
    {
        private var _gameTypeId:int;
        private var _freeGamesLeft:int;
        private var _Str_21057:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get freeGamesLeft():int
        {
            return this._freeGamesLeft;
        }

        public function get _Str_22319():int
        {
            return this._Str_21057;
        }

        public function get hasUnlimitedGames():Boolean
        {
            return this._freeGamesLeft == -1;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._freeGamesLeft = k.readInteger();
            this._Str_21057 = k.readInteger();
            return true;
        }
    }
}
