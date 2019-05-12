package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.InventoryItemParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class FurniListAddOrUpdateParser implements IMessageParser 
    {
        protected var _items:Vector.<InventoryItemParser>;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._items = new Vector.<InventoryItemParser>(0);
			this._items.push(new InventoryItemParser(k));
            return true;
        }

        public function flush():Boolean
        {
            this._items = null;
            return true;
        }

        public function _Str_9248():Vector.<InventoryItemParser>
        {
            return this._items;
        }
    }
}
