//com.sulake.room.utils.IRoomGeometry

package com.sulake.room.utils{
    import flash.geom.Point;

    public /*dynamic*/ interface IRoomGeometry {

        function get scale():Number;
        function get directionAxis():IVector3d;
        function get direction():IVector3d;
        function getCoordinatePosition(k:IVector3d):IVector3d;
        function getScreenPoint(k:IVector3d):Point;
        function getScreenPosition(k:IVector3d):IVector3d;
        function getPlanePosition(k:Point, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):Point;
        function setDisplacement(k:IVector3d, _arg_2:IVector3d):void;
        function adjustLocation(k:IVector3d, _arg_2:Number):void;
        function performZoom():void;
        function performZoomOut():void;
        function performZoomIn():void;
        function isZoomedIn():Boolean;
        function get updateId():int;
        function set z_scale(k:Number):void;

    }
}//package com.sulake.room.utils

