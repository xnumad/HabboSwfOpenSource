package com.sulake.habbo.communication.messages.parser.room.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotForceOpenContextMenuParser implements IMessageParser 
    {
        private var _botId:int;


        public function flush():Boolean
        {
            this._botId = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._botId = k.readInteger();
            return true;
        }

        public function get _Str_5455():int
        {
            return this._botId;
        }
    }
}
