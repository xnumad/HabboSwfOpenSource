package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2GameDirectoryStatusMessageParser implements IMessageParser
    {
        public static const STATUS_OK:int = 0;
        public static const STATUS_FAILED_REASON_UNKNOWN:int = 1;
        public static const STATUS_FAILED_REASON_GAME_DIRECTORY_IS_NOT_AVAILABLE:int = 2;
        public static const STATUS_FAILED_REASON_HOTEL_IS_CLOSED:int = 3;

        private var _status:int;
        private var _Str_21469:int;
        private var _Str_21518:int;
        private var _freeGamesLeft:int;


        public function get status():int
        {
            return this._status;
        }

        public function get _Str_26321():int
        {
            return this._Str_21469;
        }

        public function get _Str_26070():int
        {
            return this._Str_21518;
        }

        public function get _Str_21510():int
        {
            return this._freeGamesLeft;
        }

        public function get _Str_23843():Boolean
        {
            return this._freeGamesLeft == -1;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = k.readInteger();
            this._Str_21469 = k.readInteger();
            this._Str_21518 = k.readInteger();
            this._freeGamesLeft = k.readInteger();
            return true;
        }
    }
}
