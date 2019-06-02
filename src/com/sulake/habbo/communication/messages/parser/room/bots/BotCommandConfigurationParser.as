package com.sulake.habbo.communication.messages.parser.room.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotCommandConfigurationParser implements IMessageParser 
    {
        private var _botId:int;
        private var _commandId:int;
        private var _data:String;


        public function get _Str_5455():int
        {
            return this._botId;
        }

        public function get commandId():int
        {
            return this._commandId;
        }

        public function get data():String
        {
            return this._data;
        }

        public function flush():Boolean
        {
            this._botId = -1;
            this._commandId = -1;
            this._data = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._botId = k.readInteger();
            this._commandId = k.readInteger();
            this._data = k.readString();
            return true;
        }
    }
}
