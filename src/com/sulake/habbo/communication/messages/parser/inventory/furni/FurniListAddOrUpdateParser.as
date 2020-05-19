package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class FurniListAddOrUpdateParser implements IMessageParser 
    {
        protected var _items:Vector.<FurniData>;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._items = new Vector.<FurniData>(0);
			this._items.push(new FurniData(k));
            return true;
        }

        public function flush():Boolean
        {
            this._items = null;
            return true;
        }

        public function _Str_9248():Vector.<FurniData>
        {
            return this._items;
        }
    }
}
