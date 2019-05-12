package com.sulake.room.utils
{
    import flash.geom.Point;

    public interface IRoomGeometry 
    {
        function get scale():Number;
        function get _Str_14167():IVector3D;
        function get direction():IVector3D;
        function _Str_8614(_arg_1:IVector3D):IVector3D;
        function _Str_3045(_arg_1:IVector3D):Point;
        function _Str_4202(_arg_1:IVector3D):IVector3D;
        function _Str_21466(_arg_1:Point, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:IVector3D):Point;
        function _Str_19274(_arg_1:IVector3D, _arg_2:IVector3D):void;
        function _Str_9651(_arg_1:IVector3D, _arg_2:Number):void;
        function _Str_19206():void;
        function _Str_18667():void;
        function _Str_17302():void;
        function _Str_8719():Boolean;
        function get _Str_3795():int;
        function set _Str_17100(_arg_1:Number):void;
    }
}
