//com.sulake.habbo.room.object.visualization.room.mask.PlaneMask

package com.sulake.habbo.room.object.visualization.room.mask{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class PlaneMask {

        private var _maskVisualizations:Map;
        private var _sizes:Array;
        private var _lastMaskVisualization:PlaneMaskVisualization;
        private var _lastSize:int;

        public function PlaneMask();

        public function dispose():void;

        public function createMaskVisualization(k:int):PlaneMaskVisualization;

        private function getSizeIndex(k:int):int;

        protected function getMaskVisualization(k:int):PlaneMaskVisualization;

        public function getGraphicAsset(k:Number, _arg_2:IVector3d):IGraphicAsset;


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

