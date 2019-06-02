package com.sulake.habbo.room.utils
{
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import __AS3__.vec.*;

    public class TileObjectMap 
    {
        private var _tileObjectMap:Vector.<Vector.<IRoomObject>>;
        private var _width:int = 0;
        private var _height:int = 0;

        public function TileObjectMap(k:int, _arg_2:int)
        {
            this._tileObjectMap = new Vector.<Vector.<IRoomObject>>(_arg_2, true);
            var _local_3:int;
            while (_local_3 < _arg_2)
            {
                this._tileObjectMap[_local_3] = new Vector.<IRoomObject>(k, true);
                _local_3++;
            }
            this._width = k;
            this._height = _arg_2;
        }

        public function clear():void
        {
            var k:Vector.<IRoomObject>;
            var _local_2:int;
            for each (k in this._tileObjectMap)
            {
                _local_2 = 0;
                while (_local_2 < this._width)
                {
                    k[_local_2] = null;
                    _local_2++;
                }
            }
        }

        public function populate(k:Array):void
        {
            var _local_2:IRoomObject;
            this.clear();
            for each (_local_2 in k)
            {
                this.addRoomObject(_local_2);
            }
        }

        public function dispose():void
        {
            this._tileObjectMap = null;
            this._width = 0;
            this._height = 0;
        }

        public function getObjectInTile(k:int, _arg_2:int):IRoomObject
        {
            if (((((k >= 0) && (k < this._width)) && (_arg_2 >= 0)) && (_arg_2 < this._height)))
            {
                return this._tileObjectMap[_arg_2][k];
            }
            return null;
        }

        public function setObjectInTile(k:int, _arg_2:int, _arg_3:IRoomObject):void
        {
            if (!_arg_3.isInitialized())
            {
                Logger.log("Assigning non initialized object to tile object map!");
                return;
            }
            if (((((k >= 0) && (k < this._width)) && (_arg_2 >= 0)) && (_arg_2 < this._height)))
            {
                this._tileObjectMap[_arg_2][k] = _arg_3;
            }
        }

        public function addRoomObject(k:IRoomObject):void
        {
            var _local_8:IRoomObject;
            var _local_10:int;
            if ((((k == null) || (k.getModel() == null)) || (!(k.isInitialized()))))
            {
                return;
            }
            var _local_2:IVector3d = k.getLocation();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IVector3d = k.getDirection();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var _local_5:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            if (_local_4 < 1)
            {
                _local_4 = 1;
            }
            if (_local_5 < 1)
            {
                _local_5 = 1;
            }
            var _local_6:int;
            var _local_7:int = ((int((_local_3.x + 45)) % 360) / 90);
            if (((_local_7 == 1) || (_local_7 == 3)))
            {
                _local_6 = _local_4;
                _local_4 = _local_5;
                _local_5 = _local_6;
            }
            var _local_9:int = _local_2.y;
            while (_local_9 < (_local_2.y + _local_5))
            {
                _local_10 = _local_2.x;
                while (_local_10 < (_local_2.x + _local_4))
                {
                    _local_8 = this.getObjectInTile(_local_10, _local_9);
                    if (((!(_local_8)) || ((!(_local_8 == k)) && (_local_8.getLocation().z <= _local_2.z))))
                    {
                        this.setObjectInTile(_local_10, _local_9, k);
                    }
                    _local_10++;
                }
                _local_9++;
            }
        }

        public function toString():String
        {
            var _local_2:IRoomObject;
            var _local_4:int;
            var k:String = "";
            var _local_3:int;
            while (_local_3 < this._height)
            {
                _local_4 = 0;
                while (_local_4 < this._width)
                {
                    _local_2 = this._tileObjectMap[_local_3][_local_4];
                    k = (k + (((_local_2) ? _local_2.getId() : "x") + "\t"));
                    _local_4++;
                }
                k = (k + "\n");
                _local_3++;
            }
            return k;
        }
    }
}
