package com.sulake.room.object.visualization.utils
{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;

    public interface IGraphicAssetCollection 
    {
        function dispose():void;
        function set assetLibrary(_arg_1:IAssetLibrary):void;
        function _Str_9215():void;
        function _Str_19942():void;
        function _Str_20679():int;
        function _Str_21431():int;
        function _Str_13182(_arg_1:XML):Boolean;
        function getAsset(_arg_1:String):IGraphicAsset;
        function getAssetWithPalette(_arg_1:String, _arg_2:String):IGraphicAsset;
        function _Str_21825():Array;
        function _Str_20963(_arg_1:String):Array;
        function _Str_17888(_arg_1:String):XML;
        function addAsset(_arg_1:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean;
        function disposeAsset(_arg_1:String):void;
    }
}
