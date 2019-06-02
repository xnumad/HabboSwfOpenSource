//com.sulake.habbo.room.object.visualization.room.rasterizer.animated.AnimationItem

package com.sulake.habbo.room.object.visualization.room.rasterizer.animated{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class AnimationItem {

        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _speedX:Number = 0;
        private var _speedY:Number = 0;
        private var _bitmapData:BitmapData;

        public function AnimationItem(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:BitmapData);

        public function get bitmapData():BitmapData;

        public function dispose():void;

        public function getPosition(k:int, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:int):Point;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.animated

