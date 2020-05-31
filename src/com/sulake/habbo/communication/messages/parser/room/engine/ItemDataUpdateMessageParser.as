package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ItemDataUpdateMessageParser implements IMessageParser
    {
        private var _id:int = 0;
        private var _itemData:String;


        public function get id():int
        {
            return this._id;
        }

        public function get itemData():String
        {
            return this._itemData;
        }

        public function flush():Boolean
        {
            this._id = 0;
            this._itemData = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:String = k.readString();
            this._id = int(_local_2);
            this._itemData = k.readString();
            return true;
        }
    }
}
