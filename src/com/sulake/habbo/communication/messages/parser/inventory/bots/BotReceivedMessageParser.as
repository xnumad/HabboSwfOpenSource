package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotReceivedMessageParser implements IMessageParser
    {
        private var _Str_10056:Boolean;
        private var _item:BotData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_10056 = k.readBoolean();
            this._item = new BotData(k);
            return true;
        }

        public function get _Str_20732():Boolean
        {
            return this._Str_10056;
        }

        public function get item():BotData
        {
            return this._item;
        }
    }
}
