//com.sulake.room.object.visualization.utils.IGraphicAssetCollection

package com.sulake.room.object.visualization.utils{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IGraphicAssetCollection {

        function dispose():void;
        function set assetLibrary(k:IAssetLibrary):void;
        function addReference():void;
        function removeReference():void;
        function getReferenceCount():int;
        function getLastReferenceTimeStamp():int;
        function define(k:XML):Boolean;
        function getAsset(k:String):IGraphicAsset;
        function getAssetWithPalette(k:String, _arg_2:String):IGraphicAsset;
        function getPaletteNames():Array;
        function getPaletteColors(k:String):Array;
        function getPaletteXML(k:String):XML;
        function addAsset(k:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=true):Boolean;
        function disposeAsset(k:String):void;

    }
}//package com.sulake.room.object.visualization.utils

