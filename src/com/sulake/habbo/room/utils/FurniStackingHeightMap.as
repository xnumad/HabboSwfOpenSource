package com.sulake.habbo.room.utils
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class FurniStackingHeightMap 
    {
        private var _heightMap:Vector.<Number>;
        private var _isNotStackable:Vector.<Boolean>;
        private var _isRoomTile:Vector.<Boolean>;
        private var _width:int = 0;
        private var _height:int = 0;

        public function FurniStackingHeightMap(k:int, _arg_2:int)
        {
            this._width = k;
            this._height = _arg_2;
            this._heightMap = new Vector.<Number>((k * _arg_2));
            this._isNotStackable = new Vector.<Boolean>((k * _arg_2));
            this._isRoomTile = new Vector.<Boolean>((k * _arg_2));
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function dispose():void
        {
            this._heightMap = null;
            this._isNotStackable = null;
            this._isRoomTile = null;
            this._width = 0;
            this._height = 0;
        }

        private function validPosition(k:int, _arg_2:int):Boolean
        {
            return (((k >= 0) && (k < this._width)) && (_arg_2 >= 0)) && (_arg_2 < this._height);
        }

        public function _Str_2754(k:int, _arg_2:int):Number
        {
            return (this.validPosition(k, _arg_2)) ? this._heightMap[((_arg_2 * this._width) + k)] : 0;
        }

        public function _Str_3982(k:int, _arg_2:int, _arg_3:Number):void
        {
            if (this.validPosition(k, _arg_2))
            {
                this._heightMap[((_arg_2 * this._width) + k)] = _arg_3;
            }
        }

        public function setStackingBlocked(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (this.validPosition(k, _arg_2))
            {
                this._isNotStackable[((_arg_2 * this._width) + k)] = _arg_3;
            }
        }

        public function setIsRoomTile(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (this.validPosition(k, _arg_2))
            {
                this._isRoomTile[((_arg_2 * this._width) + k)] = _arg_3;
            }
        }

        public function validateLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean, _arg_10:Number=-1):Boolean
        {
            var _local_12:int;
            var _local_13:int;
            if (((!(this.validPosition(k, _arg_2))) || (!(this.validPosition(((k + _arg_3) - 1), ((_arg_2 + _arg_4) - 1))))))
            {
                return false;
            }
            if (((_arg_5 < 0) || (_arg_5 >= this._width)))
            {
                _arg_5 = 0;
            }
            if (((_arg_6 < 0) || (_arg_6 >= this._height)))
            {
                _arg_6 = 0;
            }
            _arg_7 = Math.min(_arg_7, (this._width - _arg_5));
            _arg_8 = Math.min(_arg_8, (this._height - _arg_6));
            if (_arg_10 == -1)
            {
                _arg_10 = this._Str_2754(k, _arg_2);
            }
            var _local_11:int = _arg_2;
            while (_local_11 < (_arg_2 + _arg_4))
            {
                _local_12 = k;
                while (_local_12 < (k + _arg_3))
                {
                    if (((((_local_12 < _arg_5) || (_local_12 >= (_arg_5 + _arg_7))) || (_local_11 < _arg_6)) || (_local_11 >= (_arg_6 + _arg_8))))
                    {
                        _local_13 = ((_local_11 * this._width) + _local_12);
                        if (_arg_9)
                        {
                            if (!this._isRoomTile[_local_13])
                            {
                                return false;
                            }
                        }
                        else
                        {
                            if ((((this._isNotStackable[_local_13]) || (!(this._isRoomTile[_local_13]))) || (Math.abs((this._heightMap[_local_13] - _arg_10)) > 0.01)))
                            {
                                return false;
                            }
                        }
                    }
                    _local_12++;
                }
                _local_11++;
            }
            return true;
        }
    }
}
