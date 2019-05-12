package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LoadGameUrlMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _url:String;
        private var _gameClientId:String;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get url():String
        {
            return this._url;
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
            this._url = k.readString();
            return true;
        }
    }
}
