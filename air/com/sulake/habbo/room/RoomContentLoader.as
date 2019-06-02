//com.sulake.habbo.room.RoomContentLoader

package com.sulake.habbo.room{
    import com.sulake.room.IRoomContentLoader;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ICoreConfiguration;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import flash.events.Event;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;

    public class RoomContentLoader implements IRoomContentLoader, IFurniDataListener, IDisposable {

        public static const CONTENT_LOADER_READY:String;
        private static const ASSET_LIBRARY_NAME_PREFIX:String;
        private static const STATE_CREATED:int;
        private static const STATE_INITIALIZING:int;
        private static const STATE_READY:int;
        private static const PLACE_HOLDER_FURNITURE:String;
        private static const PLACE_HOLDER_WALL_ITEM:String;
        private static const PLACE_HOLDER_PET:String;
        private static const PLACE_HOLDER_DEFAULT:String;
        private static const ROOM_CONTENT:String;
        private static const TILE_CURSOR:String;
        private static const SELECTION_ARROW:String;
        private static const PLACE_HOLDER_TYPES:Array;
        private static const PLACE_HOLDER_TYPES_GPU:Array;
        private static const CONTENT_DROP_DELAY:int;
        private static const COMPRESSION_INTERVAL:int;

        private var _baseUrl:String;
        private var _libraries:Map;
        private var _events:Map;
        private var _additionalObjectTypeLibraries:Map;
        private var _assetCollections:Map;
        private var _visualizationFactory:IRoomObjectVisualizationFactory;
        private var _state:int;
        private var _stateEvents:IEventDispatcher;
        private var _isDisposed:Boolean;
        private var _dataInitialized:Boolean;
        private var _activeObjectTypes:Map;
        private var _activeObjects:Dictionary;
        private var _activeObjectTypeIds:Map;
        private var _wallItemTypes:Map;
        private var _wallItems:Dictionary;
        private var _wallItemTypeIds:Map;
        private var _petTypes:Map;
        private var _pets:Dictionary;
        private var _petColors:Map;
        private var _petLayers:Map;
        private var _furniRevisions:Map;
        private var _objectAliases:Map;
        private var _objectOriginalNames:Map;
        private var _objectTypeAdURLs:Map;
        private var _furniLoadUrlBase:String;
        private var _furniLoadNameTemplate:String;
        private var _iconLoadNameTemplate:String;
        private var _assetUrlBase:String;
        private var _petLoadNameTemplate:String;
        private var _waitingForSessionDataManager:Boolean;
        private var _lastAssetCompressionTime:uint;
        private var _sessionDataManager:ISessionDataManager;
        private var _iconAssets:IAssetLibrary;
        private var _iconListener:IRoomContentListener;

        public function RoomContentLoader(k:String);

        public function set sessionDataManager(k:ISessionDataManager):void;

        public function get disposed():Boolean;

        public function set visualizationFactory(k:IRoomObjectVisualizationFactory):void;

        public function initialize(k:IEventDispatcher, _arg_2:ICoreConfiguration):void;

        private function initPetData():void;

        private function initFurnitureData():void;

        public function dispose():void;

        private function populateFurniData(k:Vector.<IFurnitureData>):void;

        private function continueInitilization():void;

        public function setRoomObjectAlias(k:String, _arg_2:String):void;

        private function getRoomObjectAlias(k:String):String;

        private function getRoomObjectOriginalName(k:String):String;

        public function getObjectCategory(k:String):int;

        public function getPlaceHolderType(k:String):String;

        public function getPlaceHolderTypes():Array;

        public function getActiveObjectType(k:int):String;

        public function getActiveObjectTypeId(k:String):int;

        public function getWallItemType(k:int, _arg_2:String=null):String;

        public function getWallItemTypeId(k:String):int;

        public function getPetType(k:int):String;

        public function getPetTypeId(k:String):int;

        public function getPetColor(k:int, _arg_2:int):PetColorResult;

        public function getPetColorsByTag(k:int, _arg_2:String):Array;

        public function getPetLayerIdForTag(k:int, _arg_2:String, _arg_3:int=64):int;

        public function getPetDefaultPalette(k:int, _arg_2:String):PetColorResult;

        public function getActiveObjectColorIndex(k:int):int;

        public function getWallItemColorIndex(k:int):int;

        public function getRoomObjectAdURL(k:String):String;

        private function getObjectType(k:String):String;

        private function getObjectColorIndex(k:String):int;

        public function getContentType(k:String):String;

        public function hasInternalContent(k:String):Boolean;

        private function getObjectRevision(k:String):int;

        private function getObjectContentURLs(k:String, _arg_2:String=null, _arg_3:Boolean=false):Array;

        private function objectHasColors(k:String):Boolean;

        public function insertObjectContent(k:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean;

        public function getObjectUrl(k:String, _arg_2:String):IRoomContentLoaderUrl;

        public function loadThumbnailContent(k:int, _arg_2:String, _arg_3:String, _arg_4:IEventDispatcher):Boolean;

        public function loadObjectContent(k:String, _arg_2:IEventDispatcher):Boolean;

        private function onContentLoadError(k:Event):void;

        private function onContentLoaded(k:Event):void;

        private function processLoadedLibrary(k:IAssetLibrary):void;

        private function extractPetDataFromLoadedContent(k:String):void;

        private function initializeGraphicAssetCollection(k:String, _arg_2:IAssetLibrary):Boolean;

        public function extractObjectContent(k:String, _arg_2:String):Boolean;

        private function getAssetLibraryName(k:String):String;

        private function getAssetLibrary(k:String):IAssetLibrary;

        private function addAssetLibraryCollection(k:String, _arg_2:IEventDispatcher):IAssetLibrary;

        private function getAssetLibraryEventDispatcher(k:String, _arg_2:Boolean=false):IEventDispatcher;

        private function getIconAssetType(k:AssetLoaderStruct):String;

        private function getAssetLibraryType(k:IAssetLibrary):String;

        public function getVisualizationType(k:String):String;

        public function getLogicType(k:String):String;

        public function hasVisualizationXML(k:String):Boolean;

        public function getVisualizationXML(k:String):XML;

        public function hasAssetXML(k:String):Boolean;

        public function getAssetXML(k:String):XML;

        public function hasLogicXML(k:String):Boolean;

        public function getLogicXML(k:String):XML;

        private function getXML(k:String, _arg_2:String):XML;

        private function hasXML(k:String, _arg_2:String):Boolean;

        public function addGraphicAsset(k:String, _arg_2:String, _arg_3:BitmapData, _arg_4:Boolean):Boolean;

        private function createGraphicAssetCollection(k:String, _arg_2:IAssetLibrary):IGraphicAssetCollection;

        public function getGraphicAssetCollection(k:String):IGraphicAssetCollection;

        public function roomObjectCreated(k:IRoomObject, _arg_2:String):void;

        private function disposeGraphicAssetCollection(k:String):Boolean;

        public function furniDataReady():void;

        public function setActiveObjectType(k:int, _arg_2:String):void;

        private function onLowMemoryWarning(k:Event):void;

        public function compressAssets():void;

        public function purge():void;

        public function getCachePath(k:String):String;

        public function set iconAssets(k:IAssetLibrary):void;

        public function set iconListener(k:IRoomContentListener):void;


    }
}//package com.sulake.habbo.room

