package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameStatusMessageParser implements IMessageParser 
    {
        private static const OK:int = 0;
        private static const MAINTENANCE:int = 1;

        private var _gameTypeId:int;
        private var _status:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get isOk():Boolean
        {
            return this._status == OK;
        }

        public function get isInMaintenance():Boolean
        {
            return this._status == MAINTENANCE;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._status = k.readInteger();
            return true;
        }
    }
}
