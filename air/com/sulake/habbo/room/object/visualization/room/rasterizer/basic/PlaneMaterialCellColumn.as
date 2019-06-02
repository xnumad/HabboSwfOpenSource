//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellColumn

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaterialCellColumn {

        public static const REPEAT_MODE_NONE:int;
        public static const REPEAT_MODE_ALL:int;
        public static const REPEAT_MODE_BORDERS:int;
        public static const REPEAT_MODE_CENTER:int;
        public static const REPEAT_MODE_FIRST:int;
        public static const REPEAT_MODE_LAST:int;

        private var _cells:Array;
        private var _repeatMode:int;
        private var _width:int;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d;
        private var _cachedBitmapDataOffsetX:int;
        private var _cachedBitmapDataOffsetY:int;
        private var _isCached:Boolean;
        private var _isStatic:Boolean;

        public function PlaneMaterialCellColumn(k:int, _arg_2:Array, _arg_3:int=1);

        public function get isStatic():Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function render(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:int):BitmapData;

        private function getCellsHeight(k:Array, _arg_2:IVector3d):int;

        private function renderCells(k:Array, _arg_2:int, _arg_3:Boolean, _arg_4:IVector3d, _arg_5:int=0, _arg_6:int=0):int;

        private function renderRepeatNone(k:IVector3d):void;

        private function renderRepeatAll(k:IVector3d, _arg_2:int, _arg_3:int):void;

        private function renderRepeatBorders(k:IVector3d):void;

        private function renderRepeatCenter(k:IVector3d):void;

        private function renderRepeatFirst(k:IVector3d):void;

        private function renderRepeatLast(k:IVector3d):void;

        public function renderSample():BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

