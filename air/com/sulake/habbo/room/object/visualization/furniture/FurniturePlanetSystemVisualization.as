//com.sulake.habbo.room.object.visualization.furniture.FurniturePlanetSystemVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.utils.Vector3d;

    public class FurniturePlanetSystemVisualization extends AnimatedFurnitureVisualization {

        private var _planetIndex:Array;
        private var _planetNameIndex:Array;
        private var _offsetArray:Array;
        private var _rootPosition:Vector3d;

        public function FurniturePlanetSystemVisualization();

        override public function dispose():void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        private function readDefinition():Boolean;

        private function addPlanet(k:String, _arg_2:int, _arg_3:String, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):void;

        private function getPlanet(k:String):FurniturePlanetSystemVisualizationPlanetObject;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

