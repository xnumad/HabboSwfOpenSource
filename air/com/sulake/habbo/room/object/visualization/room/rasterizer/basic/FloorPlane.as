//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorPlane

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class FloorPlane extends Plane {

        public static const DEFAULT_COLOR:uint;
        public static const HORIZONTAL_ANGLE_DEFAULT:Number;
        public static const VERTICAL_ANGLE_DEFAULT:Number;

        public function FloorPlane();

        public function render(k:BitmapData, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:IVector3d, _arg_6:Boolean, _arg_7:Number, _arg_8:Number):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

