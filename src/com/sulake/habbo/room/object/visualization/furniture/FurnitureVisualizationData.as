package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.object.visualization.data.SizeData;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.visualization.data.LayerData;
    import com.sulake.habbo.room.object.visualization.data.ColorData;

    public class FurnitureVisualizationData implements IRoomObjectVisualizationData 
    {
        public static const LAYER_LIMIT:int = 1000;
        public static const LAYER_NAMES:Array = new Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");

        private var _sizeDatas:Map;
        private var _sizes:Array;
        private var _lastSizeData:SizeData = null;
        private var _lastSizeDataScale:int = -1;
        private var _lastSize:int = -1;
        private var _lastSizeScale:int = -1;
        private var _type:String = "";

        public function FurnitureVisualizationData()
        {
            this._sizes = [];
            super();
            this._sizeDatas = new Map();
        }

        public function dispose():void
        {
            var k:SizeData;
            var _local_2:int;
            if (this._sizeDatas != null)
            {
                k = null;
                _local_2 = 0;
                while (_local_2 < this._sizeDatas.length)
                {
                    k = (this._sizeDatas.getWithIndex(_local_2) as SizeData);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    _local_2++;
                }
                this._sizeDatas.dispose();
                this._sizeDatas = null;
            }
            this._lastSizeData = null;
            this._sizes = null;
        }

        public function initialize(k:XML):Boolean
        {
            this.reset();
            if (k == null)
            {
                return false;
            }
            var _local_2:String = k.@type;
            if (_local_2.length == 0)
            {
                return false;
            }
            this._type = _local_2;
            if (!this.defineVisualizations(k))
            {
                this.reset();
                return false;
            }
            return true;
        }

        protected function reset():void
        {
            this._type = "";
            var k:SizeData;
            var _local_2:int;
            while (_local_2 < this._sizeDatas.length)
            {
                k = (this._sizeDatas.getWithIndex(_local_2) as SizeData);
                if (k != null)
                {
                    k.dispose();
                }
                _local_2++;
            }
            this._sizeDatas.reset();
            this._sizes = [];
            this._lastSizeData = null;
            this._lastSizeDataScale = -1;
        }

        protected function defineVisualizations(k:XML):Boolean
        {
            var _local_5:XML;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:SizeData;
            var _local_10:XMLList;
            var _local_11:int;
            var _local_12:XML;
            var _local_2:XMLList = k.graphics.visualization;
            if (_local_2.length() == 0)
            {
                return false;
            }
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _local_2.length())
            {
                _local_5 = _local_2[_local_4];
                if (!XMLValidator.checkRequiredAttributes(_local_5, ["size", "layerCount", "angle"]))
                {
                    return false;
                }
                _local_6 = int(_local_5.@size);
                _local_7 = int(_local_5.@layerCount);
                _local_8 = int(_local_5.@angle);
                if (_local_6 < 1)
                {
                    _local_6 = 1;
                }
                if (this._sizeDatas.getValue(String(_local_6)) != null)
                {
                    return false;
                }
                _local_9 = this.createSizeData(_local_6, _local_7, _local_8);
                if (_local_9 == null)
                {
                    return false;
                }
                _local_10 = _local_5.children();
                _local_11 = 0;
                while (_local_11 < _local_10.length())
                {
                    _local_12 = _local_10[_local_11];
                    if (!this.processVisualizationElement(_local_9, _local_12))
                    {
                        _local_9.dispose();
                        return false;
                    }
                    _local_11++;
                }
                this._sizeDatas.add(String(_local_6), _local_9);
                this._sizes.push(_local_6);
                this._sizes.sort(Array.NUMERIC);
                _local_4++;
            }
            return true;
        }

        protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData
        {
            var _local_4:SizeData;
            _local_4 = new SizeData(_arg_2, _arg_3);
            return _local_4;
        }

        protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            switch (String(_arg_2.name()))
            {
                case "layers":
                    if (!k.defineLayers(_arg_2))
                    {
                        return false;
                    }
                    break;
                case "directions":
                    if (!k.defineDirections(_arg_2))
                    {
                        return false;
                    }
                    break;
                case "colors":
                    if (!k.defineColors(_arg_2))
                    {
                        return false;
                    }
                    break;
            }
            return true;
        }

        public function getType():String
        {
            return this._type;
        }

        private function _Str_8560(k:int):int
        {
            var _local_3:int;
            var _local_2:int;
            if (k > 0)
            {
                _local_3 = 1;
                while (_local_3 < this._sizes.length)
                {
                    if (this._sizes[_local_3] > k)
                    {
                        if ((this._sizes[_local_3] / k) < (k / this._sizes[(_local_3 - 1)]))
                        {
                            _local_2 = _local_3;
                        }
                        break;
                    }
                    _local_2 = _local_3;
                    _local_3++;
                }
            }
            return _local_2;
        }

        public function _Str_3033(k:int):int
        {
            if (k == this._lastSizeScale)
            {
                return this._lastSize;
            }
            var _local_2:int = this._Str_8560(k);
            var _local_3:int = -1;
            if (_local_2 < this._sizes.length)
            {
                _local_3 = this._sizes[_local_2];
            }
            this._lastSizeScale = k;
            this._lastSize = _local_3;
            return _local_3;
        }

        public function getLayerCount(k:int):int
        {
            var _local_2:SizeData = this.getSizeData(k);
            if (_local_2 != null)
            {
                return _local_2.layerCount;
            }
            return 0;
        }

        public function _Str_15687(k:int, _arg_2:int):int
        {
            var _local_3:SizeData = this.getSizeData(k);
            if (_local_3 != null)
            {
                return _local_3._Str_15687(_arg_2);
            }
            return 0;
        }

        public function _Str_6014(k:int, _arg_2:int, _arg_3:int):String
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_6014(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_TAG;
        }

        public function _Str_10682(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_10682(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_INK;
        }

        public function _Str_11350(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_11350(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_ALPHA;
        }

        public function _Str_751(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_751(_arg_2, _arg_3);
            }
            return ColorData.DEFAULT_COLOR;
        }

        public function _Str_12280(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_12280(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_IGNORE_MOUSE;
        }

        public function _Str_10372(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_10372(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_X_OFFSET;
        }

        public function _Str_10926(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_10926(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_Y_OFFSET;
        }

        public function _Str_8329(k:int, _arg_2:int, _arg_3:int):Number
        {
            var _local_4:SizeData = this.getSizeData(k);
            if (_local_4 != null)
            {
                return _local_4._Str_8329(_arg_2, _arg_3);
            }
            return LayerData.DEFAULT_Z_OFFSET;
        }

        protected function getSizeData(k:int):SizeData
        {
            if (k == this._lastSizeDataScale)
            {
                return this._lastSizeData;
            }
            var _local_2:int = this._Str_8560(k);
            if (_local_2 < this._sizes.length)
            {
                this._lastSizeData = (this._sizeDatas.getValue(String(this._sizes[_local_2])) as SizeData);
            }
            else
            {
                this._lastSizeData = null;
            }
            this._lastSizeDataScale = k;
            return this._lastSizeData;
        }
    }
}
