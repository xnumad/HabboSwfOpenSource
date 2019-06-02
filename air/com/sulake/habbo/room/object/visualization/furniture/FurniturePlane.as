//com.sulake.habbo.room.object.visualization.furniture.FurniturePlane

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Matrix;

    public class FurniturePlane {

        private var _geometryUpdateId:int;
        private var _geometryDirX:Number = 0;
        private var _geometryDirY:Number = 0;
        private var _geometryDirZ:Number = 0;
        private var _geometryScale:Number = 0;
        private var _origin:Vector3d;
        private var _loc:Vector3d;
        private var _leftSide:Vector3d;
        private var _rightSide:Vector3d;
        private var _leftSideOriginal:Vector3d;
        private var _rightSideOriginal:Vector3d;
        private var _normal:Vector3d;
        private var _isVisible:Boolean;
        private var _bitmapData:BitmapData;
        private var _textures:Map;
        private var _offset:Point;
        private var _relativeDepth:Number = 0;
        private var _color:uint;
        private var _rotated:Boolean;
        private var _id:String;
        private var _cornerA:Vector3d;
        private var _cornerB:Vector3d;
        private var _cornerC:Vector3d;
        private var _cornerD:Vector3d;
        private var _width:Number = 0;
        private var _height:Number = 0;

        public function FurniturePlane(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d);

        public function get bitmapData():BitmapData;

        public function get visible():Boolean;

        public function get offset():Point;

        public function get relativeDepth():Number;

        public function get color():uint;

        public function set color(k:uint):void;

        public function get leftSide():IVector3d;

        public function get rightSide():IVector3d;

        public function get location():IVector3d;

        public function get normal():IVector3d;

        public function dispose():void;

        public function setRotation(k:Boolean):void;

        private function cacheTexture(k:String, _arg_2:BitmapData):Boolean;

        private function resetTextureCache():void;

        private function getTextureIdentifier(k:IRoomGeometry):String;

        private function needsNewTexture(k:IRoomGeometry):Boolean;

        private function getTexture(k:IRoomGeometry, _arg_2:int):BitmapData;

        public function update(k:IRoomGeometry, _arg_2:int):Boolean;

        private function updateCorners(k:IRoomGeometry):void;

        private function renderTexture(k:IRoomGeometry, _arg_2:BitmapData):void;

        private function draw(k:BitmapData, _arg_2:Matrix):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

