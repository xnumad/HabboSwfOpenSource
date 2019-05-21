package com.sulake.room
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;

    public interface IRoomContentLoader 
    {
        function dispose():void;
        function getPlaceHolderType(_arg_1:String):String;
        function getPlaceHolderTypes():Array;
        function getContentType(_arg_1:String):String;
        function hasInternalContent(_arg_1:String):Boolean;
        function loadObjectContent(_arg_1:String, _arg_2:IEventDispatcher):Boolean;
        function insertObjectContent(_arg_1:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean;
        function getVisualizationType(_arg_1:String):String;
        function getLogicType(_arg_1:String):String;
        function hasVisualizationXML(_arg_1:String):Boolean;
        function getVisualizationXML(_arg_1:String):XML;
        function hasAssetXML(_arg_1:String):Boolean;
        function getAssetXML(_arg_1:String):XML;
        function hasLogicXML(_arg_1:String):Boolean;
        function getLogicXML(_arg_1:String):XML;
        function getGraphicAssetCollection(_arg_1:String):IGraphicAssetCollection;
        function roomObjectCreated(_arg_1:IRoomObject, _arg_2:String):void;
    }
}
