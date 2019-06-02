//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterial

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.room.utils.IVector3d;
    import flash.display.BitmapData;

    public class PlaneMaterial {

        public static const MIN_NORMAL_COORDINATE_VALUE:Number;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number;

        private var _planeMaterialItems:Array;
        private var _isCached:Boolean;

        public function PlaneMaterial();

        public function dispose():void;

        public function clearCache():void;

        public function addMaterialCellMatrix(k:int, _arg_2:int, _arg_3:int, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:Number=-1, _arg_7:Number=1):PlaneMaterialCellMatrix;

        private function getMaterialCellMatrix(k:IVector3d):PlaneMaterialCellMatrix;

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean):BitmapData;

        public function renderSample():BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

