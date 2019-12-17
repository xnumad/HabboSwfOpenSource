package com.sulake.habbo.ui
{
	import com.sulake.habbo.ui.IRoomWidgetFactory;
	import com.sulake.habbo.ui.IRoomWidgetHandler;
	import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
	import com.sulake.habbo.ui.widget.infobuspolls.VotePollWidgetHandler;
    import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.window.IHabboWindowManager;
	import com.sulake.habbo.room.events.RoomObjectHSLColorEnabledEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.groups.IHabboGroupsManager;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.advertisement.IAdManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.core.window.components.IToolTipWindow;
    import flash.utils.Timer;
    import flash.geom.Rectangle;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotSkillListUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotForceOpenContextMenuEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.friendlist.events._Str_2948;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.ui.widget.IRoomWidget;
    import flash.events.TimerEvent;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotSkillListUpdateParser;
    import com.sulake.habbo.ui.widget.events._Str_5375;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotForceOpenContextMenuParser;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRequestBotForceOpenContextMenuEvent;
    import com.sulake.habbo.ui.widget.events._Str_3227;
    import com.sulake.habbo.ui.handler.ChatWidgetHandler;
    import com.sulake.habbo.ui.handler.PlayListEditorWidgetHandler;
    import com.sulake.habbo.ui.handler.SpamWallPostItWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureRoomLinkHandler;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import com.sulake.habbo.ui.widget.events._Str_3040;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.handler.InfoStandWidgetHandler;
    import com.sulake.habbo.ui.handler.ChatInputWidgetHandler;
    import com.sulake.habbo.ui.handler.MeMenuWidgetHandler;
    import com.sulake.habbo.ui.handler.PlaceholderWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureCreditWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureStickieWidgetHandler;
    import com.sulake.habbo.ui.handler.FurniturePresentWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureTrophyWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureEcotronBoxWidgetHandler;
    import com.sulake.habbo.ui.handler.PetPackageFurniWidgetHandler;
    import com.sulake.habbo.ui.handler.DoorbellWidgetHandler;
    import com.sulake.habbo.ui.handler.RoomQueueWidgetHandler;
    import com.sulake.habbo.ui.handler.LoadingBarWidgetHandler;
    import com.sulake.habbo.ui.handler.PollWidgetHandler;
    import com.sulake.habbo.ui.handler.WordQuizWidgetHandler;
    import com.sulake.habbo.ui.handler.FurniChooserWidgetHandler;
    import com.sulake.habbo.ui.handler.UserChooserWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureDimmerWidgetHandler;
    import com.sulake.habbo.ui.handler.FriendRequestWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureClothingChangeWidgetHandler;
    import com.sulake.habbo.ui.handler.ConversionPointWidgetHandler;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.ui.handler.WelcomeGiftWidgetHandler;
    import com.sulake.habbo.ui.handler.EffectsWidgetHandler;
    import com.sulake.habbo.ui.handler.MannequinWidgetHandler;
    import com.sulake.habbo.ui.handler.ObjectLocationRequestHandler;
    import com.sulake.habbo.ui.handler.CameraWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureBackgroundColorWidgetHandler;
    import com.sulake.habbo.ui.handler.CustomUserNotificationWidgetHandler;
    import com.sulake.habbo.ui.handler._Str_10181;
    import com.sulake.habbo.ui.handler.FriendFurniConfirmWidgetHandler;
    import com.sulake.habbo.ui.handler.FriendFurniEngravingWidgetHandler;
    import com.sulake.habbo.ui.handler.HighScoreFurniWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureInternalLinkHandler;
    import com.sulake.habbo.ui.handler.FurnitureCustomStackHeightWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureYoutubeDisplayWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureRentableSpaceWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureVimeoDisplayWidgetHandler;
    import com.sulake.habbo.ui.handler.ExternalImageWidgetHandler;
    import com.sulake.habbo.ui.handler.UiHelpBubbleWidgetHandler;
    import com.sulake.habbo.ui.handler.RoomThumbnailCameraWidgetHandler;
    import com.sulake.habbo.ui.handler.CraftingWidgetHandler;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetZoomToggleMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events._Str_9973;
    import flash.events.Event;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.habbo.room.events.RoomEngineRoomAdEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.room.utils.RoomId;
    import com.sulake.habbo.ui.widget.events._Str_3345;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.room.utils.RoomGeometry;
    import flash.display.DisplayObject;
    import com.sulake.habbo.room.RoomVariableEnum;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.display.Sprite;
    import flash.display.BlendMode;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.room.utils.ColorConverter;
    import flash.utils.getTimer;
    import com.sulake.core.runtime.Component;
    import flash.filters.BlurFilter;
    import flash.display.BitmapData;
    import flash.display.BitmapDataChannel;
    import flash.filters.DisplacementMapFilterMode;
    import flash.filters.DisplacementMapFilter;
    import flash.filters.BitmapFilter;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.habbo.ui.*;

    public class RoomDesktop implements IRoomDesktop, IRoomWidgetMessageListener, IRoomWidgetHandlerContainer 
    {
        public static const _Str_8876:int = -1;
        private static const _Str_17829:int = 1000;
        private static const _Str_19484:int = 1000;

        private var _events:EventDispatcherWrapper;
        private var _windowManager:IHabboWindowManager = null;
        private var _roomEngine:IRoomEngine = null;
        private var _roomWidgetFactory:IRoomWidgetFactory = null;
        private var _sessionDataManager:ISessionDataManager = null;
        private var _roomSessionManager:IRoomSessionManager = null;
        private var _communicationManager:IHabboCommunicationManager = null;
        private var _avatarRenderManager:IAvatarRenderManager = null;
        private var _friendList:IHabboFriendsList = null;
        private var _inventory:IHabboInventory = null;
        private var _toolbar:IHabboToolbar = null;
        private var _navigator:IHabboNavigator = null;
        private var _messenger:IHabboMessenger = null;
        private var _habboGroupsManager:IHabboGroupsManager = null;
        private var _avatarEditor:IHabboAvatarEditor = null;
        private var _catalog:IHabboCatalog = null;
        private var _adManager:IAdManager = null;
        private var _localization:IHabboLocalizationManager = null;
        private var _habboHelp:IHabboHelp = null;
        private var _connection:IConnection = null;
        private var _moderation:IHabboModeration;
        private var _config:IHabboConfigurationManager;
        private var _soundManager:IHabboSoundManager;
        private var _habboTracking:IHabboTracking;
        private var _userDefinedRoomEvents:IHabboUserDefinedRoomEvents;
        private var _gameManager:IHabboGameManager;
        private var _questEngine:IHabboQuestEngine;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _assets:IAssetLibrary = null;
        private var _session:IRoomSession = null;
        private var _canvasIDs:Array;
        private var _widgets:Map;
        private var _widgetHandlerMessageMap:Map;
        private var _widgetHandlerEventMap:Map;
        private var _updateListeners:Array;
        private var _layoutManager:DesktopLayoutManager;
        private var _roomCanvasWrapper:IDisplayObjectWrapper;
        private var _loadingComplete:Boolean = true;
        private var _pendingResources:Array;
        private var _roomAdTooltip:IToolTipWindow;
        private var _roomColor:uint = 0xFFFFFF;
        private var _zoomTrackingEnabled:Boolean = false;
        private var _zoomChangedMillis:int = 0;
        private var _roomBackgroundColor:uint = 0;
        private var _resizeTimer:Timer;
        private var _roomViewContainerRect:Rectangle;
        private var _botSkillListUpdateMessageEvent:IMessageEvent;
        private var _botForceOpenContextMenuMessageEvent:IMessageEvent;
        private var _pivot:Point;
        private var _scaleFactor:Number = 0;
        private var _mouseWheelSpeed:Number = 0;
        private var _shouldSmartScale:Boolean;

        public function RoomDesktop(k:IRoomSession, _arg_2:IAssetLibrary, _arg_3:IConnection)
        {
            this._canvasIDs = [];
            super();
            this._events = new EventDispatcherWrapper();
            this._session = k;
            this._assets = _arg_2;
            this._connection = _arg_3;
            this._botSkillListUpdateMessageEvent = new BotSkillListUpdateEvent(this._Str_23048);
            this._connection.addMessageEvent(this._botSkillListUpdateMessageEvent);
            this._botForceOpenContextMenuMessageEvent = new BotForceOpenContextMenuEvent(this._Str_25865);
            this._connection.addMessageEvent(this._botForceOpenContextMenuMessageEvent);
            this._widgets = new Map();
            this._widgetHandlerMessageMap = new Map();
            this._widgetHandlerEventMap = new Map();
            this._layoutManager = new DesktopLayoutManager();
            this._Str_16862();
        }

        public function set visible(k:Boolean):void
        {
            if (this._roomCanvasWrapper)
            {
                this._roomCanvasWrapper.visible = k;
            }
        }

        public function get roomSession():IRoomSession
        {
            return this._session;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get events():IEventDispatcher
        {
            return this._events;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get friendList():IHabboFriendsList
        {
            return this._friendList;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get inventory():IHabboInventory
        {
            return ((this._inventory) && (!(this._inventory.disposed))) ? this._inventory : null;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get _Str_17230():IRoomWidgetFactory
        {
            return this._roomWidgetFactory;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get _Str_8097():IHabboGroupsManager
        {
            return this._habboGroupsManager;
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get avatarEditor():IHabboAvatarEditor
        {
            return this._avatarEditor;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function get config():IHabboConfigurationManager
        {
            return this._config;
        }

        public function get _Str_2476():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get messenger():IHabboMessenger
        {
            return this._messenger;
        }

        public function get _Str_15532():IHabboModeration
        {
            return this._moderation;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get habboTracking():IHabboTracking
        {
            return this._habboTracking;
        }

        public function get session():IRoomSession
        {
            return this._session;
        }

        public function get _Str_3479():IHabboGameManager
        {
            return this._gameManager;
        }

        public function get questEngine():IHabboQuestEngine
        {
            return this._questEngine;
        }

        public function get freeFlowChat():IHabboFreeFlowChat
        {
            return this._freeFlowChat;
        }

        public function get _Str_14394():uint
        {
            return this._roomBackgroundColor;
        }

        public function set catalog(k:IHabboCatalog):void
        {
            this._catalog = k;
        }

        public function set avatarEditor(k:IHabboAvatarEditor):void
        {
            this._avatarEditor = k;
        }

        public function set _Str_17230(k:IRoomWidgetFactory):void
        {
            this._roomWidgetFactory = k;
        }

        public function set sessionDataManager(k:ISessionDataManager):void
        {
            this._sessionDataManager = k;
        }

        public function set roomSessionManager(k:IRoomSessionManager):void
        {
            this._roomSessionManager = k;
            this._Str_16862();
        }

        public function set communicationManager(k:IHabboCommunicationManager):void
        {
            this._communicationManager = k;
        }

        public function get _Str_10421():IHabboUserDefinedRoomEvents
        {
            return this._userDefinedRoomEvents;
        }

        public function get connection():IConnection
        {
            return this._connection;
        }

        public function set friendList(k:IHabboFriendsList):void
        {
            this._friendList = k;
            if (this._friendList)
            {
                this._friendList.events.addEventListener(_Str_2948.FRE_ACCEPTED, this._Str_2485);
                this._friendList.events.addEventListener(_Str_2948.FRE_DECLINED, this._Str_2485);
            }
        }

        public function set avatarRenderManager(k:IAvatarRenderManager):void
        {
            this._avatarRenderManager = k;
        }

        public function set windowManager(k:IHabboWindowManager):void
        {
            this._windowManager = k;
        }

        public function set inventory(k:IHabboInventory):void
        {
            this._inventory = k;
        }

        public function set navigator(k:IHabboNavigator):void
        {
            this._navigator = k;
        }

        public function set _Str_25206(k:IAdManager):void
        {
            this._adManager = k;
        }

        public function set localization(k:IHabboLocalizationManager):void
        {
            this._localization = k;
        }

        public function set _Str_2602(k:IHabboHelp):void
        {
            this._habboHelp = k;
        }

        public function set _Str_15532(k:IHabboModeration):void
        {
            this._moderation = k;
        }

        public function set config(k:IHabboConfigurationManager):void
        {
            this._config = k;
        }

        public function set _Str_2476(k:IHabboSoundManager):void
        {
            this._soundManager = k;
        }

        public function set habboTracking(k:IHabboTracking):void
        {
            this._habboTracking = k;
        }

        public function set _Str_10421(k:IHabboUserDefinedRoomEvents):void
        {
            this._userDefinedRoomEvents = k;
        }

        public function set _Str_3479(k:IHabboGameManager):void
        {
            this._gameManager = k;
        }

        public function set questEngine(k:IHabboQuestEngine):void
        {
            this._questEngine = k;
        }

        public function set freeFlowChat(k:IHabboFreeFlowChat):void
        {
            this._freeFlowChat = k;
        }

        public function set _Str_8097(k:IHabboGroupsManager):void
        {
            this._habboGroupsManager = k;
        }

        public function set roomEngine(k:IRoomEngine):void
        {
            this._roomEngine = k;
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.events == null))))
            {
                this._roomEngine.events.addEventListener(RoomContentLoadedEvent.RCLE_SUCCESS, this.onRoomContentLoaded);
                this._roomEngine.events.addEventListener(RoomContentLoadedEvent.RCLE_FAILURE, this.onRoomContentLoaded);
                this._roomEngine.events.addEventListener(RoomContentLoadedEvent.RCLE_CANCEL, this.onRoomContentLoaded);
            }
        }

        public function set messenger(k:IHabboMessenger):void
        {
            this._messenger = k;
        }

        public function set toolbar(k:IHabboToolbar):void
        {
            this._toolbar = k;
            this._toolbar.events.addEventListener(HabboToolbarEvent.HTIE_ICON_ZOOM, this._Str_21588);
        }

        public function set layout(k:XML):void
        {
            this._layoutManager._Str_22537(k, this._windowManager, this._config);
        }

        public function dispose():void
        {
            var _local_2:IRoomGeometry;
            var _local_3:int;
            var _local_4:String;
            var _local_5:IRoomWidget;
            if (((!(this._roomEngine == null)) && (!(this._session == null))))
            {
                _local_2 = this._roomEngine.getRoomCanvasGeometry(this._session.roomId, this.getFirstCanvasId());
                if (_local_2 != null)
                {
                    this._Str_21074(_local_2.isZoomedIn(), false);
                }
            }
            var k:int;
            if (this._canvasIDs != null)
            {
                k = 0;
                while (k < this._canvasIDs.length)
                {
                    _local_3 = this._canvasIDs[k];
                    _local_4 = this._Str_25468(_local_3);
                    if (this._windowManager)
                    {
                        this._windowManager.removeWindow(_local_4);
                    }
                    k++;
                }
            }
            this._updateListeners = null;
            if (this._widgets != null)
            {
                k = 0;
                while (k < this._widgets.length)
                {
                    _local_5 = (this._widgets.getWithIndex(k) as IRoomWidget);
                    if (_local_5 != null)
                    {
                        _local_5.dispose();
                    }
                    k++;
                }
                this._widgets.dispose();
                this._widgets = null;
            }
            if (this._widgetHandlerMessageMap != null)
            {
                this._widgetHandlerMessageMap.dispose();
                this._widgetHandlerMessageMap = null;
            }
            if (this._widgetHandlerEventMap != null)
            {
                this._widgetHandlerEventMap.dispose();
                this._widgetHandlerEventMap = null;
            }
            if (this._connection)
            {
                if (this._botSkillListUpdateMessageEvent != null)
                {
                    this._connection.removeMessageEvent(this._botSkillListUpdateMessageEvent);
                    this._botSkillListUpdateMessageEvent.dispose();
                    this._botSkillListUpdateMessageEvent = null;
                }
                if (this._botForceOpenContextMenuMessageEvent != null)
                {
                    this._connection.removeMessageEvent(this._botForceOpenContextMenuMessageEvent);
                    this._botForceOpenContextMenuMessageEvent.dispose();
                    this._botForceOpenContextMenuMessageEvent = null;
                }
                this._connection = null;
            }
            this._assets = null;
            this._avatarRenderManager = null;
            this._canvasIDs = null;
            this._events = null;
            if (((this._friendList) && (this._friendList.events)))
            {
                this._friendList.events.removeEventListener(_Str_2948.FRE_ACCEPTED, this._Str_2485);
                this._friendList.events.removeEventListener(_Str_2948.FRE_DECLINED, this._Str_2485);
            }
            this._friendList = null;
            this._layoutManager.dispose();
            this._layoutManager = null;
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.events == null))))
            {
                this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.RCLE_SUCCESS, this.onRoomContentLoaded);
                this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.RCLE_FAILURE, this.onRoomContentLoaded);
                this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.RCLE_CANCEL, this.onRoomContentLoaded);
            }
            this._roomEngine = null;
            this._roomSessionManager = null;
            this._roomWidgetFactory = null;
            this._session = null;
            this._sessionDataManager = null;
            this._windowManager = null;
            this._inventory = null;
            this._localization = null;
            this._config = null;
            this._soundManager = null;
            this._habboGroupsManager = null;
            if (((this._toolbar) && (this.toolbar.events)))
            {
                this._toolbar.events.removeEventListener(HabboToolbarEvent.HTIE_ICON_ZOOM, this._Str_21588);
                this._toolbar = null;
            }
            this._navigator = null;
            if (this._roomAdTooltip != null)
            {
                this._roomAdTooltip.dispose();
                this._roomAdTooltip = null;
            }
            if (this._resizeTimer != null)
            {
                this._resizeTimer.reset();
                this._resizeTimer.removeEventListener(TimerEvent.TIMER, this._Str_19147);
                this._resizeTimer = null;
            }
            this._roomViewContainerRect = null;
        }

        private function _Str_23048(k:BotSkillListUpdateEvent):void
        {
            var _local_3:RoomUserData;
            var _local_2:BotSkillListUpdateParser = k.getParser();
            if (this._session != null)
            {
                _local_3 = this._session.userDataManager._Str_17237(_local_2._Str_5455);
                _local_3._Str_7594 = k.getParser().skillList.concat();
            }
            this.events.dispatchEvent(new _Str_5375(_local_2._Str_5455, _local_2.skillList));
        }

        private function _Str_25865(k:BotForceOpenContextMenuEvent):void
        {
            var _local_2:BotForceOpenContextMenuParser = k.getParser();
            this.events.dispatchEvent(new RoomWidgetRequestBotForceOpenContextMenuEvent(_local_2._Str_5455));
        }

        public function init():void
        {
            if (((!(this._roomEngine == null)) && (!(this._session == null))))
            {
                this._pendingResources = new Array();
                if (this._pendingResources.length > 0)
                {
                    this._loadingComplete = false;
                    this._Str_2485(new _Str_3227(_Str_3227.RWLBUE_SHOW_LOADING_BAR));
                }
            }
        }

        public function _Str_23725():void
        {
            if (this._adManager != null)
            {
                this._adManager.showInterstitial();
            }
        }

        private function onRoomContentLoaded(k:RoomContentLoadedEvent):void
        {
            if (((this._pendingResources == null) || (this._pendingResources.length == 0)))
            {
                return;
            }
            var _local_2:int = this._pendingResources.indexOf(k.contentType);
            if (_local_2 != -1)
            {
                this._pendingResources.splice(_local_2, 1);
            }
            if (this._pendingResources.length == 0)
            {
                this._loadingComplete = true;
                this._Str_16862();
            }
        }

        public function _Str_2548(k:String):void
        {
            var _local_3:Boolean;
            var widgetHandler:IRoomWidgetHandler;
            var _local_5:ChatWidgetHandler;
            var _local_6:PlayListEditorWidgetHandler;
            var _local_7:SpamWallPostItWidgetHandler;
            var _local_8:FurnitureContextMenuWidgetHandler;
            var _local_9:FurnitureRoomLinkHandler;
            var _local_10:RoomToolsWidgetHandler;
            var _local_11:Array;
            var _local_12:Array;
            var _local_13:Array;
            var _local_14:String;
            var _local_15:String;
            var _local_16:_Str_3040;
            if (this._roomWidgetFactory == null)
            {
                return;
            }
            var _local_2:IRoomWidget = (this._widgets.getValue(k) as IRoomWidget);
            if (_local_2 != null)
            {
                return;
            }
            if (((this._session.isGameSession) && (!(this._Str_24010(k)))))
            {
                return;
            }
            switch (k)
            {
                case RoomWidgetEnum.CHAT_WIDGET:
                    _local_5 = new ChatWidgetHandler();
                    _local_5.connection = this._connection;
                    widgetHandler = _local_5;
                    _local_3 = true;
                    break;
                case RoomWidgetEnum.INFOSTAND:
                    widgetHandler = new InfoStandWidgetHandler(this._soundManager._Str_2774);
                    break;
                case RoomWidgetEnum.CHAT_INPUT_WIDGET:
                    _local_3 = true;
                    widgetHandler = new ChatInputWidgetHandler();
                    break;
                case RoomWidgetEnum.ME_MENU:
                    widgetHandler = new MeMenuWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_PLACEHOLDER:
                    widgetHandler = new PlaceholderWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_CREDIT_WIDGET:
                    widgetHandler = new FurnitureCreditWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_STICKIE_WIDGET:
                    widgetHandler = new FurnitureStickieWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_PRESENT_WIDGET:
                    widgetHandler = new FurniturePresentWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_TROPHY_WIDGET:
                    widgetHandler = new FurnitureTrophyWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_ECOTRONBOX_WIDGET:
                    widgetHandler = new FurnitureEcotronBoxWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_PET_PACKAGE_WIDGET:
                    widgetHandler = new PetPackageFurniWidgetHandler();
                    break;
                case RoomWidgetEnum.DOORBELL:
                    widgetHandler = new DoorbellWidgetHandler();
                    break;
                case RoomWidgetEnum.ROOM_QUEUE:
                    widgetHandler = new RoomQueueWidgetHandler();
                    break;
                case RoomWidgetEnum.LOADINGBAR:
                    widgetHandler = new LoadingBarWidgetHandler();
                    break;
                case RoomWidgetEnum.ROOM_POLL:
                    widgetHandler = new PollWidgetHandler();
                    break;
				case RoomWidgetEnum.ROOM_VOTE:
					widgetHandler = new VotePollWidgetHandler();
					break;
                case RoomWidgetEnum.WORD_QUIZZ:
                    widgetHandler = new WordQuizWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_CHOOSER:
                    widgetHandler = new FurniChooserWidgetHandler();
                    break;
                case RoomWidgetEnum.USER_CHOOSER:
                    widgetHandler = new UserChooserWidgetHandler();
                    break;
                case RoomWidgetEnum.ROOM_DIMMER:
                    widgetHandler = new FurnitureDimmerWidgetHandler();
                    break;
                case RoomWidgetEnum.FRIEND_REQUEST:
                    widgetHandler = new FriendRequestWidgetHandler();
                    break;
                case RoomWidgetEnum.CLOTHING_CHANGE:
                    widgetHandler = new FurnitureClothingChangeWidgetHandler();
                    break;
                case RoomWidgetEnum.CONVERSION_TRACKING:
                    widgetHandler = new ConversionPointWidgetHandler();
                    break;
                case RoomWidgetEnum.AVATAR_INFO:
                    widgetHandler = new AvatarInfoWidgetHandler();
                    break;
                case RoomWidgetEnum.WELCOME_GIFT:
                    widgetHandler = new WelcomeGiftWidgetHandler();
                    break;
                case RoomWidgetEnum.PLAYLIST_EDITOR_WIDGET:
                    _local_6 = new PlayListEditorWidgetHandler();
                    _local_6.connection = this._connection;
                    widgetHandler = (_local_6 as IRoomWidgetHandler);
                    break;
                case RoomWidgetEnum.SPAMWALL_POSTIT_WIDGET:
                    _local_7 = new SpamWallPostItWidgetHandler();
                    _local_7.connection = this._connection;
                    widgetHandler = (_local_7 as IRoomWidgetHandler);
                    break;
                case RoomWidgetEnum.EFFECTS:
                    widgetHandler = new EffectsWidgetHandler();
                    break;
                case RoomWidgetEnum.MANNEQUIN:
                    widgetHandler = new MannequinWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNITURE_CONTEXT_MENU:
                    _local_8 = new FurnitureContextMenuWidgetHandler();
                    _local_8.connection = this._connection;
                    widgetHandler = (_local_8 as IRoomWidgetHandler);
                    break;
                case RoomWidgetEnum.LOCATION_WIDGET:
                    widgetHandler = new ObjectLocationRequestHandler();
                    break;
                case RoomWidgetEnum.CAMERA:
                    widgetHandler = new CameraWidgetHandler(this);
                    break;
                case RoomWidgetEnum.ROOM_BACKGROUND_COLOR:
                    widgetHandler = new FurnitureBackgroundColorWidgetHandler();
                    break;
                case RoomWidgetEnum.CUSTOM_USER_NOTIFICATION:
                    widgetHandler = new CustomUserNotificationWidgetHandler();
                    break;
                case RoomWidgetEnum.FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING:
                    widgetHandler = new _Str_10181();
                    break;
                case RoomWidgetEnum.FRIEND_FURNI_CONFIRM:
                    widgetHandler = new FriendFurniConfirmWidgetHandler();
                    FriendFurniConfirmWidgetHandler(widgetHandler).connection = this.connection;
                    break;
                case RoomWidgetEnum.FRIEND_FURNI_ENGRAVING:
                    widgetHandler = new FriendFurniEngravingWidgetHandler();
                    break;
                case RoomWidgetEnum.HIGH_SCORE_DISPLAY:
                    widgetHandler = new HighScoreFurniWidgetHandler();
                    break;
                case RoomWidgetEnum.INTERNAL_LINK:
                    widgetHandler = new FurnitureInternalLinkHandler();
                    break;
                case RoomWidgetEnum.ROOM_LINK:
                    _local_9 = new FurnitureRoomLinkHandler();
                    _local_9.communicationManager = this._communicationManager;
                    widgetHandler = _local_9;
                    break;
                case RoomWidgetEnum.CUSTOM_STACK_HEIGHT:
                    widgetHandler = new FurnitureCustomStackHeightWidgetHandler();
                    break;
                case RoomWidgetEnum.YOUTUBE:
                    widgetHandler = new FurnitureYoutubeDisplayWidgetHandler();
                    break;
                case RoomWidgetEnum.RENTABLESPACE:
                    widgetHandler = new FurnitureRentableSpaceWidgetHandler();
                    break;
                case RoomWidgetEnum.VIMEO:
                    widgetHandler = new FurnitureVimeoDisplayWidgetHandler();
                    break;
                case RoomWidgetEnum.ROOM_TOOLS:
                    _local_10 = new RoomToolsWidgetHandler();
                    _local_10.communicationManager = this._communicationManager;
                    _local_10.navigator = this._navigator;
                    widgetHandler = _local_10;
                    break;
                case RoomWidgetEnum.EXTERNAL_IMAGE:
                    widgetHandler = new ExternalImageWidgetHandler();
                    break;
                case RoomWidgetEnum.UI_HELP_BUBBLE:
                    widgetHandler = new UiHelpBubbleWidgetHandler();
                    break;
                case RoomWidgetEnum.ROOM_THUMBNAIL_CAMERA:
                    widgetHandler = new RoomThumbnailCameraWidgetHandler(this);
                    break;
                case RoomWidgetEnum.CRAFTING:
                    widgetHandler = new CraftingWidgetHandler(this);
                    break;
            }
            if (widgetHandler != null)
            {
                widgetHandler.container = this;
                _local_11 = null;
                _local_12 = widgetHandler._Str_2607();
                if (_local_12 != null)
                {
                    for each (_local_14 in _local_12)
                    {
                        _local_11 = this._widgetHandlerMessageMap.getValue(_local_14);
                        if (_local_11 == null)
                        {
                            _local_11 = [];
                            this._widgetHandlerMessageMap.add(_local_14, _local_11);
                        }
                        else
                        {
                            Logger.log((("Room widget message '" + _local_14) + "' handled by more than one widget message handler, could cause problems. Be careful!"));
                        }
                        _local_11.push(widgetHandler);
                    }
                }
                _local_13 = widgetHandler._Str_2609();
                if (_local_13 != null)
                {
                    _local_13.push(RoomEngineTriggerWidgetEvent.OPEN_WIDGET);
                    _local_13.push(RoomEngineTriggerWidgetEvent.CLOSE_WIDGET);
                    for each (_local_15 in _local_13)
                    {
                        _local_11 = this._widgetHandlerEventMap.getValue(_local_15);
                        if (_local_11 == null)
                        {
                            _local_11 = [];
                            this._widgetHandlerEventMap.add(_local_15, _local_11);
                        }
                        _local_11.push(widgetHandler);
                    }
                }
            }
            _local_2 = this._roomWidgetFactory._Str_2548(k, widgetHandler);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.messageListener = this;
            _local_2.registerUpdateEvents(this._events);
            if (!this._widgets.add(k, _local_2))
            {
                _local_2.dispose();
            }
            else
            {
                this._layoutManager._Str_24018(k, _local_2.mainWindow);
            }
            if (_local_3)
            {
                k = _Str_3040.RWRVUE_ROOM_VIEW_SIZE_CHANGED;
                _local_16 = new _Str_3040(k, this._layoutManager._Str_16760);
                this.events.dispatchEvent(_local_16);
            }
        }

        private function _Str_24010(k:String):Boolean
        {
            switch (k)
            {
                case RoomWidgetEnum.CHAT_INPUT_WIDGET:
                case RoomWidgetEnum.CHAT_WIDGET:
                case RoomWidgetEnum.AVATAR_INFO:
                case RoomWidgetEnum.LOCATION_WIDGET:
                    return true;
                default:
                    return false;
            }
        }

        public function _Str_22861(k:String):void
        {
            var _local_2:IRoomWidget;
            if (this._widgets != null)
            {
                _local_2 = this._widgets.remove(k);
                if (_local_2 != null)
                {
                    if (this._layoutManager != null)
                    {
                        this._layoutManager.window2(k, _local_2.mainWindow);
                    }
                    _local_2.dispose();
                }
            }
        }

        public function _Str_11511(k:String):IRoomWidget
        {
            var _local_2:IRoomWidget;
            if (this._widgets != null)
            {
                _local_2 = this._widgets[k];
            }
            return _local_2;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_3:IRoomWidgetHandler;
            var _local_4:RoomWidgetUpdateEvent;
            if (k == null)
            {
                return null;
            }
            if (k.type == RoomWidgetZoomToggleMessage.RWZTM_ZOOM_TOGGLE)
            {
                this._Str_17253();
            }
            var _local_2:Array = this._widgetHandlerMessageMap.getValue(k.type);
            if (_local_2 != null)
            {
                for each (_local_3 in _local_2)
                {
                    _local_4 = _local_3.processWidgetMessage(k);
                    if (_local_4 != null)
                    {
                        return _local_4;
                    }
                }
            }
            return null;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_3:IRoomWidgetHandler;
            var _local_4:Boolean;
            var _local_5:RoomEngineTriggerWidgetEvent;
            if (((!(k)) || (!(this._widgetHandlerEventMap))))
            {
                return;
            }
            if (((this._roomCanvasWrapper) && (k.type == _Str_9973.RDMZEE_ENABLED)))
            {
                this._Str_19067(this._roomCanvasWrapper.getDisplayObject());
            }
            var _local_2:Array = this._widgetHandlerEventMap.getValue(k.type);
            if (_local_2 != null)
            {
                for each (_local_3 in _local_2)
                {
                    _local_4 = true;
                    if (((k.type == RoomEngineTriggerWidgetEvent.OPEN_WIDGET) || (k.type == RoomEngineTriggerWidgetEvent.CLOSE_WIDGET)))
                    {
                        _local_5 = (k as RoomEngineTriggerWidgetEvent);
                        _local_4 = ((!(_local_5 == null)) && (_local_3.type == _local_5.widget));
                    }
                    if (k.type == RoomWidgetZoomToggleMessage.RWZTM_ZOOM_TOGGLE)
                    {
                        this._Str_17253();
                    }
                    if (_local_4)
                    {
                        _local_3._Str_2485(k);
                    }
                }
            }
        }

        private function _Str_22621(k:RoomEngineObjectEvent):Boolean
        {
            var _local_4:IRoomObjectModel;
            var _local_2:Boolean;
            var _local_3:IRoomObject = this.roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
            if (_local_3 != null)
            {
                _local_4 = _local_3.getModel();
                if (_local_4 != null)
                {
                    if (_local_4.getNumber(RoomObjectVariableEnum.FURNITURE_SELECTION_DISABLE) == 1)
                    {
                        _local_2 = true;
                        if (this._sessionDataManager.isGodMode)
                        {
                            _local_2 = false;
                        }
                    }
                }
            }
            return _local_2;
        }

        public function roomObjectEventHandler(k:RoomEngineObjectEvent):void
        {
            var _local_6:String;
            var _local_7:IRoomObject;
            var _local_8:RoomUserData;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Boolean;
            var _local_12:int;
            if (k == null)
            {
                return;
            }
            var _local_2:int = int(k._Str_1577);
            var _local_3:int = int(k.category);
            var _local_4:RoomWidgetRoomObjectUpdateEvent;
            var _local_5:RoomWidgetFurniToWidgetMessage;
            switch (k.type)
            {
                case RoomEngineObjectEvent.SELECTED:
                    if (!this._Str_22621(k))
                    {
                        _local_4 = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED, _local_2, _local_3, k.roomId);
                    }
                    if (((!(this._moderation == null)) && (_local_3 == RoomObjectCategoryEnum.CONST_100)))
                    {
                        _local_8 = this._session.userDataManager.getUserDataByIndex(_local_2);
                        if (((!(_local_8 == null)) && (_local_8.type == RoomObjectTypeEnum.HABBO)))
                        {
                            this._moderation._Str_9380(_local_8._Str_2394, _local_8.name);
                        }
                    }
                    break;
                case RoomEngineObjectEvent.ADDED:
                    switch (_local_3)
                    {
                        case RoomObjectCategoryEnum.CONST_10:
                        case RoomObjectCategoryEnum.CONST_20:
                            _local_6 = RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED;
                            break;
                        case RoomObjectCategoryEnum.CONST_100:
                            _local_6 = RoomWidgetRoomObjectUpdateEvent.USER_ADDED;
                            break;
                    }
                    if (_local_6 != null)
                    {
                        _local_4 = new RoomWidgetRoomObjectUpdateEvent(_local_6, _local_2, _local_3, k.roomId);
                    }
                    break;
                case RoomEngineObjectEvent.REMOVED:
                    switch (_local_3)
                    {
                        case RoomObjectCategoryEnum.CONST_10:
                        case RoomObjectCategoryEnum.CONST_20:
                            _local_6 = RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED;
                            break;
                        case RoomObjectCategoryEnum.CONST_100:
                            _local_6 = RoomWidgetRoomObjectUpdateEvent.USER_REMOVED;
                            break;
                    }
                    if (_local_6 != null)
                    {
                        _local_4 = new RoomWidgetRoomObjectUpdateEvent(_local_6, _local_2, _local_3, k.roomId);
                    }
                    break;
                case RoomEngineObjectEvent.DESELECTED:
                    _local_4 = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, _local_2, _local_3, k.roomId);
                    break;
                case RoomEngineObjectEvent.MOUSE_ENTER:
                    _local_4 = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OVER, _local_2, _local_3, k.roomId);
                    break;
                case RoomEngineObjectEvent.MOUSE_LEAVE:
                    _local_4 = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OUT, _local_2, _local_3, k.roomId);
                    break;
                case RoomEngineObjectEvent.REQUEST_MOVE:
                    if (this._Str_21292(k.roomId, k._Str_1577, k.category))
                    {
                        this._roomEngine.updateObjectWallItemData(k._Str_1577, k.category, RoomObjectOperationEnum.OBJECT_MOVE);
                    }
                    break;
                case RoomEngineObjectEvent.REQUEST_ROTATE:
                    if (this._Str_21292(k.roomId, k._Str_1577, k.category))
                    {
                        this._roomEngine.updateObjectWallItemData(k._Str_1577, k.category, RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
                    }
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CREDITFURNI:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CREDITFURNI, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_STICKIE:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_STICKIE, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PRESENT:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PRESENT, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TROPHY:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_TROPHY, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TEASER:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_TEASER, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ECOTRONBOX:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_ECOTRONBOX, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_DIMMER:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_DIMMER, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLACEHOLDER:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PLACEHOLDER, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineRoomAdEvent.FURNI_CLICK:
                case RoomEngineRoomAdEvent.FURNI_DOUBLE_CLICK:
                    this._Str_24118(k);
                    break;
                case RoomEngineRoomAdEvent.TOOLTIP_SHOW:
                case RoomEngineRoomAdEvent.TOOLTIP_HIDE:
                    this._Str_22753(k);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CLOTHING_CHANGE:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLAYLIST_EDITOR:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING:
                    _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING, _local_2, _local_3, k.roomId);
                    this.processWidgetMessage(_local_5);
                    break;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED:
                    _local_7 = this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
                    if (_local_7 != null)
                    {
                        _local_9 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID);
                        _local_10 = this._sessionDataManager.userId;
                        if (_local_9 == _local_10)
                        {
                            _local_5 = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED, _local_2, _local_3, k.roomId);
                            this.processWidgetMessage(_local_5);
                        }
                    }
                    break;
                case RoomEngineTriggerWidgetEvent.OPEN_WIDGET:
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                case RoomEngineTriggerWidgetEvent.RETWE_OPEN_FURNI_CONTEXT_MENU:
                case RoomEngineTriggerWidgetEvent.RETWE_CLOSE_FURNI_CONTEXT_MENU:
                case RoomEngineTriggerWidgetEvent.RETWE_REMOVE_DIMMER:
                case RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MANNEQUIN:
                case RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY:
                case RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_ROOM:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BACKGROUND_COLOR:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIGH_SCORE_DISPLAY:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_INTERNAL_LINK:
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ROOM_LINK:
                    this._Str_2485(k);
                    break;
            }
            if (_local_4 != null)
            {
                _local_11 = true;
                if ((_local_4 is RoomWidgetRoomObjectUpdateEvent))
                {
                    _local_12 = (_local_4 as RoomWidgetRoomObjectUpdateEvent).roomId;
                    _local_11 = (!(RoomId.isRoomPreviewerId(_local_12)));
                }
                else
                {
                    if ((_local_4 is _Str_3345))
                    {
                        _local_12 = (_local_4 as _Str_3345).roomId;
                        _local_11 = (!(RoomId.isRoomPreviewerId(_local_12)));
                    }
                }
                if (_local_11)
                {
                    this.events.dispatchEvent(_local_4);
                }
            }
        }

        private function _Str_21292(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            return ((this._session.roomControllerLevel >= RoomControllerLevel.GUEST) || (this._sessionDataManager.isGodMode)) || (this.isOwnerOfFurniture(this._roomEngine.getRoomObject(k, _arg_2, _arg_3)));
        }

        public function _Str_9500(k:RoomEngineEvent):void
        {
            var _local_2:RoomWidgetUpdateEvent;
            switch (k.type)
            {
                case RoomEngineEvent.NORMAL_MODE:
                    _local_2 = new _Str_3345(_Str_3345.RWREUE_NORMAL_MODE, k.roomId);
                    break;
                case RoomEngineEvent.GAME_MODE:
                    _local_2 = new _Str_3345(_Str_3345.RWREUE_GAME_MODE, k.roomId);
                    break;
            }
            if (_local_2 != null)
            {
                this.events.dispatchEvent(_local_2);
            }
        }

        public function _Str_22664(k:int):void
        {
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:IWindow;
            var _local_2:Rectangle = this._layoutManager._Str_16760;
            var _local_3:int = _local_2.width;
            var _local_4:int = _local_2.height;
            var _local_5:int = ((this._session.isGameSession) ? RoomGeometry.SCALE_ZOOMED_OUT : RoomGeometry.SCALE_ZOOMED_IN);
            if (this._canvasIDs.indexOf(k) >= 0)
            {
                return;
            }
            if ((((this._session == null) || (this._windowManager == null)) || (this._roomEngine == null)))
            {
                return;
            }
            var _local_6:DisplayObject = this._roomEngine.createRoomCanvas(this._session.roomId, k, _local_3, _local_4, _local_5);
            if (_local_6 == null)
            {
                return;
            }
            var _local_7:RoomGeometry = (this._roomEngine.getRoomCanvasGeometry(this._session.roomId, k) as RoomGeometry);
            if (_local_7 != null)
            {
                _local_14 = this._roomEngine.getRoomNumberValue(this._session.roomId, RoomVariableEnum.ROOM_MIN_X);
                _local_15 = this._roomEngine.getRoomNumberValue(this._session.roomId, RoomVariableEnum.ROOM_MAX_X);
                _local_16 = this._roomEngine.getRoomNumberValue(this._session.roomId, RoomVariableEnum.ROOM_MIN_Y);
                _local_17 = this._roomEngine.getRoomNumberValue(this._session.roomId, RoomVariableEnum.ROOM_MAX_Y);
                _local_18 = ((_local_14 + _local_15) / 2);
                _local_19 = ((_local_16 + _local_17) / 2);
                _local_20 = 20;
                _local_18 = (_local_18 + (_local_20 - 1));
                _local_19 = (_local_19 + (_local_20 - 1));
                _local_21 = (Math.sqrt(((_local_20 * _local_20) + (_local_20 * _local_20))) * Math.tan(((30 / 180) * Math.PI)));
                _local_7.location = new Vector3d(_local_18, _local_19, _local_21);
            }
            var _local_8:XmlAsset = (this._assets.getAssetByName("room_view_container_xml") as XmlAsset);
            if (_local_8 == null)
            {
                return;
            }
            var _local_9:IWindowContainer = (this._windowManager.buildFromXML((_local_8.content as XML)) as IWindowContainer);
            if (_local_9 == null)
            {
                return;
            }
            _local_9.width = _local_3;
            _local_9.height = _local_4;
            this._roomCanvasWrapper = (_local_9.findChildByName("room_canvas_wrapper") as IDisplayObjectWrapper);
            if (this._roomCanvasWrapper == null)
            {
                return;
            }
            this._roomCanvasWrapper.setDisplayObject(_local_6);
            if (this._session.isGameSession)
            {
                _local_6.addEventListener(MouseEvent.CLICK, this._Str_23529);
            }
            this._Str_19067(_local_6);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.CLICK, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.DOUBLE_CLICK, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.MOVE, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.DOWN, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.UP, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowMouseEvent.UP_OUTSIDE, this._Str_9634);
            this._roomCanvasWrapper.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_17251);
            var _local_10:Sprite = new Sprite();
            _local_10.mouseEnabled = false;
            _local_10.blendMode = BlendMode.MULTIPLY;
            var _local_11:IDisplayObjectWrapper = (_local_9.findChildByName("colorizer_wrapper") as IDisplayObjectWrapper);
            if (_local_11 == null)
            {
                return;
            }
            _local_11.setDisplayObject(_local_10);
            _local_11.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_23585);
            var _local_12:Sprite = new Sprite();
			_local_12.alpha = 1;
            _local_12.mouseEnabled = false;
            var _local_13:IDisplayObjectWrapper = (_local_9.findChildByName("background_wrapper") as IDisplayObjectWrapper);
            if (_local_13 == null)
            {
                return;
            }
            _local_13.setDisplayObject(_local_12);
            _local_13.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_22744);
            if (this._session._Str_4780)
            {
                _local_22 = this._Str_24343();
                if (_local_22 != null)
                {
                    _local_22.width = _local_9.width;
                    _local_22.height = _local_9.height;
                    _local_9.addChild(_local_22);
                }
            }
            this._layoutManager._Str_24675(_local_9);
            this._canvasIDs.push(k);
        }

        private function _Str_19067(k:DisplayObject):void
        {
            k.removeEventListener(MouseEvent.MOUSE_WHEEL, this._Str_19200);
            if (this._sessionDataManager.isPerkAllowed(PerkEnum.MOUSE_ZOOM))
            {
                k.addEventListener(MouseEvent.MOUSE_WHEEL, this._Str_19200);
            }
        }

        private function _Str_19200(k:MouseEvent):void
        {
            var _local_2:Point;
            var _local_3:int;
            var _local_4:int;
            if ((((k.ctrlKey) && (!(k.altKey))) && (!(k.shiftKey))))
            {
                this._mouseWheelSpeed = (this._mouseWheelSpeed + ((k.delta == 0) ? 0 : ((k.delta < 0) ? -20 : 20)));
                _local_2 = new Point();
                this._roomCanvasWrapper.getGlobalPosition(_local_2);
                _local_3 = (k.stageX - _local_2.x);
                _local_4 = (k.stageY - _local_2.y);
                this._pivot = new Point(_local_3, _local_4);
            }
        }

        private function _Str_23585(k:WindowEvent):void
        {
            var _local_2:IDisplayObjectWrapper = (k.target as IDisplayObjectWrapper);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:Sprite = (_local_2.getDisplayObject() as Sprite);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.graphics.clear();
            _local_3.graphics.beginFill(this._roomColor);
            _local_3.graphics.drawRect(0, 0, _local_2.width, _local_2.height);
            _local_3.graphics.endFill();
        }

        private function _Str_22744(k:WindowEvent):void
        {
            var _local_2:IDisplayObjectWrapper = (k.target as IDisplayObjectWrapper);
            if (_local_2 == null)
            {
                return;
            }
            this._Str_19741(_local_2);
        }

        private function _Str_19741(k:IDisplayObjectWrapper):void
        {
            var _local_2:Sprite = (k.getDisplayObject() as Sprite);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.graphics.clear();
            _local_2.graphics.beginFill(this._roomBackgroundColor);
            _local_2.graphics.drawRect(0, 0, k.width, k.height);
            _local_2.graphics.endFill();
        }

        public function _Str_16960(k:uint, _arg_2:int):void
        {
            var _local_3:IWindowContainer = (this._layoutManager._Str_19928() as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IDisplayObjectWrapper = (_local_3.getChildByName("colorizer_wrapper") as IDisplayObjectWrapper);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:Sprite = (_local_4.getDisplayObject() as Sprite);
            if (_local_5 == null)
            {
                return;
            }
            var _local_6:int = ColorConverter.rgbToHSL(k);
            _local_6 = ((_local_6 & 0xFFFF00) + _arg_2);
            k = ColorConverter.hslToRGB(_local_6);
            this._roomColor = k;
            _local_5.graphics.clear();
            _local_5.graphics.beginFill(k);
            _local_5.graphics.drawRect(0, 0, _local_4.width, _local_4.height);
            _local_5.graphics.endFill();
        }

        public function _Str_18812(k:int, _arg_2:int, _arg_3:int):void
        {
            this._roomBackgroundColor = ColorConverter.hslToRGB(((((k & 0xFF) << 16) + ((_arg_2 & 0xFF) << 8)) + (_arg_3 & 0xFF)));
            var _local_4:IWindowContainer = (this._layoutManager._Str_19928() as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IDisplayObjectWrapper = (_local_4.getChildByName("background_wrapper") as IDisplayObjectWrapper);
            if (_local_5 == null)
            {
                return;
            }
            if ((((k == 0) && (_arg_2 == 0)) && (_arg_3 == 0)))
            {
                _local_5.visible = false;
            }
            else
            {
                _local_5.visible = true;
                this._Str_19741(_local_5);
            }
        }

        public function getFirstCanvasId():int
        {
            if (this._canvasIDs != null)
            {
                if (this._canvasIDs.length > 0)
                {
                    return this._canvasIDs[0];
                }
            }
            return 0;
        }

        public function _Str_18304():Rectangle
        {
            if (!this._layoutManager)
            {
                return null;
            }
            return this._layoutManager._Str_16760;
        }

        public function _Str_22190(k:String, _arg_2:Function):void
        {
            if ((((!(this._roomCanvasWrapper)) || (!(this._roomCanvasWrapper.getDisplayObject()))) || (!(this._roomCanvasWrapper.getDisplayObject().stage))))
            {
                return;
            }
            this._roomCanvasWrapper.getDisplayObject().stage.addEventListener(k, _arg_2, false, 0, true);
        }

        public function _Str_19098(k:String, _arg_2:Function):void
        {
            if ((((!(this._roomCanvasWrapper)) || (!(this._roomCanvasWrapper.getDisplayObject()))) || (!(this._roomCanvasWrapper.getDisplayObject().stage))))
            {
                return;
            }
            this._roomCanvasWrapper.getDisplayObject().stage.removeEventListener(k, _arg_2);
        }

        public function _Str_9634(k:WindowEvent):void
        {
            var _local_5:Point;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Point;
            if (((this._roomEngine == null) || (this._session == null)))
            {
                return;
            }
            var _local_2:WindowMouseEvent = (k as WindowMouseEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:String = "";
            switch (_local_2.type)
            {
                case WindowMouseEvent.CLICK:
                    _local_3 = MouseEvent.CLICK;
                    break;
                case WindowMouseEvent.DOUBLE_CLICK:
                    _local_3 = MouseEvent.DOUBLE_CLICK;
                    break;
                case WindowMouseEvent.DOWN:
                    _local_3 = MouseEvent.MOUSE_DOWN;
                    break;
                case WindowMouseEvent.UP:
                case WindowMouseEvent.UP_OUTSIDE:
                    _local_3 = MouseEvent.MOUSE_UP;
                    break;
                case WindowMouseEvent.MOVE:
                    _local_3 = MouseEvent.MOUSE_MOVE;
                    break;
                default:
                    return;
            }
            var _local_4:IDisplayObjectWrapper = (_local_2.target as IDisplayObjectWrapper);
            if (_local_4 == _local_2.target)
            {
                _local_5 = new Point();
                _local_4.getGlobalPosition(_local_5);
                _local_6 = (_local_2.stageX - _local_5.x);
                _local_7 = (_local_2.stageY - _local_5.y);
                this._roomEngine.setActiveRoom(this._session.roomId);
                this._roomEngine.handleRoomCanvasMouseEvent(this._canvasIDs[0], _local_6, _local_7, _local_3, _local_2.altKey, _local_2.ctrlKey, _local_2.shiftKey, _local_2.buttonDown);
            }
            if (((_local_3 == MouseEvent.MOUSE_MOVE) && (!(this._roomAdTooltip == null))))
            {
                _local_8 = new Point(_local_2.stageX, _local_2.stageY);
                _local_8.offset((-(this._roomAdTooltip.width) / 2), 15);
                this._roomAdTooltip.setGlobalPosition(_local_8);
            }
        }

        private function _Str_23529(k:MouseEvent):void
        {
            var _local_2:Point = new Point();
            this._roomCanvasWrapper.getGlobalPosition(_local_2);
            var _local_3:int = (k.stageX - _local_2.x);
            var _local_4:int = (k.stageY - _local_2.y);
            this._roomEngine.setActiveRoom(this._session.roomId);
            k.stopImmediatePropagation();
            this._roomEngine.handleRoomCanvasMouseEvent(this._canvasIDs[0], _local_3, _local_4, k.type, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
        }

        private function _Str_17251(k:WindowEvent):void
        {
            var _local_2:IWindow = k.window;
            this._roomViewContainerRect = _local_2.rectangle;
            this._roomEngine.modifyRoomCanvas(this._session.roomId, this._canvasIDs[0], _local_2.width, _local_2.height);
            if (this._resizeTimer == null)
            {
                this._resizeTimer = new Timer(_Str_17829, 1);
                this._resizeTimer.addEventListener(TimerEvent.TIMER, this._Str_19147);
            }
            else
            {
                this._resizeTimer.reset();
            }
            this._resizeTimer.start();
        }

        private function _Str_19147(k:TimerEvent):void
        {
            var _local_2:String = _Str_3040.RWRVUE_ROOM_VIEW_SIZE_CHANGED;
            this.events.dispatchEvent(new _Str_3040(_local_2, this._roomViewContainerRect));
        }

        private function _Str_21074(k:Boolean, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:int;
            if (this._zoomTrackingEnabled)
            {
                _local_3 = getTimer();
                _local_4 = Math.round(((_local_3 - this._zoomChangedMillis) / 1000));
                if (this._habboTracking != null)
                {
                    if (k)
                    {
                        if (_arg_2)
                        {
                            this._habboTracking.trackGoogle("zoomEvent", "out");
                        }
                        this._habboTracking.trackGoogle("zoomEnded", "in", _local_4);
                    }
                    else
                    {
                        if (_arg_2)
                        {
                            this._habboTracking.trackGoogle("zoomEvent", "in");
                        }
                        this._habboTracking.trackGoogle("zoomEnded", "out", _local_4);
                    }
                }
                this._zoomChangedMillis = _local_3;
            }
        }

        private function _Str_21588(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTIE_ICON_ZOOM)
            {
                this._Str_17253();
            }
        }

        private function _Str_17253():void
        {
            var k:Number;
            var _local_2:Number;
            var _local_3:IRoomGeometry;
            if (this._session != null)
            {
                if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                {
                    k = this._roomEngine._Str_5151(this._roomEngine.activeRoomId);
                    _local_2 = ((k == 1) ? 0.5 : 1);
                    this._roomEngine._Str_5041(this._roomEngine.activeRoomId, this.getFirstCanvasId(), _local_2);
                }
                else
                {
                    _local_3 = this._roomEngine.getRoomCanvasGeometry(this._session.roomId, this.getFirstCanvasId());
                    if (_local_3 != null)
                    {
                        this._Str_21074(_local_3.isZoomedIn(), true);
                        _local_3.performZoom();
                    }
                }
            }
        }

        public function update():void
        {
            var k:Number;
            var _local_4:IRoomWidgetHandler;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            if (this._updateListeners == null)
            {
                return;
            }
            var _local_2:int = this._updateListeners.length;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = (this._updateListeners[_local_3] as IRoomWidgetHandler);
                if (_local_4 != null)
                {
                    _local_4.update();
                }
                _local_3++;
            }
            if (Math.abs(this._mouseWheelSpeed) > 0.01)
            {
                k = this._roomEngine._Str_5151(this._roomEngine.activeRoomId);
                _local_5 = this._Str_24422(k);
                _local_6 = (((_local_5 > 1) ? (_local_5 << 1) : 1) / 10);
                _local_7 = ((this._mouseWheelSpeed > 0) ? (k - _local_6) : (k + _local_6));
                _local_7 = Math.max(0.5, _local_7);
                this._shouldSmartScale = true;
                this._mouseWheelSpeed = (this._mouseWheelSpeed * 0.05);
                this._roomEngine._Str_5041(this._session.roomId, this.getFirstCanvasId(), _local_7, this._pivot, null, false, true);
            }
            else
            {
                if (this._shouldSmartScale)
                {
                    this._shouldSmartScale = false;
                    k = this._roomEngine._Str_5151(this._roomEngine.activeRoomId);
                    if (k < 0.75)
                    {
                        this._roomEngine._Str_5041(this._session.roomId, this.getFirstCanvasId(), 0.5, this._pivot, null, false, true);
                    }
                    else
                    {
                        this._roomEngine._Str_5041(this._session.roomId, this.getFirstCanvasId(), Math.round(k), this._pivot, null, false, true);
                    }
                }
            }
        }

        private function _Str_24422(k:int):int
        {
            k = (k | (k >> 1));
            k = (k | (k >> 2));
            k = (k | (k >> 4));
            k = (k | (k >> 8));
            k = (k | (k >> 16));
            return k - (k >> 1);
        }

        private function _Str_25468(k:int):String
        {
            return "Room_Engine_Window_" + k;
        }

        private function _Str_25922(k:int, _arg_2:int):Array
        {
            var _local_3:BlurFilter = new BlurFilter(2, 2);
            return [];
        }

        private function _Str_26066(k:int, _arg_2:int):BitmapFilter
        {
            var _local_3:BitmapData = new BitmapData(k, _arg_2);
            _local_3.perlinNoise(k, _arg_2, 5, (Math.random() * 0x77359400), true, false);
            var _local_4:Point = new Point(0, 0);
            var _local_5:uint = BitmapDataChannel.RED;
            var _local_6:uint = _local_5;
            var _local_7:uint = _local_5;
            var _local_8:Number = (k / 20);
            var _local_9:Number = (-(k) / 25);
            var _local_10:String = DisplacementMapFilterMode.COLOR;
            var _local_11:uint;
            var _local_12:Number = 0;
            return new DisplacementMapFilter(_local_3, _local_4, _local_6, _local_7, _local_8, _local_9, _local_10, _local_11, _local_12);
        }

        private function _Str_16862():Boolean
        {
            if ((((!(this._roomSessionManager == null)) && (!(this._session == null))) && (this._loadingComplete)))
            {
                this._roomSessionManager._Str_12778(this._session);
                this._Str_2485(new _Str_3227(_Str_3227.RWLBUW_HIDE_LOADING_BAR));
                return true;
            }
            return false;
        }

        private function _Str_24118(k:RoomEngineObjectEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IRoomObject = this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomObjectModel = (_local_2.getModel() as IRoomObjectModel);
            var _local_4:String = _local_3.getString(RoomObjectVariableEnum.FURNITURE_AD_URL);
            if (((_local_4 == null) || (!(_local_4.indexOf("http") == 0))))
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineRoomAdEvent.FURNI_CLICK:
                    if (((this._session.roomControllerLevel >= RoomControllerLevel.GUEST) || (this._sessionDataManager.isGodMode)))
                    {
                        return;
                    }
                    HabboWebTools.openWebPage(_local_4);
                    return;
                case RoomEngineRoomAdEvent.FURNI_DOUBLE_CLICK:
                    if ((((!(this._session.roomControllerLevel)) >= RoomControllerLevel.GUEST) && (!(this._sessionDataManager.isGodMode))))
                    {
                        return;
                    }
                    HabboWebTools.openWebPage(_local_4);
                    return;
            }
        }

        private function _Str_22753(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:String;
            var _local_4:IRoomObjectModel;
            var _local_5:String;
            if (k == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineRoomAdEvent.TOOLTIP_SHOW:
                    if (this._roomAdTooltip != null)
                    {
                        return;
                    }
                    _local_2 = this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    _local_3 = this._localization.getLocalization((_local_2.getType() + ".tooltip"), "${ads.roomad.tooltip}");
                    if (_local_3 == null)
                    {
                        _local_4 = (_local_2.getModel() as IRoomObjectModel);
                        _local_5 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_AD_URL);
                        if (((!(_local_5 == null)) && (_local_5.indexOf("http") == 0)))
                        {
                            _local_3 = _local_5;
                        }
                    }
                    if (_local_3 == null)
                    {
                        return;
                    }
                    this._roomAdTooltip = (this._windowManager.createWindow("room_ad_tooltip", _local_3, WindowType.WINDOW_TYPE_TOOLTIP, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT) as IToolTipWindow);
                    this._roomAdTooltip.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, false);
                    this._roomAdTooltip.visible = true;
                    this._roomAdTooltip.center();
                    return;
                case RoomEngineRoomAdEvent.TOOLTIP_HIDE:
                    if (this._roomAdTooltip == null)
                    {
                        return;
                    }
                    this._roomAdTooltip.dispose();
                    this._roomAdTooltip = null;
                    return;
            }
        }

        private function _Str_24343():IWindow
        {
            var k:XmlAsset = (this._assets.getAssetByName("spectator_mode_xml") as XmlAsset);
            if (k == null)
            {
                return null;
            }
            var _local_2:IWindowContainer = (this._windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            if (_local_2 == null)
            {
                return null;
            }
            this._Str_3209(_local_2.findChildByName("top_left"), "spec_top_left_png");
            this._Str_3209(_local_2.findChildByName("top_middle"), "spec_top_middle_png");
            this._Str_3209(_local_2.findChildByName("top_right"), "spec_top_right_png");
            this._Str_3209(_local_2.findChildByName("middle_left"), "spec_middle_left_png");
            this._Str_3209(_local_2.findChildByName("middle_right"), "spec_middle_right_png");
            this._Str_3209(_local_2.findChildByName("bottom_left"), "spec_bottom_left_png");
            this._Str_3209(_local_2.findChildByName("bottom_middle"), "spec_bottom_middle_png");
            this._Str_3209(_local_2.findChildByName("bottom_right"), "spec_bottom_right_png");
            return _local_2;
        }

        private function _Str_3209(k:IWindow, _arg_2:String):void
        {
            var _local_3:IBitmapWrapperWindow = (k as IBitmapWrapperWindow);
            if (((_local_3 == null) || (this._assets == null)))
            {
                return;
            }
            var _local_4:BitmapDataAsset = (this._assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:BitmapData = (_local_4.content as BitmapData);
            if (_local_5 == null)
            {
                return;
            }
            _local_3.bitmap = _local_5.clone();
        }

        public function _Str_23614(k:String, _arg_2:int=0):void
        {
            var _local_3:IRoomWidget = this._widgets[k];
            if (_local_3 == null)
            {
                Logger.log(("Tried to initialize an unknown widget " + k));
                return;
            }
            _local_3.initialize(_arg_2);
        }

        public function _Str_24524(k:String):int
        {
            var _local_2:IRoomWidget = this._widgets[k];
            if (_local_2 == null)
            {
                Logger.log(("Requested the state of an unknown widget " + k));
                return _Str_8876;
            }
            return _local_2.state;
        }

        public function _Str_19457(k:IRoomWidgetHandler):void
        {
            if (this._updateListeners == null)
            {
                this._updateListeners = new Array();
            }
            if (this._updateListeners.indexOf(k) == -1)
            {
                this._updateListeners.push(k);
            }
        }

        public function _Str_20159(k:IRoomWidgetHandler):void
        {
            if (this._updateListeners == null)
            {
                return;
            }
            var _local_2:int = this._updateListeners.indexOf(k);
            if (_local_2 != -1)
            {
                this._updateListeners.splice(_local_2, 1);
            }
        }

        public function isOwnerOfFurniture(k:IRoomObject):Boolean
        {
            var _local_2:int = this.sessionDataManager.userId;
            var _local_3:IRoomObjectModel = k.getModel();
            if (_local_3 == null)
            {
                return false;
            }
            var _local_4:Number = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID);
            return _local_4 == _local_2;
        }

        public function getFurnitureOwnerId(k:IRoomObject):int
        {
            var _local_3:Number;
            var _local_2:IRoomObjectModel = k.getModel();
            if (_local_2 != null)
            {
                _local_3 = _local_2.getNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID);
                if (!isNaN(_local_3))
                {
                    return _local_3;
                }
            }
            return -1;
        }

        public function _Str_25220(k:RoomUserData):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:int = this.sessionDataManager.userId;
            return _local_2 == k.ownerId;
        }

        public function _Str_9753(k:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:AvatarInfoWidget = (this._widgets[RoomWidgetEnum.AVATAR_INFO] as AvatarInfoWidget);
            if (!_local_5)
            {
                return;
            }
            _local_5._Str_9753(k, _arg_2, _arg_3, _arg_4);
        }

        public function get _Str_6642():DesktopLayoutManager
        {
            return this._layoutManager;
        }

        public function _Str_25373(k:MouseEvent, _arg_2:int):Boolean
        {
            var _local_3:Array = new Array(0);
            var _local_4:Point = new Point(k.stageX, k.stageY);
            this._windowManager.getDesktop(_arg_2).groupParameterFilteredChildrenUnderPoint(_local_4, _local_3, WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            return _local_3.length > 1;
        }
    }
}
