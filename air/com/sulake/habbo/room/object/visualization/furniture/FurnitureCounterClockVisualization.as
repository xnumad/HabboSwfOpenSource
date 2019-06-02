//com.sulake.habbo.room.object.visualization.furniture.FurnitureCounterClockVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization {

        private static const SECONDS_SPRITE_TAG:String;
        private static const TEN_SECONDS_SPRITE_TAG:String;
        private static const MINUTES_SPRITE_TAG:String;
        private static const TEN_MINUTES_SPRITE_TAG:String;

        public function FurnitureCounterClockVisualization();

        override public function get animationId():int;

        override protected function getFrameNumber(k:int, _arg_2:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

