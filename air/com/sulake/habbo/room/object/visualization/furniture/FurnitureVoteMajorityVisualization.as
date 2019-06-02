//com.sulake.habbo.room.object.visualization.furniture.FurnitureVoteMajorityVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureVoteMajorityVisualization extends AnimatedFurnitureVisualization {

        private static const ONES_SPRITE_TAG:String;
        private static const TENS_SPRITE_TAG:String;
        private static const HUNDREDS_SPRITE_TAG:String;
        private static const HIDE_RESULTS_STATES:Array;
        private static const HIDE_RESULTS_VALUE:int;

        public function FurnitureVoteMajorityVisualization();

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        override protected function getFrameNumber(k:int, _arg_2:int):int;

        override protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

