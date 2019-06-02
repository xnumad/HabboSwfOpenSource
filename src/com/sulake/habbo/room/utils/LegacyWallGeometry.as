package com.sulake.habbo.room.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class LegacyWallGeometry implements IDisposable 
    {
        private static const L:String = "l";
        private static const R:String = "r";

        private var _isDisposed:Boolean = false;
        private var _scale:int = 64;
        private var _heightMap:Array;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _floorHeight:int = 0;

        public function LegacyWallGeometry()
        {
            this._heightMap = [];
            super();
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get scale():int
        {
            return this._scale;
        }

        public function set scale(k:int):void
        {
            this._scale = k;
        }

        public function dispose():void
        {
            this.reset();
            this._isDisposed = true;
        }

        public function initialize(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:Array;
            var _local_6:int;
            if (((k <= this._width) && (_arg_2 <= this._height)))
            {
                this._width = k;
                this._height = _arg_2;
                this._floorHeight = _arg_3;
                return;
            }
            this.reset();
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_5 = [];
                this._heightMap.push(_local_5);
                _local_6 = 0;
                while (_local_6 < k)
                {
                    _local_5.push(0);
                    _local_6++;
                }
                _local_4++;
            }
            this._width = k;
            this._height = _arg_2;
            this._floorHeight = _arg_3;
        }

        private function reset():void
        {
            var k:int;
            var _local_2:Array;
            if (this._heightMap != null)
            {
                k = 0;
                while (k < this._heightMap.length)
                {
                    _local_2 = (this._heightMap[k] as Array);
                    k++;
                }
                this._heightMap = [];
            }
        }

        public function _Str_3982(k:int, _arg_2:int, _arg_3:Number):Boolean
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return false;
            }
            var _local_4:Array = (this._heightMap[_arg_2] as Array);
            if (_local_4 != null)
            {
                _local_4[k] = _arg_3;
                return true;
            }
            return false;
        }

        public function _Str_2754(k:int, _arg_2:int):Number
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return 0;
            }
            var _local_3:Array = (this._heightMap[_arg_2] as Array);
            if (_local_3 != null)
            {
                return _local_3[k] as Number;
            }
            return 0;
        }

        public function getLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String):IVector3d
        {
            var _local_12:int;
            var _local_6:int;
            var _local_7:int;
            if (((k == 0) && (_arg_2 == 0)))
            {
                k = this._width;
                _arg_2 = this._height;
                _local_12 = Math.round((this.scale / 10));
                if (_arg_5 == R)
                {
                    _local_7 = (this._width - 1);
                    while (_local_7 >= 0)
                    {
                        _local_6 = 1;
                        while (_local_6 < this._height)
                        {
                            if (this._Str_2754(_local_7, _local_6) <= this._floorHeight)
                            {
                                if ((_local_6 - 1) < _arg_2)
                                {
                                    k = _local_7;
                                    _arg_2 = (_local_6 - 1);
                                }
                                break;
                            }
                            _local_6++;
                        }
                        _local_7--;
                    }
                    _arg_4 = (_arg_4 + ((this.scale / 4) - (_local_12 / 2)));
                    _arg_3 = (_arg_3 + (this.scale / 2));
                }
                else
                {
                    _local_6 = (this._height - 1);
                    while (_local_6 >= 0)
                    {
                        _local_7 = 1;
                        while (_local_7 < this._width)
                        {
                            if (this._Str_2754(_local_7, _local_6) <= this._floorHeight)
                            {
                                if ((_local_7 - 1) < k)
                                {
                                    k = (_local_7 - 1);
                                    _arg_2 = _local_6;
                                }
                                break;
                            }
                            _local_7++;
                        }
                        _local_6--;
                    }
                    _arg_4 = (_arg_4 + ((this.scale / 4) - (_local_12 / 2)));
                    _arg_3 = (_arg_3 - _local_12);
                }
            }
            var _local_8:Number = Number(k);
            var _local_9:Number = Number(_arg_2);
            var _local_10:Number = this._Str_2754(k, _arg_2);
            if (_arg_5 == R)
            {
                _local_8 = (_local_8 + ((_arg_3 / Number((this._scale / 2))) - 0.5));
                _local_9 = (_local_9 + 0.5);
                _local_10 = (_local_10 - ((_arg_4 - (_arg_3 / 2)) / Number((this._scale / 2))));
            }
            else
            {
                _local_9 = (_local_9 + ((((this._scale / 2) - _arg_3) / Number((this._scale / 2))) - 0.5));
                _local_8 = (_local_8 + 0.5);
                _local_10 = (_local_10 - ((_arg_4 - (((this._scale / 2) - _arg_3) / 2)) / Number((this._scale / 2))));
            }
            var _local_11:Vector3d = new Vector3d(_local_8, _local_9, _local_10);
            return _local_11;
        }

        public function getLocationOldFormat(k:Number, _arg_2:Number, _arg_3:String):IVector3d
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:Number = 0;
            var _local_7:Number = 0;
            _local_5 = Math.ceil(k);
            _local_6 = (_local_5 - k);
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:Number = 0;
            _local_4 = 0;
            while (_local_4 < this._width)
            {
                if (((_local_5 >= 0) && (_local_5 < this._height)))
                {
                    if (this._Str_2754(_local_4, _local_5) <= this._floorHeight)
                    {
                        _local_8 = (_local_4 - 1);
                        _local_9 = _local_5;
                        _local_7 = _local_4;
                        _arg_3 = L;
                        break;
                    }
                    if (this._Str_2754(_local_4, (_local_5 + 1)) <= this._floorHeight)
                    {
                        _local_8 = _local_4;
                        _local_9 = _local_5;
                        _local_7 = (_local_9 - k);
                        _arg_3 = R;
                        break;
                    }
                }
                _local_5++;
                _local_4++;
            }
            _local_10 = ((this.scale / 2) * _local_6);
            var _local_13:Number = ((-(_local_7) * this.scale) / 2);
            _local_13 = (_local_13 + ((((-(_arg_2) * 18) / 32) * this.scale) / 2));
            _local_12 = this._Str_2754(_local_8, _local_9);
            _local_11 = (((_local_12 * this.scale) / 2) + _local_13);
            if (_arg_3 == R)
            {
                _local_11 = (_local_11 + ((_local_6 * this.scale) / 4));
            }
            else
            {
                _local_11 = (_local_11 + (((1 - _local_6) * this.scale) / 4));
            }
            return this.getLocation(_local_8, _local_9, _local_10, _local_11, _arg_3);
        }

        public function getOldLocation(k:IVector3d, _arg_2:Number):Array
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:Number = 0;
            var _local_4:Number = 0;
            var _local_5:Number = 0;
            var _local_6:Number = 0;
            var _local_7:String = "";
            var _local_8:Number = 0;
            if (_arg_2 == 90)
            {
                _local_3 = Math.floor((k.x - 0.5));
                _local_4 = Math.floor((k.y + 0.5));
                _local_8 = this._Str_2754(_local_3, _local_4);
                _local_5 = ((this._scale / 2) - (((k.y - _local_4) + 0.5) * Number((this._scale / 2))));
                _local_6 = (((_local_8 - k.z) * Number((this._scale / 2))) + (((this._scale / 2) - _local_5) / 2));
                _local_7 = L;
            }
            else
            {
                if (_arg_2 == 180)
                {
                    _local_3 = Math.floor((k.x + 0.5));
                    _local_4 = Math.floor((k.y - 0.5));
                    _local_8 = this._Str_2754(_local_3, _local_4);
                    _local_5 = (((k.x + 0.5) - _local_3) * Number((this._scale / 2)));
                    _local_6 = (((_local_8 - k.z) * Number((this._scale / 2))) + (_local_5 / 2));
                    _local_7 = R;
                }
                else
                {
                    return null;
                }
            }
            return [_local_3, _local_4, _local_5, _local_6, _local_7];
        }

        public function getOldLocationString(k:IVector3d, _arg_2:Number):String
        {
            var _local_3:Array = this.getOldLocation(k, _arg_2);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:int = int(_local_3[0]);
            var _local_5:int = int(_local_3[1]);
            var _local_6:int = int(_local_3[2]);
            var _local_7:int = int(_local_3[3]);
            var _local_8:String = _local_3[4];
            var _local_9:String = (((((((((":w=" + _local_4) + ",") + _local_5) + " l=") + _local_6) + ",") + _local_7) + " ") + _local_8);
            return _local_9;
        }

        public function getDirection(k:String):Number
        {
            if (k == R)
            {
                return 180;
            }
            return 90;
        }

        public function getFloorAltitude(k:int, _arg_2:int):Number
        {
            var _local_3:int;
            _local_3 = this._Str_2754(k, _arg_2);
            var _local_4:int = (_local_3 + 1);
            return _local_3 + (((((((((int(this._Str_2754((k - 1), (_arg_2 - 1))) == _local_4) || (int(this._Str_2754(k, (_arg_2 - 1))) == _local_4)) || (int(this._Str_2754((k + 1), (_arg_2 - 1))) == _local_4)) || (int(this._Str_2754((k - 1), _arg_2)) == _local_4)) || (int(this._Str_2754((k + 1), _arg_2)) == _local_4)) || (int(this._Str_2754((k - 1), (_arg_2 + 1))) == _local_4)) || (int(this._Str_2754(k, (_arg_2 + 1))) == _local_4)) || (int(this._Str_2754((k + 1), (_arg_2 + 1))) == _local_4)) ? 0.5 : 0);
        }

        public function _Str_10375(k:int, _arg_2:int):Boolean
        {
            return ((((k >= 0) && (k < this._width)) && (_arg_2 >= 0)) && (_arg_2 < this._height)) && (this._heightMap[_arg_2][k] >= 0);
        }
    }
}
