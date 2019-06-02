package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3292;
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

        public function getObject(k:int):_Str_3292
        {
            if (((k < 0) || (k >= this.getObjectCount())))
            {
                return null;
            }
            var _local_2:_Str_3292 = (this._objects[k] as _Str_3292);
            if (_local_2 != null)
            {
                _local_2._Str_4710();
            }
            return _local_2;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_6:int;
            var _local_7:String;
            var _local_8:_Str_3292;
            if (k == null)
            {
                return false;
            }
            this._objects = [];
            var _local_3:Map = new Map();
            var _local_4:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_4)
            {
                _local_6 = k.readInteger();
                _local_7 = k.readString();
                _local_3.add(_local_6, _local_7);
                _local_2++;
            }
            var _local_5:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_5)
            {
                _local_8 = _Str_4638._Str_16439(k);
                if (_local_8 != null)
                {
                    _local_8.ownerName = _local_3.getValue(_local_8.ownerId);
                    this._objects.push(_local_8);
                }
                _local_2++;
            }
            return true;
        }
    }
}
