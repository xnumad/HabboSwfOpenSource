package com.sulake.habbo.window.utils.floorplaneditor
{
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.geom.Point;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
    import __AS3__.vec.*;
    import com.sulake.habbo.window.utils.floorplaneditor.images.*;

    public class FloorPlanPreviewer 
    {
        public static var tile_preview_0:Class = FloorPlanPreviewer_tile_preview_0;
        public static var tile_preview_1:Class = FloorPlanPreviewer_tile_preview_1;
        public static var tile_preview_2:Class = FloorPlanPreviewer_tile_preview_2;
        public static var tile_preview_3:Class = FloorPlanPreviewer_tile_preview_3;
        public static var tile_preview_4:Class = FloorPlanPreviewer_tile_preview_4;
        public static var tile_preview_5:Class = FloorPlanPreviewer_tile_preview_5;
        public static var tile_preview_6:Class = FloorPlanPreviewer_tile_preview_6;
        public static var tile_preview_7:Class = FloorPlanPreviewer_tile_preview_7;
        public static var tile_preview_8:Class = FloorPlanPreviewer_tile_preview_8;
        public static var tile_preview_9:Class = FloorPlanPreviewer_tile_preview_9;
        public static var _Str_13785:Class = FloorPlanPreviewer__Str_13785;
        public static var _Str_12541:Class = FloorPlanPreviewer__Str_12541;
        public static var _Str_15592:Class = FloorPlanPreviewer__Str_15592;
        public static var _Str_15443:Class = FloorPlanPreviewer__Str_15443;
        public static var _Str_14220:Class = FloorPlanPreviewer__Str_14220;
        public static var _Str_15140:Class = FloorPlanPreviewer__Str_15140;
        public static var _Str_14517:Class = FloorPlanPreviewer__Str_14517;

        private var _bcFloorPlanEditor:BCFloorPlanEditor;
        private var _tileImages:Vector.<BitmapData>;
        private var _floorPlan:FloorPlanCache;

        public function FloorPlanPreviewer(k:BCFloorPlanEditor)
        {
            this._bcFloorPlanEditor = k;
            this._floorPlan = k._Str_4134;
            this._tileImages = new Vector.<BitmapData>(0);
            this._tileImages.push(Bitmap(new tile_preview_0()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_1()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_2()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_3()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_4()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_5()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_6()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_7()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_8()).bitmapData);
            this._tileImages.push(Bitmap(new tile_preview_9()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_13785()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_12541()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_15592()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_15443()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_14220()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_15140()).bitmapData);
            this._tileImages.push(Bitmap(new _Str_14517()).bitmapData);
        }

        private static function _Str_21730(k:int, _arg_2:int, _arg_3:int):Point
        {
            return new Point((8 * (k - _arg_2)), ((4 * (k + _arg_2)) - (8 * _arg_3)));
        }


        public function _Str_3190():void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_12:Object;
            var _local_13:int;
            var _local_14:Point;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:int;
            var _local_23:int;
            var _local_24:int;
            var k:Array = [];
            var _local_2:int = int.MAX_VALUE;
            var _local_3:int = int.MAX_VALUE;
            var _local_4:int = int.MIN_VALUE;
            var _local_5:int = int.MIN_VALUE;
            _local_7 = 0;
            while (_local_7 < this._floorPlan.floorHeight)
            {
                _local_6 = 0;
                while (_local_6 < this._floorPlan._Str_17437)
                {
                    _local_13 = this._floorPlan._Str_4203(_local_6, _local_7);
                    if (_local_13 < 0)
                    {
                    }
                    else
                    {
                        _local_14 = _Str_21730(_local_6, _local_7, _local_13);
                        _local_2 = Math.min(_local_2, _local_14.x);
                        _local_3 = Math.min(_local_3, _local_14.y);
                        _local_4 = Math.max(_local_4, _local_14.x);
                        _local_5 = Math.max(_local_5, _local_14.y);
                        _local_15 = this._floorPlan._Str_4203((_local_6 - 1), (_local_7 - 1));
                        _local_16 = this._floorPlan._Str_4203(_local_6, (_local_7 - 1));
                        _local_17 = this._floorPlan._Str_4203((_local_6 + 1), (_local_7 - 1));
                        _local_18 = this._floorPlan._Str_4203((_local_6 - 1), _local_7);
                        _local_19 = this._floorPlan._Str_4203((_local_6 + 1), _local_7);
                        _local_20 = this._floorPlan._Str_4203((_local_6 - 1), (_local_7 + 1));
                        _local_21 = this._floorPlan._Str_4203(_local_6, (_local_7 + 1));
                        _local_22 = this._floorPlan._Str_4203((_local_6 + 1), (_local_7 + 1));
                        _local_23 = (_local_13 + 1);
                        _local_24 = (((((((_local_15 == _local_23) || (_local_16 == _local_23)) || (_local_18 == _local_23)) ? 1 : 0) | ((((_local_17 == _local_23) || (_local_16 == _local_23)) || (_local_19 == _local_23)) ? 2 : 0)) | ((((_local_20 == _local_23) || (_local_21 == _local_23)) || (_local_18 == _local_23)) ? 4 : 0)) | ((((_local_22 == _local_23) || (_local_21 == _local_23)) || (_local_19 == _local_23)) ? 8 : 0));
                        if (_local_24 == 15)
                        {
                            _local_24 = 0;
                        }
                        if (this._floorPlan._Str_21855(_local_6, _local_7))
                        {
                            _local_24 = (this._tileImages.length - 1);
                        }
                        k.push({
                            "point":_local_14,
                            "type":_local_24
                        });
                    }
                    _local_6++;
                }
                _local_7++;
            }
            var _local_8:int = Math.min(((_local_4 - _local_2) + 18), TrackedBitmapData.MIN_HEIGHT);
            var _local_9:int = Math.min(((_local_5 - _local_3) + 18), TrackedBitmapData.MIN_HEIGHT);
            var _local_10:BitmapData = new BitmapData(_local_8, _local_9, false, 0xFFFFFFFF);
            var _local_11:Point = new Point(-(_local_2), -(_local_3));
            for each (_local_12 in k)
            {
                _local_10.copyPixels(this._tileImages[_local_12.type], this._tileImages[_local_12.type].rect, _local_12.point.add(_local_11));
            }
            this._bcFloorPlanEditor._Str_22370(_local_10);
        }
    }
}
