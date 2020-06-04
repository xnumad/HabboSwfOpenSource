package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ObjectsMessageParser implements IMessageParser 
    {
        private var _objects:Array;

        public function ObjectsMessageParser()
        {
            this._objects = [];
            super();
        }

        public function flush():Boolean
        {
            this._objects = [];
            return true;
        }

        public function getObjectCount():int
        {
            return this._objects.length;
        }

        public function getObject(k:int):ObjectMessageData
        {
            if (((k < 0) || (k >= this.getObjectCount())))
            {
                return null;
            }
            var _local_2:ObjectMessageData = (this._objects[k] as ObjectMessageData);
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
            var _local_8:ObjectMessageData;
            if (k == null)
            {
                return false;
            }
            this._objects = [];
            var _local_3:Map = new Map();
            var _local_4:int = k.readInteger();
            iterator = 0;
            while (iterator < _local_4)
            {
                ownerId = k.readInteger();
                ownerName = k.readString();
                _local_3.add(ownerId, ownerName);
                iterator++;
            }
            var _local_5:int = k.readInteger();
            iterator = 0;
            while (iterator < _local_5)
            {
                _local_8 = ObjectDataParser.parseObjectData(k);
                if (_local_8 != null)
                {
                    _local_8.ownerName = _local_3.getValue(_local_8.ownerId);
                    this._objects.push(_local_8);
                }
                iterator++;
            }
            return true;
        }
    }
}
