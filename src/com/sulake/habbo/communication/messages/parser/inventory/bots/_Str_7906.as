package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7906 implements IMessageParser 
    {
        private var _itemId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._itemId = k.readInteger();
            return true;
        }

        public function get itemId():int
        {
            return this._itemId;
        }
    }
}
