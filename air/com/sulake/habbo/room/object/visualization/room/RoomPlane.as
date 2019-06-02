//com.sulake.habbo.room.object.visualization.room.RoomPlane

package com.sulake.habbo.room.object.visualization.room{
    import flash.geom.Point;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Matrix;

    public class RoomPlane {

        private static const ZERO_POINT:Point;
        public static const TYPE_UNDEFINED:int;
        public static const TYPE_WALL:int;
        public static const TYPE_FLOOR:int;
        public static const TYPE_LANDSCAPE:int;

        private var _disposed:Boolean;
        private var _randomSeed:int;
        private var _origin:Vector3d;
        private var _loc:Vector3d;
        private var _leftSide:Vector3d;
        private var _rightSide:Vector3d;
        private var _normal:Vector3d;
        private var _secondaryNormals:Array;
        private var _geometryUpdateId:int;
        private var _type:int;
        private var _isVisible:Boolean;
        private var _bitmapData:BitmapData;
        private var _hasTexture:Boolean;
        private var _offset:Point;
        private var _relativeDepth:Number = 0;
        private var _color:uint;
        private var _rasterizer:IPlaneRasterizer;
        private var _maskManager:PlaneMaskManager;
        private var _id:String;
        private var _previousId:String;
        private var _textureOffsetX:Number = 0;
        private var _textureOffsetY:Number = 0;
        private var _textureMaxX:Number = 0;
        private var _textureMaxY:Number = 0;
        private var _textures:Map;
        private var _activeTexture:PlaneBitmapData;
        private var _useMask:Boolean;
        private var _bitmapMasks:Array;
        private var _rectangleMasks:Array;
        private var _maskChanged:Boolean;
        private var _maskBitmapData:BitmapData;
        private var _maskBufferBitmapData:BitmapData;
        private var _bitmapMasksOld:Array;
        private var _rectangleMasksOld:Array;
        private var _cornerA:Vector3d;
        private var _cornerB:Vector3d;
        private var _cornerC:Vector3d;
        private var _cornerD:Vector3d;
        private var _width:Number = 0;
        private var _height:Number = 0;
        private var _canBeVisible:Boolean;

        public function RoomPlane(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:Boolean, _arg_7:Array, _arg_8:int, _arg_9:Number=0, k0:Number=0, k1:Number=0, k2:Number=0);

        public function set canBeVisible(k:Boolean):void;

        public function get canBeVisible():Boolean;

        public function get bitmapData():BitmapData;

        public function get visible():Boolean;

        public function get offset():Point;

        public function get relativeDepth():Number;

        public function get color():uint;

        public function set color(k:uint):void;

        public function get type():int;

        public function get leftSide():IVector3d;

        public function get rightSide():IVector3d;

        public function get location():IVector3d;

        public function get normal():IVector3d;

        public function get hasTexture():Boolean;

        public function set hasTexture(k:Boolean):void;

        public function get rasterizer():IPlaneRasterizer;

        public function set rasterizer(k:IPlaneRasterizer):void;

        public function set maskManager(k:PlaneMaskManager):void;

        public function get id():String;

        public function set id(k:String):void;

        public function dispose():void;

        public function copyBitmapData(k:BitmapData):BitmapData;

        private function cacheTexture(k:String, _arg_2:PlaneBitmapData):Boolean;

        private function resetTextureCache(k:BitmapData=null):void;

        private function getTextureIdentifier(k:Number):String;

        private function needsNewTexture(k:IRoomGeometry, _arg_2:int):Boolean;

        private function getTexture(k:IRoomGeometry, _arg_2:int):BitmapData;

        private function addOutlines(k:PlaneBitmapData):void;

        public function update(k:IRoomGeometry, _arg_2:int):Boolean;

        private function updateCorners(k:IRoomGeometry):void;

        private function renderTexture(k:IRoomGeometry, _arg_2:BitmapData):void;

        private function draw(k:BitmapData, _arg_2:Matrix):void;

        public function resetBitmapMasks():void;

        public function addBitmapMask(k:String, _arg_2:Number, _arg_3:Number):Boolean;

        public function resetRectangleMasks():void;

        public function addRectangleMask(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Boolean;

        private function updateMaskChangeStatus():void;

        private function updateMask(k:BitmapData, _arg_2:IRoomGeometry):void;

        private function combineTextureMask(k:BitmapData, _arg_2:BitmapData):void;


    }
}//package com.sulake.habbo.room.object.visualization.room

