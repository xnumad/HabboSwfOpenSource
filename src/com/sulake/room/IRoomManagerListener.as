package com.sulake.room
{
    public interface IRoomManagerListener 
    {
        function roomManagerInitialized(_arg_1:Boolean):void;
        function contentLoaded(_arg_1:String, _arg_2:Boolean):void;
        function objectInitialized(_arg_1:String, _arg_2:int, _arg_3:int):void;
        function objectsInitialized(_arg_1:String):void;
    }
}
