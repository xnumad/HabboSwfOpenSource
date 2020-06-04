package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ObjectUpdateMessageParser implements IMessageParser
    {
        private var _data:ObjectMessageData = null;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function get data():ObjectMessageData
        {
            var k:ObjectMessageData = this._data;
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
            this._data = ObjectDataParser.parseObjectData(k);
            return true;
        }
    }
}
