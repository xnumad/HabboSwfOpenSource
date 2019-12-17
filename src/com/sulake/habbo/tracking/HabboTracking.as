package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.external.ExternalInterface;
    import flash.system.Capabilities;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.events.Event;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.habbo.window.enum._Str_5209;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
    import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
    import com.sulake.habbo.catalog.enum.HabboCatalogTrackingEvent;
    import com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.habbo.friendlist.events._Str_3797;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.habbo.help.enum.HabboHelpTrackingEvent;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_3660;
    import com.sulake.habbo.communication.messages.incoming._Str_516.PongMessageParser;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
    import com.sulake.habbo.communication.enum.HabboHotelViewEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.runtime.events.ErrorEvent;
    import com.sulake.core.runtime.exceptions.Exception;
    import flash.system.System;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_5519;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageComposer;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class HabboTracking extends Component implements IHabboTracking, IUpdateReceiver 
    {
        private static const ERROR_DATA_FLAG_COUNT:uint = 11;
        private static var _Str_1229:HabboTracking;

        private var _communication:IHabboCommunicationManager;
        private var _errorContextFlags:Array;
        private var _crashed:Boolean = false;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _performanceTracker:PerformanceTracker = null;
        private var _framerateTracker:FramerateTracker = null;
        private var _latencyTracker:LatencyTracker = null;
        private var _lagWarningLogger:LagWarningLogger = null;
        private var _toolbarClickTracker:ToolbarClickTracker = null;
        private var _roomEngine:IRoomEngine = null;
        private var _anyRoomsVisited:Boolean = false;
        private var _currentTime:int = -1;
        private var _invalidTimeCount:int = 0;
        private var _timeLeapCount:int = 0;
        private var _fpsTrackingTimer:Timer;
        private var _fpsTrackingCount:int = 0;
        private var _fpsTrackingRoomId:int = -1;
        private var _instance:Vector.<String>;

        public function HabboTracking(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._instance = new Vector.<String>(0);
            if (_Str_1229 == null)
            {
                _Str_1229 = this;
            }
            this._errorContextFlags = new Array(ERROR_DATA_FLAG_COUNT);
            var _local_4:uint;
            while (_local_4 < ERROR_DATA_FLAG_COUNT)
            {
                this._errorContextFlags[_local_4] = 0;
                _local_4++;
            }
            super(k, _arg_2, _arg_3);
            var _local_5:IContext = k.root;
            if (_local_5 != null)
            {
                _local_5.events.addEventListener(Component.COMPONENT_EVENT_ERROR, this.onError);
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.START_TIME, new Date().getTime().toString());
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.AGENT, ((ExternalInterface.available) ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown"));
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.SYSTEM, Capabilities.serverString);
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.IN_ROOM, String(false));
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.LAST_ROOM, String(0));
            }
            registerUpdateReceiver(this, 1);
        }

        public static function getInstance():HabboTracking
        {
            return _Str_1229;
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), function (k:IHabboConfigurationManager):void
            {
                if (k != null)
                {
                    setErrorContextFlag(1, 0);
                }
            }, false, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                if (k != null)
                {
                    setErrorContextFlag(1, 1);
                }
            }, false), new ComponentDependency(new IIDHabboWindowManager(), null, false, [{
                "type":_Str_5209.HABBO_WINDOW_TRACKING_EVENT_INPUT,
                "callback":this.onWindowTrackingEvent
            }, {
                "type":_Str_5209.HABBO_WINDOW_TRACKING_EVENT_RENDER,
                "callback":this.onWindowTrackingEvent
            }, {
                "type":_Str_5209.HABBO_WINDOW_TRACKING_EVENT_SLEEP,
                "callback":this.onWindowTrackingEvent
            }]), new ComponentDependency(new IIDHabboNavigator(), null, false, [{
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH,
                "callback":this.onNavigatorTrackingEvent
            }, {
                "type":HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED,
                "callback":this.onRoomSettingsTrackingEvent
            }, {
                "type":HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT,
                "callback":this.onRoomSettingsTrackingEvent
            }, {
                "type":HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED,
                "callback":this.onRoomSettingsTrackingEvent
            }, {
                "type":HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS,
                "callback":this.onRoomSettingsTrackingEvent
            }, {
                "type":HabboToolbarEvent.HTIE_ICON_ZOOM,
                "callback":this.onZoomToggle
            }]), new ComponentDependency(new IIDHabboCatalog(), null, false, [{
                "type":CatalogPageOpenedEvent.CATALOG_PAGE_OPENED,
                "callback":this.onCatalogPageOpened
            }, {
                "type":HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN,
                "callback":this.onCatalogTrackingEvent
            }, {
                "type":HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE,
                "callback":this.onCatalogTrackingEvent
            }, {
                "type":CatalogFurniPurchaseEvent.CATALOG_FURNI_PURCHASE,
                "callback":this.onCatalogTrackingEvent
            }]), new ComponentDependency(new IIDHabboInventory(), null, false, [{
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED,
                "callback":this.onInventoryTrackingEvent
            }, {
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI,
                "callback":this.onInventoryTrackingEvent
            }, {
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS,
                "callback":this.onInventoryTrackingEvent
            }, {
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES,
                "callback":this.onInventoryTrackingEvent
            }, {
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS,
                "callback":this.onInventoryTrackingEvent
            }, {
                "type":HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING,
                "callback":this.onInventoryTrackingEvent
            }]), new ComponentDependency(new IIDHabboFriendList(), null, false, [{
                "type":_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED,
                "callback":this.onFriendlistTrackingEvent
            }, {
                "type":_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_FRIENDS,
                "callback":this.onFriendlistTrackingEvent
            }, {
                "type":_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_SEARCH,
                "callback":this.onFriendlistTrackingEvent
            }, {
                "type":_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_REQUEST,
                "callback":this.onFriendlistTrackingEvent
            }, {
                "type":_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_MINIMZED,
                "callback":this.onFriendlistTrackingEvent
            }]), new ComponentDependency(new IIDHabboHelp(), null, false, [{
                "type":HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED,
                "callback":this.onHelpTrackingEvent
            }, {
                "type":HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT,
                "callback":this.onHelpTrackingEvent
            }]), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false, [{
                "type":RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK,
                "callback":this.onRoomAdClick
            }, {
                "type":RoomEngineEvent.INITIALIZED,
                "callback":this.onRoomAction
            }, {
                "type":RoomEngineEvent.DISPOSED,
                "callback":this.onRoomAction
            }]), new ComponentDependency(new IIDHabboAdManager(), null, false, [{
                "type":AdEvent.ROOM_AD_SHOW,
                "callback":this.onRoomAdLoad
            }]), new ComponentDependency(new IIDHabboToolbar(), null, false, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this.onToolbarClick
            }])]));
        }

        override protected function initComponent():void
        {
            this._latencyTracker = new LatencyTracker(this);
            this._performanceTracker = new PerformanceTracker(this);
            this._framerateTracker = new FramerateTracker(this);
            this._lagWarningLogger = new LagWarningLogger(this);
            this._toolbarClickTracker = new ToolbarClickTracker(this);
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new AuthenticationOKMessageEvent(this.onAuthOK));
            this.addMessageEvent(new _Str_2752(this.onCreditBalance));
            this.addMessageEvent(new _Str_3660(this._Str_25489));
            this.addMessageEvent(new PongMessageParser(this._Str_17172));
            var k:IEventDispatcher = Component(context).events;
            k.addEventListener(HabboCommunicationEvent.INIT, this.onConnectionEvent);
            k.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_ESTABLISHED, this.onConnectionEvent);
            k.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKING, this.onConnectionEvent);
            k.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKED, this.onConnectionEvent);
            k.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL, this.onConnectionEvent);
            k.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_AUTHENTICATED, this.onConnectionEvent);
            k.addEventListener(HabboHotelViewEvent.HHVE_START_LOAD, this.onHotelViewEvent);
            k.addEventListener(HabboHotelViewEvent.ERROR, this.onHotelViewEvent);
            k.addEventListener(HabboHotelViewEvent.HHVE_LOADED, this.onHotelViewEvent);
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communication.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            if (_Str_1229 == this)
            {
                _Str_1229 = null;
            }
            removeUpdateReceiver(this);
            if (((!(this._messageEvents == null)) && (!(this._communication == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communication.removeHabboConnectionMessageEvent(k);
                }
            }
            this._performanceTracker = null;
            this._framerateTracker = null;
            this._toolbarClickTracker = null;
            if (this._latencyTracker != null)
            {
                this._latencyTracker.dispose();
                this._latencyTracker = null;
            }
            if (this._fpsTrackingTimer)
            {
                this._fpsTrackingTimer.stop();
                this._fpsTrackingTimer.removeEventListener(TimerEvent.TIMER, this.onRoomActionTimerEvent);
                this._fpsTrackingTimer = null;
            }
            super.dispose();
        }

        private function setErrorContextFlag(k:uint, _arg_2:uint):void
        {
            this._errorContextFlags[_arg_2] = k;
        }

        private function onHotelViewEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboHotelViewEvent.HHVE_START_LOAD:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HOTELVIEW_START);
                    return;
                case HabboHotelViewEvent.HHVE_LOADED:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HOTELVIEW_OK);
                    return;
                case HabboHotelViewEvent.ERROR:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HOTELVIEW_FAIL);
                    return;
            }
        }

        private function onConnectionEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboCommunicationEvent.INIT:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_SOCKET_INIT);
                    break;
                case HabboCommunicationEvent.HABBO_CONNECTION_EVENT_ESTABLISHED:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_SOCKET_OK, String(this._communication.port));
                    break;
                case HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKING:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HANDSHAKE_START);
                    break;
                case HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL:
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HANDSHAKE_FAIL);
                    break;
                case HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKED:
                    this.setErrorContextFlag(2, 0);
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_HANDSHAKE_OK);
                    break;
                case HabboCommunicationEvent.HABBO_CONNECTION_EVENT_AUTHENTICATED:
                    this.setErrorContextFlag(3, 0);
                    this.loadConversionTrackingFrame();
                    this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_AUTH_OK);
                    break;
            }
            Component(context).events.removeEventListener(k.type, this.onConnectionEvent);
        }

        private function onWindowTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case _Str_5209.HABBO_WINDOW_TRACKING_EVENT_SLEEP:
                    this.setErrorContextFlag(0, 3);
                    return;
                case _Str_5209.HABBO_WINDOW_TRACKING_EVENT_RENDER:
                    this.setErrorContextFlag(1, 3);
                    return;
                case _Str_5209.HABBO_WINDOW_TRACKING_EVENT_INPUT:
                    this.setErrorContextFlag(2, 3);
                    return;
            }
        }

        private function onError(k:ErrorEvent):void
        {
            this.storeErrorDetails(k);
            if (k.critical)
            {
                this._crashed = true;
            }
            this.logError(context.root.getLastErrorMessage());
        }

        private function storeErrorDetails(k:ErrorEvent):void
        {
            var _local_3:uint;
            var _local_4:String;
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_VARIABLE_IS_FATAL, k.critical.toString());
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_VARIABLE_CLIENT_CRASH_TIME, new Date().getTime().toString());
            var _local_2:String = "";
            for each (_local_3 in this._errorContextFlags)
            {
                _local_2 = (_local_2 + String(_local_3));
            }
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_VARIABLE_CONTEXT, _local_2);
            if (this._performanceTracker != null)
            {
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_VARIABLE_FLASH_VERSION, this._performanceTracker.flashVersion);
                ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_VARIABLE_AVERAGE_UPDATE_INTERVAL, String(this._performanceTracker.averageUpdateInterval));
            }
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_DESC, k.message);
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_CAT, String(k.category));
            if (k.error != null)
            {
                _local_4 = Exception.getChainedStackTrace(k.error);
                if (_local_4 != null)
                {
                    ErrorReportStorage.setParameter(HabboErrorVariableEnum.ERROR_DATA, _local_4);
                }
            }
            this._communication.setMessageQueueErrorDebugData();
            ErrorReportStorage.addDebugData("Flash memory usage", (("Memory usage: " + Math.round((System.totalMemory / (0x0400 * 0x0400)))) + " MB"));
        }

        private function onNavigatorTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED:
                    this.setErrorContextFlag(0, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS:
                    this.setErrorContextFlag(1, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS:
                    this.setErrorContextFlag(2, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME:
                    this.setErrorContextFlag(3, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL:
                    this.setErrorContextFlag(4, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH:
                    this.setErrorContextFlag(5, 4);
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES:
                    this._Str_3754("navigator", "my_favorites");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS:
                    this._Str_3754("navigator", "my_friends_rooms");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY:
                    this._Str_3754("navigator", "my_history");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS:
                    this._Str_3754("navigator", "my_rooms");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS:
                    this._Str_3754("navigator", "official_rooms");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS:
                    this._Str_3754("navigator", "popular_rooms");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE:
                    this._Str_3754("navigator", "rooms_where_my_friends_are");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE:
                    this._Str_3754("navigator", "highest_score");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH:
                    this._Str_3754("navigator", "tag_search");
                    return;
                case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH:
                    this._Str_3754("navigator", "text_search");
                    return;
            }
        }

        private function onRoomSettingsTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED:
                    this.setErrorContextFlag(0, 7);
                    return;
                case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT:
                    this.setErrorContextFlag(1, 7);
                    return;
                case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED:
                    this.setErrorContextFlag(2, 7);
                    return;
            }
        }

        private function onInventoryTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED:
                    this.setErrorContextFlag(0, 5);
                    return;
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI:
                    this.setErrorContextFlag(1, 5);
                    return;
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS:
                    this.setErrorContextFlag(2, 5);
                    return;
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES:
                    this.setErrorContextFlag(3, 5);
                    return;
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS:
                    this.setErrorContextFlag(4, 5);
                    return;
                case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING:
                    this.setErrorContextFlag(5, 5);
                    return;
            }
        }

        private function _Str_25489(k:_Str_3660):void
        {
            var _local_2:_Str_5519 = k.getParser();
            this._Str_3754("achievement", "achievement", [_local_2.data.badgeCode]);
        }

        private function onCatalogPageOpened(k:CatalogPageOpenedEvent):void
        {
            this._Str_3754("catalogue", "page", [k.pageLocalization]);
        }

        private function onCatalogTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN:
                    this.setErrorContextFlag(1, 9);
                    return;
                case HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE:
                    this.setErrorContextFlag(0, 9);
                    return;
            }
        }

        private function onFriendlistTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case _Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED:
                    this.setErrorContextFlag(0, 6);
                    return;
                case _Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_FRIENDS:
                    this.setErrorContextFlag(1, 6);
                    return;
                case _Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_SEARCH:
                    this.setErrorContextFlag(2, 6);
                    return;
                case _Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_REQUEST:
                    this.setErrorContextFlag(3, 6);
                    return;
                case _Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_MINIMZED:
                    this.setErrorContextFlag(4, 6);
                    return;
            }
        }

        private function onHelpTrackingEvent(k:Event):void
        {
            switch (k.type)
            {
                case HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED:
                    this.setErrorContextFlag(0, 10);
                    return;
                case HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT:
                    this.setErrorContextFlag(1, 10);
                    return;
            }
        }

        private function onAuthOK(k:IMessageEvent):void
        {
            this._Str_3754("authentication", "authok");
        }

        private function _Str_17172(k:PongMessageParser):void
        {
            if (this._latencyTracker != null)
            {
                this._latencyTracker._Str_17172(k);
            }
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            if (!this._anyRoomsVisited)
            {
                this.trackLoginStep(HabboLoginTrackingStep.CLIENT_INIT_ROOM_ENTER);
                this._anyRoomsVisited = true;
            }
            var _local_2:_Str_4522 = _Str_2752(k).getParser();
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.LAST_ROOM, String(_local_2._Str_6550));
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.IN_ROOM, String(true));
            this._Str_3754("navigator", "private", [_local_2._Str_6550]);
        }

        private function onConfigurationComplete(k:Event):void
        {
            if (this._latencyTracker != null)
            {
                this._latencyTracker.init();
            }
        }

        private function onRoomAdLoad(k:AdEvent):void
        {
            this._Str_3754("room_ad", "show", [this.getAliasFromAdTechUrl(k.clickUrl)]);
        }

        private function onRoomAdClick(k:RoomObjectRoomAdEvent):void
        {
            this._Str_3754("room_ad", "click", [this.getAliasFromAdTechUrl(k.clickUrl)]);
        }

        private function getAliasFromAdTechUrl(k:String):String
        {
            var _local_2:Array = k.match(/;alias=([^;]+)/);
            if (((!(_local_2 == null)) && (_local_2.length > 1)))
            {
                return _local_2[1];
            }
            return "unknown";
        }

        private function onRoomAction(k:RoomEngineEvent):void
        {
            if (k.type == RoomEngineEvent.INITIALIZED)
            {
                if (!this._fpsTrackingTimer)
                {
                    this._fpsTrackingRoomId = k.roomId;
                    this._fpsTrackingTimer = new Timer((60 * 1000), 1);
                    this._fpsTrackingTimer.addEventListener(TimerEvent.TIMER, this.onRoomActionTimerEvent);
                    this._fpsTrackingTimer.start();
                }
            }
            else
            {
                if (k.type == RoomEngineEvent.DISPOSED)
                {
                    if (this._fpsTrackingTimer)
                    {
                        this._fpsTrackingTimer.removeEventListener(TimerEvent.TIMER, this.onRoomActionTimerEvent);
                        this._fpsTrackingTimer.stop();
                        this._fpsTrackingTimer = null;
                        this._fpsTrackingRoomId = -1;
                    }
                }
            }
        }

        private function onRoomActionTimerEvent(k:TimerEvent):void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:int;
            if (((((!(disposed)) && (!(this._crashed))) && (!(this._communication == null))) && (this._framerateTracker)))
            {
                _local_2 = null;
                if (this._roomEngine != null)
                {
                    _local_3 = this._roomEngine.getRoomObjectCount(this._roomEngine.activeRoomId, RoomObjectCategoryEnum.CONST_100);
                    _local_4 = (this._roomEngine.getRoomObjectCount(this._roomEngine.activeRoomId, RoomObjectCategoryEnum.CONST_10) + this._roomEngine.getRoomObjectCount(this._roomEngine.activeRoomId, RoomObjectCategoryEnum.CONST_20));
                    _local_2 = ((("Avatars: " + _local_3) + ", Objects: ") + _local_4);
                }
                this.trackEventLog("ClientPerformance", String(this._framerateTracker.frameRate), "fps", _local_2, this._fpsTrackingRoomId);
                this._fpsTrackingCount++;
            }
        }

        private function onToolbarClick(k:HabboToolbarEvent):void
        {
            if (this._toolbarClickTracker)
            {
                this._toolbarClickTracker.track(k._Str_4856);
            }
        }

        private function onZoomToggle(k:HabboToolbarEvent):void
        {
            if (this._toolbarClickTracker)
            {
                this._toolbarClickTracker.track(k.type);
            }
        }

        public function _Str_3754(k:String, _arg_2:String, _arg_3:Array=null):void
        {
            Logger.log((((((("legacyTrackGoogle(" + k) + ", ") + _arg_2) + ", ") + _arg_3) + ")"));
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.legacyTrack", k, _arg_2, ((_arg_3 == null) ? [] : _arg_3));
                }
                else
                {
                    Logger.log("ExternalInterface is not available, tracking is disabled");
                }
            }
            catch(e:Error)
            {
            }
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            Logger.log((((((("trackGoogle(" + k) + ", ") + _arg_2) + ", ") + _arg_3) + ")"));
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.track", k, _arg_2, _arg_3);
                }
                else
                {
                    Logger.log("ExternalInterface is not available, tracking is disabled");
                }
            }
            catch(e:Error)
            {
            }
        }

        private function loadConversionTrackingFrame():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.loadConversionTrackingFrame");
                }
                else
                {
                    Logger.log("ExternalInterface is not available!");
                }
            }
            catch(e:Error)
            {
            }
        }

        public function trackLoginStep(k:String, _arg_2:String=null):void
        {
            Logger.log(("* Track Login Step: " + k));
            if (!getBoolean("processlog.enabled"))
            {
                return;
            }
            try
            {
                if (ExternalInterface.available)
                {
                    if (_arg_2 != null)
                    {
                        ExternalInterface.call("FlashExternalInterface.logLoginStep", k, _arg_2);
                    }
                    else
                    {
                        ExternalInterface.call("FlashExternalInterface.logLoginStep", k);
                    }
                }
                else
                {
                    Logger.log("ExternalInterface is not available, tracking is disabled");
                }
            }
            catch(e:Error)
            {
            }
        }

        public function trackEventLog(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void
        {
            if ((((!(this._communication == null)) && (!(this._communication.connection == null))) && (this._communication.connection.connected)))
            {
                this._communication.connection.send(new EventLogMessageComposer(k, _arg_2, _arg_3, _arg_4, _arg_5));
            }
        }

        public function _Str_3990(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void
        {
            var _local_6:String = ((k + _arg_2) + _arg_3);
            var _local_7:Boolean;
            var _local_8:uint;
            while (_local_8 < this._instance.length)
            {
                if (this._instance[_local_8] == _local_6)
                {
                    _local_7 = true;
                    break;
                }
                _local_8++;
            }
            if (!_local_7)
            {
                this.trackEventLog(k, _arg_2, _arg_3, _arg_4, _arg_5);
                this._instance.push(_local_6);
            }
        }

        public function trackTalentTrackOpen(k:String, _arg_2:String):void
        {
            this.trackEventLog("Talent", k, "talent.open", _arg_2);
        }

        public function logError(k:String):void
        {
            Logger.log((("logError(" + k) + ")"));
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.logError", k);
                }
                else
                {
                    Logger.log("ExternalInterface is not available, tracking is disabled");
                }
            }
            catch(e:Error)
            {
            }
        }

        public function _Str_13181(k:int):void
        {
            this._lagWarningLogger._Str_13181(k);
        }

        public function update(k:uint):void
        {
            var _local_2:int = getTimer();
            if (((this._currentTime > -1) && (_local_2 < this._currentTime)))
            {
                this._invalidTimeCount++;
                ErrorReportStorage.addDebugData("Invalid time counter", ("Invalid times: " + this._invalidTimeCount));
            }
            if (((this._currentTime > -1) && ((_local_2 - this._currentTime) > (15 * 1000))))
            {
                this._timeLeapCount++;
                ErrorReportStorage.addDebugData("Time leap counter", ("Time leaps: " + this._timeLeapCount));
            }
            this._currentTime = _local_2;
            if (this._performanceTracker != null)
            {
                this._performanceTracker.update(k, this._currentTime);
            }
            if (this._latencyTracker != null)
            {
                this._latencyTracker.update(k, this._currentTime);
            }
            if (this._framerateTracker != null)
            {
                this._framerateTracker.trackUpdate(k, this._currentTime);
            }
            if (this._lagWarningLogger != null)
            {
                this._lagWarningLogger.update(this._currentTime);
            }
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function send(k:IMessageComposer):void
        {
            if ((((!(this._communication == null)) && (!(this._communication.connection == null))) && (this._communication.connection.connected)))
            {
                this._communication.connection.send(k);
            }
        }
    }
}
