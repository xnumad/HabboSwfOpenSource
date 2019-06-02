//com.sulake.habbo.room.object.visualization.furniture.FurnitureHabboWheelVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization {

        private static const ANIMATION_ID_OFFSET_SLOW1:int;
        private static const ANIMATION_ID_OFFSET_SLOW2:int;
        private static const ANIMATION_ID_START_ROLL:int;
        private static const ANIMATION_ID_ROLL:int;

        private var _stateQueue:Array;
        private var _running:Boolean;

        public function FurnitureHabboWheelVisualization();

        override protected function setAnimation(k:int):void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

