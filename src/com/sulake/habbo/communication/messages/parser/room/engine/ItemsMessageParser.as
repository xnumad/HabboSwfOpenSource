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

        public function _Str_2990(k:int):ItemMessageData
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
            var _local_6:int;
            var _local_7:String;
            var _local_8:ItemMessageData;
            if (k == null)
            {
                return false;
            }
            this._items = [];
            var _local_3:Map = new Map();
            var _local_4:int = k.readInteger();
            iterator = 0;
            while (iterator < _local_4)
            {
                _local_6 = k.readInteger();
                _local_7 = k.readString();
                _local_3.add(_local_6, _local_7);
                iterator++;
            }
            var _local_5:int = k.readInteger();
            Logger.log((("We have: " + _local_5) + " items"));
            iterator = 0;
            while (iterator < _local_5)
            {
                _local_8 = ItemDataParser.parseItemData(k);
                _local_8.ownerName = _local_3.getValue(_local_8.ownerId);
                this._items.push(_local_8);
                iterator++;
            }
            return true;
        }
    }
}
