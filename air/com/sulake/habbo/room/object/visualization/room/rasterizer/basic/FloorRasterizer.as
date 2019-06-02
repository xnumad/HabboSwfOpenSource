//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public class FloorRasterizer extends PlaneRasterizer {

        public function FloorRasterizer();

        override protected function initializePlanes():void;

        private function parseFloors(k:XML):void;

        override public function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, k0:Number=0, k1:Number=0, k2:int=0):PlaneBitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

