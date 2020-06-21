package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ItemsMessageParser implements IMessageParser 
    {
        private var _items:Array;

        public function ItemsMessageParser()
        {
            this._items = [];
            super();
        }

        public function flush():Boolean
        {
            this._items = [];
            return true;
        }

        public function getItemCount():int
        {
            return this._items.length;
        }

        public function getItem(k:int):ItemMessageData
        {
            if (((k < 0) || (k >= this.getItemCount())))
            {
                return null;
            }
            var _local_2:ItemMessageData = (this._items[k] as ItemMessageData);
            if (_local_2 != null)
            {
                _local_2.setReadOnly();
            }
            return _local_2;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var iterator:int;
            var ownerId:int;
            var ownerName:String;
            var item:ItemMessageData;
            if (k == null)
            {
                return false;
            }
            this._items = [];
            var owners:Map = new Map();
            var ownersAmount:int = k.readInteger();
            iterator = 0;
            while (iterator < ownersAmount)
            {
                ownerId = k.readInteger();
                ownerName = k.readString();
                owners.add(ownerId, ownerName);
                iterator++;
            }
            var items:int = k.readInteger();
            Logger.log((("We have: " + items) + " items"));
            iterator = 0;
            while (iterator < items)
            {
                item = ItemDataParser.parseItemData(k);
                item.ownerName = owners.getValue(item.ownerId);
                this._items.push(item);
                iterator++;
            }
            return true;
        }
    }
}
