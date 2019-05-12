package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class JoinedQueueMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            return true;
        }
    }
}
