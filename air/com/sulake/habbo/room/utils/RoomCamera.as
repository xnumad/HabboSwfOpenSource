//com.sulake.habbo.room.utils.RoomCamera

package com.sulake.habbo.room.utils{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomCamera {

        private static const MOVE_SPEED_DENOMINATOR:Number;

        private var _targetId:int;
        private var _targetCategory:int;
        private var _targetLoc:Vector3d;
        private var _moveDistance:Number = 0;
        private var _previousMoveSpeed:Number = 0;
        private var _maintainPreviousMoveSpeed:Boolean;
        private var _currentLoc:Vector3d;
        private var _targetObjectLoc:Vector3d;
        private var _limitedLocX:Boolean;
        private var _limitedLocY:Boolean;
        private var _centeredLocX:Boolean;
        private var _centeredLocY:Boolean;
        private var _screenWd:int;
        private var _screenHt:int;
        private var _scale:int;
        private var _roomWd:int;
        private var _roomHt:int;
        private var _geometryUpdateId:int;
        private var _scaleChanged:Boolean;
        private var _followDuration:int;

        public function RoomCamera();

        public function get location():IVector3d;

        public function get targetId():int;

        public function get targetCategory():int;

        public function get targetObjectLoc():IVector3d;

        public function get limitedLocationX():Boolean;

        public function get limitedLocationY():Boolean;

        public function get centeredLocX():Boolean;

        public function get centeredLocY():Boolean;

        public function get screenWd():int;

        public function get screenHt():int;

        public function get scale():int;

        public function get roomWd():int;

        public function get roomHt():int;

        public function get geometryUpdateId():int;

        public function get isMoving():Boolean;

        public function set targetId(k:int):void;

        public function set targetObjectLoc(k:IVector3d):void;

        public function set targetCategory(k:int):void;

        public function set limitedLocationX(k:Boolean):void;

        public function set limitedLocationY(k:Boolean):void;

        public function set centeredLocX(k:Boolean):void;

        public function set centeredLocY(k:Boolean):void;

        public function set screenWd(k:int):void;

        public function set screenHt(k:int):void;

        public function set scale(k:int):void;

        public function set roomWd(k:int):void;

        public function set roomHt(k:int):void;

        public function set geometryUpdateId(k:int):void;

        public function set target(k:IVector3d):void;

        public function dispose():void;

        public function initializeLocation(k:IVector3d):void;

        public function resetLocation(k:IVector3d):void;

        public function update(k:uint, _arg_2:Number):void;

        public function reset():void;

        public function activateFollowing(k:int):void;


    }
}//package com.sulake.habbo.room.utils

