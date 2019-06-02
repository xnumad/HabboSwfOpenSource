package com.sulake.room
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.RoomObject;
    import com.sulake.room.object.IRoomObjectController;

    public class RoomObjectManager implements IRoomObjectManager 
    {
        private var _objects:Map;
        private var _objectsPerType:Map;

        public function RoomObjectManager()
        {
            this._objects = new Map();
            this._objectsPerType = new Map();
        }

        public function dispose():void
        {
            this.reset();
            if (this._objects != null)
            {
                this._objects.dispose();
                this._objects = null;
            }
            if (this._objectsPerType != null)
            {
                this._objectsPerType.dispose();
                this._objectsPerType = null;
            }
        }

        public function createObject(k:int, _arg_2:uint, _arg_3:String):IRoomObjectController
        {
            var _local_4:RoomObject = new RoomObject(k, _arg_2, _arg_3);
            return this.addObject(String(k), _arg_3, _local_4);
        }

        private function addObject(k:String, _arg_2:String, _arg_3:IRoomObjectController):IRoomObjectController
        {
            if (this._objects.getValue(k) != null)
            {
                _arg_3.dispose();
                return null;
            }
            this._objects.add(k, _arg_3);
            var _local_4:Map = this.getObjectsForType(_arg_2);
            _local_4.add(k, _arg_3);
            return _arg_3;
        }

        private function getObjectsForType(k:String, _arg_2:Boolean=true):Map
        {
            var _local_3:Map = this._objectsPerType.getValue(k);
            if (((_local_3 == null) && (_arg_2)))
            {
                _local_3 = new Map();
                this._objectsPerType.add(k, _local_3);
            }
            return _local_3;
        }

        public function getObject(k:int):IRoomObjectController
        {
            var _local_2:IRoomObjectController = (this._objects.getValue(String(k)) as IRoomObjectController);
            return _local_2;
        }

        public function getObjects():Array
        {
            return this._objects.getValues();
        }

        public function getObjectWithIndex(k:int):IRoomObjectController
        {
            var _local_2:IRoomObjectController = (this._objects.getWithIndex(k) as IRoomObjectController);
            return _local_2;
        }

        public function getObjectCount():int
        {
            return this._objects.length;
        }

        public function getObjectCountForType(k:String):int
        {
            var _local_2:Map = this.getObjectsForType(k, false);
            if (_local_2 != null)
            {
                return _local_2.length;
            }
            return 0;
        }

        public function getObjectWithIndexAndType(k:int, _arg_2:String):IRoomObjectController
        {
            var _local_4:IRoomObjectController;
            var _local_3:Map = this.getObjectsForType(_arg_2, false);
            if (_local_3 != null)
            {
                _local_4 = (_local_3.getWithIndex(k) as IRoomObjectController);
                return _local_4;
            }
            return null;
        }

        public function disposeObject(k:int):Boolean
        {
            var _local_4:String;
            var _local_5:Map;
            var _local_2:String = String(k);
            var _local_3:RoomObject = (this._objects.remove(_local_2) as RoomObject);
            if (_local_3 != null)
            {
                _local_4 = _local_3.getType();
                _local_5 = this.getObjectsForType(_local_4, false);
                if (_local_5 != null)
                {
                    _local_5.remove(_local_2);
                }
                _local_3.dispose();
                return true;
            }
            return false;
        }

        public function reset():void
        {
            var k:int;
            var _local_2:IRoomObjectController;
            var _local_3:int;
            var _local_4:Map;
            if (this._objects != null)
            {
                k = 0;
                while (k < this._objects.length)
                {
                    _local_2 = (this._objects.getWithIndex(k) as IRoomObjectController);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._objects.reset();
            }
            if (this._objectsPerType != null)
            {
                _local_3 = 0;
                while (_local_3 < this._objectsPerType.length)
                {
                    _local_4 = (this._objectsPerType.getWithIndex(_local_3) as Map);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    }
                    _local_3++;
                }
                this._objectsPerType.reset();
            }
        }
    }
}
