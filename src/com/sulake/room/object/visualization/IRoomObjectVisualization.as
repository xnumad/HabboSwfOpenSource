package com.sulake.room.object.visualization
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public interface IRoomObjectVisualization 
    {
        function set object(_arg_1:IRoomObject):void;
        function get object():IRoomObject;
        function dispose():void;
        function initialize(_arg_1:IRoomObjectVisualizationData):Boolean;
        function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void;
        function get image():BitmapData;
        function getImage(_arg_1:int, _arg_2:int):BitmapData;
        function get boundingRectangle():Rectangle;
        function getInstanceId():int;
        function getUpdateID():int;
    }
}
