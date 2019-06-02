//com.sulake.habbo.room.object.RoomPlaneData

package com.sulake.habbo.room.object{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneData {

        public static const PLANE_UNDEFINED:int;
        public static const PLANE_FLOOR:int;
        public static const PLANE_WALL:int;
        public static const PLANE_LANDSCAPE:int;
        public static const PLANE_BILLBOARD:int;

        private var _type:int;
        private var _loc:Vector3d;
        private var _leftSide:Vector3d;
        private var _rightSide:Vector3d;
        private var _normal:Vector3d;
        private var _normalDirection:Vector3d;
        private var _secondaryNormals:Array;
        private var _masks:Array;

        public function RoomPlaneData(k:int, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Array);

        public function get type():int;

        public function get loc():IVector3d;

        public function get leftSide():IVector3d;

        public function get rightSide():IVector3d;

        public function get normal():IVector3d;

        public function get normalDirection():IVector3d;

        public function get secondaryNormalCount():int;

        public function get maskCount():int;

        public function dispose():void;

        public function getSecondaryNormal(k:int):IVector3d;

        public function addMask(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):void;

        private function getMask(k:int):RoomPlaneMaskData;

        public function getMaskLeftSideLoc(k:int):Number;

        public function getMaskRightSideLoc(k:int):Number;

        public function getMaskLeftSideLength(k:int):Number;

        public function getMaskRightSideLength(k:int):Number;


    }
}//package com.sulake.habbo.room.object

