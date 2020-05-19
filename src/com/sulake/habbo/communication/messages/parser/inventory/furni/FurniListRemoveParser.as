package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FurniListRemoveParser implements IMessageParser 
    {
        private var _itemId:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._itemId = k.readInteger();
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get stripId():int
        {
            return this._itemId;
        }
    }
}
