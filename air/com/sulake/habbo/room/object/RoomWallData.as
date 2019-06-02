//com.sulake.habbo.room.object.RoomWallData

package com.sulake.habbo.room.object{
    import flash.geom.Point;

    public class RoomWallData {

        public static var WALL_DIRECTION_VECTORS:Array;
        public static var WALL_NORMAL_VECTORS:Array;

        private var _corners:Array;
        private var _endPoints:Array;
        private var _directions:Array;
        private var _lengths:Array;
        private var _leftTurns:Array;
        private var _borders:Array;
        private var _hideWalls:Array;
        private var _manuallyLeftCut:Array;
        private var _manuallyRightCut:Array;
        private var _addDuplicates:Boolean;
        private var _count:int;

        public function RoomWallData();

        public function addWall(k:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):void;

        private function checkIsNotDuplicate(k:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):Boolean;

        public function get count():int;

        public function getCorner(k:int):Point;

        public function getEndPoint(k:int):Point;

        public function getLength(k:int):int;

        public function getDirection(k:int):int;

        public function getBorder(k:int):Boolean;

        public function getHideWall(k:int):Boolean;

        public function getLeftTurn(k:int):Boolean;

        public function getManuallyLeftCut(k:int):Boolean;

        public function getManuallyRightCut(k:int):Boolean;

        public function setHideWall(k:int, _arg_2:Boolean):void;

        public function setLength(k:int, _arg_2:int):void;

        public function moveCorner(k:int, _arg_2:int):void;

        private function calculateWallEndPoints():void;


    }
}//package com.sulake.habbo.room.object

