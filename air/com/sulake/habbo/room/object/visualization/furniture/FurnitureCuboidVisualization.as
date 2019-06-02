//com.sulake.habbo.room.object.visualization.furniture.FurnitureCuboidVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureCuboidVisualization extends RoomObjectSpriteVisualization {

        private var _assetLibrary:AssetLibrary;
        private var _planes:Array;
        private var _planesInitialized:Boolean;
        private var _assetUpdateCounter:int;

        public function FurnitureCuboidVisualization();

        override public function dispose():void;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        protected function defineSprites():void;

        protected function initializePlanes():Boolean;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        protected function updatePlanes(k:IRoomGeometry, _arg_2:int, _arg_3:Number):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

