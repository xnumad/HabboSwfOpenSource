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
        function get maskAssetNames():Array;
        function get maskAssetLocations():Array;
        function get maskAssetFlipHs():Array;
        function get maskAssetFlipVs():Array;
        function isBottomAligned():Boolean;
        function get assetNameColumns():Array;
    }
}
