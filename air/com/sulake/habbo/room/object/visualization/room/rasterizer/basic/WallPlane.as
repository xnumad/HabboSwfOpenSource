//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallPlane

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class WallPlane extends Plane {

        public static const DEFAULT_COLOR:uint;
        public static const HORIZONTAL_ANGLE_DEFAULT:Number;
        public static const VERTICAL_ANGLE_DEFAULT:Number;

        public function WallPlane();

        public function render(k:BitmapData, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:IVector3d, _arg_6:Boolean):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

