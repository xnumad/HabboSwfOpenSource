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
            var object:ObjectMessageData;
            if (k == null)
            {
                return false;
            }
            this._objects = [];
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
            var objects:int = k.readInteger();
            iterator = 0;
            while (iterator < objects)
            {
                object = ObjectDataParser.parseObjectData(k);
                if (object != null)
                {
                    object.ownerName = owners.getValue(object.ownerId);
                    this._objects.push(object);
                }
                iterator++;
            }
            return true;
        }
    }
}
