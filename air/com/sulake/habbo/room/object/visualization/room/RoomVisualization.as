//com.sulake.habbo.room.object.visualization.room.RoomVisualization

package com.sulake.habbo.room.object.visualization.room{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import flash.utils.Dictionary;
    import away3d.materials.MaterialBase;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import away3d.entities.Mesh;

    public class RoomVisualization extends RoomObjectSpriteVisualization {

        public static const FLOOR_COLOR:int;
        public static const FLOOR_COLOR_LEFT:int;
        public static const FLOOR_COLOR_RIGHT:int;
        private static const WALL_COLOR_TOP:int;
        private static const WALL_COLOR_SIDE:int;
        private static const WALL_COLOR_BOTTOM:int;
        private static const WALL_COLOR_BORDER:int;
        public static const LANDSCAPE_COLOR_TOP:int;
        public static const LANDSCAPE_COLOR_SIDE:int;
        public static const LANDSCAPE_COLOR_BOTTOM:int;
        private static const ROOM_DEPTH_OFFSET:Number;

        protected var _data:RoomVisualizationData;
        private var _assetLibrary:AssetLibrary;
        private var _planeParser:RoomPlaneParser;
        private var _planes:Array;
        private var _planesInitialized:Boolean;
        private var _visiblePlanes:Array;
        private var _visiblePlaneSpriteNumbers:Array;
        private var _boundingRectangle:Rectangle;
        private var _planeMaskParser:RoomPlaneBitmapMaskParser;
        private var _wallType:String;
        private var _floorType:String;
        private var _landscapeType:String;
        private var _floorThicknessMultiplier:Number;
        private var _wallThicknessMultiplier:Number;
        private var _floorHoleUpdateTime:Number;
        private var _planeMaskData:String;
        private var _backgroundColor:uint;
        private var _backgroundRed:int;
        private var _backgroundGreen:int;
        private var _backgroundBlue:int;
        private var _colorizeBgOnly:Boolean;
        private var _assetUpdateCounter:int;
        private var _geometryUpdateId:int;
        private var _geometryDirX:Number = 0;
        private var _geometryDirY:Number = 0;
        private var _geometryDirZ:Number = 0;
        private var _geometryScale:Number = 0;
        private var _planeTypeVisibilities:Array;
        private var _planeMaterials:Dictionary;

        public function RoomVisualization();

        private static function disposeMaterial(k:MaterialBase):void;

        private static function legalizeSize(k:BitmapData):BitmapData;


        public function get floorRelativeDepth():Number;

        public function get wallRelativeDepth():Number;

        public function get wallAdRelativeDepth():Number;

        public function get planeCount():int;

        override public function dispose():void;

        private function resetRoomPlanes():void;

        override protected function reset():void;

        override public function get boundingRectangle():Rectangle;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        protected function defineSprites():void;

        protected function initializeRoomPlanes():Boolean;

        private function getLandscapeWidth():Number;

        private function getLandscapeHeight():Number;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        private function updateGeometry(k:IRoomGeometry):Boolean;

        private function updateMasksAndColors(k:IRoomObjectModel):Boolean;

        private function updatePlaneTexturesAndVisibilities(k:IRoomObjectModel):Boolean;

        private function updatePlaneThicknesses(k:IRoomObjectModel):Boolean;

        private function updateFloorHoles(k:IRoomObjectModel):Boolean;

        protected function updatePlaneTextureTypes(k:String, _arg_2:String, _arg_3:String):Boolean;

        private function updatePlaneTypeVisibilities(k:Boolean, _arg_2:Boolean, _arg_3:Boolean):void;

        protected function updatePlanes(k:IRoomGeometry, _arg_2:Boolean, _arg_3:Number, _arg_4:int):Boolean;

        private function updateSprite(k:IRoomObjectSprite, _arg_2:RoomPlane, _arg_3:String, _arg_4:Number):void;

        private function createPlaneMesh(k:RoomPlane, _arg_2:uint):Mesh;

        private function getPlaneBitmap(k:RoomPlane, _arg_2:String):BitmapData;

        protected function updatePlaneMasks(k:String):void;


    }
}//package com.sulake.habbo.room.object.visualization.room

