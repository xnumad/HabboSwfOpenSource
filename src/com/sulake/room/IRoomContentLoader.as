package com.sulake.room
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;

    public interface IRoomContentLoader 
    {
        function dispose():void;
        function _Str_20150(_arg_1:String):String;
        function _Str_14258():Array;
        function _Str_5136(_arg_1:String):String;
        function _Str_22212(_arg_1:String):Boolean;
        function _Str_16108(_arg_1:String, _arg_2:IEventDispatcher):Boolean;
        function _Str_21307(_arg_1:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean;
        function _Str_10580(_arg_1:String):String;
        function _Str_17270(_arg_1:String):String;
        function _Str_21673(_arg_1:String):Boolean;
        function _Str_14929(_arg_1:String):XML;
        function _Str_22742(_arg_1:String):Boolean;
        function _Str_6090(_arg_1:String):XML;
        function _Str_24009(_arg_1:String):Boolean;
        function _Str_16500(_arg_1:String):XML;
        function _Str_5052(_arg_1:String):IGraphicAssetCollection;
        function _Str_19903(_arg_1:IRoomObject, _arg_2:String):void;
    }
}
