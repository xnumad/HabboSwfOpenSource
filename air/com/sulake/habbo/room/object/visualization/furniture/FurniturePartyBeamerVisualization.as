//com.sulake.habbo.room.object.visualization.furniture.FurniturePartyBeamerVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.geom.Point;

    public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization {

        private static const UPDATE_INTERVAL:int;
        private static const AREA_DIAMETER_SMALL:int;
        private static const AREA_DIAMETER_LARGE:int;
        private static const ANIM_SPEED_FAST:int;
        private static const ANIM_SPEED_SLOW:int;

        private var _animPhaseIndex:Array;
        private var _animDirectionIndex:Array;
        private var _animSpeedIndex:Array;
        private var _animFactorIndex:Array;
        private var _animOffsetIndex:Array;

        public function FurniturePartyBeamerVisualization();

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        private function getNewPoint(k:Number, _arg_2:int):Point;

        private function initItems(k:Number):void;

        private function getRandomAmplitudeFactor():Number;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

