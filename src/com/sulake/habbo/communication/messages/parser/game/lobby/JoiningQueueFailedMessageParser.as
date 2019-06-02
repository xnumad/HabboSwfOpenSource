package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class JoiningQueueFailedMessageParser implements IMessageParser 
    {
        public static const DUPLICATE_MACHINEID:int = 1;

        private var _gameTypeId:int;
        private var _reason:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get reason():int
        {
            return this._reason;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._reason = k.readInteger();
            return true;
        }
    }
}
