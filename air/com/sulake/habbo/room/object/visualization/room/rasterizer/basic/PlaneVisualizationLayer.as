//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualizationLayer

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.ColorTransform;

    public class PlaneVisualizationLayer implements IDisposable {

        public static const DEFAULT_OFFSET:int;
        public static const ALIGN_TOP:int;
        public static const ALIGN_BOTTOM:int;
        public static const ALIGN_DEFAULT:int;

        private var _material:PlaneMaterial;
        private var _color:uint;
        private var _offset:int;
        private var _align:int;
        private var _bitmapData:BitmapData;
        private var _isDisposed:Boolean;

        public function PlaneVisualizationLayer(k:PlaneMaterial, _arg_2:uint, _arg_3:int, _arg_4:int=0);

        public function get offset():int;

        public function get align():int;

        public function get disposed():Boolean;

        public function get material():PlaneMaterial;

        public function dispose():void;

        public function clearCache():void;

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int):BitmapData;

        public function get colorTransform():ColorTransform;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

