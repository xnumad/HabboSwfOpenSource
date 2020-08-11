package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotAddedToInventoryParser implements IMessageParser
    {
        private var _item:BotData;
        private var _Str_12302:Boolean;


        public function flush():Boolean
        {
            this._item = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._item = new BotData(k);
            this._Str_12302 = k.readBoolean();
            return true;
        }

        public function get item():BotData
        {
            return this._item;
        }

        public function _Str_19947():Boolean
        {
            return this._Str_12302;
        }
    }
}
