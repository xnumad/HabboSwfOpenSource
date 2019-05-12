package com.sulake.room.object.visualization
{
    import __AS3__.vec.Vector;
    import flash.geom.Point;

    public interface IPlaneDrawingData 
    {
        function set z(_arg_1:Number):void;
        function get z():Number;
        function set cornerPoints(_arg_1:Vector.<Point>):void;
        function get cornerPoints():Vector.<Point>;
        function get color():uint;
        function get _Str_21807():Array;
        function get _Str_20731():Array;
        function get _Str_21810():Array;
        function get _Str_19044():Array;
        function _Str_14945():Boolean;
        function get _Str_17636():Array;
    }
}
