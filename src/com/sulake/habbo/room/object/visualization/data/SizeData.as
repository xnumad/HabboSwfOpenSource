package com.sulake.habbo.room.object.visualization.data
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.XMLValidator;

    public class SizeData 
    {
        public static const _Str_7946:int = 1000;
        public static const _Str_18866:int = 0;

        private var _layerCount:int = 0;
        private var _angle:int = 360;
        private var _defaultDirection:DirectionData = null;
        private var _directions:Map;
        private var _colors:Map;
        private var _lastDirectionData:DirectionData = null;
        private var _lastDirection:int = -1;

        public function SizeData(k:int, _arg_2:int)
        {
            if (k < 0)
            {
                k = 0;
            }
            if (k > _Str_7946)
            {
                k = _Str_7946;
            }
            this._layerCount = k;
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            }
            if (_arg_2 > 360)
            {
                _arg_2 = 360;
            }
            this._angle = _arg_2;
            this._defaultDirection = new DirectionData(k);
            this._directions = new Map();
            this._colors = new Map();
        }

        public function dispose():void
        {
            var _local_2:DirectionData;
            var _local_3:ColorData;
            if (this._defaultDirection != null)
            {
                this._defaultDirection.dispose();
                this._defaultDirection = null;
            }
            var k:int;
            if (this._directions != null)
            {
                _local_2 = null;
                k = 0;
                while (k < this._directions.length)
                {
                    _local_2 = (this._directions.getWithIndex(k) as DirectionData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._directions.dispose();
                this._directions = null;
            }
            this._lastDirectionData = null;
            if (this._colors != null)
            {
                _local_3 = null;
                k = 0;
                while (k < this._colors.length)
                {
                    _local_3 = (this._colors.getWithIndex(k) as ColorData);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    }
                    k++;
                }
                this._colors.dispose();
                this._colors = null;
            }
        }

        public function get layerCount():int
        {
            return this._layerCount;
        }

        public function _Str_22886(k:XML):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:XMLList = k.layer;
            return this._Str_19820(this._defaultDirection, _local_2);
        }

        public function _Str_22896(k:XML):Boolean
        {
            var _local_6:XML;
            var _local_7:int;
            var _local_8:XMLList;
            if (k == null)
            {
                return false;
            }
            var _local_2:Array = ["id"];
            var _local_3:DirectionData;
            var _local_4:XMLList = k.direction;
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                if (!XMLValidator._Str_2747(_local_6, _local_2))
                {
                    return false;
                }
                _local_7 = int(_local_6.@id);
                _local_8 = _local_6.layer;
                if (this._directions.getValue(String(_local_7)) != null)
                {
                    return false;
                }
                _local_3 = new DirectionData(this.layerCount);
                _local_3._Str_17122(this._defaultDirection);
                this._Str_19820(_local_3, _local_8);
                this._directions.add(String(_local_7), _local_3);
                this._lastDirection = -1;
                this._lastDirectionData = null;
                _local_5++;
            }
            return true;
        }

        private function _Str_19820(k:DirectionData, _arg_2:XMLList):Boolean
        {
            var _local_5:XML;
            var _local_6:int;
            var _local_7:String;
            var _local_8:String;
            var _local_9:int;
            var _local_10:int;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_3:Array = ["id"];
            var _local_4:int;
            while (_local_4 < _arg_2.length())
            {
                _local_5 = _arg_2[_local_4];
                if (!XMLValidator._Str_2747(_local_5, _local_3))
                {
                    return false;
                }
                _local_6 = int(_local_5.@id);
                if (((_local_6 < 0) || (_local_6 >= this.layerCount)))
                {
                    return false;
                }
                _local_7 = _local_5.@tag;
                if (_local_7.length > 0)
                {
                    k._Str_9289(_local_6, _local_7);
                }
                _local_8 = _local_5.@ink;
                switch (_local_8)
                {
                    case "ADD":
                        k._Str_16985(_local_6, LayerData._Str_15822);
                        break;
                    case "SUBTRACT":
                        k._Str_16985(_local_6, LayerData._Str_12715);
                        break;
                    case "DARKEN":
                        k._Str_16985(_local_6, LayerData._Str_12864);
                        break;
                }
                _local_7 = _local_5.@alpha;
                if (_local_7.length > 0)
                {
                    k._Str_16703(_local_6, int(_local_7));
                }
                _local_7 = _local_5.@ignoreMouse;
                if (_local_7.length > 0)
                {
                    _local_9 = int(_local_7);
                    k.window1(_local_6, (!(_local_9 == 0)));
                }
                _local_7 = _local_5.@x;
                if (_local_7.length > 0)
                {
                    k._Str_24958(_local_6, int(_local_7));
                }
                _local_7 = _local_5.@y;
                if (_local_7.length > 0)
                {
                    k._Str_24307(_local_6, int(_local_7));
                }
                _local_7 = _local_5.@z;
                if (_local_7.length > 0)
                {
                    _local_10 = int(_local_7);
                    k._Str_24059(_local_6, (Number(_local_10) / -1000));
                }
                _local_4++;
            }
            return true;
        }

        public function _Str_22971(k:XML):Boolean
        {
            var _local_7:XML;
            var _local_8:String;
            var _local_9:XMLList;
            var _local_10:int;
            var _local_11:XML;
            var _local_12:int;
            var _local_13:int;
            if (k == null)
            {
                return true;
            }
            var _local_2:ColorData;
            var _local_3:Array = ["id"];
            var _local_4:Array = ["id", "color"];
            var _local_5:XMLList = k.color;
            var _local_6:int;
            while (_local_6 < _local_5.length())
            {
                _local_7 = _local_5[_local_6];
                if (!XMLValidator._Str_2747(_local_7, _local_3))
                {
                    return false;
                }
                _local_8 = _local_7.@id;
                if (this._colors.getValue(_local_8) != null)
                {
                    return false;
                }
                _local_2 = new ColorData(this.layerCount);
                _local_9 = _local_7.colorLayer;
                _local_10 = 0;
                while (_local_10 < _local_9.length())
                {
                    _local_11 = _local_9[_local_10];
                    if (!XMLValidator._Str_2747(_local_11, _local_4))
                    {
                        _local_2.dispose();
                        return false;
                    }
                    _local_12 = int(_local_11.@id);
                    _local_13 = parseInt(_local_11.@color, 16);
                    _local_2._Str_1685(_local_13, _local_12);
                    _local_10++;
                }
                if (_local_2 != null)
                {
                    this._colors.add(_local_8, _local_2);
                }
                _local_6++;
            }
            return true;
        }

        public function _Str_15687(k:int):int
        {
            var _local_6:int;
            var _local_7:int;
            var _local_2:int = (((((k % 360) + 360) + (this._angle / 2)) % 360) / this._angle);
            if (this._directions.getValue(String(_local_2)) != null)
            {
                return _local_2;
            }
            _local_2 = (((k % 360) + 360) % 360);
            var _local_3:int = -1;
            var _local_4:int = -1;
            var _local_5:int;
            while (_local_5 < this._directions.length)
            {
                _local_6 = (int(this._directions.getKey(_local_5)) * this._angle);
                _local_7 = (((_local_6 - _local_2) + 360) % 360);
                if (_local_7 > 180)
                {
                    _local_7 = (360 - _local_7);
                }
                if (((_local_7 < _local_3) || (_local_3 < 0)))
                {
                    _local_3 = _local_7;
                    _local_4 = _local_5;
                }
                _local_5++;
            }
            if (_local_4 >= 0)
            {
                return int(this._directions.getKey(_local_4));
            }
            return _Str_18866;
        }

        private function _Str_7931(k:int):DirectionData
        {
            if (((k == this._lastDirection) && (!(this._lastDirectionData == null))))
            {
                return this._lastDirectionData;
            }
            var _local_2:DirectionData;
            _local_2 = (this._directions.getValue(String(k)) as DirectionData);
            if (_local_2 == null)
            {
                _local_2 = this._defaultDirection;
            }
            this._lastDirection = k;
            this._lastDirectionData = _local_2;
            return this._lastDirectionData;
        }

        public function _Str_6014(k:int, _arg_2:int):String
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_6014(_arg_2);
            }
            return LayerData._Str_12249;
        }

        public function _Str_10682(k:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_10682(_arg_2);
            }
            return LayerData._Str_7943;
        }

        public function _Str_11350(k:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_11350(_arg_2);
            }
            return LayerData._Str_8655;
        }

        public function _Str_751(k:int, _arg_2:int):uint
        {
            var _local_3:ColorData = (this._colors.getValue(String(_arg_2)) as ColorData);
            if (_local_3 != null)
            {
                return _local_3._Str_751(k);
            }
            return ColorData._Str_2531;
        }

        public function _Str_12280(k:int, _arg_2:int):Boolean
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_12280(_arg_2);
            }
            return LayerData._Str_9888;
        }

        public function _Str_10372(k:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_10372(_arg_2);
            }
            return LayerData._Str_9326;
        }

        public function _Str_10926(k:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_10926(_arg_2);
            }
            return LayerData._Str_9412;
        }

        public function _Str_8329(k:int, _arg_2:int):Number
        {
            var _local_3:DirectionData;
            _local_3 = this._Str_7931(k);
            if (_local_3 != null)
            {
                return _local_3._Str_8329(_arg_2);
            }
            return LayerData._Str_7951;
        }
    }
}
