package com.sulake.room.utils
{
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public interface IRoomGeometry 
    {
        function get scale():Number;
        function get directionAxis():IVector3d;
        function get direction():IVector3d;
        function getCoordinatePosition(_arg_1:IVector3d):IVector3d;
        function getScreenPoint(_arg_1:IVector3d):Point;
        function getScreenPosition(_arg_1:IVector3d):IVector3d;
        function getPlanePosition(_arg_1:Point, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):Point;
        function setDisplacement(_arg_1:IVector3d, _arg_2:IVector3d):void;
        function adjustLocation(_arg_1:IVector3d, _arg_2:Number):void;
        function performZoom():void;
        function performZoomOut():void;
        function performZoomIn():void;
        function isZoomedIn():Boolean;
        function get updateId():int;
        function set z_scale(_arg_1:Number):void;
    }
}
