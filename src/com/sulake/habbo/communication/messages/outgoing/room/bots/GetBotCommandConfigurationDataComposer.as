package com.sulake.habbo.communication.messages.outgoing.room.bots
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetBotCommandConfigurationDataComposer implements IMessageComposer
    {
        private var _botId:int;
        private var _Str_12385:int;

        public function GetBotCommandConfigurationDataComposer(k:int, _arg_2:int)
        {
            this._botId = k;
            this._Str_12385 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._botId, this._Str_12385];
        }
    }
}
