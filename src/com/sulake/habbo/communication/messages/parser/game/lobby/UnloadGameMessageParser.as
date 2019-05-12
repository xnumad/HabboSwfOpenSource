package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UnloadGameMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _gameClientId:String;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get _Str_12486():String
        {
            return this._gameClientId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._gameClientId = k.readString();
            return true;
        }
    }
}
