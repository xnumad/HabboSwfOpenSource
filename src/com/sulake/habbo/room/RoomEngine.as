package com.sulake.habbo.room
{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.IRoomManagerListener;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.room.renderer.IRoomRendererFactory;
    import com.sulake.room.IRoomManager;
    import com.sulake.room.IRoomObjectFactory;
	import com.sulake.habbo.room.object.RoomObjectLogicEnum;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.habbo.advertisement.IAdManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.room.utils.NumberBank;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDRoomObjectFactory;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import com.sulake.iid.IIDRoomManager;
    import com.sulake.iid.IIDRoomRendererFactory;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObjectContainer;
    import flash.display.LoaderInfo;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.utils.RoomInstanceData;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.room.utils.TileObjectMap;
    import com.sulake.habbo.room.utils.RoomCamera;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.utils.FurnitureData;
    import com.sulake.room.RoomInstance;
    import flash.utils.getTimer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import flash.geom.Rectangle;
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.utils.IVector3d;
    import flash.events.Event;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.room.utils.RoomData;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
    import com.sulake.habbo.room.events.RoomBackgroundColorEvent;
    import com.sulake.habbo.room.events.RoomObjectHSLColorEnabledEvent;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage;
    import flash.display.Sprite;
    import com.sulake.room.renderer.IRoomRenderer;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.events.MouseEvent;
    import com.sulake.habbo.room.events.RoomEngineDragWidgetMouseEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import flash.display.Bitmap;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage;
    import com.sulake.habbo.room.object.data.StuffDataFactory;
    import com.sulake.habbo.room.messages.RoomObjectModelDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.utils._Str_6093;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
    import com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarOwnMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGuideStatusUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
    import flash.utils.ByteArray;
    import flash.net.FileReference;
    import com.sulake.core.utils.PlayerVersionCheck;
    import com.sulake.habbo.utils.images.PNGEncoder;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.room.utils.RoomObjectBadgeImageAssetListener;
    import com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.room.utils.SpriteDataCollector;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomThumbnailMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomMessageComposer;
    import com.sulake.core.communication.messages.IMessageComposer;
    import __AS3__.vec.*;
    import com.sulake.iid.*;
    import com.sulake.room.object.*;

    public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver, IRoomContentListener 
    {
        public static const _lastUpdateTime:uint = 1;
        public static const SETUP_WITHOUT_TOOLBAR:uint = 2;
        public static const SETUP_WITHOUT_CATALOG:uint = 4;
        public static const SETUP_WITHOUT_COMMUNICATION:uint = 5;
        private static const TEMPORARY_ROOM:String = "temporary_room";
        public static const OBJECT_ID_ROOM:int = -1;
        private static const ROOM:String = "room";
        private static const OBJECT_ID_ROOM_HIGHLIGHTER:int = -2;
        private static const TILE_CURSOR:String = "tile_cursor";
        private static const OBJECT_ID_SELECTION_ARROW:int = -3;
        private static const SELECTION_ARROW:String = "selection_arrow";
        private static const OVERLAY:String = "overlay";
        private static const OBJECT_ICON_SPRITE:String = "object_icon_sprite";
        private static const ROOM_DRAG_THRESHOLD:int = 15;
        private static const FURNITURE_CREATION_TIME_LIMIT_MILLISECONDS:int = 40;

        private var _communicationManager:IHabboCommunicationManager = null;
        private var _roomRendererFactory:IRoomRendererFactory = null;
        private var _roomManager:IRoomManager = null;
        private var _roomObjectFactory:IRoomObjectFactory = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _adManager:IAdManager = null;
        private var _sessionDataManager:ISessionDataManager = null;
        private var _roomSessionManager:IRoomSessionManager = null;
        private var _toolbar:IHabboToolbar = null;
        private var _catalog:IHabboCatalog = null;
        private var _windowManager:IHabboWindowManager;
        private var _roomObjectEventHandler:RoomObjectEventHandler = null;
        private var _roomMessageHandler:RoomMessageHandler = null;
        private var _roomContentLoader:RoomContentLoader = null;
        private var _contentLoaderReady:Boolean = false;
        private var _imageObjectIdBank:NumberBank;
        private var _imageCallbacks:Map;
        private var _Str_7020:NumberBank;
        private var _thumbnailCallbacks:Map;
        private var _roomManagerInitialized:Boolean = false;
        protected var _activeRoomId:int = 0;
        private var _activeRoomActiveCanvas:int = -1;
        private var _activeRoomActiveCanvasMouseX:int = 0;
        private var _activeRoomActiveCanvasMouseY:int = 0;
        private var _activeRoomIsDragged:Boolean = false;
        private var _activeRoomWasDragged:Boolean = false;
        private var _activeRoomDragStartX:int = 0;
        private var _activeRoomDragStartY:int = 0;
        private var _activeRoomDragX:int = 0;
        private var _activeRoomDragY:int = 0;
        private var _cameraCentered:Boolean = false;
        private var _roomDatas:Map = null;
        private var _roomInstanceDatas:Map = null;
        private var _skipFurnitureCreationForNextFrame:Boolean = false;
        private var _mouseCursorUpdate:Boolean;
        private var _badgeListenerObjects:Map = null;
        private var _gameManager:IHabboGameManager;
        private var _isSelectedObjectInValidPosition:Boolean;
        private var _playerUnderCursor:int = -1;
        private var _mouseEventsDisabledAboveY:int = 0;
        private var _mouseEventsDisabledLeftToX:int = 0;
        private var _mouseEventsDisabledAboveYWas:int = 0;
        private var _mouseEventsDisabledLeftToXWas:int = 0;

        public function RoomEngine(k:IContext, _arg_2:uint=0)
        {
            super(k, _arg_2);
        }

        public function get mouseEventsDisabledAboveY():int
        {
            return this._mouseEventsDisabledAboveY;
        }

        public function set mouseEventsDisabledAboveY(k:int):void
        {
            this._mouseEventsDisabledAboveY = k;
        }

        public function get mouseEventsDisabledLeftToX():int
        {
            return this._mouseEventsDisabledLeftToX;
        }

        public function set mouseEventsDisabledLeftToX(k:int):void
        {
            this._mouseEventsDisabledLeftToX = k;
        }

        public function get isInitialized():Boolean
        {
            return this._roomManagerInitialized;
        }

        public function get connection():IConnection
        {
            return this._communicationManager.connection;
        }

        public function get activeRoomId():int
        {
            return this._activeRoomId;
        }

        public function get roomManager():IRoomManager
        {
            return this._roomManager;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this;
        }

        protected function get eventHandler():RoomObjectEventHandler
        {
            return this._roomObjectEventHandler;
        }

        private function get useOffsetScrolling():Boolean
        {
            return true;
        }

        public function get gameEngine():IHabboGameManager
        {
            return this._gameManager;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(), function (k:IRoomObjectFactory):void
            {
                _roomObjectFactory = k;
            }), new ComponentDependency(new IIDRoomObjectVisualizationFactory(), function (k:IRoomObjectVisualizationFactory):void
            {
                _visualizationFactory = k;
            }), new ComponentDependency(new IIDRoomManager(), function (k:IRoomManager):void
            {
                _roomManager = k;
            }), new ComponentDependency(new IIDRoomRendererFactory(), function (k:IRoomRendererFactory):void
            {
                _roomRendererFactory = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, ((flags & SETUP_WITHOUT_COMMUNICATION) == 0)), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDHabboAdManager(), function (k:IAdManager):void
            {
                _adManager = k;
            }, false, [{
                "type":AdEvent.ROOM_AD_SHOW,
                "callback":this.showRoomAd
            }, {
                "type":AdEvent.ROOM_AD_IMAGE_LOADED,
                "callback":this.onRoomAdImageLoaded
            }, {
                "type":AdEvent.ROOM_AD_IMAGE_LOADING_FAILED,
                "callback":this.onRoomAdImageLoaded
            }]), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false, [{
                "type":RoomSessionEvent.STARTED,
                "callback":this.onRoomSessionEvent
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this.onRoomSessionEvent
            }]), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }, false, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this.onToolbarClicked
            }]), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, false), new ComponentDependency(new IIDHabboGameManager(), function (k:IHabboGameManager):void
            {
                _gameManager = k;
            }, ((flags & SETUP_WITHOUT_CATALOG) == 0)), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._roomInstanceDatas = new Map();
            this._imageObjectIdBank = new NumberBank(1000);
            this._Str_7020 = new NumberBank(1000);
            this._imageCallbacks = new Map();
            this._thumbnailCallbacks = new Map();
            this._roomDatas = new Map();
            this._roomObjectEventHandler = this.createRoomObjectEventHandlerInstance();
            this._roomMessageHandler = new RoomMessageHandler(this);
            var k:DisplayObjectContainer = context.displayObjectContainer;
            var _local_2:LoaderInfo = k.loaderInfo;
            this._roomContentLoader = new RoomContentLoader(_local_2.loaderURL);
            registerUpdateReceiver(this, 1);
            this._roomObjectFactory.addObjectEventListener(this.roomObjectEventHandler);
            this._roomContentLoader.visualizationFactory = this._visualizationFactory;
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_10);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_20);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_100);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_200);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_0);
            this._roomManager.setContentLoader(this._roomContentLoader);
            if (this._communicationManager)
            {
                this._roomMessageHandler.connection = this._communicationManager.connection;
            }
            this._roomContentLoader.initialize(events, this);
            this._roomContentLoader.iconAssets = assets;
            this._roomContentLoader.iconListener = this;
            this._cameraCentered = getBoolean("room.dragging.always_center");
            this._roomContentLoader.sessionDataManager = this._sessionDataManager;
            events.addEventListener(RoomContentLoader.RCL_LOADER_READY, this.onConfigurationComplete);
        }

        protected function createRoomObjectEventHandlerInstance():RoomObjectEventHandler
        {
            return new RoomObjectEventHandler(this);
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:RoomInstanceData;
            if (disposed)
            {
                return;
            }
            removeUpdateReceiver(this);
            if (this._imageObjectIdBank != null)
            {
                this._imageObjectIdBank.dispose();
                this._imageObjectIdBank = null;
            }
            if (this._Str_7020 != null)
            {
                this._Str_7020.dispose();
                this._Str_7020 = null;
            }
            if (this._imageCallbacks != null)
            {
                this._imageCallbacks.dispose();
            }
            if (this._thumbnailCallbacks != null)
            {
                this._thumbnailCallbacks.dispose();
            }
            if (this._roomObjectEventHandler != null)
            {
                this._roomObjectEventHandler.dispose();
                this._roomObjectEventHandler = null;
            }
            if (this._roomMessageHandler != null)
            {
                this._roomMessageHandler.dispose();
                this._roomMessageHandler = null;
            }
            if (this._roomContentLoader != null)
            {
                this._roomContentLoader.dispose();
                this._roomContentLoader = null;
            }
            if (this._roomDatas != null)
            {
                this._roomDatas.dispose();
                this._roomDatas = null;
            }
            if (this._roomInstanceDatas != null)
            {
                k = 0;
                while (k < this._roomInstanceDatas.length)
                {
                    _local_2 = (this._roomInstanceDatas.getWithIndex(k) as RoomInstanceData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._roomInstanceDatas.dispose();
                this._roomInstanceDatas = null;
            }
            if (this._badgeListenerObjects != null)
            {
                this._badgeListenerObjects.dispose();
                this._badgeListenerObjects = null;
            }
            super.dispose();
        }

        public function set disableUpdate(k:Boolean):void
        {
            if (k)
            {
                removeUpdateReceiver(this);
            }
            else
            {
                removeUpdateReceiver(this);
                registerUpdateReceiver(this, 1);
            }
        }

        public function runUpdate():void
        {
            this.update(1);
        }

        private function getRoomInstanceData(k:int):RoomInstanceData
        {
            var _local_2:String = this.getRoomIdentifier(k);
            var _local_3:RoomInstanceData;
            if (this._roomInstanceDatas != null)
            {
                _local_3 = (this._roomInstanceDatas.getValue(_local_2) as RoomInstanceData);
                if (_local_3 == null)
                {
                    _local_3 = new RoomInstanceData(k);
                    this._roomInstanceDatas.add(_local_2, _local_3);
                }
            }
            return _local_3;
        }

        public function setFurniStackingHeightMap(k:int, _arg_2:FurniStackingHeightMap):void
        {
            var _local_3:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_3 != null)
            {
                _local_3._Str_18267 = _arg_2;
            }
        }

        public function getFurniStackingHeightMap(k:int):FurniStackingHeightMap
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2._Str_18267;
            }
            return null;
        }

        public function setWorldType(k:int, _arg_2:String):void
        {
            var _local_3:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_3 != null)
            {
                _local_3._Str_17166 = _arg_2;
            }
        }

        public function getWorldType(k:int):String
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2._Str_17166;
            }
            return null;
        }

        public function getLegacyGeometry(k:int):LegacyWallGeometry
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2.legacyGeometry;
            }
            return null;
        }

        public function _Str_15934(k:int):TileObjectMap
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2.tileObjectMap;
            }
            return null;
        }

        private function getActiveRoomCamera():RoomCamera
        {
            return this.getRoomCamera(this._activeRoomId);
        }

        private function getRoomCamera(k:int):RoomCamera
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2.roomCamera;
            }
            return null;
        }

        public function setSelectedObjectData(k:int, _arg_2:SelectedRoomObjectData):void
        {
            var _local_3:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_3 != null)
            {
                _local_3._Str_16852 = _arg_2;
                if (_arg_2 != null)
                {
                    _local_3._Str_15689 = null;
                }
            }
        }

        public function getSelectedObjectData(k:int):ISelectedRoomObjectData
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2._Str_16852;
            }
            return null;
        }

        public function setPlacedObjectData(k:int, _arg_2:SelectedRoomObjectData):void
        {
            var _local_3:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_3 != null)
            {
                _local_3._Str_15689 = _arg_2;
            }
        }

        public function getPlacedObjectData(k:int):ISelectedRoomObjectData
        {
            var _local_2:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_2 != null)
            {
                return _local_2._Str_15689;
            }
            return null;
        }

        public function addObjectUpdateCategory(k:int):void
        {
            this._roomManager.addObjectUpdateCategory(k);
        }

        public function removeObjectUpdateCategory(k:int):void
        {
            this._roomManager.removeObjectUpdateCategory(k);
        }

        public function update(k:uint):void
        {
            var _local_2:int;
            var _local_3:IRoomInstance;
            RoomEnterEffect.turnVisualizationOn();
            if (this._roomManager != null)
            {
                this.createRoomFurniture();
                this._roomManager.update(k);
                _local_2 = 0;
                while (_local_2 < this._roomManager.getRoomCount())
                {
                    _local_3 = this._roomManager.getRoomWithIndex(_local_2);
                    if (((!(_local_3 == null)) && (!(_local_3.getRenderer() == null))))
                    {
                        _local_3.getRenderer().update(k);
                    }
                    _local_2++;
                }
                this.updateRoomCameras(k);
                if (this._mouseCursorUpdate)
                {
                    this.updateMouseCursor();
                }
            }
            RoomEnterEffect.turnVisualizationOff();
        }

        private function updateMouseCursor():void
        {
            this._mouseCursorUpdate = false;
            var k:RoomInstanceData = this.getRoomInstanceData(this._activeRoomId);
            if (((k) && (k.hasButtonMouseCursorOwners())))
            {
                Mouse.cursor = MouseCursor.BUTTON;
            }
            else
            {
                Mouse.cursor = MouseCursor.AUTO;
            }
        }

        public function requestMouseCursor(k:String, _arg_2:int, _arg_3:String):void
        {
            var _local_4:int = this.getRoomObjectCategory(_arg_3);
            switch (k)
            {
                case RoomObjectFurnitureActionEvent.MOUSE_BUTTON:
                    if (((this.setIsSelectedObjectInValidPosition) && (_local_4 == RoomObjectCategoryEnum.CONST_100)))
                    {
                        this._playerUnderCursor = _arg_2;
                    }
                    this.addButtonMouseCursorOwner(this._activeRoomId, _local_4, _arg_2);
                    return;
                default:
                    if (((this.setIsSelectedObjectInValidPosition) && (_local_4 == RoomObjectCategoryEnum.CONST_100)))
                    {
                        this._playerUnderCursor = -1;
                    }
                    this.removeButtonMouseCursorOwner(this._activeRoomId, _local_4, _arg_2);
            }
        }

        private function addButtonMouseCursorOwner(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:String;
            var _local_6:RoomInstanceData;
            var _local_4:IRoomSession = this._roomSessionManager.getSession(k);
            if ((((!(_arg_2 == RoomObjectCategoryEnum.CONST_10)) && (!(_arg_2 == RoomObjectCategoryEnum.CONST_20))) || ((!(_local_4 == null)) && (_local_4.roomControllerLevel >= RoomControllerLevel.GUEST))))
            {
                _local_5 = ((_arg_2 + "_") + _arg_3);
                _local_6 = this.getRoomInstanceData(k);
                if (_local_6 != null)
                {
                    if (_local_6.addButtonMouseCursorOwner(_local_5))
                    {
                        this._mouseCursorUpdate = true;
                    }
                }
            }
        }

        private function removeButtonMouseCursorOwner(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:String;
            var _local_4:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_4 != null)
            {
                _local_5 = ((_arg_2 + "_") + _arg_3);
                if (_local_4.removeButtonMouseCursorOwner(_local_5))
                {
                    this._mouseCursorUpdate = true;
                }
            }
        }

        public function addFloorHole(k:int, _arg_2:int):void
        {
            var _local_3:IRoomObjectController;
            var _local_4:IRoomObjectController;
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            if (_arg_2 >= 0)
            {
                _local_3 = this.getObjectRoom(k);
                _local_4 = this.getObjectFurniture(k, _arg_2);
                if (((((!(_local_4 == null)) && (!(_local_4.getModel() == null))) && (!(_local_3 == null))) && (!(_local_3.getEventHandler() == null))))
                {
                    _local_5 = RoomObjectRoomFloorHoleUpdateMessage.RORPFHUM_ADD;
                    _local_6 = _local_4.getLocation().x;
                    _local_7 = _local_4.getLocation().y;
                    _local_8 = _local_4.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
                    _local_9 = _local_4.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
                    _local_3.getEventHandler().processUpdateMessage(new RoomObjectRoomFloorHoleUpdateMessage(_local_5, _arg_2, _local_6, _local_7, _local_8, _local_9));
                }
            }
        }

        public function removeFloorHole(k:int, _arg_2:int):void
        {
            var _local_3:IRoomObjectController;
            var _local_4:String;
            if (_arg_2 >= 0)
            {
                _local_3 = this.getObjectRoom(k);
                if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
                {
                    _local_4 = RoomObjectRoomFloorHoleUpdateMessage.RORPFHUM_REMOVE;
                    _local_3.getEventHandler().processUpdateMessage(new RoomObjectRoomFloorHoleUpdateMessage(_local_4, _arg_2));
                }
            }
        }

        private function createRoomFurniture():void
        {
            var _local_3:int;
            var _local_4:RoomInstanceData;
            var _local_5:int;
            var _local_6:FurnitureData;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:RoomInstance;
            if (this._skipFurnitureCreationForNextFrame)
            {
                this._skipFurnitureCreationForNextFrame = false;
                return;
            }
            var k:int = getTimer();
            var _local_2:int = 5;
            for each (_local_4 in this._roomInstanceDatas)
            {
                _local_5 = 0;
                _local_6 = null;
                _local_7 = false;
                while ((_local_6 = _local_4.getFurnitureData()) != null)
                {
                    _local_7 = this.addObjectFurnitureFromData(_local_4.roomId, _local_6.id, _local_6);
                    if ((++_local_5 % _local_2) == 0)
                    {
                        _local_3 = getTimer();
                        if ((((_local_3 - k) >= FURNITURE_CREATION_TIME_LIMIT_MILLISECONDS) && (!(this._isSelectedObjectInValidPosition))))
                        {
                            this._skipFurnitureCreationForNextFrame = true;
                            break;
                        }
                    }
                }
                while (((!(this._skipFurnitureCreationForNextFrame)) && (!((_local_6 = _local_4.getWallItemData()) == null))))
                {
                    _local_7 = this.addObjectWallItemFromData(_local_4.roomId, _local_6.id, _local_6);
                    if ((++_local_5 % _local_2) == 0)
                    {
                        _local_3 = getTimer();
                        if ((((_local_3 - k) >= FURNITURE_CREATION_TIME_LIMIT_MILLISECONDS) && (!(this._isSelectedObjectInValidPosition))))
                        {
                            this._skipFurnitureCreationForNextFrame = true;
                            break;
                        }
                    }
                }
                if (((_local_7) && (this._isSelectedObjectInValidPosition)))
                {
                    _local_8 = this.getRoomIdentifier(_local_4.roomId);
                    _local_9 = (this._roomManager.getRoom(_local_8) as RoomInstance);
                    if (!_local_9.hasUninitializedObjects())
                    {
                        this.objectsInitialized(_local_8);
                    }
                }
                if (this._skipFurnitureCreationForNextFrame)
                {
                    return;
                }
            }
        }

        private function updateRoomCameras(k:uint):void
        {
            var _local_5:RoomInstanceData;
            var _local_6:RoomCamera;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:IRoomObject;
            var _local_2:int = 1;
            var _local_3:int;
            while (_local_3 < this._roomInstanceDatas.length)
            {
                _local_5 = (this._roomInstanceDatas.getWithIndex(_local_3) as RoomInstanceData);
                _local_6 = null;
                _local_7 = 0;
                if (_local_5 != null)
                {
                    _local_6 = _local_5.roomCamera;
                    _local_7 = _local_5.roomId;
                }
                if (_local_6 != null)
                {
                    _local_8 = _local_6._Str_10760;
                    _local_9 = _local_6._Str_16562;
                    _local_10 = this.getRoomObject(_local_7, _local_8, _local_9);
                    if (_local_10 != null)
                    {
                        if (((!(_local_7 == this._activeRoomId)) || (!(this._activeRoomIsDragged))))
                        {
                            this.updateRoomCamera(_local_7, _local_2, _local_10.getLocation(), k);
                        }
                    }
                }
                _local_3++;
            }
            var _local_4:IRoomRenderingCanvas = this.getRoomCanvas(this._activeRoomId, _local_2);
            if (_local_4 != null)
            {
                if (this._activeRoomIsDragged)
                {
                    _local_4._Str_3629 = (_local_4._Str_3629 + this._activeRoomDragX);
                    _local_4._Str_3768 = (_local_4._Str_3768 + this._activeRoomDragY);
                    this._activeRoomDragX = 0;
                    this._activeRoomDragY = 0;
                }
            }
        }

        private function updateRoomCamera(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:uint):void
        {
            var _local_10:Number;
            var _local_11:Rectangle;
            var _local_12:int;
            var _local_13:int;
            var _local_14:Rectangle;
            var _local_15:Vector3d;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Point;
            var _local_24:Number;
            var _local_25:Number;
            var _local_26:Matrix;
            var _local_27:Number;
            var _local_28:Number;
            var _local_29:Number;
            var _local_30:Number;
            var _local_31:Number;
            var _local_32:Number;
            var _local_33:Point;
            var _local_34:Boolean;
            var _local_35:Boolean;
            var _local_36:Boolean;
            var _local_37:Boolean;
            var _local_38:Number;
            var _local_39:Number;
            var _local_40:Number;
            var _local_41:Number;
            var _local_42:Number;
            var _local_43:int;
            var _local_44:int;
            var _local_45:Point;
            var _local_46:Vector3d;
            var _local_5:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            var _local_6:RoomInstanceData = this.getRoomInstanceData(k);
            if ((((_local_5 == null) || (_local_6 == null)) || (!(_local_5.scale == 1))))
            {
                return;
            }
            var _local_7:RoomGeometry = (_local_5.geometry as RoomGeometry);
            var _local_8:RoomCamera = _local_6.roomCamera;
            var _local_9:IRoomInstance = this.getRoom(k);
            if ((((!(_local_7 == null)) && (!(_local_8 == null))) && (!(_local_9 == null))))
            {
                _local_10 = (Math.floor(_arg_3.z) + 1);
                _local_11 = this.getRoomCanvasRectangle(k, _arg_2);
                if (_local_11 != null)
                {
                    _local_12 = Math.round(_local_11.width);
                    _local_13 = Math.round(_local_11.height);
                    _local_14 = this.getActiveRoomBoundingRectangle(_arg_2);
                    if (((!(_local_14 == null)) && ((((_local_14.right < 0) || (_local_14.bottom < 0)) || (_local_14.left >= _local_12)) || (_local_14.top >= _local_13))))
                    {
                        _local_8.reset();
                    }
                    if (((((((!(_local_8._Str_7609 == _local_12)) || (!(_local_8._Str_7902 == _local_13))) || (!(_local_8.scale == _local_7.scale))) || (!(_local_8._Str_16377 == _local_7.updateId))) || (!(Vector3d.isEqual(_arg_3, _local_8._Str_16185)))) || (_local_8.isMoving)))
                    {
                        _local_8._Str_16185 = _arg_3;
                        _local_15 = new Vector3d();
                        _local_15.assign(_arg_3);
                        _local_15.x = Math.round(_local_15.x);
                        _local_15.y = Math.round(_local_15.y);
                        _local_16 = (_local_9.getNumber(RoomVariableEnum.ROOM_MIN_X) - 0.5);
                        _local_17 = (_local_9.getNumber(RoomVariableEnum.ROOM_MIN_Y) - 0.5);
                        _local_18 = (_local_9.getNumber(RoomVariableEnum.ROOM_MAX_X) + 0.5);
                        _local_19 = (_local_9.getNumber(RoomVariableEnum.ROOM_MAX_Y) + 0.5);
                        _local_20 = Math.round(((_local_16 + _local_18) / 2));
                        _local_21 = Math.round(((_local_17 + _local_19) / 2));
                        _local_22 = 2;
                        _local_23 = new Point((_local_15.x - _local_20), (_local_15.y - _local_21));
                        _local_24 = (_local_7.scale / Math.sqrt(2));
                        _local_25 = (_local_24 / 2);
                        _local_26 = new Matrix();
                        _local_26.rotate(((-(_local_7.direction.x + 90) / 180) * Math.PI));
                        _local_23 = _local_26.transformPoint(_local_23);
                        _local_23.y = (_local_23.y * (_local_25 / _local_24));
                        _local_27 = (((_local_11.width / 2) / _local_24) - 1);
                        _local_28 = (((_local_11.height / 2) / _local_25) - 1);
                        _local_29 = 0;
                        _local_30 = 0;
                        _local_31 = 0;
                        _local_32 = 0;
                        _local_33 = _local_7.getScreenPoint(new Vector3d(_local_20, _local_21, _local_22));
                        if (!_local_33)
                        {
                            return;
                        }
                        _local_33.x = (_local_33.x + Math.round((_local_11.width / 2)));
                        _local_33.y = (_local_33.y + Math.round((_local_11.height / 2)));
                        if (_local_14 != null)
                        {
                            _local_14.offset(-(_local_5._Str_3629), -(_local_5._Str_3768));
                            if (((_local_14.width > 1) && (_local_14.height > 1)))
                            {
                                _local_29 = (((_local_14.left - _local_33.x) - (_local_7.scale * 0.25)) / _local_24);
                                _local_31 = (((_local_14.right - _local_33.x) + (_local_7.scale * 0.25)) / _local_24);
                                _local_30 = (((_local_14.top - _local_33.y) - (_local_7.scale * 0.5)) / _local_25);
                                _local_32 = (((_local_14.bottom - _local_33.y) + (_local_7.scale * 0.5)) / _local_25);
                            }
                            else
                            {
                                _local_7.adjustLocation(new Vector3d(-30, -30), 25);
                                return;
                            }
                        }
                        else
                        {
                            _local_7.adjustLocation(new Vector3d(0, 0), 25);
                            return;
                        }
                        _local_34 = false;
                        _local_35 = false;
                        _local_36 = false;
                        _local_37 = false;
                        _local_38 = Math.round(((_local_31 - _local_29) * _local_24));
                        if (_local_38 < _local_11.width)
                        {
                            _local_10 = 2;
                            _local_23.x = ((_local_31 + _local_29) / 2);
                            _local_36 = true;
                        }
                        else
                        {
                            if (_local_23.x > (_local_31 - _local_27))
                            {
                                _local_23.x = (_local_31 - _local_27);
                                _local_34 = true;
                            }
                            if (_local_23.x < (_local_29 + _local_27))
                            {
                                _local_23.x = (_local_29 + _local_27);
                                _local_34 = true;
                            }
                        }
                        _local_39 = Math.round(((_local_32 - _local_30) * _local_25));
                        if (_local_39 < _local_11.height)
                        {
                            _local_10 = 2;
                            _local_23.y = ((_local_32 + _local_30) / 2);
                            _local_37 = true;
                        }
                        else
                        {
                            if (_local_23.y > (_local_32 - _local_28))
                            {
                                _local_23.y = (_local_32 - _local_28);
                                _local_35 = true;
                            }
                            if (_local_23.y < (_local_30 + _local_28))
                            {
                                _local_23.y = (_local_30 + _local_28);
                                _local_35 = true;
                            }
                            if (_local_35)
                            {
                                _local_23.y = (_local_23.y / (_local_25 / _local_24));
                            }
                        }
                        _local_26.invert();
                        _local_23 = _local_26.transformPoint(_local_23);
                        _local_23.x = (_local_23.x + _local_20);
                        _local_23.y = (_local_23.y + _local_21);
                        _local_40 = 0.35;
                        _local_41 = 0.2;
                        _local_42 = 0.2;
                        _local_43 = 10;
                        _local_44 = 10;
                        if ((_local_42 * _local_12) > 100)
                        {
                            _local_42 = (100 / _local_12);
                        }
                        if ((_local_40 * _local_13) > 150)
                        {
                            _local_40 = (150 / _local_13);
                        }
                        if ((_local_41 * _local_13) > 150)
                        {
                            _local_41 = (150 / _local_13);
                        }
                        if ((((_local_8._Str_10235) && (_local_8._Str_7609 == _local_12)) && (_local_8._Str_7902 == _local_13)))
                        {
                            _local_42 = 0;
                        }
                        if ((((_local_8._Str_10446) && (_local_8._Str_7609 == _local_12)) && (_local_8._Str_7902 == _local_13)))
                        {
                            _local_40 = 0;
                            _local_41 = 0;
                        }
                        _local_11.right = (_local_11.right * (1 - (_local_42 * 2)));
                        _local_11.bottom = (_local_11.bottom * (1 - (_local_40 + _local_41)));
                        if (_local_11.right < _local_43)
                        {
                            _local_11.right = _local_43;
                        }
                        if (_local_11.bottom < _local_44)
                        {
                            _local_11.bottom = _local_44;
                        }
                        if ((_local_40 + _local_41) > 0)
                        {
                            _local_11.offset((-(_local_11.width) / 2), (-(_local_11.height) * (_local_41 / (_local_40 + _local_41))));
                        }
                        else
                        {
                            _local_11.offset((-(_local_11.width) / 2), (-(_local_11.height) / 2));
                        }
                        _local_33 = _local_7.getScreenPoint(_local_15);
                        if (!_local_33)
                        {
                            return;
                        }
                        if (_local_33 != null)
                        {
                            _local_33.x = (_local_33.x + _local_5._Str_3629);
                            _local_33.y = (_local_33.y + _local_5._Str_3768);
                            _local_15.z = _local_10;
                            _local_15.x = (Math.round((_local_23.x * 2)) / 2);
                            _local_15.y = (Math.round((_local_23.y * 2)) / 2);
                            if (_local_8.location == null)
                            {
                                _local_7.location = _local_15;
                                if (this.useOffsetScrolling)
                                {
                                    _local_8.initializeLocation(new Vector3d(0, 0, 0));
                                }
                                else
                                {
                                    _local_8.initializeLocation(_local_15);
                                }
                            }
                            _local_45 = _local_7.getScreenPoint(_local_15);
                            _local_46 = new Vector3d(0, 0, 0);
                            if (_local_45 != null)
                            {
                                _local_46.x = _local_45.x;
                                _local_46.y = _local_45.y;
                            }
                            if (((((((((_local_33.x < _local_11.left) || (_local_33.x > _local_11.right)) && (!(_local_8._Str_8564))) || (((_local_33.y < _local_11.top) || (_local_33.y > _local_11.bottom)) && (!(_local_8._Str_8690)))) || (((_local_36) && (!(_local_8._Str_8564))) && (!(_local_8._Str_7609 == _local_12)))) || (((_local_37) && (!(_local_8._Str_8690))) && (!(_local_8._Str_7902 == _local_13)))) || ((!(_local_8._Str_18975 == _local_14.width)) || (!(_local_8._Str_15953 == _local_14.height)))) || ((!(_local_8._Str_7609 == _local_12)) || (!(_local_8._Str_7902 == _local_13)))))
                            {
                                _local_8._Str_10235 = _local_34;
                                _local_8._Str_10446 = _local_35;
                                if (this.useOffsetScrolling)
                                {
                                    _local_8.target = _local_46;
                                }
                                else
                                {
                                    _local_8.target = _local_15;
                                }
                            }
                            else
                            {
                                if (!_local_34)
                                {
                                    _local_8._Str_10235 = false;
                                }
                                if (!_local_35)
                                {
                                    _local_8._Str_10446 = false;
                                }
                            }
                        }
                        _local_8._Str_8564 = _local_36;
                        _local_8._Str_8690 = _local_37;
                        _local_8._Str_7609 = _local_12;
                        _local_8._Str_7902 = _local_13;
                        _local_8.scale = _local_7.scale;
                        _local_8._Str_16377 = _local_7.updateId;
                        _local_8._Str_18975 = _local_14.width;
                        _local_8._Str_15953 = _local_14.height;
                        if (!this._sessionDataManager._Str_18110)
                        {
                            if (this.useOffsetScrolling)
                            {
                                _local_8.update(_arg_4, 8);
                            }
                            else
                            {
                                _local_8.update(_arg_4, 0.5);
                            }
                        }
                        if (this.useOffsetScrolling)
                        {
                            _local_5._Str_3629 = -(_local_8.location.x);
                            _local_5._Str_3768 = -(_local_8.location.y);
                        }
                        else
                        {
                            _local_7.adjustLocation(_local_8.location, 25);
                        }
                    }
                    else
                    {
                        _local_8._Str_10235 = false;
                        _local_8._Str_10446 = false;
                        _local_8._Str_8564 = false;
                        _local_8._Str_8690 = false;
                    }
                }
            }
        }

        private function onConfigurationComplete(k:Event):void
        {
            this._contentLoaderReady = true;
            this._roomManager.initialize(<nothing/>
            , this);
        }

        private function onRoomSessionEvent(k:RoomSessionEvent):void
        {
            switch (k.type)
            {
                case RoomSessionEvent.STARTED:
                    if (this._roomMessageHandler)
                    {
                        this._roomMessageHandler.setCurrentRoom(k.session.roomId);
                    }
                    return;
                case RoomSessionEvent.ENDED:
                    if (this._roomMessageHandler)
                    {
                        this._roomMessageHandler.resetCurrentRoom();
                        this.disposeRoom(k.session.roomId);
                    }
                    return;
            }
        }

        private function onToolbarClicked(k:HabboToolbarEvent):void
        {
            var _local_2:RoomCamera;
            if (k._Str_3378 == HabboToolbarIconEnum.MEMENU)
            {
                _local_2 = this.getActiveRoomCamera();
                if (_local_2)
                {
                    _local_2.activateFollowing(this.cameraFollowDuration);
                    _local_2.reset();
                }
            }
        }

        public function roomManagerInitialized(k:Boolean):void
        {
            var _local_2:int;
            var _local_3:RoomData;
            if (k)
            {
                this._roomManagerInitialized = true;
                events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.ENGINE_INITIALIZED, 0));
                _local_2 = 0;
                while (_local_2 < this._roomDatas.length)
                {
                    _local_3 = (this._roomDatas.getWithIndex(_local_2) as RoomData);
                    if (_local_3 != null)
                    {
                        this.initializeRoom(_local_3.roomId, _local_3.data);
                    }
                    _local_2++;
                }
            }
        }

        public function setActiveRoom(k:int):void
        {
            this._activeRoomId = k;
        }

        public function getRoomIdentifier(k:int):String
        {
            return String(k);
        }

        private function getRoomId(k:String):int
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split("_");
                if (_local_2.length > 0)
                {
                    return _local_2[0];
                }
            }
            return -1;
        }

        public function getRoomNumberValue(k:int, _arg_2:String):Number
        {
            var _local_3:IRoomInstance = this.getRoom(k);
            if (_local_3 != null)
            {
                return _local_3.getNumber(_arg_2);
            }
            return NaN;
        }

        public function getRoomStringValue(k:int, _arg_2:String):String
        {
            var _local_3:IRoomInstance = this.getRoom(k);
            if (_local_3 != null)
            {
                return _local_3.getString(_arg_2);
            }
            return null;
        }

        public function setIsPlayingGame(k:int, _arg_2:Boolean):void
        {
            var _local_4:int;
            var _local_3:IRoomInstance = this.getRoom(k);
            if (_local_3 != null)
            {
                _local_4 = ((_arg_2) ? 1 : 0);
                _local_3.setNumber(RoomVariableEnum.IS_PLAYING_GAME, _local_4);
                if (_local_4 == 0)
                {
                    events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.NORMAL_MODE, k));
                }
                else
                {
                    events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.GAME_MODE, k));
                }
            }
        }

        public function getIsPlayingGame(k:int):Boolean
        {
            var _local_3:Number;
            var _local_2:IRoomInstance = this.getRoom(k);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getNumber(RoomVariableEnum.IS_PLAYING_GAME);
                if (_local_3 > 0)
                {
                    return true;
                }
            }
            return false;
        }

        public function getActiveRoomIsPlayingGame():Boolean
        {
            return this.getIsPlayingGame(this._activeRoomId);
        }

        public function getRoom(k:int):IRoomInstance
        {
            if (!this._roomManagerInitialized)
            {
                return null;
            }
            var _local_2:String = this.getRoomIdentifier(k);
            var _local_3:IRoomInstance = this._roomManager.getRoom(_local_2);
            return _local_3;
        }

        public function initializeRoom(k:int, _arg_2:XML):void
        {
            var _local_3:String = this.getRoomIdentifier(k);
            var _local_4:RoomData;
            var _local_5:String = "111";
            var _local_6:String = "201";
            var _local_7:String = "1";
            if (!this._roomManagerInitialized)
            {
                _local_4 = this._roomDatas.remove(_local_3);
                if (_local_4 != null)
                {
                    _local_5 = _local_4._Str_5207;
                    _local_6 = _local_4._Str_5259;
                    _local_7 = _local_4._Str_5109;
                }
                _local_4 = new RoomData(k, _arg_2);
                _local_4._Str_5207 = _local_5;
                _local_4._Str_5259 = _local_6;
                _local_4._Str_5109 = _local_7;
                this._roomDatas.add(_local_3, _local_4);
                Logger.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
                return;
            }
            if (_arg_2 == null)
            {
                Logger.log("Room property messages received before floor height map, will initialize when floor height map received.");
                return;
            }
            _local_4 = this._roomDatas.remove(_local_3);
            if (_local_4 != null)
            {
                if (((!(_local_4._Str_5207 == null)) && (_local_4._Str_5207.length > 0)))
                {
                    _local_5 = _local_4._Str_5207;
                }
                if (((!(_local_4._Str_5259 == null)) && (_local_4._Str_5259.length > 0)))
                {
                    _local_6 = _local_4._Str_5259;
                }
                if (((!(_local_4._Str_5109 == null)) && (_local_4._Str_5109.length > 0)))
                {
                    _local_7 = _local_4._Str_5109;
                }
            }
            var _local_8:IRoomInstance = this.createRoom(_local_3, _arg_2, _local_5, _local_6, _local_7, this.getWorldType(k));
            if (_local_8 == null)
            {
                return;
            }
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.INITIALIZED, k));
        }

        private function createRoom(k:String, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String):IRoomInstance
        {
            var _local_11:int;
            var _local_12:XML;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:RoomObjectRoomUpdateMessage;
            var _local_18:XMLList;
            var _local_19:Array;
            var _local_20:RoomObjectRoomMaskUpdateMessage;
            var _local_21:int;
            var _local_22:XML;
            var _local_23:Number;
            var _local_24:Number;
            var _local_25:Number;
            var _local_26:Number;
            var _local_27:String;
            var _local_28:String;
            var _local_29:Vector3d;
            if (!this._roomManagerInitialized)
            {
                return null;
            }
            var _local_7:IRoomInstance = this._roomManager.createRoom(k, _arg_2);
            if (_local_7 == null)
            {
                return null;
            }
            var _local_8:int = RoomObjectCategoryEnum.CONST_0;
            var _local_9:IRoomObjectController;
            var _local_10:Number = 1;
            _local_9 = (_local_7.createRoomObject(OBJECT_ID_ROOM, ROOM, _local_8) as IRoomObjectController);
            _local_7.setNumber(RoomVariableEnum.ROOM_IS_PUBLIC, 0, true);
            _local_7.setNumber(RoomVariableEnum.ROOM_Z_SCALE, _local_10, true);
            if (_arg_2 != null)
            {
                _local_11 = 0;
                if (_arg_2.dimensions.length() == 1)
                {
                    _local_12 = _arg_2.dimensions[0];
                    _local_13 = Number(_local_12.@minX);
                    _local_14 = Number(_local_12.@maxX);
                    _local_15 = Number(_local_12.@minY);
                    _local_16 = Number(_local_12.@maxY);
                    _local_7.setNumber(RoomVariableEnum.ROOM_MIN_X, _local_13);
                    _local_7.setNumber(RoomVariableEnum.ROOM_MAX_X, _local_14);
                    _local_7.setNumber(RoomVariableEnum.ROOM_MIN_Y, _local_15);
                    _local_7.setNumber(RoomVariableEnum.ROOM_MAX_Y, _local_16);
                    _local_11 = (_local_11 + ((((_local_13 * 423) + (_local_14 * 671)) + (_local_15 * 913)) + (_local_16 * 7509)));
                    if (((!(_local_9 == null)) && (!(_local_9.getModelController() == null))))
                    {
                        _local_9.getModelController().setNumber(RoomObjectVariableEnum.ROOM_RANDOM_SEED, _local_11, true);
                    }
                }
            }
            if (((!(_local_9 == null)) && (!(_local_9.getEventHandler() == null))))
            {
                _local_9.getEventHandler().initialize(_arg_2);
                _local_17 = null;
                if (_arg_3 != null)
                {
                    _local_17 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_FLOOR_UPDATE, _arg_3);
                    _local_9.getEventHandler().processUpdateMessage(_local_17);
                    _local_7.setString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE, _arg_3);
                }
                if (_arg_4 != null)
                {
                    _local_17 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_WALL_UPDATE, _arg_4);
                    _local_9.getEventHandler().processUpdateMessage(_local_17);
                    _local_7.setString(RoomObjectVariableEnum.ROOM_WALL_TYPE, _arg_4);
                }
                if (_arg_5 != null)
                {
                    _local_17 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_LANDSCAPE_UPDATE, _arg_5);
                    _local_9.getEventHandler().processUpdateMessage(_local_17);
                    _local_7.setString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE, _arg_5);
                }
                if (_arg_2 != null)
                {
                    if (_arg_2.doors.door.length() > 0)
                    {
                        _local_18 = _arg_2.doors.door;
                        _local_19 = ["x", "y", "z", "dir"];
                        _local_20 = null;
                        _local_21 = 0;
                        while (_local_21 < _local_18.length())
                        {
                            _local_22 = _local_18[_local_21];
                            if (XMLValidator.checkRequiredAttributes(_local_22, _local_19))
                            {
                                _local_23 = Number(_local_22.@x);
                                _local_24 = Number(_local_22.@y);
                                _local_25 = Number(_local_22.@z);
                                _local_26 = Number(_local_22.@dir);
                                _local_27 = RoomObjectRoomMaskUpdateMessage.DOOR;
                                _local_28 = ("door_" + _local_21);
                                _local_29 = new Vector3d(_local_23, _local_24, _local_25);
                                _local_20 = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.RORMUM_ADD_MASK, _local_28, _local_27, _local_29, RoomObjectRoomMaskUpdateMessage.HOLE);
                                _local_9.getEventHandler().processUpdateMessage(_local_20);
                                if (((_local_26 == 90) || (_local_26 == 180)))
                                {
                                    if (_local_26 == 90)
                                    {
                                        _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_X, (_local_23 - 0.5), true);
                                        _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_Y, _local_24, true);
                                    }
                                    if (_local_26 == 180)
                                    {
                                        _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_X, _local_23, true);
                                        _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_Y, (_local_24 - 0.5), true);
                                    }
                                    _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_Z, _local_25, true);
                                    _local_7.setNumber(RoomObjectVariableEnum.ROOM_DOOR_DIR, _local_26, true);
                                }
                            }
                            _local_21++;
                        }
                    }
                }
            }
            _local_7.createRoomObject(OBJECT_ID_ROOM_HIGHLIGHTER, TILE_CURSOR, RoomObjectCategoryEnum.CONST_200);
            if (!getBoolean("avatar.widget.enabled"))
            {
                _local_7.createRoomObject(OBJECT_ID_SELECTION_ARROW, SELECTION_ARROW, RoomObjectCategoryEnum.CONST_200);
            }
            return _local_7;
        }

        public function getObjectRoom(k:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), OBJECT_ID_ROOM, RoomObjectCategoryEnum.CONST_0);
        }

        public function updateObjectRoom(k:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean
        {
            var _local_9:String;
            var _local_10:RoomData;
            var _local_6:IRoomObjectController = this.getObjectRoom(k);
            var _local_7:IRoomInstance = this.getRoom(k);
            if (_local_6 == null)
            {
                _local_9 = this.getRoomIdentifier(k);
                _local_10 = this._roomDatas.getValue(_local_9);
                if (_local_10 == null)
                {
                    _local_10 = new RoomData(k, null);
                    this._roomDatas.add(_local_9, _local_10);
                }
                if (_arg_2 != null)
                {
                    _local_10._Str_5207 = _arg_2;
                }
                if (_arg_3 != null)
                {
                    _local_10._Str_5259 = _arg_3;
                }
                if (_arg_4 != null)
                {
                    _local_10._Str_5109 = _arg_4;
                }
                return true;
            }
            if (_local_6.getEventHandler() == null)
            {
                return false;
            }
            var _local_8:RoomObjectRoomUpdateMessage;
            if (_arg_2 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE, _arg_2);
                }
                _local_8 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_FLOOR_UPDATE, _arg_2);
                _local_6.getEventHandler().processUpdateMessage(_local_8);
            }
            if (_arg_3 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString(RoomObjectVariableEnum.ROOM_WALL_TYPE, _arg_3);
                }
                _local_8 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_WALL_UPDATE, _arg_3);
                _local_6.getEventHandler().processUpdateMessage(_local_8);
            }
            if (_arg_4 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE, _arg_4);
                }
                _local_8 = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.RORUM_ROOM_LANDSCAPE_UPDATE, _arg_4);
                _local_6.getEventHandler().processUpdateMessage(_local_8);
            }
            return true;
        }

        public function updateObjectRoomColor(k:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean
        {
            var _local_5:IRoomObjectController = this.getObjectRoom(k);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return false;
            }
            var _local_6:RoomObjectRoomColorUpdateMessage;
            _local_6 = new RoomObjectRoomColorUpdateMessage(RoomObjectRoomColorUpdateMessage.RORCUM_BACKGROUND_COLOR, _arg_2, _arg_3, _arg_4);
            _local_5.getEventHandler().processUpdateMessage(_local_6);
            events.dispatchEvent(new RoomBackgroundColorEvent(k, _arg_2, _arg_3, _arg_4));
            return true;
        }

        public function updateObjectRoomBackgroundColor(k:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            var _local_6:IRoomObjectController = this.getObjectRoom(k);
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return false;
            }
            events.dispatchEvent(new RoomObjectHSLColorEnabledEvent(RoomObjectHSLColorEnabledEvent.ROOM_BACKGROUND_COLOR, k, _arg_2, _arg_3, _arg_4, _arg_5));
            return true;
        }

        public function updateObjectRoomVisibilities(k:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectRoom(k);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return false;
            }
            var _local_5:RoomObjectRoomPlaneVisibilityUpdateMessage;
            _local_5 = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.RORPVUM_WALL_VISIBILITY, _arg_2);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            _local_5 = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.RORPVUM_FLOOR_VISIBILITY, _arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return true;
        }

        public function updateObjectRoomPlaneThicknesses(k:int, _arg_2:Number, _arg_3:Number):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectRoom(k);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return false;
            }
            var _local_5:RoomObjectRoomPlanePropertyUpdateMessage;
            _local_5 = new RoomObjectRoomPlanePropertyUpdateMessage(RoomObjectRoomPlanePropertyUpdateMessage.RORPPUM_WALL_THICKNESS, _arg_2);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            _local_5 = new RoomObjectRoomPlanePropertyUpdateMessage(RoomObjectRoomPlanePropertyUpdateMessage.RORPVUM_FLOOR_THICKNESS, _arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return true;
        }

        public function disposeRoom(k:int):void
        {
            var _local_2:String = this.getRoomIdentifier(k);
            this._roomManager.disposeRoom(_local_2);
            var _local_3:RoomInstanceData = this._roomInstanceDatas.remove(_local_2);
            if (_local_3 != null)
            {
                _local_3.dispose();
            }
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.DISPOSED, k));
        }

        public function setOwnUserId(k:int, _arg_2:int):void
        {
            var _local_3:IRoomSession = this._roomSessionManager.getSession(k);
            if (_local_3)
            {
                _local_3._Str_3871 = _arg_2;
            }
            var _local_4:RoomCamera = this.getRoomCamera(k);
            if (_local_4 != null)
            {
                _local_4._Str_10760 = _arg_2;
                _local_4._Str_16562 = RoomObjectCategoryEnum.CONST_100;
                _local_4.activateFollowing(this.cameraFollowDuration);
            }
        }

        public function createRoomCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):DisplayObject
        {
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Vector3d;
            var _local_16:Vector3d;
            var _local_17:Sprite;
            var _local_6:String = this.getRoomIdentifier(k);
            var _local_7:IRoomInstance = this._roomManager.getRoom(_local_6);
            if (_local_7 == null)
            {
                return null;
            }
            var _local_8:IRoomRenderer = (_local_7.getRenderer() as IRoomRenderer);
            if (_local_8 == null)
            {
                _local_8 = this._roomRendererFactory.createRenderer();
            }
            if (_local_8 == null)
            {
                return null;
            }
            _local_8.roomObjectVariableAccurateZ = RoomObjectVariableEnum.OBJECT_ACCURATE_Z_VALUE;
            _local_7.setRenderer(_local_8);
            var _local_9:IRoomRenderingCanvas = _local_8.createCanvas(_arg_2, _arg_3, _arg_4, _arg_5);
            if (_local_9 == null)
            {
                return null;
            }
            _local_9.mouseListener = this._roomObjectEventHandler;
            if (_local_9.geometry != null)
            {
                _local_9.geometry.z_scale = _local_7.getNumber(RoomVariableEnum.ROOM_Z_SCALE);
            }
            if (_local_9.geometry != null)
            {
                _local_11 = _local_7.getNumber(RoomObjectVariableEnum.ROOM_DOOR_X);
                _local_12 = _local_7.getNumber(RoomObjectVariableEnum.ROOM_DOOR_Y);
                _local_13 = _local_7.getNumber(RoomObjectVariableEnum.ROOM_DOOR_Z);
                _local_14 = _local_7.getNumber(RoomObjectVariableEnum.ROOM_DOOR_DIR);
                _local_15 = new Vector3d(_local_11, _local_12, _local_13);
                _local_16 = null;
                if (_local_14 == 90)
                {
                    _local_16 = new Vector3d(-2000, 0, 0);
                }
                if (_local_14 == 180)
                {
                    _local_16 = new Vector3d(0, -2000, 0);
                }
                _local_9.geometry.setDisplacement(_local_15, _local_16);
            }
            var _local_10:Sprite = (_local_9.displayObject as Sprite);
            if (_local_10 != null)
            {
                _local_17 = new Sprite();
                _local_17.name = OVERLAY;
                _local_17.mouseEnabled = false;
                _local_10.addChild(_local_17);
            }
            return _local_10;
        }

        public function _Str_5041(k:int, _arg_2:int, _arg_3:Number, _arg_4:Point=null, _arg_5:Point=null, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false):void
        {
            var _local_10:RoomInstanceData;
            var _local_11:RoomCamera;
            if (!getBoolean("zoom.enabled"))
            {
                return;
            }
            if (!_arg_7)
            {
                _arg_3 = ((_arg_6) ? -1 : ((_arg_3 < 1) ? 0.5 : Math.floor(_arg_3)));
            }
            var _local_9:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_9 != null)
            {
                _local_9._Str_13261(_arg_3, _arg_4, _arg_5, _arg_8);
                _local_10 = this.getRoomInstanceData(this._activeRoomId);
                if (_local_10 != null)
                {
                    _local_11 = _local_10.roomCamera;
                }
                events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.ROOM_ZOOMED, k));
            }
        }

        public function _Str_5151(k:int=-1000, _arg_2:int=-1):Number
        {
            if (k == -1000)
            {
                k = this._activeRoomId;
            }
            if (_arg_2 == -1)
            {
                _arg_2 = this._activeRoomActiveCanvas;
            }
            var _local_3:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_3 == null)
            {
                return 1;
            }
            return _local_3.scale;
        }

        public function getRoomCanvas(k:int, _arg_2:int):IRoomRenderingCanvas
        {
            var _local_3:String = this.getRoomIdentifier(k);
            var _local_4:IRoomInstance = this._roomManager.getRoom(_local_3);
            if (_local_4 == null)
            {
                return null;
            }
            var _local_5:IRoomRenderer = (_local_4.getRenderer() as IRoomRenderer);
            if (_local_5 == null)
            {
                return null;
            }
            var _local_6:IRoomRenderingCanvas = _local_5.getCanvas(_arg_2);
            return _local_6;
        }

        public function modifyRoomCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean
        {
            var _local_5:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_5 == null)
            {
                return false;
            }
            _local_5.initialize(_arg_3, _arg_4);
            return true;
        }

        public function setRoomCanvasMask(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_4:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_4 == null)
            {
                return;
            }
            _local_4.useMask = _arg_3;
        }

        private function getRoomCanvasRectangle(k:int, _arg_2:int):Rectangle
        {
            var _local_3:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_3 == null)
            {
                return null;
            }
            return new Rectangle(0, 0, _local_3.width, _local_3.height);
        }

        public function getRoomCanvasGeometry(k:int, _arg_2:int=-1):IRoomGeometry
        {
            if (_arg_2 == -1)
            {
                _arg_2 = this._activeRoomActiveCanvas;
            }
            var _local_3:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_3 == null)
            {
                return null;
            }
            return _local_3.geometry;
        }

        public function getRoomCanvasScreenOffset(k:int, _arg_2:int=-1):Point
        {
            if (_arg_2 == -1)
            {
                _arg_2 = this._activeRoomActiveCanvas;
            }
            var _local_3:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (_local_3 == null)
            {
                return null;
            }
            return new Point(_local_3._Str_3629, _local_3._Str_3768);
        }

        public function setRoomCanvasScreenOffset(k:int, _arg_2:int, _arg_3:Point):Boolean
        {
            var _local_4:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (((_local_4 == null) || (_arg_3 == null)))
            {
                return false;
            }
            _local_4._Str_3629 = _arg_3.x;
            _local_4._Str_3768 = _arg_3.y;
            return true;
        }

        public function _Str_16420(k:int, _arg_2:int, _arg_3:BitmapData, _arg_4:Matrix, _arg_5:Boolean):Boolean
        {
            var _local_6:IRoomRenderingCanvas = this.getRoomCanvas(k, _arg_2);
            if (!_local_6)
            {
                return false;
            }
            var _local_7:DisplayObject = _local_6.displayObject;
            if (!_local_7)
            {
                return false;
            }
            _arg_3.draw(_local_7, _arg_4, null, null, null, _arg_5);
            return true;
        }

        private function handleRoomDragging(k:IRoomRenderingCanvas, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean
        {
            var _local_10:RoomInstanceData;
            var _local_11:RoomCamera;
            if (this._isSelectedObjectInValidPosition)
            {
                return false;
            }
            var _local_8:int = (_arg_2 - this._activeRoomActiveCanvasMouseX);
            var _local_9:int = (_arg_3 - this._activeRoomActiveCanvasMouseY);
            if (_arg_4 == MouseEvent.MOUSE_DOWN)
            {
                if (((((!(_arg_5)) && (!(_arg_6))) && (!(_arg_7))) && (!(this.getIsSelectedObjectInValidPosition))))
                {
                    this._activeRoomIsDragged = true;
                    this._activeRoomWasDragged = false;
                    this._activeRoomDragStartX = this._activeRoomActiveCanvasMouseX;
                    this._activeRoomDragStartY = this._activeRoomActiveCanvasMouseY;
                    this._mouseEventsDisabledLeftToXWas = this._mouseEventsDisabledLeftToX;
                    this._mouseEventsDisabledLeftToX = 0;
                }
            }
            else
            {
                if (_arg_4 == MouseEvent.MOUSE_UP)
                {
                    if (this._activeRoomIsDragged)
                    {
                        this._activeRoomIsDragged = false;
                        if (this._activeRoomWasDragged)
                        {
                            _local_10 = this.getRoomInstanceData(this._activeRoomId);
                            if (_local_10 != null)
                            {
                                _local_11 = _local_10.roomCamera;
                                if (_local_11 != null)
                                {
                                    if (this.useOffsetScrolling)
                                    {
                                        if (!_local_11.isMoving)
                                        {
                                            _local_11._Str_8564 = false;
                                            _local_11._Str_8690 = false;
                                        }
                                        _local_11.resetLocation(new Vector3d(-(k._Str_3629), -(k._Str_3768)));
                                    }
                                    if (this._cameraCentered)
                                    {
                                        _local_11.reset();
                                    }
                                }
                            }
                            events.dispatchEvent(new RoomEngineDragWidgetMouseEvent(RoomEngineDragWidgetMouseEvent.DRAG_END, this._activeRoomId));
                        }
                    }
                    if (this._mouseEventsDisabledLeftToXWas != 0)
                    {
                        this._mouseEventsDisabledLeftToX = this._mouseEventsDisabledLeftToXWas;
                        this._mouseEventsDisabledLeftToXWas = 0;
                    }
                }
                else
                {
                    if (_arg_4 == MouseEvent.MOUSE_MOVE)
                    {
                        if (this._activeRoomIsDragged)
                        {
                            if (!this._activeRoomWasDragged)
                            {
                                _local_8 = (_arg_2 - this._activeRoomDragStartX);
                                _local_9 = (_arg_3 - this._activeRoomDragStartY);
                                if (((((_local_8 <= -(ROOM_DRAG_THRESHOLD)) || (_local_8 >= ROOM_DRAG_THRESHOLD)) || (_local_9 <= -(ROOM_DRAG_THRESHOLD))) || (_local_9 >= ROOM_DRAG_THRESHOLD)))
                                {
                                    this._activeRoomWasDragged = true;
                                    events.dispatchEvent(new RoomEngineDragWidgetMouseEvent(RoomEngineDragWidgetMouseEvent.DRAG_START, this._activeRoomId));
                                }
                                _local_8 = 0;
                                _local_9 = 0;
                            }
                            if (((!(_local_8 == 0)) || (!(_local_9 == 0))))
                            {
                                this._activeRoomDragX = (this._activeRoomDragX + _local_8);
                                this._activeRoomDragY = (this._activeRoomDragY + _local_9);
                                if (!this._activeRoomWasDragged)
                                {
                                    events.dispatchEvent(new RoomEngineDragWidgetMouseEvent(RoomEngineDragWidgetMouseEvent.DRAG_START, this._activeRoomId));
                                }
                                this._activeRoomWasDragged = true;
                            }
                        }
                    }
                    else
                    {
                        if (((_arg_4 == MouseEvent.CLICK) || (_arg_4 == MouseEvent.DOUBLE_CLICK)))
                        {
                            this._activeRoomIsDragged = false;
                            if (this._activeRoomWasDragged)
                            {
                                this._activeRoomWasDragged = false;
                                return true;
                            }
                        }
                    }
                }
            }
            return false;
        }

        public function handleRoomCanvasMouseEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean):void
        {
            var _local_10:Sprite;
            var _local_11:Sprite;
            var _local_12:Number;
            var _local_13:Rectangle;
            var _local_14:String;
            var _local_15:RoomObjectEvent;
            if (((this._mouseEventsDisabledAboveY > 0) && (_arg_3 < this._mouseEventsDisabledAboveY)))
            {
                return;
            }
            if (((this._mouseEventsDisabledLeftToX > 0) && (_arg_2 < this._mouseEventsDisabledLeftToX)))
            {
                return;
            }
            var _local_9:IRoomRenderingCanvas = this.getRoomCanvas(this._activeRoomId, k);
            if (_local_9 != null)
            {
                if (((((this._sessionDataManager.isPerkAllowed(PerkEnum.MOUSE_ZOOM)) && (_arg_4 == MouseEvent.CLICK)) && (_arg_6)) && (_arg_5)))
                {
                    _local_12 = ((_arg_7) ? (_local_9.scale >> 1) : ((_local_9.scale < 1) ? 1 : (_local_9.scale << 1)));
                    this._Str_5041(this.activeRoomId, this._activeRoomActiveCanvas, _local_12, new Point(_arg_2, _arg_3));
                    return;
                }
                _local_10 = this.getOverlaySprite(_local_9);
                _local_11 = this.getOverlayIconSprite(_local_10, OBJECT_ICON_SPRITE);
                if (_local_11 != null)
                {
                    _local_13 = _local_11.getRect(_local_11);
                    _local_11.x = (_arg_2 - (_local_13.width / 2));
                    _local_11.y = (_arg_3 - (_local_13.height / 2));
                }
                if (!this.handleRoomDragging(_local_9, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7))
                {
                    if (!_local_9.handleMouseEvent(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8))
                    {
                        _local_14 = "";
                        if (_arg_4 == MouseEvent.CLICK)
                        {
                            if (events != null)
                            {
                                events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.DESELECTED, this._activeRoomId, -1, RoomObjectCategoryEnum.CONST_MIN2));
                            }
                            _local_14 = RoomObjectMouseEvent.ROE_MOUSE_CLICK;
                        }
                        else
                        {
                            if (_arg_4 == MouseEvent.MOUSE_MOVE)
                            {
                                _local_14 = RoomObjectMouseEvent.ROE_MOUSE_MOVE;
                            }
                            else
                            {
                                if (_arg_4 == MouseEvent.MOUSE_DOWN)
                                {
                                    _local_14 = RoomObjectMouseEvent.ROE_MOUSE_DOWN;
                                }
                            }
                        }
                        if (this._roomObjectEventHandler != null)
                        {
                            _local_15 = new RoomObjectMouseEvent(_local_14, this.getRoomObject(this._activeRoomId, OBJECT_ID_ROOM, RoomObjectCategoryEnum.CONST_0), null, _arg_5);
                            this._roomObjectEventHandler.handleRoomObjectEvent(_local_15, this._activeRoomId);
                        }
                    }
                }
                this._activeRoomActiveCanvas = k;
                this._activeRoomActiveCanvasMouseX = _arg_2;
                this._activeRoomActiveCanvasMouseY = _arg_3;
            }
        }

        private function getOverlaySprite(k:IRoomRenderingCanvas):Sprite
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:Sprite = (k.displayObject as Sprite);
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:Sprite = (_local_2.getChildByName(OVERLAY) as Sprite);
            return _local_3;
        }

        private function addOverlayIconSprite(k:Sprite, _arg_2:String, _arg_3:BitmapData):Sprite
        {
            if (((k == null) || (_arg_3 == null)))
            {
                return null;
            }
            var _local_4:Sprite = this.getOverlayIconSprite(k, _arg_2);
            if (_local_4 != null)
            {
                return null;
            }
            _local_4 = new Sprite();
            _local_4.name = _arg_2;
            _local_4.mouseEnabled = false;
            var _local_5:Bitmap = new Bitmap(_arg_3);
            _local_4.addChild(_local_5);
            k.addChild(_local_4);
            return _local_4;
        }

        private function removeOverlayIconSprite(k:Sprite, _arg_2:String):Boolean
        {
            var _local_4:Sprite;
            var _local_5:Bitmap;
            if (k == null)
            {
                return false;
            }
            var _local_3:int = (k.numChildren - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (k.getChildAt(_local_3) as Sprite);
                if (_local_4 != null)
                {
                    if (_local_4.name == _arg_2)
                    {
                        k.removeChildAt(_local_3);
                        _local_5 = (_local_4.getChildAt(0) as Bitmap);
                        if (((!(_local_5 == null)) && (!(_local_5.bitmapData == null))))
                        {
                            _local_5.bitmapData.dispose();
                            _local_5.bitmapData = null;
                        }
                        return true;
                    }
                }
                _local_3--;
            }
            return false;
        }

        private function getOverlayIconSprite(k:Sprite, _arg_2:String):Sprite
        {
            var _local_4:Sprite;
            if (k == null)
            {
                return null;
            }
            var _local_3:int = (k.numChildren - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (k.getChildAt(_local_3) as Sprite);
                if (_local_4 != null)
                {
                    if (_local_4.name == _arg_2)
                    {
                        return _local_4;
                    }
                }
                _local_3--;
            }
            return null;
        }

        public function setObjectMoverIconSprite(k:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void
        {
            var _local_11:String;
            var _local_12:int;
            var _local_13:PetFigureData;
            var _local_14:Sprite;
            var _local_15:Sprite;
            var _local_9:ImageResult;
            if (_arg_3)
            {
                _local_9 = this.getRoomObjectImage(this._activeRoomId, k, _arg_2, new Vector3d(), 1, null);
            }
            else
            {
                if (this._roomContentLoader != null)
                {
                    _local_11 = null;
                    _local_12 = 0;
                    if (_arg_2 == RoomObjectCategoryEnum.CONST_10)
                    {
                        _local_11 = this._roomContentLoader.getActiveObjectType(k);
                        _local_12 = this._roomContentLoader.getActiveObjectColorIndex(k);
                    }
                    else
                    {
                        if (_arg_2 == RoomObjectCategoryEnum.CONST_20)
                        {
                            _local_11 = this._roomContentLoader.getWallItemType(k, _arg_4);
                            _local_12 = this._roomContentLoader.getWallItemColorIndex(k);
                        }
                    }
                    if (_arg_2 == RoomObjectCategoryEnum.CONST_100)
                    {
                        _local_11 = RoomObjectUserTypes.getName(k);
                        if (_local_11 == "pet")
                        {
                            _local_11 = this.getPetType(_arg_4);
                            _local_13 = new PetFigureData(_arg_4);
                            _local_9 = this.getPetImage(_local_13.typeId, _local_13.paletteId, _local_13.color, new Vector3d(180), 64, null, true, 0, _local_13._Str_3542, _arg_8);
                        }
                        else
                        {
                            _local_9 = this.getGenericRoomObjectImage(_local_11, _arg_4, new Vector3d(180), 1, null, 0, null, _arg_5, _arg_6, _arg_7, _arg_8);
                        }
                    }
                    else
                    {
                        _local_9 = this.getGenericRoomObjectImage(_local_11, String(_local_12), new Vector3d(), 1, null, 0, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
                    }
                }
            }
            if (((_local_9 == null) || (_local_9.data == null)))
            {
                return;
            }
            var _local_10:IRoomRenderingCanvas = this.getActiveRoomActiveCanvas();
            if (_local_10 != null)
            {
                _local_14 = this.getOverlaySprite(_local_10);
                this.removeOverlayIconSprite(_local_14, OBJECT_ICON_SPRITE);
                _local_15 = this.addOverlayIconSprite(_local_14, OBJECT_ICON_SPRITE, _local_9.data);
                if (_local_15 != null)
                {
                    _local_15.x = (this._activeRoomActiveCanvasMouseX - (_local_9.data.width / 2));
                    _local_15.y = (this._activeRoomActiveCanvasMouseY - (_local_9.data.height / 2));
                }
            }
        }

        public function setObjectMoverIconSpriteVisible(k:Boolean):void
        {
            var _local_3:Sprite;
            var _local_4:Sprite;
            var _local_2:IRoomRenderingCanvas = this.getActiveRoomActiveCanvas();
            if (_local_2 != null)
            {
                _local_3 = this.getOverlaySprite(_local_2);
                _local_4 = this.getOverlayIconSprite(_local_3, OBJECT_ICON_SPRITE);
                if (_local_4 != null)
                {
                    _local_4.visible = k;
                }
            }
        }

        public function removeObjectMoverIconSprite():void
        {
            var _local_2:Sprite;
            var k:IRoomRenderingCanvas = this.getActiveRoomActiveCanvas();
            if (k != null)
            {
                _local_2 = this.getOverlaySprite(k);
                this.removeOverlayIconSprite(_local_2, OBJECT_ICON_SPRITE);
            }
        }

        public function getRoomObjectCount(k:int, _arg_2:int):int
        {
            if (!this._roomManagerInitialized)
            {
                return 0;
            }
            var _local_3:String = this.getRoomIdentifier(k);
            var _local_4:IRoomInstance = this._roomManager.getRoom(_local_3);
            if (_local_4 == null)
            {
                return 0;
            }
            return _local_4.getObjectCount(_arg_2);
        }

        public function getRoomObject(k:int, _arg_2:int, _arg_3:int):IRoomObject
        {
            if (!this._roomManagerInitialized)
            {
                return null;
            }
            var _local_4:String = this.getRoomIdentifier(k);
            if (k == 0)
            {
                _local_4 = TEMPORARY_ROOM;
            }
            return this.getObject(_local_4, _arg_2, _arg_3);
        }

        public function _Str_22003(k:int):Array
        {
            var _local_2:IRoomInstance;
            if (this._roomManager != null)
            {
                _local_2 = this._roomManager.getRoom(this.getRoomIdentifier(this._activeRoomId));
            }
            if (_local_2 == null)
            {
                return [];
            }
            return _local_2.getObjects(k);
        }

        public function getRoomObjectWithIndex(k:int, _arg_2:int, _arg_3:int):IRoomObject
        {
            if (!this._roomManagerInitialized)
            {
                return null;
            }
            var _local_4:String = this.getRoomIdentifier(k);
            var _local_5:IRoomInstance = this._roomManager.getRoom(_local_4);
            if (_local_5 == null)
            {
                return null;
            }
            var _local_6:IRoomObject = _local_5.getObjectWithIndex(_arg_2, _arg_3);
            return _local_6;
        }

        public function getRoomObjects(k:int, _arg_2:int):Array
        {
            var _local_3:String;
            var _local_4:IRoomInstance;
            if (this._roomManagerInitialized)
            {
                _local_3 = this.getRoomIdentifier(k);
                _local_4 = this._roomManager.getRoom(_local_3);
                if (_local_4 != null)
                {
                    return _local_4.getObjects(_arg_2);
                }
            }
            return [];
        }

        public function updateObjectWallItemData(k:int, _arg_2:int, _arg_3:String):Boolean
        {
            if (this._roomObjectEventHandler != null)
            {
                return this._roomObjectEventHandler.updateObjectWallItemData(this._activeRoomId, k, _arg_2, _arg_3);
            }
            return false;
        }

        public function modifyRoomObjectDataWithMap(k:int, _arg_2:int, _arg_3:String, _arg_4:Map):Boolean
        {
            if (this._roomObjectEventHandler != null)
            {
                if (_arg_2 == RoomObjectCategoryEnum.CONST_10)
                {
                    return this._roomObjectEventHandler.modifyRoomObjectData(this._activeRoomId, k, _arg_2, _arg_3, _arg_4);
                }
            }
            return false;
        }

        public function modifyRoomObjectData(k:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean
        {
            if (this._roomObjectEventHandler != null)
            {
                if (_arg_2 == RoomObjectCategoryEnum.CONST_20)
                {
                    return this._roomObjectEventHandler.modifyWallItemData(this._activeRoomId, k, _arg_3, _arg_4);
                }
            }
            return false;
        }

        public function deleteRoomObject(k:int, _arg_2:int):Boolean
        {
            if (this._roomObjectEventHandler != null)
            {
                if (_arg_2 == RoomObjectCategoryEnum.CONST_20)
                {
                    return this._roomObjectEventHandler.deleteWallItem(this._activeRoomId, k);
                }
            }
            return false;
        }

        public function initializeRoomObjectInsert(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:IStuffData=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:String=null):Boolean
        {
            var _local_10:IRoomInstance = this.getRoom(this._activeRoomId);
            if (((_local_10 == null) || (!(_local_10.getNumber(RoomVariableEnum.ROOM_IS_PUBLIC) == 0))))
            {
                return false;
            }
            if (this._roomObjectEventHandler != null)
            {
                return this._roomObjectEventHandler.initializeRoomObjectInsert(k, this._activeRoomId, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9);
            }
            return false;
        }

        public function cancelRoomObjectInsert():void
        {
            if (this._roomObjectEventHandler != null)
            {
                this._roomObjectEventHandler.cancelRoomObjectInsert(this._activeRoomId);
            }
        }

        public function useRoomObjectInActiveRoom(k:int, _arg_2:int):Boolean
        {
            var _local_4:IRoomObjectEventHandler;
            var _local_3:IRoomObject = this.getRoomObject(this._activeRoomId, k, _arg_2);
            if (_local_3 != null)
            {
                _local_4 = (_local_3.getMouseHandler() as IRoomObjectEventHandler);
                if (_local_4 != null)
                {
                    _local_4.useObject();
                    return true;
                }
            }
            return false;
        }

        private function getRoomObjectAdURL(k:String):String
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getRoomObjectAdURL(k);
            }
            return "";
        }

        public function setRoomObjectAlias(k:String, _arg_2:String):void
        {
            if (this._roomContentLoader != null)
            {
                this._roomContentLoader.setRoomObjectAlias(k, _arg_2);
            }
        }

        public function getRoomObjectCategory(k:String):int
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getObjectCategory(k);
            }
            return RoomObjectCategoryEnum.CONST_MIN2;
        }

        public function getFurnitureType(k:int):String
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getActiveObjectType(k);
            }
            return "";
        }

        public function getFurnitureTypeId(k:String):int
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getActiveObjectTypeId(k);
            }
            return 0;
        }

        public function getWallItemType(k:int, _arg_2:String=null):String
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getWallItemType(k, _arg_2);
            }
            return "";
        }

        public function getWallItemTypeId(k:String):int
        {
            var _local_3:Array;
            var _local_2:int = -1;
            if (k != null)
            {
                _local_3 = k.split(" ");
                if (_local_3.length > 1)
                {
                    _local_2 = parseInt(_local_3[0]);
                }
            }
            return _local_2;
        }

        private function getPetType(k:String):String
        {
            var _local_2:Array;
            var _local_3:int;
            if (k != null)
            {
                _local_2 = k.split(" ");
                if (_local_2.length > 1)
                {
                    _local_3 = parseInt(_local_2[0]);
                    if (this._roomContentLoader != null)
                    {
                        return this._roomContentLoader.getPetType(_local_3);
                    }
                    return "pet";
                }
            }
            return null;
        }

        public function getPetColor(k:int, _arg_2:int):PetColorResult
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getPetColor(k, _arg_2);
            }
            return null;
        }

        public function getPetColorsByTag(k:int, _arg_2:String):Array
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getPetColorsByTag(k, _arg_2);
            }
            return null;
        }

        public function getPetLayerIdForTag(k:int, _arg_2:String):int
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getPetLayerIdForTag(k, _arg_2);
            }
            return -1;
        }

        public function getPetDefaultPalette(k:int, _arg_2:String):PetColorResult
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getPetDefaultPalette(k, _arg_2);
            }
            return null;
        }

        private function getFurnitureColorIndex(k:int):int
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getActiveObjectColorIndex(k);
            }
            return 0;
        }

        private function getWallItemColorIndex(k:int):int
        {
            if (this._roomContentLoader != null)
            {
                return this._roomContentLoader.getWallItemColorIndex(k);
            }
            return 0;
        }

        public function getSelectionArrow(k:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), OBJECT_ID_SELECTION_ARROW, RoomObjectCategoryEnum.CONST_200);
        }

        public function getTileCursor(k:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), OBJECT_ID_ROOM_HIGHLIGHTER, RoomObjectCategoryEnum.CONST_200);
        }

        public function setTileCursorState(k:int, _arg_2:int):void
        {
            var _local_4:RoomObjectDataUpdateMessage;
            var _local_3:IRoomObjectController = this.getTileCursor(k);
            if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
            {
                _local_4 = new RoomObjectDataUpdateMessage(_arg_2, null);
                _local_3.getEventHandler().processUpdateMessage(_local_4);
            }
        }

        public function _Str_21042(k:int, _arg_2:Boolean):void
        {
            var _local_4:RoomObjectTileCursorUpdateMessage;
            var _local_3:IRoomObjectController = this.getTileCursor(k);
            if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
            {
                _local_4 = new RoomObjectTileCursorUpdateMessage(null, 0, _arg_2, "", true);
                _local_3.getEventHandler().processUpdateMessage(_local_4);
            }
        }

        public function addObjectFurniture(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1):Boolean
        {
            var _local_17:FurnitureData;
            var _local_16:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_16 != null)
            {
                _local_17 = new FurnitureData(_arg_2, _arg_3, null, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12, _arg_13, _arg_14, _arg_15);
                _local_16.addFurnitureData(_local_17);
            }
            return true;
        }

        public function addObjectFurnitureByName(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN):Boolean
        {
            var _local_11:FurnitureData;
            var _local_9:String = this.getWorldType(k);
            var _local_10:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_10 != null)
            {
                _local_11 = new FurnitureData(_arg_2, 0, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, 0);
                _local_10.addFurnitureData(_local_11);
            }
            return true;
        }

        private function addObjectFurnitureFromData(k:int, _arg_2:int, _arg_3:FurnitureData):Boolean
        {
            var _local_10:RoomInstanceData;
            if (_arg_3 == null)
            {
                _local_10 = this.getRoomInstanceData(k);
                if (_local_10 != null)
                {
                    _arg_3 = _local_10.getFurnitureDataWithId(_arg_2);
                }
            }
            if (_arg_3 == null)
            {
                return false;
            }
            var _local_4:Boolean;
            var _local_5:String = _arg_3.type;
            if (_local_5 == null)
            {
                _local_5 = this.getFurnitureType(_arg_3.typeId);
                _local_4 = true;
            }
            var _local_6:int = this.getFurnitureColorIndex(_arg_3.typeId);
            var _local_7:String = this.getRoomObjectAdURL(_local_5);
            if (_local_5 == null)
            {
                _local_5 = "";
            }
            var _local_8:IRoomObjectController = this.createObjectFurniture(k, _arg_2, _local_5);
            if (_local_8 == null)
            {
                return false;
            }
            if ((((!(_local_8 == null)) && (!(_local_8.getModelController() == null))) && (_local_4)))
            {
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_COLOR, _local_6, true);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID, _arg_3.typeId, true);
                _local_8.getModelController().setString(RoomObjectVariableEnum.FURNITURE_AD_URL, _local_7, true);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT, ((_arg_3.realRoomObject) ? 1 : 0), false);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRY_TIME, _arg_3.expiryTime);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRTY_TIMESTAMP, getTimer());
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_USAGE_POLICY, _arg_3.usagePolicy);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID, _arg_3.ownerId);
                _local_8.getModelController().setString(RoomObjectVariableEnum.FURNITURE_OWNER_NAME, _arg_3.ownerName);
            }
            if (!this.updateObjectFurniture(k, _arg_2, _arg_3.loc, _arg_3.dir, _arg_3.state, _arg_3.data, _arg_3._Str_2794))
            {
                return false;
            }
            if (_arg_3.sizeZ >= 0)
            {
                if (!this.updateObjectFurnitureHeight(k, _arg_2, _arg_3.sizeZ))
                {
                    return false;
                }
            }
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.ADDED, k, _arg_2, RoomObjectCategoryEnum.CONST_10));
            }
            var _local_9:ISelectedRoomObjectData = this.getPlacedObjectData(k);
            if ((((_local_9) && (Math.abs(_local_9.id) == _arg_2)) && (_local_9.category == RoomObjectCategoryEnum.CONST_10)))
            {
                this._Str_5538(k, _arg_2, RoomObjectCategoryEnum.CONST_10);
            }
            if (((_local_8.isInitialized()) && (_arg_3.synchronized)))
            {
                this.addObjectToTileMap(k, _local_8);
            }
            return true;
        }

        public function changeObjectState(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:Number;
            var _local_6:int;
            var _local_7:IStuffData;
            var _local_8:RoomObjectDataUpdateMessage;
            var _local_4:IRoomObjectController = this.getObject(this.getRoomIdentifier(k), _arg_2, _arg_3);
            if (((!(_local_4 == null)) && (!(_local_4.getModelController() == null))))
            {
                _local_5 = _local_4.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX);
                if (isNaN(_local_5))
                {
                    _local_5 = 1;
                }
                else
                {
                    _local_5 = (_local_5 + 1);
                }
                _local_4.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX, _local_5);
                _local_6 = _local_4.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT);
                _local_7 = StuffDataFactory._Str_6438(_local_6);
                _local_7.initializeFromRoomObjectModel(_local_4.getModel());
                _local_8 = new RoomObjectDataUpdateMessage(_local_5, _local_7);
                if (_local_4.getEventHandler() != null)
                {
                    _local_4.getEventHandler().processUpdateMessage(_local_8);
                }
            }
        }

        public function changeObjectModelData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int):Boolean
        {
            var _local_7:RoomObjectModelDataUpdateMessage;
            var _local_6:IRoomObjectController = this.getObject(this.getRoomIdentifier(k), _arg_2, _arg_3);
            if (_local_6 == null)
            {
                return false;
            }
            if (((!(_local_6 == null)) && (!(_local_6.getEventHandler() == null))))
            {
                _local_7 = new RoomObjectModelDataUpdateMessage(_arg_4, _arg_5);
                _local_6.getEventHandler().processUpdateMessage(_local_7);
            }
            return true;
        }

        public function updateObjectFurniture(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:IStuffData, _arg_7:Number=NaN):Boolean
        {
            var _local_8:IRoomObjectController = this.getObjectFurniture(k, _arg_2);
            if (_local_8 == null)
            {
                return false;
            }
            var _local_9:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, _arg_4);
            var _local_10:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(_arg_5, _arg_6, _arg_7);
            if (((!(_local_8 == null)) && (!(_local_8.getEventHandler() == null))))
            {
                _local_8.getEventHandler().processUpdateMessage(_local_9);
                _local_8.getEventHandler().processUpdateMessage(_local_10);
            }
            return true;
        }

        public function updateObjectFurnitureHeight(k:int, _arg_2:int, _arg_3:Number):Boolean
        {
            var _local_5:RoomObjectHeightUpdateMessage;
            var _local_4:IRoomObjectController = this.getObjectFurniture(k, _arg_2);
            if (_local_4 == null)
            {
                return false;
            }
            if (((!(_local_4 == null)) && (!(_local_4.getEventHandler() == null))))
            {
                _local_5 = new RoomObjectHeightUpdateMessage(null, null, _arg_3);
                _local_4.getEventHandler().processUpdateMessage(_local_5);
            }
            return true;
        }

        public function updateObjectFurnitureLocation(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d):Boolean
        {
            var _local_6:RoomObjectMoveUpdateMessage;
            var _local_5:IRoomObjectController = this.getObjectFurniture(k, _arg_2);
            if (_local_5 == null)
            {
                return false;
            }
            if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
            {
                _local_6 = new RoomObjectMoveUpdateMessage(_arg_3, _arg_4, null, (!(_arg_4 == null)));
                _local_5.getEventHandler().processUpdateMessage(_local_6);
            }
            return true;
        }

        public function updateObjectFurnitureExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectFurniture(k, _arg_2);
            if (_local_4 == null)
            {
                return false;
            }
            _local_4.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRY_TIME, _arg_3);
            _local_4.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRTY_TIMESTAMP, getTimer());
            return true;
        }

        private function createObjectFurniture(k:int, _arg_2:int, _arg_3:String):IRoomObjectController
        {
            var _local_4:int = RoomObjectCategoryEnum.CONST_10;
            var _local_5:IRoomObjectController = this.createObject(this.getRoomIdentifier(k), _arg_2, _arg_3, _local_4);
            return _local_5;
        }

        private function getObjectFurniture(k:int, _arg_2:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), _arg_2, RoomObjectCategoryEnum.CONST_10);
        }

        public function disposeObjectFurniture(k:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void
        {
            var _local_6:IRoomObject;
            var _local_7:Point;
            var _local_8:IRoomObjectModel;
            var _local_9:Boolean;
            var _local_10:int;
            var _local_11:String;
            var _local_12:int;
            var _local_13:IStuffData;
            var _local_14:BitmapData;
            var _local_5:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_5 != null)
            {
                _local_5.getFurnitureDataWithId(_arg_2);
            }
            if ((((this._sessionDataManager) && (_arg_3 == this._sessionDataManager.userId)) && (!(_Str_6093._Str_7070(_arg_2)))))
            {
                _local_6 = this.getRoomObject(k, _arg_2, RoomObjectCategoryEnum.CONST_10);
                if (_local_6)
                {
                    _local_7 = this.getRoomObjectScreenLocation(k, _arg_2, RoomObjectCategoryEnum.CONST_10, this._activeRoomActiveCanvas);
                    if (_local_7)
                    {
                        _local_8 = _local_6.getModel();
                        _local_9 = (_local_8.getNumber(RoomObjectVariableEnum.FURNITURE_DISABLE_PICKING_ANIMATION) == 1);
                        if (!_local_9)
                        {
                            _local_10 = _local_8.getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                            _local_11 = _local_8.getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                            _local_12 = _local_8.getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT);
                            _local_13 = StuffDataFactory._Str_6438(_local_12);
                            _local_14 = this.getFurnitureIcon(_local_10, null, _local_11, _local_13).data;
                            if (_local_14)
                            {
                                this._toolbar.createTransitionToIcon(HabboToolbarIconEnum.INVENTORY, _local_14, _local_7.x, _local_7.y);
                            }
                        }
                    }
                }
            }
            this.disposeObject(k, _arg_2, RoomObjectCategoryEnum.CONST_10);
            this.removeButtonMouseCursorOwner(k, RoomObjectCategoryEnum.CONST_10, _arg_2);
            if (_arg_4)
            {
                this.refreshTileObjectMap(k, "RoomEngine.disposeObjectFurniture()");
            }
        }

        public function addObjectWallItem(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, _arg_10:String="", _arg_11:int=-1, _arg_12:Boolean=true):Boolean
        {
            var _local_14:LegacyStuffData;
            var _local_15:FurnitureData;
            var _local_13:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_13 != null)
            {
                _local_14 = new LegacyStuffData();
                _local_14.setString(_arg_7);
                _local_15 = new FurnitureData(_arg_2, _arg_3, null, _arg_4, _arg_5, _arg_6, _local_14, NaN, _arg_11, _arg_8, _arg_9, _arg_10, true, _arg_12);
                _local_13.addWallItemData(_local_15);
            }
            return true;
        }

        private function addObjectWallItemFromData(k:int, _arg_2:int, _arg_3:FurnitureData):Boolean
        {
            var _local_10:RoomInstanceData;
            if (_arg_3 == null)
            {
                _local_10 = this.getRoomInstanceData(k);
                if (_local_10 != null)
                {
                    _arg_3 = _local_10.getWallItemDataWithId(_arg_2);
                }
            }
            if (_arg_3 == null)
            {
                return false;
            }
            var _local_4:String = "";
            if (_arg_3.data != null)
            {
                _local_4 = _arg_3.data.getLegacyString();
            }
            var _local_5:String = this.getWallItemType(_arg_3.typeId, _local_4);
            var _local_6:int = this.getWallItemColorIndex(_arg_3.typeId);
            var _local_7:String = this.getRoomObjectAdURL(_local_5);
            if (_local_5 == null)
            {
                _local_5 = "";
            }
            var _local_8:IRoomObjectController = this.createObjectWallItem(k, _arg_2, _local_5);
            if (_local_8 == null)
            {
                return false;
            }
            if (((!(_local_8 == null)) && (!(_local_8.getModelController() == null))))
            {
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_COLOR, _local_6, false);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID, _arg_3.typeId, true);
                _local_8.getModelController().setString(RoomObjectVariableEnum.FURNITURE_AD_URL, _local_7, true);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT, ((_arg_3.realRoomObject) ? 1 : 0), false);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.OBJECT_ACCURATE_Z_VALUE, 1, true);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_USAGE_POLICY, _arg_3.usagePolicy);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRY_TIME, _arg_3.expiryTime);
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRTY_TIMESTAMP, getTimer());
                _local_8.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID, _arg_3.ownerId);
                _local_8.getModelController().setString(RoomObjectVariableEnum.FURNITURE_OWNER_NAME, _arg_3.ownerName);
            }
            _local_4 = "";
            if (_arg_3.data != null)
            {
                _local_4 = _arg_3.data.getLegacyString();
            }
            if (!this.updateObjectWallItem(k, _arg_2, _arg_3.loc, _arg_3.dir, _arg_3.state, _local_4))
            {
                return false;
            }
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.ADDED, k, _arg_2, RoomObjectCategoryEnum.CONST_20));
            }
            var _local_9:ISelectedRoomObjectData = this.getPlacedObjectData(k);
            if ((((_local_9) && (_local_9.id == _arg_2)) && (_local_9.category == RoomObjectCategoryEnum.CONST_20)))
            {
                this._Str_5538(k, _arg_2, RoomObjectCategoryEnum.CONST_20);
            }
            return true;
        }

        public function updateObjectWallItem(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean
        {
            var _local_7:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_7 == null)
            {
                return false;
            }
            var _local_8:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, _arg_4);
            var _local_9:LegacyStuffData = new LegacyStuffData();
            _local_9.setString(_arg_6);
            var _local_10:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(_arg_5, _local_9);
            if (((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))))
            {
                _local_7.getEventHandler().processUpdateMessage(_local_8);
                _local_7.getEventHandler().processUpdateMessage(_local_10);
            }
            this.updateObjectRoomWindow(k, _arg_2);
            return true;
        }

        public function updateObjectRoomWindow(k:int, _arg_2:int, _arg_3:Boolean=true):void
        {
            var _local_8:String;
            var _local_9:IVector3d;
            var _local_4:String = ((RoomObjectCategoryEnum.CONST_20 + "_") + _arg_2);
            var _local_5:RoomObjectRoomMaskUpdateMessage;
            var _local_6:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_6 != null)
            {
                if (_local_6.getModel() != null)
                {
                    if (_local_6.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_USES_PLANE_MASK) > 0)
                    {
                        _local_8 = _local_6.getModel().getString(RoomObjectVariableEnum.FURNITURE_PLANE_MASK_TYPE);
                        _local_9 = _local_6.getLocation();
                        if (_arg_3)
                        {
                            _local_5 = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.RORMUM_ADD_MASK, _local_4, _local_8, _local_9);
                        }
                        else
                        {
                            _local_5 = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.REMOVE_MASK, _local_4);
                        }
                    }
                }
            }
            else
            {
                _local_5 = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.REMOVE_MASK, _local_4);
            }
            var _local_7:IRoomObjectController = this.getObjectRoom(k);
            if ((((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))) && (!(_local_5 == null))))
            {
                _local_7.getEventHandler().processUpdateMessage(_local_5);
            }
        }

        public function updateObjectUserFlatControl(k:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_4 == null)
            {
                return false;
            }
            var _local_5:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(_arg_3);
            if (((!(_local_4 == null)) && (!(_local_4.getEventHandler() == null))))
            {
                _local_4.getEventHandler().processUpdateMessage(_local_5);
            }
            return true;
        }

        private function createObjectWallItem(k:int, _arg_2:int, _arg_3:String):IRoomObjectController
        {
            var _local_4:int = RoomObjectCategoryEnum.CONST_20;
            var _local_5:IRoomObjectController = this.createObject(this.getRoomIdentifier(k), _arg_2, _arg_3, _local_4);
            return _local_5;
        }

        private function getObjectWallItem(k:int, _arg_2:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), _arg_2, RoomObjectCategoryEnum.CONST_20);
        }

        public function updateObjectWallItemLocation(k:int, _arg_2:int, _arg_3:IVector3d):Boolean
        {
            var _local_5:RoomObjectMoveUpdateMessage;
            var _local_4:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_4 == null)
            {
                return false;
            }
            if (_local_4.getEventHandler() != null)
            {
                _local_5 = new RoomObjectMoveUpdateMessage(_arg_3, null, null);
                _local_4.getEventHandler().processUpdateMessage(_local_5);
            }
            this.updateObjectRoomWindow(k, _arg_2);
            return true;
        }

        public function updateObjectWallItemExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_4 == null)
            {
                return false;
            }
            _local_4.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRY_TIME, _arg_3);
            _local_4.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_EXPIRTY_TIMESTAMP, getTimer());
            return true;
        }

        public function disposeObjectWallItem(k:int, _arg_2:int, _arg_3:int=-1):void
        {
            var _local_5:IRoomObject;
            var _local_6:Point;
            var _local_7:IRoomObjectModel;
            var _local_8:int;
            var _local_9:String;
            var _local_10:BitmapData;
            var _local_4:RoomInstanceData = this.getRoomInstanceData(k);
            if (_local_4 != null)
            {
                _local_4.getWallItemDataWithId(_arg_2);
            }
            if ((((this._sessionDataManager) && (_arg_3 == this._sessionDataManager.userId)) && (!(_Str_6093._Str_7070(_arg_2)))))
            {
                _local_5 = this.getRoomObject(k, _arg_2, RoomObjectCategoryEnum.CONST_20);
                if ((((_local_5) && (_local_5.getType().indexOf("post_it") == -1)) && (_local_5.getType().indexOf("external_image_wallitem") == -1)))
                {
                    _local_6 = this.getRoomObjectScreenLocation(k, _arg_2, RoomObjectCategoryEnum.CONST_20, this._activeRoomActiveCanvas);
                    _local_7 = _local_5.getModel();
                    _local_8 = _local_7.getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                    _local_9 = _local_7.getString(RoomObjectVariableEnum.FURNITURE_DATA);
                    _local_10 = this.getWallItemIcon(_local_8, null, _local_9).data;
                    if (((this._toolbar) && (_local_6)))
                    {
                        this._toolbar.createTransitionToIcon(HabboToolbarIconEnum.INVENTORY, _local_10, _local_6.x, _local_6.y);
                    }
                }
            }
            this.disposeObject(k, _arg_2, RoomObjectCategoryEnum.CONST_20);
            this.updateObjectRoomWindow(k, _arg_2, false);
            this.removeButtonMouseCursorOwner(k, RoomObjectCategoryEnum.CONST_20, _arg_2);
        }

        public function addObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean
        {
            var _local_10:RoomObjectUpdateMessage;
            var _local_11:RoomObjectAvatarFigureUpdateMessage;
            if (this.getObjectUser(k, _arg_2) != null)
            {
                return false;
            }
            var _local_8:String = RoomObjectUserTypes.getName(_arg_6);
            if (_local_8 == RoomObjectUserTypes.PET)
            {
                _local_8 = this.getPetType(_arg_7);
            }
            var _local_9:IRoomObjectController = this._Str_25379(k, _arg_2, _local_8);
            if (_local_9 == null)
            {
                return false;
            }
            if (((!(_local_9 == null)) && (!(_local_9.getEventHandler() == null))))
            {
                _local_10 = new RoomObjectAvatarUpdateMessage(this.fixedUserLocation(k, _arg_3), null, _arg_4, _arg_5, false, 0);
                _local_9.getEventHandler().processUpdateMessage(_local_10);
                if (_arg_7 != null)
                {
                    _local_11 = new RoomObjectAvatarFigureUpdateMessage(_arg_7);
                    _local_9.getEventHandler().processUpdateMessage(_local_11);
                }
            }
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.ADDED, k, _arg_2, RoomObjectCategoryEnum.CONST_100));
            }
            return true;
        }

        public function updateObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean
        {
            var _local_9:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if ((((_local_9 == null) || (_local_9.getEventHandler() == null)) || (_local_9.getModel() == null)))
            {
                return false;
            }
            if (_arg_3 == null)
            {
                _arg_3 = _local_9.getLocation();
            }
            if (_arg_7 == null)
            {
                _arg_7 = _local_9.getDirection();
            }
            if (isNaN(_arg_8))
            {
                _arg_8 = _local_9.getModel().getNumber(RoomObjectVariableEnum.HEAD_DIRECTION);
            }
            var _local_10:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(this.fixedUserLocation(k, _arg_3), this.fixedUserLocation(k, _arg_4), _arg_7, _arg_8, _arg_5, _arg_6);
            _local_9.getEventHandler().processUpdateMessage(_local_10);
            if ((((this.roomSessionManager) && (this.roomSessionManager.getSession(k))) && (_arg_2 == this.roomSessionManager.getSession(k)._Str_3871)))
            {
                this._roomObjectFactory.events.dispatchEvent(new RoomToObjectOwnAvatarMoveEvent(RoomToObjectOwnAvatarMoveEvent.ROAME_MOVE_TO, _arg_4));
            }
            return true;
        }

        public function updateObjectPetGesture(k:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return false;
            }
            var _local_5:RoomObjectUpdateStateMessage = new RoomObjectAvatarFlatControlUpdateMessage(_arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return true;
        }

        public function updateObjectUserOwnUserAvatar(k:int, _arg_2:int):Boolean
        {
            var _local_3:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_3 == null) || (_local_3.getEventHandler() == null)))
            {
                return false;
            }
            var _local_4:RoomObjectUpdateMessage = new RoomObjectAvatarOwnMessage();
            _local_3.getEventHandler().processUpdateMessage(_local_4);
            return true;
        }

        public function updateObjectUserFigure(k:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean
        {
            var _local_7:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_7 == null) || (_local_7.getEventHandler() == null)))
            {
                return false;
            }
            var _local_8:RoomObjectUpdateStateMessage = new RoomObjectAvatarFigureUpdateMessage(_arg_3, _arg_4, _arg_5, _arg_6);
            _local_7.getEventHandler().processUpdateMessage(_local_8);
            return true;
        }

        public function updateObjectUserAction(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean
        {
            var _local_6:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return false;
            }
            var _local_7:RoomObjectUpdateStateMessage;
            switch (_arg_3)
            {
                case RoomObjectVariableEnum.FIGURE_TALK:
                    _local_7 = new RoomObjectAvatarChatUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_SLEEP:
                    _local_7 = new RoomObjectAvatarSleepUpdateMessage((!(_arg_4 == 0)));
                    break;
                case RoomObjectVariableEnum.FIGURE_IS_TYPING:
                    _local_7 = new RoomObjectAvatarTypingUpdateMessage((!(_arg_4 == 0)));
                    break;
                case RoomObjectVariableEnum.FIGURE_IS_MUTED:
                    _local_7 = new RoomObjectAvatarMutedUpdateMessage((!(_arg_4 == 0)));
                    break;
                case RoomObjectVariableEnum.FIGURE_CARRY_OBJECT:
                    _local_7 = new RoomObjectAvatarCarryObjectUpdateMessage(_arg_4, _arg_5);
                    break;
                case RoomObjectVariableEnum.FIGURE_USE_OBJECT:
                    _local_7 = new RoomObjectAvatarUseObjectUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_DANCE:
                    _local_7 = new RoomObjectAvatarDanceUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_GAINED_EXPERIENCE:
                    _local_7 = new RoomObjectAvatarExperienceUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_NUMBER_VALUE:
                    _local_7 = new RoomObjectAvatarPlayerValueUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_SIGN:
                    _local_7 = new RoomObjectAvatarSignUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_EXPRESSION:
                    _local_7 = new RoomObjectAvatarExpressionUpdateMessage(_arg_4);
                    break;
                case RoomObjectVariableEnum.FIGURE_IS_PLAYING_GAME:
                    _local_7 = new RoomObjectAvatarPlayingGameMessage((!(_arg_4 == 0)));
                    break;
                case RoomObjectVariableEnum.FIGURE_GUIDE_STATUS:
                    _local_7 = new RoomObjectAvatarGuideStatusUpdateMessage(_arg_4);
                    break;
            }
            _local_6.getEventHandler().processUpdateMessage(_local_7);
            return true;
        }

        public function updateObjectUserPosture(k:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean
        {
            var _local_5:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return false;
            }
            var _local_6:RoomObjectUpdateStateMessage = new RoomObjectAvatarPostureUpdateMessage(_arg_3, _arg_4);
            _local_5.getEventHandler().processUpdateMessage(_local_6);
            return true;
        }

        public function updateObjectUserGesture(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return false;
            }
            var _local_5:RoomObjectUpdateStateMessage = new RoomObjectAvatarGestureUpdateMessage(_arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return true;
        }

        public function _Str_19224(k:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_4:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return false;
            }
            var _local_5:RoomObjectUpdateStateMessage = new RoomObjectAvatarPetGestureUpdateMessage(_arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return true;
        }

        public function updateObjectUserEffect(k:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean
        {
            var _local_5:IRoomObjectController = this.getObjectUser(k, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return false;
            }
            _local_5.getEventHandler().processUpdateMessage(new RoomObjectAvatarEffectUpdateMessage(_arg_3, _arg_4));
            return true;
        }

        private function _Str_25379(k:int, _arg_2:int, _arg_3:String, _arg_4:int=RoomObjectCategoryEnum.CONST_100):IRoomObjectController
        {
            var _local_5:IRoomObjectController = this.createObject(this.getRoomIdentifier(k), _arg_2, _arg_3, _arg_4);
            return _local_5;
        }

        private function getObjectUser(k:int, _arg_2:int):IRoomObjectController
        {
            return this.getObject(this.getRoomIdentifier(k), _arg_2, RoomObjectCategoryEnum.CONST_100);
        }

        public function disposeObjectUser(k:int, _arg_2:int):void
        {
            this.disposeObject(k, _arg_2, RoomObjectCategoryEnum.CONST_100);
        }

        private function createObject(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObjectController
        {
            var _local_5:IRoomInstance = this._roomManager.getRoom(k);
            if (_local_5 == null)
            {
                return null;
            }
            var _local_6:IRoomObjectController;
            _local_6 = (_local_5.createRoomObject(_arg_2, _arg_3, _arg_4) as IRoomObjectController);
            return _local_6;
        }

        private function getObject(k:String, _arg_2:int, _arg_3:int):IRoomObjectController
        {
            var _local_4:IRoomInstance;
            if (this._roomManager != null)
            {
                _local_4 = this._roomManager.getRoom(k);
            }
            if (_local_4 == null)
            {
                return null;
            }
            var _local_5:IRoomObjectController;
            _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
            if (_local_5 == null)
            {
                if (_arg_3 == RoomObjectCategoryEnum.CONST_10)
                {
                    this.addObjectFurnitureFromData(this.getRoomId(k), _arg_2, null);
                    _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
                }
                else
                {
                    if (_arg_3 == RoomObjectCategoryEnum.CONST_20)
                    {
                        this.addObjectWallItemFromData(this.getRoomId(k), _arg_2, null);
                        _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
                    }
                }
            }
            return _local_5;
        }

        private function disposeObject(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:IRoomInstance;
            if (this._roomManager != null)
            {
                _local_4 = this.getRoom(k);
                if (_local_4 == null)
                {
                    return;
                }
                if (_local_4.disposeObject(_arg_2, _arg_3))
                {
                    if (events != null)
                    {
                        events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.REMOVED, k, _arg_2, _arg_3));
                    }
                }
            }
        }

        private function roomObjectEventHandler(k:RoomObjectEvent):void
        {
            var _local_2:String;
            var _local_3:int;
            if (this._roomObjectEventHandler != null)
            {
                _local_2 = this.getRoomObjectRoomIdentifier(k.object);
                if (_local_2 != null)
                {
                    _local_3 = this.getRoomId(_local_2);
                    this._roomObjectEventHandler.handleRoomObjectEvent(k, _local_3);
                }
            }
        }

        private function getRoomObjectRoomIdentifier(k:IRoomObject):String
        {
            if (((!(k == null)) && (!(k.getModel() == null))))
            {
                return k.getModel().getString(RoomObjectVariableEnum.OBJECT_ROOM_ID);
            }
            return null;
        }

        public function _Str_19272(roomId:int, canvasId:int, fileName:String):void
        {
            var encoded:ByteArray;
            var file:FileReference;
            var date:Date;
            var timeStamp:String;
            var p:RegExp = /[:\/\\\*\?"<>\|%]/g;
            fileName = fileName.replace(p, "");
            var roomCanvas:IRoomRenderingCanvas = this.getRoomCanvas(roomId, canvasId);
            if (!roomCanvas)
            {
                return;
            }
            var bmp:BitmapData = roomCanvas._Str_21425();
            if (PlayerVersionCheck.isVersionAtLeast(11, 3))
            {
            }
            if (encoded == null)
            {
                encoded = PNGEncoder.encode(bmp);
            }
            try
            {
                file = new FileReference();
                file.save(encoded, fileName);
            }
            catch(error:Error)
            {
                date = new Date();
                timeStamp = (([date.getFullYear(), date.getMonth(), date.getDate()].join("-") + " ") + [date.getHours(), date.getMinutes(), date.getSeconds()].join("."));
                fileName = ("Habbo " + timeStamp);
                file = new FileReference();
                file.save(encoded, fileName);
            }
        }

        public function _Str_24060(k:int):String
        {
            var _local_2:String;
            var _local_3:String = "";
            if (this._roomContentLoader != null)
            {
                _local_2 = this._roomContentLoader.getActiveObjectType(k);
                _local_3 = String(this._roomContentLoader.getActiveObjectColorIndex(k));
            }
            return this._roomContentLoader._Str_21771(_local_2, _local_3);
        }

        public function getFurnitureIcon(k:int, _arg_2:IGetImageListener, _arg_3:String=null, _arg_4:IStuffData=null):ImageResult
        {
            return this.getFurnitureImage(k, new Vector3d(), 1, _arg_2, 0, _arg_3, -1, -1, _arg_4);
        }

        public function _Str_22347(k:int, _arg_2:String=null):String
        {
            var _local_3:String;
            var _local_4:String = "";
            if (this._roomContentLoader != null)
            {
                _local_3 = this._roomContentLoader.getWallItemType(k, _arg_2);
                _local_4 = String(this._roomContentLoader.getWallItemColorIndex(k));
            }
            return this._roomContentLoader._Str_21771(_local_3, _local_4);
        }

        public function getWallItemIcon(k:int, _arg_2:IGetImageListener, _arg_3:String=null):ImageResult
        {
            return this.getWallItemImage(k, new Vector3d(), 1, _arg_2, 0, _arg_3);
        }

        public function getFurnitureImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:IStuffData=null):ImageResult
        {
            var _local_10:String;
            var _local_11:String = "";
            if (this._roomContentLoader != null)
            {
                _local_10 = this._roomContentLoader.getActiveObjectType(k);
                _local_11 = String(this._roomContentLoader.getActiveObjectColorIndex(k));
            }
            if (((_arg_3 == 1) && (!(_arg_4 == null))))
            {
                return this._Str_22095(_local_10, _local_11, _arg_4, _arg_6, _arg_9);
            }
            return this.getGenericRoomObjectImage(_local_10, _local_11, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_9, _arg_7, _arg_8);
        }

        public function getPetImage(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:IGetImageListener, _arg_7:Boolean=true, _arg_8:uint=0, _arg_9:Array=null, _arg_10:String=null):ImageResult
        {
            var _local_13:PetCustomPart;
            var _local_11:String;
            var _local_12:String = ((((k + " ") + _arg_2) + " ") + _arg_3.toString(16));
            if (!_arg_7)
            {
                _local_12 = (_local_12 + (" " + "head"));
            }
            if (_arg_9 != null)
            {
                _local_12 = (_local_12 + (" " + _arg_9.length));
                for each (_local_13 in _arg_9)
                {
                    _local_12 = (_local_12 + (((((" " + _local_13._Str_11008) + " ") + _local_13._Str_1502) + " ") + _local_13.paletteId));
                }
            }
            if (this._roomContentLoader != null)
            {
                _local_11 = this._roomContentLoader.getPetType(k);
            }
            return this.getGenericRoomObjectImage(_local_11, _local_12, _arg_4, _arg_5, _arg_6, _arg_8, null, null, -1, -1, _arg_10);
        }

        public function getWallItemImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1):ImageResult
        {
            var _local_9:String;
            var _local_10:String = "";
            if (this._roomContentLoader != null)
            {
                _local_9 = this._roomContentLoader.getWallItemType(k, _arg_6);
                _local_10 = String(this._roomContentLoader.getWallItemColorIndex(k));
            }
            if (((_arg_3 == 1) && (!(_arg_4 == null))))
            {
                return this._Str_22095(_local_9, _local_10, _arg_4, _arg_6, null);
            }
            return this.getGenericRoomObjectImage(_local_9, _local_10, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, null, _arg_7, _arg_8);
        }

        public function getRoomImage(k:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:IGetImageListener, _arg_6:String=null):ImageResult
        {
            if (k == null)
            {
                k = "";
            }
            if (_arg_2 == null)
            {
                _arg_2 = "";
            }
            if (_arg_3 == null)
            {
                _arg_3 = "";
            }
            var _local_7:String = ROOM;
            var _local_8:* = (((((k + "\n") + _arg_2) + "\n") + _arg_3) + "\n");
            if (_arg_6 != null)
            {
                _local_8 = (_local_8 + _arg_6);
            }
            return this.getGenericRoomObjectImage(_local_7, _local_8, new Vector3d(), _arg_4, _arg_5);
        }

        public function getRoomObjectImage(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:IGetImageListener, _arg_7:uint=0):ImageResult
        {
            var _local_10:String;
            var _local_15:IRoomObject;
            var _local_16:int;
            var _local_8:String;
            var _local_9:String = "";
            var _local_11:IStuffData;
            var _local_12:int = -1;
            var _local_13:String = this.getRoomIdentifier(k);
            var _local_14:IRoomInstance = this._roomManager.getRoom(_local_13);
            if (_local_14 != null)
            {
                _local_15 = _local_14.getObject(_arg_2, _arg_3);
                if (((!(_local_15 == null)) && (!(_local_15.getModel() == null))))
                {
                    _local_8 = _local_15.getType();
                    _local_12 = _local_15.getId();
                    switch (_arg_3)
                    {
                        case RoomObjectCategoryEnum.CONST_10:
                        case RoomObjectCategoryEnum.CONST_20:
                            _local_9 = String(_local_15.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_COLOR));
                            _local_10 = _local_15.getModel().getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                            _local_16 = _local_15.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT);
                            if (_local_16 != LegacyStuffData.FORMAT_KEY)
                            {
                                _local_11 = StuffDataFactory._Str_6438(_local_16);
                                _local_11.initializeFromRoomObjectModel(_local_15.getModel());
                            }
                            break;
                        case RoomObjectCategoryEnum.CONST_100:
                            _local_9 = _local_15.getModel().getString(RoomObjectVariableEnum.FIGURE);
                            break;
                    }
                }
            }
            return this.getGenericRoomObjectImage(_local_8, _local_9, _arg_4, _arg_5, _arg_6, _arg_7, _local_10, _local_11, -1, -1, null, _local_12);
        }

        private function initializeRoomForGettingImage(k:IRoomObjectController, _arg_2:String):void
        {
            var _local_3:Array;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            var _local_8:int;
            var _local_9:RoomPlaneParser;
            var _local_10:int;
            var _local_11:XML;
            var _local_12:int;
            var _local_13:RoomObjectRoomMaskUpdateMessage;
            var _local_14:String;
            if (_arg_2 != null)
            {
                _local_3 = _arg_2.split("\n");
                if (_local_3.length >= 3)
                {
                    _local_4 = _local_3[0];
                    _local_5 = _local_3[1];
                    _local_6 = _local_3[2];
                    _local_7 = _local_3[3];
                    _local_8 = 6;
                    _local_9 = new RoomPlaneParser();
                    _local_9.initializeTileMap((_local_8 + 2), (_local_8 + 2));
                    _local_10 = 1;
                    while (_local_10 < (1 + _local_8))
                    {
                        _local_12 = 1;
                        while (_local_12 < (1 + _local_8))
                        {
                            _local_9._Str_3982(_local_12, _local_10, 0);
                            _local_12++;
                        }
                        _local_10++;
                    }
                    _local_9.wallHeight = _local_8;
                    _local_9.initializeFromTileData();
                    _local_11 = _local_9._Str_5598();
                    k.getEventHandler().initialize(_local_11);
                    k.getModelController().setString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE, _local_4);
                    k.getModelController().setString(RoomObjectVariableEnum.ROOM_WALL_TYPE, _local_5);
                    k.getModelController().setString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE, _local_6);
                    if (_local_7 != null)
                    {
                        _local_13 = null;
                        _local_14 = (RoomObjectCategoryEnum.CONST_20 + "_1");
                        _local_13 = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.RORMUM_ADD_MASK, _local_14, _local_7, new Vector3d(2.5, 0.5, 2));
                        k.getEventHandler().processUpdateMessage(_local_13);
                    }
                    _local_9.dispose();
                }
            }
        }

        public function _Str_22095(type:String, param:String, listener:IGetImageListener, extraData:String=null, stuffData:IStuffData=null):ImageResult
        {
            var assetName:String;
            var imageListeners:Vector.<IGetImageListener>;
            var asset:BitmapDataAsset;
            var bitmap:BitmapData;
            var result:ImageResult = new ImageResult();
            result.id = -1;
            if (((!(this._roomManagerInitialized)) || (type == null)))
            {
                return result;
            }
            var room:IRoomInstance = this._roomManager.getRoom(TEMPORARY_ROOM);
            if (room == null)
            {
                room = this._roomManager.createRoom(TEMPORARY_ROOM, null);
                if (room == null)
                {
                    return result;
                }
            }
            var id:int = this._Str_7020.reserveNumber();
            var category:int = this.getRoomObjectCategory(type);
            if (id < 0)
            {
                return result;
            }
            id = (id + 1);
            result.id = id;
            result.data = null;
            assetName = [type, param].join("_");
            if (((!(assets.hasAsset(assetName))) && (!(listener == null))))
            {
                imageListeners = this._thumbnailCallbacks.getValue(assetName);
                if (imageListeners == null)
                {
                    imageListeners = new Vector.<IGetImageListener>(0);
                    this._thumbnailCallbacks.add(assetName, imageListeners);
                    this._roomContentLoader.loadThumbnailContent(id, type, param, null);
                }
                imageListeners.push(listener);
            }
            else
            {
                asset = (assets.getAssetByName(assetName) as BitmapDataAsset);
                if (((asset) && (!(asset.disposed))))
                {
                    bitmap = (asset.content as BitmapData);
                    try
                    {
                        if (((((!(bitmap == null)) && (bitmap is BitmapData)) && (bitmap.width > 0)) && (bitmap.height > 0)))
                        {
                            result.data = bitmap.clone();
                        }
                        else
                        {
                            Logger.log(("Could not process thumbnail for icon (disposed?): " + assetName));
                        }
                    }
                    catch(error:Error)
                    {
                        Logger.log(("Could not process thumbnail for icon: " + assetName));
                    }
                }
                this._Str_7020.freeNumber((id - 1));
                result.id = 0;
            }
            return result;
        }

        public function getGenericRoomObjectImage(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null, _arg_12:int=-1):ImageResult
        {
            var _local_22:PetFigureData;
            var _local_23:RoomObjectDataUpdateMessage;
            var _local_24:int;
            var _local_13:ImageResult = new ImageResult();
            _local_13.id = -1;
            if (((!(this._roomManagerInitialized)) || (k == null)))
            {
                return _local_13;
            }
            var _local_14:IRoomInstance = this._roomManager.getRoom(TEMPORARY_ROOM);
            if (_local_14 == null)
            {
                _local_14 = this._roomManager.createRoom(TEMPORARY_ROOM, null);
                if (_local_14 == null)
                {
                    return _local_13;
                }
            }
            var _local_15:int = this._imageObjectIdBank.reserveNumber();
            var _local_16:int = this.getRoomObjectCategory(k);
            if (_local_15 < 0)
            {
                return _local_13;
            }
            _local_15 = (_local_15 + 1);
            var _local_17:IRoomObjectController = (_local_14.createRoomObject(_local_15, k, _local_16) as IRoomObjectController);
            if ((((_local_17 == null) || (_local_17.getModelController() == null)) || (_local_17.getEventHandler() == null)))
            {
                return _local_13;
            }
            var _local_18:IRoomObjectModelController = _local_17.getModelController();
            switch (_local_16)
            {
                case RoomObjectCategoryEnum.CONST_10:
                case RoomObjectCategoryEnum.CONST_20:
                    _local_18.setNumber(RoomObjectVariableEnum.FURNITURE_COLOR, int(_arg_2));
                    _local_18.setString(RoomObjectVariableEnum.FURNITURE_EXTRAS, _arg_7);
                    break;
                case RoomObjectCategoryEnum.CONST_100:
                    if (((((k == RoomObjectUserTypes.USER) || (k == RoomObjectUserTypes.BOT)) || (k == RoomObjectUserTypes.RENTABLE_BOT)) || (k == RoomObjectUserTypes.PET)))
                    {
                        _local_18.setString(RoomObjectVariableEnum.FIGURE, _arg_2);
                    }
                    else
                    {
                        _local_22 = new PetFigureData(_arg_2);
                        _local_18.setNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX, _local_22.paletteId);
                        _local_18.setNumber(RoomObjectVariableEnum.PET_COLOR, _local_22.color);
                        if (_local_22.headOnly)
                        {
                            _local_18.setNumber(RoomObjectVariableEnum.PET_HEAD_ONLY, 1);
                        }
                        if (_local_22.hasCustomParts)
                        {
                            _local_18.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_LAYER_IDS, _local_22.customLayerIds);
                            _local_18.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PARTS_IDS, _local_22.customPartIds);
                            _local_18.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PALETTE_IDS, _local_22.customPaletteIds);
                        }
                        if (_arg_11 != null)
                        {
                            _local_18.setString(RoomObjectVariableEnum.FIGURE_POSTURE, _arg_11);
                        }
                    }
                    break;
                case RoomObjectCategoryEnum.CONST_0:
                    this.initializeRoomForGettingImage(_local_17, _arg_2);
                    break;
            }
            _local_17.setDirection(_arg_3);
            var _local_19:IRoomObjectSpriteVisualization;
            _local_19 = (_local_17.getVisualization() as IRoomObjectSpriteVisualization);
            if (_local_19 == null)
            {
                _local_14.disposeObject(_local_15, _local_16);
                return _local_13;
            }
            if (((_arg_9 > -1) || (_arg_8)))
            {
                if (((!(_arg_8 == null)) && (!(_arg_8.getLegacyString() == ""))))
                {
                    _local_23 = new RoomObjectDataUpdateMessage(int(_arg_8.getLegacyString()), _arg_8);
                }
                else
                {
                    _local_23 = new RoomObjectDataUpdateMessage(_arg_9, _arg_8);
                }
                if (_local_17.getEventHandler() != null)
                {
                    _local_17.getEventHandler().processUpdateMessage(_local_23);
                }
            }
            var _local_20:RoomGeometry = new RoomGeometry(_arg_4, new Vector3d(-135, 30, 0), new Vector3d(11, 11, 5));
            _local_19.update(_local_20, 0, true, false);
            if (_arg_10 > 0)
            {
                _local_24 = 0;
                while (_local_24 < _arg_10)
                {
                    _local_19.update(_local_20, 0, true, false);
                    _local_24++;
                }
            }
            var _local_21:BitmapData = _local_19.getImage(_arg_6, _arg_12);
            _local_13.data = _local_21;
            _local_13.id = _local_15;
            if (((!(this.isRoomObjectContentAvailable(k))) && (!(_arg_5 == null))))
            {
                this._imageCallbacks.add(String(_local_15), _arg_5);
                _local_18.setNumber(RoomObjectVariableEnum.IMAGE_QUERY_SCALE, _arg_4, true);
            }
            else
            {
                _local_14.disposeObject(_local_15, _local_16);
                this._imageObjectIdBank.freeNumber((_local_15 - 1));
                _local_13.id = 0;
            }
            _local_20.dispose();
            return _local_13;
        }

        public function getRoomObjectBoundingRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Rectangle
        {
            var _local_6:IRoomObject;
            var _local_7:IRoomObjectVisualization;
            var _local_8:Rectangle;
            var _local_9:IRoomRenderingCanvas;
            var _local_10:Number;
            var _local_11:Point;
            var _local_5:IRoomGeometry = this.getRoomCanvasGeometry(k, _arg_4);
            if (_local_5 != null)
            {
                _local_6 = this.getRoomObject(k, _arg_2, _arg_3);
                if (_local_6 != null)
                {
                    _local_7 = _local_6.getVisualization();
                    if (_local_7 != null)
                    {
                        _local_8 = _local_7.boundingRectangle;
                        _local_9 = this.getRoomCanvas(k, _arg_4);
                        _local_10 = ((_local_9) ? _local_9.scale : 1);
                        _local_11 = _local_5.getScreenPoint(_local_6.getLocation());
                        if (_local_11 != null)
                        {
                            _local_8.left = (_local_8.left * _local_10);
                            _local_8.top = (_local_8.top * _local_10);
                            _local_8.width = (_local_8.width * _local_10);
                            _local_8.height = (_local_8.height * _local_10);
                            _local_11.x = (_local_11.x * _local_10);
                            _local_11.y = (_local_11.y * _local_10);
                            _local_8.offset(_local_11.x, _local_11.y);
                            if (_local_9 != null)
                            {
                                _local_8.offset(((_local_9.width / 2) + _local_9._Str_3629), ((_local_9.height / 2) + _local_9._Str_3768));
                                return _local_8;
                            }
                        }
                    }
                }
            }
            return null;
        }

        public function getRoomObjectScreenLocation(k:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):Point
        {
            var _local_6:IRoomObject;
            var _local_7:Point;
            var _local_8:IRoomRenderingCanvas;
            if (_arg_4 == -1)
            {
                _arg_4 = this._activeRoomActiveCanvas;
            }
            var _local_5:IRoomGeometry = this.getRoomCanvasGeometry(k, _arg_4);
            if (_local_5 != null)
            {
                _local_6 = this.getRoomObject(k, _arg_2, _arg_3);
                if (_local_6 != null)
                {
                    _local_7 = _local_5.getScreenPoint(_local_6.getLocation());
                    if (_local_7 != null)
                    {
                        _local_8 = this.getRoomCanvas(k, _arg_4);
                        if (_local_8 != null)
                        {
                            _local_7.x = (_local_7.x * _local_8.scale);
                            _local_7.y = (_local_7.y * _local_8.scale);
                            _local_7.offset(((_local_8.width / 2) + _local_8._Str_3629), ((_local_8.height / 2) + _local_8._Str_3768));
                        }
                        return _local_7;
                    }
                }
            }
            return null;
        }

        public function getActiveRoomBoundingRectangle(k:int):Rectangle
        {
            return this.getRoomObjectBoundingRectangle(this._activeRoomId, OBJECT_ID_ROOM, RoomObjectCategoryEnum.CONST_0, k);
        }

        public function getActiveRoomActiveCanvas():IRoomRenderingCanvas
        {
            var k:IRoomRenderingCanvas = this.getRoomCanvas(this._activeRoomId, this._activeRoomActiveCanvas);
            return k;
        }

        public function isRoomObjectContentAvailable(k:String):Boolean
        {
            return this._roomManager.isContentAvailable(k);
        }

        public function iconLoaded(id:int, assetName:String, success:Boolean):void
        {
            var asset:BitmapDataAsset;
            var bitmap:BitmapData;
            var listener:IGetImageListener;
            if (this._roomContentLoader == null)
            {
                return;
            }
            if (id == -1)
            {
                return;
            }
            this._Str_7020.freeNumber((id - 1));
            var imageListeners:Vector.<IGetImageListener> = this._thumbnailCallbacks.getValue(assetName);
            if (imageListeners != null)
            {
                this._thumbnailCallbacks.remove(assetName);
                asset = (assets.getAssetByName(assetName) as BitmapDataAsset);
                bitmap = (asset.content as BitmapData);
                if (((asset) && (!(asset.disposed))))
                {
                    for each (listener in imageListeners)
                    {
                        if (listener != null)
                        {
                            try
                            {
                                if (((((!(bitmap == null)) && (bitmap is BitmapData)) && (bitmap.width > 0)) && (bitmap.height > 0)))
                                {
                                    listener.imageReady(id, bitmap.clone());
                                }
                                else
                                {
                                    Logger.log(("Could not load thumbnail for icon (disposed?): " + assetName));
                                }
                            }
                            catch(error:Error)
                            {
                                Logger.log(("Could not load thumbnail for icon: " + assetName));
                            }
                        }
                    }
                }
            }
        }

        public function contentLoaded(k:String, _arg_2:Boolean):void
        {
            var _local_9:IRoomObject;
            var _local_10:int;
            var _local_11:BitmapData;
            var _local_12:IRoomObjectSpriteVisualization;
            var _local_13:IGetImageListener;
            var _local_14:Number;
            var _local_3:IRoomInstance = this._roomManager.getRoom(TEMPORARY_ROOM);
            if (_local_3 == null)
            {
                Logger.log(((("No room instance for " + k) + " room: ") + TEMPORARY_ROOM));
                return;
            }
            if (this._roomContentLoader == null)
            {
                return;
            }
            var _local_4:RoomGeometry;
            var _local_5:Number = 0;
            var _local_6:int = this._roomContentLoader.getObjectCategory(k);
            var _local_7:int = _local_3.getObjectCount(_local_6);
            var _local_8:int = (_local_7 - 1);
            while (_local_8 >= 0)
            {
                _local_9 = _local_3.getObjectWithIndex(_local_8, _local_6);
                if ((((!(_local_9 == null)) && (!(_local_9.getModel() == null))) && (_local_9.getType() == k)))
                {
                    _local_10 = _local_9.getId();
                    _local_11 = null;
                    _local_12 = null;
                    _local_12 = (_local_9.getVisualization() as IRoomObjectSpriteVisualization);
                    if (_local_12 != null)
                    {
                        _local_14 = _local_9.getModel().getNumber(RoomObjectVariableEnum.IMAGE_QUERY_SCALE);
                        if (((!(_local_4 == null)) && (!(_local_5 == _local_14))))
                        {
                            _local_4.dispose();
                            _local_4 = null;
                        }
                        if (_local_4 == null)
                        {
                            _local_5 = _local_14;
                            _local_4 = new RoomGeometry(_local_14, new Vector3d(-135, 30, 0), new Vector3d(11, 11, 5));
                        }
                        _local_12.update(_local_4, 0, true, false);
                        _local_11 = _local_12.image;
                    }
                    _local_3.disposeObject(_local_10, _local_6);
                    this._imageObjectIdBank.freeNumber((_local_10 - 1));
                    _local_13 = (this._imageCallbacks.remove(String(_local_10)) as IGetImageListener);
                    if (_local_13 != null)
                    {
                        if (_local_11 != null)
                        {
                            _local_13.imageReady(_local_10, _local_11);
                        }
                        else
                        {
                            _local_13.imageFailed(_local_10);
                        }
                    }
                    else
                    {
                        if (_local_11 != null)
                        {
                            _local_11.dispose();
                        }
                    }
                }
                _local_8--;
            }
            if (_local_4 != null)
            {
                _local_4.dispose();
            }
        }

        public function objectInitialized(k:String, _arg_2:int, _arg_3:int):void
        {
            var _local_6:int;
            var _local_7:IStuffData;
            var _local_8:int;
            var _local_9:RoomObjectDataUpdateMessage;
            var _local_4:int = this.getRoomId(k);
            if (_arg_3 == RoomObjectCategoryEnum.CONST_20)
            {
                this.updateObjectRoomWindow(_local_4, _arg_2);
            }
            var _local_5:IRoomObjectController = (this.getRoomObject(_local_4, _arg_2, _arg_3) as IRoomObjectController);
            if ((((!(_local_5 == null)) && (!(_local_5.getModel() == null))) && (!(_local_5.getEventHandler() == null))))
            {
                if (!isNaN(_local_5.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT)))
                {
                    _local_6 = _local_5.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT);
                    _local_7 = StuffDataFactory._Str_6438(_local_6);
                    _local_7.initializeFromRoomObjectModel(_local_5.getModel());
                    _local_8 = _local_5.getState(0);
                    _local_9 = new RoomObjectDataUpdateMessage(_local_8, _local_7);
                    _local_5.getEventHandler().processUpdateMessage(_local_9);
                }
                if (events != null)
                {
                    events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.CONTENT_UPDATED, _local_4, _arg_2, _arg_3));
                }
            }
            if (k != TEMPORARY_ROOM)
            {
                this.addObjectToTileMap(_local_4, _local_5);
            }
        }

        public function objectsInitialized(k:String):void
        {
            var _local_2:int;
            if (events != null)
            {
                _local_2 = this.getRoomId(k);
                events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.OBJECTS_INITIALIZED, _local_2));
            }
        }

        public function selectAvatar(k:int, _arg_2:int):void
        {
            if (this._roomObjectEventHandler != null)
            {
                this._roomObjectEventHandler.setSelectedAvatar(k, _arg_2, true);
            }
        }

        public function getSelectedAvatarId():int
        {
            if (this._roomObjectEventHandler != null)
            {
                return this._roomObjectEventHandler.getSelectedAvatarId();
            }
            return -1;
        }

        public function _Str_5538(k:int, _arg_2:int, _arg_3:int):void
        {
            if (this._roomObjectEventHandler == null)
            {
                return;
            }
            this._roomObjectEventHandler.setSelectedObject(k, _arg_2, _arg_3);
        }

        protected function addObjectToTileMap(k:int, _arg_2:IRoomObject):void
        {
            var _local_3:TileObjectMap = this.getRoomInstanceData(k).tileObjectMap;
            if (_local_3)
            {
                _local_3.addRoomObject(_arg_2);
            }
        }

        public function refreshTileObjectMap(k:int, _arg_2:String):void
        {
            var _local_3:TileObjectMap = this.getRoomInstanceData(k).tileObjectMap;
            if (_local_3)
            {
                _local_3.populate(this.getRoomObjects(k, RoomObjectCategoryEnum.CONST_10));
            }
        }

        private function showRoomAd(k:AdEvent):void
        {
            var _local_2:IRoomObjectController;
            var _local_3:RoomObjectRoomAdUpdateMessage;
            if (this._roomContentLoader != null)
            {
                _local_2 = this.getObjectRoom(k.roomId);
                if (_local_2 == null)
                {
                    return;
                }
                _local_3 = null;
                _local_3 = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.RORUM_ROOM_AD_ACTIVATE, RoomObjectVariableEnum.ROOM_AD_IMAGE_ASSET, k.clickUrl);
                _local_2.getEventHandler().processUpdateMessage(_local_3);
            }
        }

        public function _Str_20364(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void
        {
            if (this._adManager != null)
            {
                this._adManager.loadRoomAdImage(k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        private function onRoomAdImageLoaded(k:AdEvent):void
        {
            var _local_4:RoomObjectRoomAdUpdateMessage;
            var _local_2:IRoomObjectController = this.getObjectRoom(k.roomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomObjectController = this.getObjectFurniture(k.roomId, k.objectId);
            if (((_local_3 == null) || (_local_3.getEventHandler() == null)))
            {
                return;
            }
            if (k.image != null)
            {
                this._roomContentLoader._Str_16696(_local_3.getType(), k.imageUrl, k.image, true);
            }
            switch (k.type)
            {
                case AdEvent.ROOM_AD_IMAGE_LOADED:
                    _local_4 = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.RORUM_ROOM_BILLBOARD_IMAGE_LOADED, k.imageUrl, k.clickUrl, k.objectId, k.image);
                    break;
                case AdEvent.ROOM_AD_IMAGE_LOADING_FAILED:
                    _local_4 = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.RORUM_ROOM_BILLBOARD_IMAGE_LOADING_FAILED, k.imageUrl, k.clickUrl, k.objectId, k.image);
                    break;
            }
            if (_local_4 != null)
            {
                _local_3.getEventHandler().processUpdateMessage(_local_4);
            }
        }

        public function insertContentLibrary(k:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean
        {
            return this._roomContentLoader.insertObjectContent(k, _arg_2, _arg_3);
        }

        public function setActiveObjectType(k:int, _arg_2:String):void
        {
            this._roomContentLoader.setActiveObjectType(k, _arg_2);
        }

        override public function purge():void
        {
            super.purge();
            if (this._roomContentLoader)
            {
                this._roomContentLoader.purge();
            }
        }

        public function requestBadgeImageAsset(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void
        {
            var _local_10:IRoomInstance;
            var _local_11:Array;
            var _local_6:IRoomObjectController;
            if (k == 0)
            {
                _local_10 = this._roomManager.getRoom(TEMPORARY_ROOM);
                if (_local_10 != null)
                {
                    _local_6 = (_local_10.getObject(_arg_2, _arg_3) as IRoomObjectController);
                }
            }
            else
            {
                _local_6 = this.getObjectFurniture(k, _arg_2);
            }
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return;
            }
            var _local_7:Function = ((_arg_5) ? this._sessionDataManager.getGroupBadgeAssetName : this._sessionDataManager.getBadgeImageAssetName);
            var _local_8:String = _local_7.call(null, _arg_4);
            if (!_local_8)
            {
                _local_8 = "loading_icon";
                if (!this._badgeListenerObjects)
                {
                    this._badgeListenerObjects = new Map();
                }
                if (this._badgeListenerObjects.length == 0)
                {
                    this._sessionDataManager.events.addEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this.onBadgeLoaded);
                }
                _local_11 = this._badgeListenerObjects.getValue(_arg_4);
                if (_local_11 == null)
                {
                    _local_11 = new Array();
                }
                _local_11.push(new RoomObjectBadgeImageAssetListener(_local_6, _arg_5));
                this._badgeListenerObjects[_arg_4] = _local_11;
            }
            else
            {
                this.addBadgeGraphicAssets(_local_6, _arg_4, _arg_5);
            }
            var _local_9:RoomObjectGroupBadgeUpdateMessage = new RoomObjectGroupBadgeUpdateMessage(_arg_4, _local_8);
            if (_local_9 != null)
            {
                _local_6.getEventHandler().processUpdateMessage(_local_9);
            }
        }

        private function addBadgeGraphicAssets(k:IRoomObjectController, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_4:Function = ((_arg_3) ? this._sessionDataManager.getGroupBadgeAssetName : this._sessionDataManager.getBadgeImageAssetName);
            var _local_5:Function = ((_arg_3) ? this._sessionDataManager.getGroupBadgeSmallAssetName : this._sessionDataManager.getBadgeImageSmallAssetName);
            var _local_6:Function = ((_arg_3) ? this._sessionDataManager.getGroupBadgeImage : this._sessionDataManager.getBadgeImage);
            var _local_7:Function = ((_arg_3) ? this._sessionDataManager.getGroupBadgeSmallImage : this._sessionDataManager.getBadgeSmallImage);
            var _local_8:String = String(_local_4.call(null, _arg_2));
            var _local_9:BitmapData = BitmapData(_local_6.call(null, _arg_2));
            this._roomContentLoader._Str_16696(k.getType(), _local_8, _local_9, false);
            var _local_10:String = String(_local_5.call(null, _arg_2));
            var _local_11:BitmapData = _local_7.call(null, _arg_2);
            if (_local_11)
            {
                this._roomContentLoader._Str_16696(k.getType(), _local_10, _local_11, false);
            }
        }

        private function onBadgeLoaded(k:BadgeImageReadyEvent):void
        {
            var _local_4:RoomObjectBadgeImageAssetListener;
            var _local_5:Function;
            var _local_6:RoomObjectGroupBadgeUpdateMessage;
            var _local_2:Array = (this._badgeListenerObjects.getValue(k.badgeId) as Array);
            if (_local_2 == null)
            {
                Logger.log(("Could not find matching objects for group badge asset request " + k.badgeId));
                return;
            }
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                this.addBadgeGraphicAssets(_local_4.object, k.badgeId, _local_4._Str_14095);
                _local_5 = ((_local_4._Str_14095) ? this._sessionDataManager.getGroupBadgeAssetName : this._sessionDataManager.getBadgeImageAssetName);
                _local_6 = new RoomObjectGroupBadgeUpdateMessage(k.badgeId, String(_local_5.call(null, k.badgeId)));
                if (((!(_local_6 == null)) && (!(_local_4.object.getEventHandler() == null))))
                {
                    _local_4.object.getEventHandler().processUpdateMessage(_local_6);
                }
                _local_3++;
            }
            this._badgeListenerObjects.remove(k.badgeId);
            if (this._badgeListenerObjects.length == 0)
            {
                this._sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this.onBadgeLoaded);
            }
        }

        public function get getIsSelectedObjectInValidPosition():Boolean
        {
            if (!this._roomSessionManager)
            {
                return false;
            }
            var k:IRoomSession = this._roomSessionManager.getSession(this._activeRoomId);
            return (k) && (k._Str_5249);
        }

        public function get setIsSelectedObjectInValidPosition():Boolean
        {
            return this._isSelectedObjectInValidPosition;
        }

        public function set setIsSelectedObjectInValidPosition(k:Boolean):void
        {
            this._isSelectedObjectInValidPosition = k;
        }

        public function showUseProductSelection(k:int, _arg_2:int, _arg_3:int=-1):void
        {
            var _local_5:int;
            var _local_4:String;
            if (this._roomContentLoader != null)
            {
                _local_4 = this._roomContentLoader.getActiveObjectType(_arg_2);
                _local_5 = this.getRoomObjectCategory(_local_4);
                events.dispatchEvent(new RoomEngineUseProductEvent(RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY, this._activeRoomId, _arg_3, _local_5, k, _arg_2));
            }
        }

        public function placeSelectedObject(k:int):void
        {
            if (((this._sessionDataManager == null) || (this._roomSessionManager == null)))
            {
                return;
            }
            var _local_2:IRoomSession = this._roomSessionManager.getSession(this._activeRoomId);
            if (_local_2 == null)
            {
                return;
            }
            this.updateObjectUserEffect(this.activeRoomId, _local_2._Str_3871, k);
        }

        public function get playerUnderCursor():int
        {
            return this._playerUnderCursor;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        private function fixedUserLocation(k:int, _arg_2:IVector3d):IVector3d
        {
            if (_arg_2 == null)
            {
                return null;
            }
            var _local_3:FurniStackingHeightMap = this.getFurniStackingHeightMap(k);
            var _local_4:LegacyWallGeometry = this.getLegacyGeometry(k);
            if (((_local_3 == null) || (_local_4 == null)))
            {
                return _arg_2;
            }
            var _local_5:Number = _arg_2.z;
            var _local_6:Number = _local_3._Str_2754(_arg_2.x, _arg_2.y);
            var _local_7:Number = _local_4._Str_2754(_arg_2.x, _arg_2.y);
            if (((Math.abs((_local_5 - _local_6)) < 0.1) && (Math.abs((_local_6 - _local_7)) < 0.1)))
            {
                _local_5 = _local_4.getFloorAltitude(_arg_2.x, _arg_2.y);
            }
            return new Vector3d(_arg_2.x, _arg_2.y, _local_5);
        }

        private function get cameraFollowDuration():int
        {
            return (getBoolean("room.camera.follow_user")) ? 1000 : 0;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function _Str_9972(k:Rectangle, _arg_2:uint, _arg_3:Boolean=false, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:int=-1):IMessageComposer
        {
            var _local_7:IRoomRenderingCanvas;
            if (_arg_6 > -1)
            {
                _local_7 = this.getRoomCanvas(this._activeRoomId, _arg_6);
            }
            else
            {
                _local_7 = this.getActiveRoomActiveCanvas();
            }
            if (!_local_7)
            {
                return null;
            }
            if (_arg_5)
            {
                _local_7._Str_20787();
            }
            var _local_8:int = -1;
            if (((!(_arg_4)) && (!(this._roomSessionManager.getSession(this._activeRoomId) == null))))
            {
                _local_8 = this._roomSessionManager.getSession(this._activeRoomId)._Str_3871;
            }
            var _local_9:SpriteDataCollector = new SpriteDataCollector();
            var _local_10:String = _local_9.getFurniData(k, _local_7, this, _local_8);
            var _local_11:String = _local_9._Str_24177(this);
            var _local_12:Array = _local_9._Str_22985(k, _local_7, this, _arg_2);
            if (_arg_5)
            {
                _local_7._Str_22174();
            }
            if (_arg_3)
            {
                return new RenderRoomThumbnailMessageComposer(_local_12, _local_10, _local_11, this._activeRoomId, this._sessionDataManager._Str_8500);
            }
            return new RenderRoomMessageComposer(_local_12, _local_10, _local_11, this._activeRoomId, this._sessionDataManager._Str_8500);
        }

        public function get _Str_22413():RoomContentLoader
        {
            return this._roomContentLoader;
        }
		
		public function _SafeStr_7811(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean
        {
            var _local_5:String;
            var _local_7:RoomObjectUpdateMessage;
            if (_arg_4 == RoomObjectCategoryEnum.CONST_201)
            {
                _local_5 = RoomObjectLogicEnum.GAME_SNOWBALL;
            }
            else
            {
                if (_arg_4 == RoomObjectCategoryEnum.CONST_202)
                {
                    _local_5 = RoomObjectLogicEnum.GAME_SNOWSPLASH;
                }
            }
            var _local_6:IRoomObjectController = this._Str_25379(k, _arg_2, _local_5, _arg_4);
            if (!_local_6)
            {
                return false;
            }
            if (_local_6.getEventHandler())
            {
                _local_7 = new RoomObjectUpdateMessage(_arg_3, null);
                _local_6.getEventHandler().processUpdateMessage(_local_7);
            }
            return true;
        }
		
        public function _SafeStr_7817(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean
        {
            var _local_5:IRoomObjectController = this.getObject(this.getRoomIdentifier(k), _arg_2, _arg_4);
            var _local_6:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, null);
            _local_5.getEventHandler().processUpdateMessage(_local_6);
            return true;
        }
		
		/*public function updateObjectWallItem(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean
        {
            var _local_7:IRoomObjectController = this.getObjectWallItem(k, _arg_2);
            if (_local_7 == null)
            {
                return false;
            }
            var _local_8:_Str_2359 = new _Str_2359(_arg_3, _arg_4);
            var _local_9:_Str_2664 = new _Str_2664();
            _local_9.setString(_arg_6);
            var _local_10:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(_arg_5, _local_9);
            if (((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))))
            {
                _local_7.getEventHandler().processUpdateMessage(_local_8);
                _local_7.getEventHandler().processUpdateMessage(_local_10);
            }
            this.updateObjectRoomWindow(k, _arg_2);
            return true;
        }
		*/
    }
}
