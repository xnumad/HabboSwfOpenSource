//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.Plane

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IRoomGeometry;

    public class Plane {

        private var _planeVisualizations:Map;
        private var _sizes:Array;
        private var _lastPlaneVisualization:PlaneVisualization;
        private var _lastSize:int;

        public function Plane();

        public function isStatic(k:int):Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function createPlaneVisualization(k:int, _arg_2:int, _arg_3:IRoomGeometry):PlaneVisualization;

        private function getSizeIndex(k:int):int;

        public function getPlaneVisualization(k:int):PlaneVisualization;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

