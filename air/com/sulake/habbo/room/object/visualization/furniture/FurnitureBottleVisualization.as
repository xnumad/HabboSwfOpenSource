//com.sulake.habbo.room.object.visualization.furniture.FurnitureBottleVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization {

        private static const ANIMATION_ID_OFFSET_SLOW1:int;
        private static const ANIMATION_ID_OFFSET_SLOW2:int;
        private static const ANIMATION_ID_ROLL:int;

        private var _stateQueue:Array;
        private var _running:Boolean;

        public function FurnitureBottleVisualization();

        override protected function setAnimation(k:int):void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

