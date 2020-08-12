package com.sulake.habbo.communication.messages.outgoing.room.bots
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CommandBotComposer implements IMessageComposer
    {
        private var _botId:int;
        private var _Str_12385:int;
        private var _Str_21366:String;

        public function CommandBotComposer(k:int, _arg_2:int, _arg_3:String)
        {
            this._botId = k;
            this._Str_12385 = _arg_2;
            this._Str_21366 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._botId, this._Str_12385, this._Str_21366];
        }
    }
}
