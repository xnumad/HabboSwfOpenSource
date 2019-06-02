//com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskBitmap

package com.sulake.habbo.room.object.visualization.room.mask{
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class PlaneMaskBitmap {

        public static const MIN_NORMAL_COORDINATE_VALUE:Number;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number;

        private var _asset:IGraphicAsset;
        private var _normalMinX:Number;
        private var _normalMaxX:Number;
        private var _normalMinY:Number;
        private var _normalMaxY:Number;

        public function PlaneMaskBitmap(k:IGraphicAsset, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1);

        public function get asset():IGraphicAsset;

        public function get normalMinX():Number;

        public function get normalMaxX():Number;

        public function get normalMinY():Number;

        public function get normalMaxY():Number;

        public function dispose():void;


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

