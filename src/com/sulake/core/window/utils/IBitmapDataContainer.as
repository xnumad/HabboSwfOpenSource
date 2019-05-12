package com.sulake.core.window.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public interface IBitmapDataContainer 
    {
        function get bitmapData():BitmapData;
        function get pivotPoint():uint;
        function set pivotPoint(_arg_1:uint):void;
        function get stretchedX():Boolean;
        function set stretchedX(_arg_1:Boolean):void;
        function get stretchedY():Boolean;
        function set stretchedY(_arg_1:Boolean):void;
        function get zoomX():Number;
        function set zoomX(_arg_1:Number):void;
        function get zoomY():Number;
        function set zoomY(_arg_1:Number):void;
        function get greyscale():Boolean;
        function set greyscale(_arg_1:Boolean):void;
        function get etchingColor():uint;
        function set etchingColor(_arg_1:uint):void;
        function get etchingPoint():Point;
        function get fitSizeToContents():Boolean;
        function set fitSizeToContents(_arg_1:Boolean):void;
        function get wrapX():Boolean;
        function set wrapX(_arg_1:Boolean):void;
        function get wrapY():Boolean;
        function set wrapY(_arg_1:Boolean):void;
    }
}
