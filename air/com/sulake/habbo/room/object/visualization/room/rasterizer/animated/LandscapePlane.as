//com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapePlane

package com.sulake.habbo.room.object.visualization.room.rasterizer.animated{
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.Plane;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class LandscapePlane extends Plane {

        public static const DEFAULT_COLOR:uint;
        public static const HORIZONTAL_ANGLE_DEFAULT:Number;
        public static const VERTICAL_ANGLE_DEFAULT:Number;

        private var _width:int;
        private var _height:int;

        public function LandscapePlane();

        override public function isStatic(k:int):Boolean;

        public function initializeDimensions(k:int, _arg_2:int):void;

        public function render(k:BitmapData, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:IVector3d, _arg_6:Boolean, _arg_7:Number, _arg_8:Number, _arg_9:Number, k0:Number, k1:int):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.animated

