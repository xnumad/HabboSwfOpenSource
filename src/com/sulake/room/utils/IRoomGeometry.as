package com.sulake.room.utils
{
    import flash.geom.Point;

    public interface IRoomGeometry 
    {
        function get scale():Number;
        function get directionAxis():IVector3D;
        function get direction():IVector3D;
        function getCoordinatePosition(_arg_1:IVector3D):IVector3D;
        function getScreenPoint(_arg_1:IVector3D):Point;
        function getScreenPosition(_arg_1:IVector3D):IVector3D;
        function getPlanePosition(_arg_1:Point, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:IVector3D):Point;
        function setDisplacement(_arg_1:IVector3D, _arg_2:IVector3D):void;
        function adjustLocation(_arg_1:IVector3D, _arg_2:Number):void;
        function performZoom():void;
        function performZoomOut():void;
        function performZoomIn():void;
        function isZoomedIn():Boolean;
        function get updateId():int;
        function set z_scale(_arg_1:Number):void;
    }
}
