//com.sulake.habbo.room.object.RoomPlaneParser

package com.sulake.habbo.room.object{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneParser {

        private static const FLOOR_THICKNESS:Number;
        private static const WALL_THICKNESS:Number;
        private static const MAX_WALL_ADDITIONAL_HEIGHT:Number;
        public static const TILE_BLOCKED:int;
        public static const TILE_HOLE:int;

        private var _tileMatrix:Array;
        private var _tileMatrixOriginal:Array;
        private var _width:int;
        private var _height:int;
        private var _minX:int;
        private var _maxX:int;
        private var _minY:int;
        private var _maxY:int;
        private var _planes:Vector.<RoomPlaneData>;
        private var _wallHeight:Number = 0;
        private var _wallThicknessMultiplier:Number;
        private var _floorThicknessMultiplier:Number;
        private var _fixedWallHeight:int;
        private var _floorHeight:Number = 0;
        private var _floorHoles:Map;
        private var _floorHoleMatrix:Array;

        public function RoomPlaneParser();

        private static function getFloorHeight(k:Array):Number;

        private static function findEntranceTile(k:Array):Point;

        private static function expandFloorTiles(k:Vector.<Vector.<int>>):Vector.<Vector.<int>>;

        private static function addTileTypes(k:Vector.<Vector.<int>>):void;

        private static function unpadHeightMap(k:Vector.<Vector.<int>>):void;

        private static function padHeightMap(k:Vector.<Vector.<int>>):void;


        public function get minX():int;

        public function get maxX():int;

        public function get minY():int;

        public function get maxY():int;

        public function get tileMapWidth():int;

        public function get tileMapHeight():int;

        public function get planeCount():int;

        public function get floorHeight():Number;

        public function get wallHeight():Number;

        public function set wallHeight(k:Number):void;

        public function get wallThicknessMultiplier():Number;

        public function set wallThicknessMultiplier(k:Number):void;

        public function get floorThicknessMultiplier():Number;

        public function set floorThicknessMultiplier(k:Number):void;

        public function dispose():void;

        public function reset():void;

        public function initializeTileMap(k:int, _arg_2:int):Boolean;

        public function setTileHeight(k:int, _arg_2:int, _arg_3:Number):Boolean;

        public function getTileHeight(k:int, _arg_2:int):Number;

        private function getTileHeightOriginal(k:int, _arg_2:int):Number;

        private function getTileHeightInternal(k:int, _arg_2:int):Number;

        public function initializeFromTileData(k:int=-1):Boolean;

        private function initialize(k:Point):Boolean;

        private function generateWallData(k:Point, _arg_2:Boolean):RoomWallData;

        private function hidePeninsulaWallChains(k:RoomWallData):void;

        private function updateWallsNextToHoles(k:RoomWallData):void;

        private function resolveOriginalWallIndex(k:Point, _arg_2:Point, _arg_3:RoomWallData):int;

        private function hideOriginallyHiddenWalls(k:RoomWallData, _arg_2:RoomWallData):void;

        private function checkWallHiding(k:RoomWallData, _arg_2:RoomWallData):void;

        private function addWalls(k:RoomWallData, _arg_2:RoomWallData):void;

        private function createWallPlanes():Boolean;

        private function extractTopWall(k:Point, _arg_2:Boolean):Point;

        private function extractRightWall(k:Point, _arg_2:Boolean):Point;

        private function extractBottomWall(k:Point, _arg_2:Boolean):Point;

        private function extractLeftWall(k:Point, _arg_2:Boolean):Point;

        private function addWall(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void;

        private function addFloor(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void;

        public function initializeFromXML(k:XML):Boolean;

        private function addPlane(k:int, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Array=null):RoomPlaneData;

        public function getXML():XML;

        public function getPlanes():Vector.<RoomPlaneData>;

        public function getPlaneLocation(k:int):IVector3d;

        public function getPlaneNormal(k:int):IVector3d;

        public function getPlaneLeftSide(k:int):IVector3d;

        public function getPlaneRightSide(k:int):IVector3d;

        public function getPlaneNormalDirection(k:int):IVector3d;

        public function getPlaneSecondaryNormals(k:int):Array;

        public function getPlaneType(k:int):int;

        public function getPlaneMaskCount(k:int):int;

        public function getPlaneMaskLeftSideLoc(k:int, _arg_2:int):Number;

        public function getPlaneMaskRightSideLoc(k:int, _arg_2:int):Number;

        public function getPlaneMaskLeftSideLength(k:int, _arg_2:int):Number;

        public function getPlaneMaskRightSideLength(k:int, _arg_2:int):Number;

        public function addFloorHole(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void;

        public function removeFloorHole(k:int):void;

        public function resetFloorHoles():void;

        private function initializeHoleMap():void;

        private function extractPlanes(k:Vector.<Vector.<int>>):void;

        public function getFloorCenter():IVector3d;


    }
}//package com.sulake.habbo.room.object

