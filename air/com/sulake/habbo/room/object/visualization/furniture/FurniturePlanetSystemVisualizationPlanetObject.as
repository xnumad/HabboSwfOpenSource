//com.sulake.habbo.room.object.visualization.furniture.FurniturePlanetSystemVisualizationPlanetObject

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.utils.Vector3d;

    public class FurniturePlanetSystemVisualizationPlanetObject {

        private static const SYSTEM_TEMPO:Number;

        private var _index:int;
        private var _name:String;
        private var _radius:Number;
        private var _arcSpeed:Number;
        private var _arcOffset:Number;
        private var _height:Number;
        private var _position:Number;
        private var _positionVector:Vector3d;
        private var _children:Array;

        public function FurniturePlanetSystemVisualizationPlanetObject(k:String, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number);

        public function get name():String;

        public function dispose():void;

        public function update(k:Array, _arg_2:Vector3d, _arg_3:Number):void;

        public function getPositionVector(k:Vector3d, _arg_2:Number):Vector3d;

        public function addChild(k:FurniturePlanetSystemVisualizationPlanetObject):void;

        public function hasChild(k:String):Boolean;

        public function getChild(k:String):FurniturePlanetSystemVisualizationPlanetObject;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

