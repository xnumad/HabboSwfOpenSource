//com.sulake.habbo.room.object.visualization.furniture.FurnitureQueueTileVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization {

        private static const ANIMATION_ID_ROLL:int;
        private static const ANIMATION_ID_ROLL_ONCE:int;
        private static const ANIMATION_ID_NORMAL:int;
        private static const ANIMATION_DURATION:int;

        private var _stateQueue:Array;
        private var _animationCounter:int;

        public function FurnitureQueueTileVisualization();

        override protected function setAnimation(k:int):void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function usesAnimationResetting():Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

