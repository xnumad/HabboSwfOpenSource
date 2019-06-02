//com.sulake.habbo.room.RoomEngine

package com.sulake.habbo.room{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.IRoomManagerListener;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.room.renderer.IRoomRendererFactory;
    import com.sulake.room.IRoomManager;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.habbo.advertisement.IAdManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.room.utils.NumberBank;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.ICoreConfiguration;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.habbo.room.utils.RoomInstanceData;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.room.utils.RoomCamera;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObjectController;
    import flash.display.DisplayObject;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import flash.geom.Rectangle;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.utils.FurnitureData;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.window.IHabboWindowManager;

    public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver, IRoomContentListener {

        public static const SETUP_WITHOUT_TOOLBAR:uint;
        public static const SETUP_WITHOUT_CATALOG:uint;
        public static const SETUP_WITHOUT_GAME_MANAGER:uint;
        public static const SETUP_WITHOUT_COMMUNICATION:uint;
        private static const ROOM_TEMP_ID:String;
        protected static const OBJECT_ID_ROOM:int;
        private static const OBJECT_TYPE_ROOM:String;
        private static const OBJECT_ID_ROOM_HIGHLIGHTER:int;
        private static const OBJECT_TYPE_ROOM_HIGHLIGHTER:String;
        private static const OBJECT_ID_SELECTION_ARROW:int;
        private static const OBJECT_TYPE_SELECTION_ARROW:String;
        private static const OVERLAY_SPRITE:String;
        private static const OBJECT_ICON_SPRITE:String;
        private static const ROOM_DRAG_THRESHOLD:int;
        private static const FURNITURE_CREATION_TIME_LIMIT_MILLISECONDS:int;
        private static const MAX_UPDATE_INTERVAL:int;

        private var _communication:IHabboCommunicationManager;
        private var _roomRendererFactory:IRoomRendererFactory;
        private var _roomManager:IRoomManager;
        private var _roomObjectFactory:IRoomObjectFactory;
        private var _visualizationFactory:IRoomObjectVisualizationFactory;
        private var _adManager:IAdManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _toolbar:IHabboToolbar;
        private var _catalog:IHabboCatalog;
        private var _roomObjectEventHandler:RoomObjectEventHandler;
        private var _roomMessageHandler:RoomMessageHandler;
        private var _roomContentLoader:RoomContentLoader;
        private var _contentLoaderReady:Boolean;
        private var _imageObjectIdBank:NumberBank;
        private var _imageCallbacks:Map;
        private var _thumbnailCallbacks:Map;
        private var _roomManagerInitialized:Boolean;
        protected var _activeRoomId:int;
        private var _activeRoomActiveCanvas:int;
        private var _activeRoomActiveCanvasMouseX:int;
        private var _activeRoomActiveCanvasMouseY:int;
        private var _activeRoomIsDragged:Boolean;
        private var _activeRoomWasDragged:Boolean;
        private var _activeRoomDragStartX:int;
        private var _activeRoomDragStartY:int;
        private var _activeRoomDragX:int;
        private var _activeRoomDragY:int;
        private var _roomDraggingAlwaysCenters:Boolean;
        private var _roomDatas:Map;
        private var _roomInstanceDatas:Map;
        private var _skipFurnitureCreationForNextFrame:Boolean;
        private var _mouseCursorUpdate:Boolean;
        private var _isSelectedObjectInValidPosition:Boolean;
        private var _badgeListenerObjects:Map;
        private var _gameManager:IHabboGameManager;
        private var _isGameMode:Boolean;
        private var _playerUnderCursor:int;
        private var _mouseEventsDisabledAboveY:int;
        private var _mouseEventsDisabledLeftToX:int;
        private var _lastUpdateTime:uint;
        private var _mouseEventsDisabledAboveYWas:int;
        private var _mouseEventsDisabledLeftToXWas:int;

        public function RoomEngine(k:IContext, _arg_2:uint=0);

        public function get mouseEventsDisabledAboveY():int;

        public function set mouseEventsDisabledAboveY(k:int):void;

        public function get mouseEventsDisabledLeftToX():int;

        public function set mouseEventsDisabledLeftToX(k:int):void;

        public function get isInitialized():Boolean;

        public function get connection():IConnection;

        public function get activeRoomId():int;

        public function get roomManager():IRoomManager;

        public function get configuration():ICoreConfiguration;

        public function get eventHandler():RoomObjectEventHandler;

        public function get objectMouseClickHandler():IRoomObjectMouseClickHandler;

        private function get useOffsetScrolling():Boolean;

        public function get gameEngine():IHabboGameManager;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        private function onConfigurationComplete(k:Event):void;

        protected function createRoomObjectEventHandlerInstance():RoomObjectEventHandler;

        override public function dispose():void;

        public function set disableUpdate(k:Boolean):void;

        public function runUpdate():void;

        private function getRoomInstanceData(k:int):RoomInstanceData;

        public function setFurniStackingHeightMap(k:int, _arg_2:FurniStackingHeightMap):void;

        public function getFurniStackingHeightMap(k:int):IFurniStackingHeightMap;

        public function setWorldType(k:int, _arg_2:String):void;

        public function getWorldType(k:int):String;

        public function getLegacyGeometry(k:int):LegacyWallGeometry;

        public function getTileObjectMap(k:int):ITileObjectMap;

        private function getActiveRoomCamera():RoomCamera;

        private function getRoomCamera(k:int):RoomCamera;

        public function setSelectedObjectData(k:int, _arg_2:SelectedRoomObjectData):void;

        public function getSelectedObjectData(k:int):ISelectedRoomObjectData;

        public function setPlacedObjectData(k:int, _arg_2:SelectedRoomObjectData):void;

        public function getPlacedObjectData(k:int):ISelectedRoomObjectData;

        public function addObjectUpdateCategory(k:int):void;

        public function removeObjectUpdateCategory(k:int):void;

        public function update(k:uint):void;

        private function updateMouseCursor():void;

        public function requestMouseCursor(k:String, _arg_2:int, _arg_3:String):void;

        private function addButtonMouseCursorOwner(k:int, _arg_2:int, _arg_3:int):void;

        private function removeButtonMouseCursorOwner(k:int, _arg_2:int, _arg_3:int):void;

        public function addFloorHole(k:int, _arg_2:int):void;

        public function removeFloorHole(k:int, _arg_2:int):void;

        private function createRoomFurniture():void;

        private function updateRoomCameras(k:uint):void;

        private function updateRoomCamera(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:uint):void;

        private function onContentLoaderReady(k:Event):void;

        private function onRoomSessionEvent(k:RoomSessionEvent):void;

        private function onToolbarClicked(k:HabboToolbarEvent):void;

        public function roomManagerInitialized(k:Boolean):void;

        public function setActiveRoom(k:int):void;

        public function getRoomIdentifier(k:int):String;

        private function getRoomId(k:String):int;

        public function getRoomNumberValue(k:int, _arg_2:String):Number;

        public function getRoomStringValue(k:int, _arg_2:String):String;

        public function setIsPlayingGame(k:int, _arg_2:Boolean):void;

        public function getIsPlayingGame(k:int):Boolean;

        public function getActiveRoomIsPlayingGame():Boolean;

        public function getRoom(k:int):IRoomInstance;

        public function initializeRoom(k:int, _arg_2:XML):void;

        private function createRoom(k:String, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String):IRoomInstance;

        public function getObjectRoom(k:int):IRoomObjectController;

        public function updateObjectRoom(k:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean;

        public function updateObjectRoomColor(k:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean;

        public function updateObjectRoomBackgroundColor(k:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;

        public function updateObjectRoomVisibilities(k:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean;

        public function updateObjectRoomPlaneThicknesses(k:int, _arg_2:Number, _arg_3:Number):Boolean;

        public function disposeRoom(k:int):void;

        public function setOwnUserId(k:int, _arg_2:int):void;

        public function createRoomCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):DisplayObject;

        public function createRoomCanvas3d(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):IRoomRenderingCanvas;

        private function getRoomCanvas(k:int, _arg_2:int):IRoomRenderingCanvas;

        public function modifyRoomCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean;

        public function setRoomCanvasMask(k:int, _arg_2:int, _arg_3:Boolean):void;

        private function getRoomCanvasRectangle(k:int, _arg_2:int):Rectangle;

        public function getRoomCanvasGeometry(k:int, _arg_2:int=-1):IRoomGeometry;

        public function getRoomCanvasScreenOffset(k:int, _arg_2:int=-1):Point;

        public function setRoomCanvasScreenOffset(k:int, _arg_2:int, _arg_3:Point):Boolean;

        public function getRoomCanvasScale(k:int, _arg_2:int=-1):Number;

        public function getRoomSnapshot(k:int, _arg_2:int):BitmapData;

        private function handleRoomDragging(k:IRoomRenderingCanvas, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean;

        public function handleRoomCanvasMouseEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean):void;

        private function getOverlaySprite(k:IRoomRenderingCanvas):Sprite;

        private function addOverlayIconSprite(k:Sprite, _arg_2:String, _arg_3:BitmapData):Sprite;

        private function removeOverlayIconSprite(k:Sprite, _arg_2:String):Boolean;

        private function getOverlayIconSprite(k:Sprite, _arg_2:String):Sprite;

        public function setObjectMoverIconSprite(k:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void;

        public function setObjectMoverIconSpriteVisible(k:Boolean):void;

        public function setIsSelectedObjectInValidPosition(k:Boolean):void;

        public function getIsSelectedObjectInValidPosition():Boolean;

        public function removeObjectMoverIconSprite():void;

        public function getRoomObjectCount(k:int, _arg_2:int):int;

        public function getRoomObject(k:int, _arg_2:int, _arg_3:int):IRoomObject;

        public function getRoomObjectWithIndex(k:int, _arg_2:int, _arg_3:int):IRoomObject;

        protected function getRoomObjects(k:int, _arg_2:int):Array;

        public function modifyRoomObject(k:int, _arg_2:int, _arg_3:int, _arg_4:String):Boolean;

        public function modifyRoomObjectDataWithMap(k:int, _arg_2:int, _arg_3:String, _arg_4:Map):Boolean;

        public function placeSelectedObject(k:int):void;

        public function modifyRoomObjectData(k:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean;

        public function deleteRoomObject(k:int, _arg_2:int):Boolean;

        public function initializeRoomObjectInsert(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:IStuffData=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:String=null):Boolean;

        public function cancelRoomObjectInsert():void;

        public function isInsertingObject():Boolean;

        public function useRoomObjectInActiveRoom(k:int, _arg_2:int):Boolean;

        private function getRoomObjectAdURL(k:String):String;

        public function setRoomObjectAlias(k:String, _arg_2:String):void;

        public function getRoomObjectCategory(k:String):int;

        public function getFurnitureType(k:int):String;

        public function getFurnitureTypeId(k:String):int;

        public function getWallItemType(k:int, _arg_2:String=null):String;

        public function getWallItemTypeId(k:String):int;

        public function getPetTypeId(k:String):int;

        private function getPetType(k:String):String;

        public function getPetColor(k:int, _arg_2:int):PetColorResult;

        public function getPetColorsByTag(k:int, _arg_2:String):Array;

        public function getPetLayerIdForTag(k:int, _arg_2:String):int;

        public function getPetDefaultPalette(k:int, _arg_2:String):PetColorResult;

        private function getFurnitureColorIndex(k:int):int;

        private function getWallItemColorIndex(k:int):int;

        public function getSelectionArrow(k:int):IRoomObjectController;

        public function getTileCursor(k:int):IRoomObjectController;

        public function setTileCursorState(k:int, _arg_2:int):void;

        public function addObjectFurniture(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, k0:int=0, k1:int=0, k2:String="", k3:Boolean=true, k4:Boolean=true, k5:Number=-1):Boolean;

        public function addObjectFurnitureByName(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN):Boolean;

        private function addObjectFurnitureFromData(k:int, _arg_2:int, _arg_3:FurnitureData):Boolean;

        public function changeObjectState(k:int, _arg_2:int, _arg_3:int):void;

        public function changeObjectModelData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int):Boolean;

        public function updateObjectFurniture(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:IStuffData, _arg_7:Number=NaN):Boolean;

        public function updateObjectFurnitureHeight(k:int, _arg_2:int, _arg_3:Number):Boolean;

        public function updateObjectFurnitureLocation(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d):Boolean;

        public function updateObjectFurnitureExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean;

        private function createObjectFurniture(k:int, _arg_2:int, _arg_3:String):IRoomObjectController;

        private function getObjectFurniture(k:int, _arg_2:int):IRoomObjectController;

        public function disposeObjectFurniture(k:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void;

        public function addObjectWallItem(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, k0:String="", k1:int=-1, k2:Boolean=true):Boolean;

        private function addObjectWallItemFromData(k:int, _arg_2:int, _arg_3:FurnitureData):Boolean;

        public function updateObjectWallItem(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean;

        public function updateObjectRoomWindow(k:int, _arg_2:int, _arg_3:Boolean=true):void;

        public function updateObjectWallItemData(k:int, _arg_2:int, _arg_3:String):Boolean;

        private function createObjectWallItem(k:int, _arg_2:int, _arg_3:String):IRoomObjectController;

        private function getObjectWallItem(k:int, _arg_2:int):IRoomObjectController;

        public function updateObjectWallItemLocation(k:int, _arg_2:int, _arg_3:IVector3d):Boolean;

        public function updateObjectWallItemExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean;

        public function disposeObjectWallItem(k:int, _arg_2:int, _arg_3:int=-1):void;

        public function addObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean;

        public function addObjectSnowWar(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean;

        public function addObjectSnowSplash(k:int, _arg_2:int, _arg_3:IVector3d):Boolean;

        public function updateObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean;

        public function updateObjectSnowWar(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean;

        public function disposeObjectSnowWar(k:int, _arg_2:int, _arg_3:int):void;

        public function updateObjectUserFlatControl(k:int, _arg_2:int, _arg_3:String):Boolean;

        public function updateObjectUserOwnUserAvatar(k:int, _arg_2:int):Boolean;

        public function updateObjectUserFigure(k:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean;

        public function updateObjectUserAction(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean;

        public function updateObjectUserPosture(k:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean;

        public function updateObjectUserGesture(k:int, _arg_2:int, _arg_3:int):Boolean;

        public function updateObjectPetGesture(k:int, _arg_2:int, _arg_3:String):Boolean;

        public function updateObjectUserEffect(k:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean;

        private function createObjectUser(k:int, _arg_2:int, _arg_3:String):IRoomObjectController;

        private function createObjectSnowWar(k:int, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObjectController;

        private function getObjectUser(k:int, _arg_2:int):IRoomObjectController;

        public function disposeObjectUser(k:int, _arg_2:int):void;

        public function getUsersCarryingObjectId(k:int, _arg_2:int):int;

        private function createObject(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObjectController;

        private function getObject(k:String, _arg_2:int, _arg_3:int):IRoomObjectController;

        private function disposeObject(k:int, _arg_2:int, _arg_3:int):void;

        private function roomObjectEventHandler(k:RoomObjectEvent):void;

        private function getRoomObjectRoomIdentifier(k:IRoomObject):String;

        public function getFurnitureIconUrl(k:int):IRoomContentLoaderUrl;

        public function getFurnitureIcon(k:int, _arg_2:IGetImageListener, _arg_3:String=null, _arg_4:IStuffData=null):ImageResult;

        public function getWallItemIconUrl(k:int, _arg_2:String=null):IRoomContentLoaderUrl;

        public function getWallItemIcon(k:int, _arg_2:IGetImageListener, _arg_3:String=null):ImageResult;

        public function getFurnitureImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:IStuffData=null):ImageResult;

        public function getPetImage(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:IGetImageListener, _arg_7:Boolean=true, _arg_8:uint=0, _arg_9:Array=null, k0:String=null):ImageResult;

        public function getWallItemImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1):ImageResult;

        public function getRoomImage(k:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:IGetImageListener, _arg_6:String=null):ImageResult;

        public function getRoomObjectImage(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:IGetImageListener, _arg_7:uint=0):ImageResult;

        private function initializeRoomForGettingImage(k:IRoomObjectController, _arg_2:String):void;

        public function getGenericRoomObjectThumbnail(k:String, _arg_2:String, _arg_3:IGetImageListener, _arg_4:String=null, _arg_5:IStuffData=null):ImageResult;

        public function getGenericRoomObjectImage(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, k0:int=-1, k1:String=null, k2:int=-1):ImageResult;

        public function getRoomObjectBoundingRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Rectangle;

        public function getRoomObjectScreenLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):Point;

        public function getActiveRoomBoundingRectangle(k:int):Rectangle;

        public function getActiveRoomActiveCanvas():IRoomRenderingCanvas;

        public function isRoomObjectContentAvailable(k:String):Boolean;

        public function iconLoaded(k:int, _arg_2:String, _arg_3:Boolean):void;

        public function contentLoaded(k:String, _arg_2:Boolean):void;

        public function objectInitialized(k:String, _arg_2:int, _arg_3:int):void;

        public function objectsInitialized(k:String):void;

        public function selectAvatar(k:int, _arg_2:int):void;

        public function getSelectedAvatarId():int;

        public function selectRoomObject(k:int, _arg_2:int, _arg_3:int):void;

        protected function addObjectToTileMap(k:int, _arg_2:IRoomObject):void;

        public function refreshTileObjectMap(k:int, _arg_2:String):void;

        private function showRoomAd(k:AdEvent):void;

        public function requestRoomAdImage(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int):void;

        private function onRoomAdImageLoaded(k:AdEvent):void;

        public function insertContentLibrary(k:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean;

        public function setActiveObjectType(k:int, _arg_2:String):void;

        override public function purge():void;

        public function requestBadgeImageAsset(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void;

        private function addBadgeGraphicAssets(k:IRoomObjectController, _arg_2:String, _arg_3:Boolean=false):void;

        private function onBadgeLoaded(k:BadgeImageReadyEvent):void;

        public function get isDecorateMode():Boolean;

        public function get isGameMode():Boolean;

        public function set isGameMode(k:Boolean):void;

        public function showUseProductSelection(k:int, _arg_2:int, _arg_3:int=-1):void;

        public function setAvatarEffect(k:int):void;

        public function get playerUnderCursor():int;

        public function get roomSessionManager():IRoomSessionManager;

        public function get sessionDataManager():ISessionDataManager;

        public function get toolbar():IHabboToolbar;

        public function get catalog():IHabboCatalog;

        private function fixedUserLocation(k:int, _arg_2:IVector3d):IVector3d;

        private function get cameraFollowDuration():int;

        public function purgeRoomContent():void;

        public function get windowManager():IHabboWindowManager;

        private function getOwnUser():IRoomObject;


    }
}//package com.sulake.habbo.room

