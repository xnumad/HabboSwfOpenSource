package com.sulake.habbo.room.object.visualization.room.mask
{
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaskManager 
    {
        private var _assetCollection:IGraphicAssetCollection = null;
        private var _masks:Map = null;
        private var _data:XML = null;

        public function PlaneMaskManager()
        {
            this._masks = new Map();
        }

        public function get data():XML
        {
            return this._data;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneMask;
            this._assetCollection = null;
            this._data = null;
            if (this._masks != null)
            {
                k = 0;
                while (k < this._masks.length)
                {
                    _local_2 = (this._masks.getWithIndex(k) as PlaneMask);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._masks.dispose();
            }
        }

        public function initialize(k:XML):void
        {
            this._data = k;
        }

        public function _Str_6703(k:IGraphicAssetCollection):void
        {
            if (this.data == null)
            {
                return;
            }
            this._assetCollection = k;
            this.parseMasks(this.data, k);
        }

        private function parseMasks(k:XML, _arg_2:IGraphicAssetCollection):void
        {
            var _local_7:XML;
            var _local_8:String;
            var _local_9:PlaneMask;
            var _local_10:XMLList;
            var _local_11:int;
            var _local_12:XML;
            var _local_13:int;
            var _local_14:PlaneMaskVisualization;
            var _local_15:XMLList;
            var _local_16:String;
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_3:Array = ["id"];
            var _local_4:Array = ["size"];
            var _local_5:XMLList = k.mask;
            var _local_6:int;
            while (_local_6 < _local_5.length())
            {
                _local_7 = _local_5[_local_6];
                if (XMLValidator.checkRequiredAttributes(_local_7, _local_3))
                {
                    _local_8 = _local_7.@id;
                    if (this._masks.getValue(_local_8) == null)
                    {
                        _local_9 = new PlaneMask();
                        _local_10 = _local_7.maskVisualization;
                        _local_11 = 0;
                        while (_local_11 < _local_10.length())
                        {
                            _local_12 = _local_10[_local_11];
                            if (XMLValidator.checkRequiredAttributes(_local_12, _local_4))
                            {
                                _local_13 = parseInt(_local_12.@size);
                                _local_14 = _local_9.createMaskVisualization(_local_13);
                                if (_local_14 != null)
                                {
                                    _local_15 = _local_12.bitmap;
                                    _local_16 = this._Str_25815(_local_15, _local_14, _arg_2);
                                    _local_9._Str_24425(_local_13, _local_16);
                                }
                            }
                            _local_11++;
                        }
                        this._masks.add(_local_8, _local_9);
                    }
                }
                _local_6++;
            }
        }

        private function _Str_25815(k:XMLList, _arg_2:PlaneMaskVisualization, _arg_3:IGraphicAssetCollection):String
        {
            var _local_6:XML;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:String;
            var _local_12:IGraphicAsset;
            if (k == null)
            {
                return null;
            }
            var _local_4:String;
            var _local_5:int;
            while (_local_5 < k.length())
            {
                _local_6 = k[_local_5];
                if (XMLValidator.checkRequiredAttributes(_local_6, ["assetName"]))
                {
                    _local_7 = PlaneMaskVisualization.MIN_NORMAL_COORDINATE_VALUE;
                    _local_8 = PlaneMaskVisualization.MAX_NORMAL_COORDINATE_VALUE;
                    _local_9 = PlaneMaskVisualization.MIN_NORMAL_COORDINATE_VALUE;
                    _local_10 = PlaneMaskVisualization.MAX_NORMAL_COORDINATE_VALUE;
                    if (String(_local_6.@normalMinX) != "")
                    {
                        _local_7 = parseFloat(_local_6.@normalMinX);
                    }
                    if (String(_local_6.@normalMaxX) != "")
                    {
                        _local_8 = parseFloat(_local_6.@normalMaxX);
                    }
                    if (String(_local_6.@normalMinY) != "")
                    {
                        _local_9 = parseFloat(_local_6.@normalMinY);
                    }
                    if (String(_local_6.@normalMaxY) != "")
                    {
                        _local_10 = parseFloat(_local_6.@normalMaxY);
                    }
                    _local_11 = _local_6.@assetName;
                    _local_12 = _arg_3.getAsset(_local_11);
                    if (_local_12 != null)
                    {
                        if (!_local_12.flipH)
                        {
                            _local_4 = _local_11;
                        }
                        _arg_2.addBitmap(_local_12, _local_7, _local_8, _local_9, _local_10);
                    }
                }
                _local_5++;
            }
            return _local_4;
        }

        public function updateMask(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:IVector3d, _arg_5:int, _arg_6:int):Boolean
        {
            var _local_8:IGraphicAsset;
            var _local_9:BitmapDataAsset;
            var _local_10:BitmapData;
            var _local_11:Point;
            var _local_12:Matrix;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_7:PlaneMask = (this._masks.getValue(_arg_2) as PlaneMask);
            if (_local_7 != null)
            {
                _local_8 = _local_7.getGraphicAsset(_arg_3, _arg_4);
                if (_local_8 != null)
                {
                    _local_9 = (_local_8.asset as BitmapDataAsset);
                    if (_local_9 != null)
                    {
                        _local_10 = (_local_9.content as BitmapData);
                        if (_local_10 != null)
                        {
                            _local_11 = new Point((_arg_5 + _local_8.offsetX), (_arg_6 + _local_8.offsetY));
                            _local_12 = new Matrix();
                            _local_13 = 1;
                            _local_14 = 1;
                            _local_15 = 0;
                            _local_16 = 0;
                            if (_local_8.flipH)
                            {
                                _local_13 = -1;
                                _local_15 = _local_10.width;
                            }
                            if (_local_8.flipV)
                            {
                                _local_14 = -1;
                                _local_16 = _local_10.height;
                            }
                            _local_12.scale(_local_13, _local_14);
                            _local_12.translate((_local_11.x + _local_15), (_local_11.y + _local_16));
                            k.draw(_local_10, _local_12);
                        }
                    }
                }
            }
            return true;
        }

        public function getMask(k:String):PlaneMask
        {
            return this._masks.getValue(k) as PlaneMask;
        }
    }
}
