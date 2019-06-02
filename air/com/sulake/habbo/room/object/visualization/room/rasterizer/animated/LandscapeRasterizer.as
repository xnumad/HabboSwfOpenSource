//com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer

package com.sulake.habbo.room.object.visualization.room.rasterizer.animated{
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneRasterizer;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public class LandscapeRasterizer extends PlaneRasterizer {

        private static const UPDATE_INTERVAL:int;

        private var _landscapeWidth:int;
        private var _landscapeHeight:int;

        public function LandscapeRasterizer();

        override public function initializeDimensions(k:int, _arg_2:int):Boolean;

        override protected function initializePlanes():void;

        private function parseLandscapes(k:XML):void;

        private function getCoordinateValue(k:String, _arg_2:String):Number;

        override public function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, k0:Number=0, k1:Number=0, k2:int=0):PlaneBitmapData;

        override public function getTextureIdentifier(k:Number, _arg_2:IVector3d):String;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.animated

