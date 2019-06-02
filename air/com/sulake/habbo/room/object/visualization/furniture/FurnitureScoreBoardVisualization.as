//com.sulake.habbo.room.object.visualization.furniture.FurnitureScoreBoardVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureScoreBoardVisualization extends AnimatedFurnitureVisualization {

        private static const ONES_SPRITE_TAG:String;
        private static const TENS_SPRITE_TAG:String;
        private static const HUNDREDS_SPRITE_TAG:String;
        private static const THOUSANDS_SPRITE_TAG:String;

        public function FurnitureScoreBoardVisualization();

        override public function get animationId():int;

        override protected function getFrameNumber(k:int, _arg_2:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

