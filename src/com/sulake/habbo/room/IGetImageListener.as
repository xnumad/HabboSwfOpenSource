package com.sulake.habbo.room
{
    import flash.display.BitmapData;

    public interface IGetImageListener 
    {
        function imageReady(_arg_1:int, _arg_2:BitmapData):void;
        function imageFailed(_arg_1:int):void;
    }
}
