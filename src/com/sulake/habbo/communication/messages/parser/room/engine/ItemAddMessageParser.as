package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ItemAddMessageParser implements IMessageParser
    {
        private var _item:ItemMessageData = null;


        public function flush():Boolean
        {
            this._item = null;
            return true;
        }

        public function get data():ItemMessageData
        {
            var k:ItemMessageData = this._item;
            if (k != null)
            {
                k.setReadOnly();
            }
            return k;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._item = ItemDataParser.parseItemData(k);
            this._item.ownerName = k.readString();
            return true;
        }
    }
}
