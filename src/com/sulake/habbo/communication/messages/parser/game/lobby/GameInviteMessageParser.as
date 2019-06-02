package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameInviteMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _inviterId:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get inviterId():int
        {
            return this._inviterId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._inviterId = k.readInteger();
            return true;
        }
    }
}
