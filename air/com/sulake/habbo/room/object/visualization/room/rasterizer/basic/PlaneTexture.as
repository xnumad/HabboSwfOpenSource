//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneTexture

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class PlaneTexture {

        public static const MIN_NORMAL_COORDINATE_VALUE:Number;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number;

        private var _bitmaps:Array;

        public function PlaneTexture();

        public function dispose():void;

        public function addBitmap(k:BitmapData, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1):void;

        public function getBitmap(k:IVector3d):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

