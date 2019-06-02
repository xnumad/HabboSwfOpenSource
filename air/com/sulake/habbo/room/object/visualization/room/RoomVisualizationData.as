//com.sulake.habbo.room.object.visualization.room.RoomVisualizationData

package com.sulake.habbo.room.object.visualization.room{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public class RoomVisualizationData implements IRoomObjectVisualizationData {

        private var _wallRasterizer:WallRasterizer;
        private var _floorRasterizer:FloorRasterizer;
        private var _wallAdRasterizer:WallAdRasterizer;
        private var _landscapeRasterizer:LandscapeRasterizer;
        private var _maskManager:PlaneMaskManager;
        private var _initialized:Boolean;

        public function RoomVisualizationData();

        public function get initialized():Boolean;

        public function get floorRasterizer():IPlaneRasterizer;

        public function get wallRasterizer():IPlaneRasterizer;

        public function get wallAdRasterizr():WallAdRasterizer;

        public function get landscapeRasterizer():IPlaneRasterizer;

        public function get maskManager():PlaneMaskManager;

        public function dispose():void;

        public function clearCache():void;

        public function initialize(k:XML):Boolean;

        public function initializeAssetCollection(k:IGraphicAssetCollection):void;

        protected function reset():void;


    }
}//package com.sulake.habbo.room.object.visualization.room

