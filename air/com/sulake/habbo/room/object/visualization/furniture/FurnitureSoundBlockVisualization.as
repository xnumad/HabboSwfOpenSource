//com.sulake.habbo.room.object.visualization.furniture.FurnitureSoundBlockVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureSoundBlockVisualization extends AnimatedFurnitureVisualization {

        private var _frameIncrease:int;
        private var _internalFrameIncreaseCounter:Number = 0;

        public function FurnitureSoundBlockVisualization();

        override protected function get frameIncrease():int;

        override protected function updateAnimations(k:Number):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

