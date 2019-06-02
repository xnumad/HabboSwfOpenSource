//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellMatrix

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Point;

    public class PlaneMaterialCellMatrix {

        public static const REPEAT_MODE_ALL:int;
        public static const REPEAT_MODE_BORDERS:int;
        public static const REPEAT_MODE_CENTER:int;
        public static const REPEAT_MODE_FIRST:int;
        public static const REPEAT_MODE_LAST:int;
        public static const REPEAT_MODE_RANDOM:int;
        public static const REPEAT_MODE_DEFAULT:int;
        public static const MIN_NORMAL_COORDINATE_VALUE:Number;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number;
        public static const ALIGN_TOP:int;
        public static const ALIGN_BOTTOM:int;
        public static const ALIGN_DEFAULT:int;

        private var _columns:Array;
        private var _repeatMode:int;
        private var _align:int;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d;
        private var _cachedBitmapHeight:int;
        private var _isCached:Boolean;
        private var _isStatic:Boolean;
        private var _normalMinX:Number;
        private var _normalMaxX:Number;
        private var _normalMinY:Number;
        private var _normalMaxY:Number;

        public function PlaneMaterialCellMatrix(k:int, _arg_2:int=1, _arg_3:int=1, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:Number=-1, _arg_7:Number=1);

        public function get normalMinX():Number;

        public function get normalMaxX():Number;

        public function get normalMinY():Number;

        public function get normalMaxY():Number;

        public function get isStatic():Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function createColumn(k:int, _arg_2:int, _arg_3:Array, _arg_4:int=1):Boolean;

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean):BitmapData;

        private function copyCachedBitmapOnCanvas(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:Boolean):void;

        private function getColumnsWidth(k:Array):int;

        private function renderColumns(k:BitmapData, _arg_2:Array, _arg_3:int, _arg_4:Boolean):Point;

        private function renderRepeatAll(k:BitmapData, _arg_2:Array):int;

        private function renderRepeatBorders(k:BitmapData, _arg_2:Array):int;

        private function renderRepeatCenter(k:BitmapData, _arg_2:Array):int;

        private function renderRepeatFirst(k:BitmapData, _arg_2:Array):int;

        private function renderRepeatLast(k:BitmapData, _arg_2:Array):int;

        private function renderRepeatRandom(k:BitmapData, _arg_2:Array):int;

        public function renderSample():BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

