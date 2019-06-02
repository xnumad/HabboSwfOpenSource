//com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization

package com.sulake.habbo.room.object.visualization.room.mask{
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaskVisualization {

        public static const MIN_NORMAL_COORDINATE_VALUE:Number;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number;

        private var _bitmaps:Array;

        public function PlaneMaskVisualization();

        public function dispose():void;

        public function addBitmap(k:IGraphicAsset, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1):void;

        public function getAsset(k:IVector3d):IGraphicAsset;


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

