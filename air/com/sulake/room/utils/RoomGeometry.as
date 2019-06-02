//com.sulake.room.utils.RoomGeometry

package com.sulake.room.utils{
    import com.sulake.core.utils.Map;
    import flash.geom.Point;

    public class RoomGeometry implements IRoomGeometry {

        public static const SCALE_ZOOMED_IN:Number;
        public static const SCALE_ZOOMED_OUT:Number;

        private var _updateId:int;
        private var _x:Vector3d;
        private var _y:Vector3d;
        private var _z:Vector3d;
        private var _directionAxis:Vector3d;
        private var _location:Vector3d;
        private var _direction:Vector3d;
        private var _depth:Vector3d;
        private var _scale:Number;
        private var _scaleSqrt:Number;
        private var _x_scale:Number;
        private var _y_scale:Number;
        private var _z_scale:Number;
        private var _x_scale_internal:Number;
        private var _y_scale_internal:Number;
        private var _z_scale_internal:Number;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _clipNear:Number;
        private var _clipFar:Number;
        private var _displacements:Map;

        public function RoomGeometry(k:Number, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d=null);

        public static function getIntersectionVector(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):IVector3d;


        public function get updateId():int;

        public function get scale():Number;

        public function get directionAxis():IVector3d;

        public function get location():IVector3d;

        public function get direction():IVector3d;

        public function set x_scale(k:Number):void;

        public function set y_scale(k:Number):void;

        public function set z_scale(k:Number):void;

        public function set scale(k:Number):void;

        public function set location(k:IVector3d):void;

        public function set direction(k:IVector3d):void;

        public function dispose():void;

        public function setDisplacement(k:IVector3d, _arg_2:IVector3d):void;

        private function getDisplacement(k:IVector3d):IVector3d;

        private function createDisplacementKey(k:IVector3d):int;

        public function setDepthVector(k:IVector3d):void;

        public function adjustLocation(k:IVector3d, _arg_2:Number):void;

        public function getCoordinatePosition(k:IVector3d):IVector3d;

        public function getScreenPosition(k:IVector3d):IVector3d;

        public function getScreenPoint(k:IVector3d):Point;

        public function getPlanePosition(k:Point, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):Point;

        public function performZoom():void;

        public function isZoomedIn():Boolean;

        public function performZoomOut():void;

        public function performZoomIn():void;


    }
}//package com.sulake.room.utils

