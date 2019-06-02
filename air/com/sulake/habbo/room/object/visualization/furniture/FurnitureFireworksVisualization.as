//com.sulake.habbo.room.object.visualization.furniture.FurnitureFireworksVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.utils.Dictionary;

    public class FurnitureFireworksVisualization extends AnimatedFurnitureVisualization {

        private var _particleSystems:Dictionary;
        private var _currentParticleSystem:FurnitureParticleSystem;

        public function FurnitureFireworksVisualization();

        override public function dispose():void;

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        override protected function updateAllSprites(k:int):void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function setAnimation(k:int):void;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        private function readDefinition():Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

