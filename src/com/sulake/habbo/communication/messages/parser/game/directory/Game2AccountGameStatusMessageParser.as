package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2AccountGameStatusMessageParser implements IMessageParser
    {
        private var _gameTypeId:int;
        private var _freeGamesLeft:int;
        private var _gamesPlayedTotal:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get freeGamesLeft():int
        {
            return this._freeGamesLeft;
        }

        public function get gamesPlayedTotal():int
        {
            return this._gamesPlayedTotal;
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
            this._gamesPlayedTotal = k.readInteger();
            return true;
        }
    }
}
