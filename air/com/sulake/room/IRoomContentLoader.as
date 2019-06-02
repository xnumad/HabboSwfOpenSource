//com.sulake.room.IRoomContentLoader

package com.sulake.room{
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomContentLoader {

        function dispose():void;
        function getPlaceHolderType(k:String):String;
        function getPlaceHolderTypes():Array;
        function getContentType(k:String):String;
        function hasInternalContent(k:String):Boolean;
        function loadObjectContent(k:String, _arg_2:IEventDispatcher):Boolean;
        function insertObjectContent(k:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean;
        function getVisualizationType(k:String):String;
        function getLogicType(k:String):String;
        function hasVisualizationXML(k:String):Boolean;
        function getVisualizationXML(k:String):XML;
        function hasAssetXML(k:String):Boolean;
        function getAssetXML(k:String):XML;
        function hasLogicXML(k:String):Boolean;
        function getLogicXML(k:String):XML;
        function getGraphicAssetCollection(k:String):IGraphicAssetCollection;
        function roomObjectCreated(k:IRoomObject, _arg_2:String):void;

    }
}//package com.sulake.room

