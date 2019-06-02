package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.navigator.view.NavigatorView;
    import com.sulake.habbo.navigator.context.ContextContainer;
    import com.sulake.habbo.navigator.lift.LiftDataContainer;
    import com.sulake.habbo.navigator.context.SearchContextHistoryManager;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4173;
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.navigator.NavigatorCache;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_10484;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorMetaDataParser;
    import com.sulake.habbo.navigator.context.SearchContext;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultList;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultSet;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorLiftedRoomsParser;
    import com.sulake.habbo.communication.messages.parser.newnavigator._Str_6991;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SavedSearch;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorSavedSearchesParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_11428;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_11429;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_9950;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7393;
    import com.sulake.habbo.utils.Base64;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_11137;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_12436;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_11341;
    import com.sulake.habbo.communication.messages.outgoing._Str_369._Str_9918;
    import __AS3__.vec.*;

    public class HabboNewNavigator extends Component implements IHabboNewNavigator, ILinkEventTracker 
    {
        private var _communication:IHabboCommunicationManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _windowManager:IHabboWindowManager;
        private var _localization:IHabboLocalizationManager;
        private var _sessionData:ISessionDataManager;
        private var _tracking:IHabboTracking;
        private var _catalog:IHabboCatalog;
        private var _habboHelp:IHabboHelp;
        private var _avatarManager:IAvatarRenderManager;
        private var _incomingMessages:NewIncomingMessages;
        private var _toolbar:IHabboToolbar;
        private var _oldNavigator:HabboNavigator;
        private var _legacyNavigator:LegacyNavigator;
        private var _initialized:Boolean = false;
        private var _navigatorView:NavigatorView;
        private var _contextContainer:ContextContainer;
        private var _liftDataContainer:LiftDataContainer;
        private var _searchContextHistoryManager:SearchContextHistoryManager;
        private var _currentResults:_Str_4173;
        private var _groupDetails:Map;
        private var _currentResultRoomNameData:Map;
        private var _collapsedCategories:Vector.<String>;
        private var _navigatorCache:NavigatorCache;
        private var _lastSearchCode:String = "official_view";
        private var _lastFilteringData:String = "";
        private var _previousFilterInput:String = "";
        private var _newResultsRendered:Boolean = false;
        private var _noPushToHistoryDueToNavigation:Boolean = false;

        public function HabboNewNavigator(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._groupDetails = new Map();
            this._currentResultRoomNameData = new Map();
            this._collapsedCategories = new Vector.<String>(0);
            super(k, _arg_2, _arg_3);
            this._legacyNavigator = new LegacyNavigator(this, this._oldNavigator);
        }

        public static function _Str_6560(k:String, _arg_2:String):String
        {
            return k + ((_arg_2 == "") ? "" : (":" + _arg_2));
        }


        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get _Str_2627():ISessionDataManager
        {
            return this._sessionData;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }, false, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this._Str_3304
            }]), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, false), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionData = k;
            }, true, [{
                "type":PerksUpdatedEvent.PERKS_UPDATED,
                "callback":this._Str_12137
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarManager = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _oldNavigator = HabboNavigator(k);
                if (_legacyNavigator)
                {
                    _legacyNavigator._Str_22899 = _oldNavigator;
                }
            }, true)]));
        }

        override protected function initComponent():void
        {
            this._incomingMessages = new NewIncomingMessages(this);
            context.addLinkEventTracker(this);
            this._navigatorView = new NavigatorView(this);
            this._contextContainer = new ContextContainer(this);
            this._searchContextHistoryManager = new SearchContextHistoryManager(this);
            this._liftDataContainer = new LiftDataContainer(this);
            this._navigatorCache = new NavigatorCache();
            this._communication.connection.send(new _Str_10484());
            this._initialized = true;
        }

        private function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                switch (k._Str_3378)
                {
                    case HabboToolbarIconEnum.NAVIGATOR:
                        this.toggle();
                        return;
                }
            }
        }

        public function initialize(k:NavigatorMetaDataParser):void
        {
            this._contextContainer.initialize(k);
        }

        public function _Str_20936(k:_Str_4173):void
        {
            this._newResultsRendered = false;
            this._currentResults = k;
            this._Str_25713(k._Str_11413);
            if (!this._noPushToHistoryDueToNavigation)
            {
                this._searchContextHistoryManager._Str_23951(new SearchContext(k._Str_4569, k._Str_5610));
            }
            this._navigatorCache._Str_22588(((k._Str_4569 + "/") + k._Str_5610), k);
            this._noPushToHistoryDueToNavigation = false;
            if (this._navigatorView.visible)
            {
                this._navigatorView._Str_18091(k, this._previousFilterInput);
            }
        }

        private function _Str_25713(k:SearchResultSet):void
        {
            var _local_2:SearchResultList;
            var _local_3:_Str_2370;
            this._currentResultRoomNameData = new Map();
            for each (_local_2 in k._Str_7385)
            {
                for each (_local_3 in _local_2.guestRooms)
                {
                    this._currentResultRoomNameData.add(_local_3.flatId, _local_3.roomName);
                }
            }
        }

        public function get _Str_16771():Boolean
        {
            return this._newResultsRendered;
        }

        public function set _Str_16771(k:Boolean):void
        {
            this._newResultsRendered = k;
        }

        public function _Str_23125(k:NavigatorLiftedRoomsParser):void
        {
            this._liftDataContainer._Str_24253(k._Str_6772);
            this._navigatorView._Str_24377();
        }

        public function _Str_23415(k:_Str_6991):void
        {
            this._navigatorView._Str_23074(k._Str_17736, k._Str_18137, k._Str_17903, k._Str_25666, k._Str_23289);
        }

        public function _Str_11632(k:NavigatorSavedSearchesParser):void
        {
            this._contextContainer._Str_8597 = k._Str_8597.concat(new Vector.<SavedSearch>(0));
            this._navigatorView._Str_11632(this._contextContainer._Str_8597);
        }

        public function _Str_3702(k:_Str_2974):void
        {
            if (this._groupDetails.hasKey(k.groupId))
            {
                this._groupDetails.remove(k.groupId);
            }
            this._groupDetails.add(k.groupId, k);
            this._navigatorView._Str_24313(k.groupId);
        }

        public function _Str_18969(k:Vector.<String>):void
        {
            this._collapsedCategories = k.concat();
        }

        public function get _Str_8273():Vector.<String>
        {
            return this._collapsedCategories;
        }

        public function _Str_20693(k:int):_Str_2974
        {
            return this._groupDetails.getValue(k);
        }

        public function _Str_25434():void
        {
            if (this._searchContextHistoryManager._Str_22168)
            {
                this._noPushToHistoryDueToNavigation = true;
                this._Str_21272(this._searchContextHistoryManager._Str_24998());
            }
            this.trackEventLog("browse.back", "Results");
        }

        public function _Str_20175():void
        {
            if (((!(this._lastSearchCode == null)) && (!(this._lastFilteringData == null))))
            {
                this._navigatorCache._Str_25085(((this._lastSearchCode + "/") + this._lastFilteringData));
                this._Str_3310(this._lastSearchCode, this._lastFilteringData);
            }
        }

        public function _Str_3310(k:String, _arg_2:String="", _arg_3:String=""):void
        {
            this._navigatorView._Str_9330 = true;
            this._previousFilterInput = _arg_3;
            var _local_4:_Str_4173 = this._navigatorCache._Str_4666(((k + "/") + _arg_2));
            if (_local_4 != null)
            {
                this._Str_20936(_local_4);
            }
            else
            {
                this._lastSearchCode = k;
                this._lastFilteringData = _arg_2;
                this._communication.connection.send(new _Str_11428(k, _arg_2));
                this.trackEventLog("search", "Search", _Str_6560(k, _arg_2));
            }
            this.open();
        }

        public function _Str_21272(k:SearchContext):void
        {
            this._Str_3310(k.searchCode, k.filtering);
        }

        public function _Str_25074(k:String, _arg_2:String):void
        {
            if (this._currentResults != null)
            {
                this._communication.connection.send(new _Str_11429(k, _arg_2));
            }
            this.trackEventLog("savedsearch.add", "SavedSearch", _Str_6560(k, _arg_2));
            this._navigatorView._Str_6496(true);
        }

        public function _Str_25285(k:int):void
        {
            this._communication.connection.send(new _Str_9950(k));
            this.trackEventLog("savedsearch.delete", "SavedSearch");
        }

        private function _Str_12137(k:PerksUpdatedEvent):void
        {
            if (!this._sessionData.isPerkAllowed(PerkEnum.NAVIGATOR_PHASE_TWO_2014))
            {
                context.removeLinkEventTracker(this);
                if (this._initialized)
                {
                    this._incomingMessages._Str_23421();
                    this.close();
                }
                return;
            }
            if (!this._initialized)
            {
                this.initComponent();
            }
            else
            {
                if (this._sessionData.isPerkAllowed(PerkEnum.NAVIGATOR_PHASE_TWO_2014))
                {
                    this._incomingMessages._Str_21575();
                }
            }
        }

        public function get eventUrlPrefix():String
        {
            return "navigator/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array;
            var _local_3:int;
            _local_2 = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "goto":
                    if (_local_2.length > 2)
                    {
                        switch (_local_2[2])
                        {
                            case "home":
                                this._legacyNavigator.goToHomeRoom();
                                break;
                            default:
                                _local_3 = int(_local_2[2]);
                                if (_local_3 > 0)
                                {
                                    this._legacyNavigator.goToPrivateRoom(_local_3);
                                }
                                else
                                {
                                    this.communication.connection.send(new _Str_7393(_local_2[2]));
                                }
                        }
                    }
                    return;
                case "search":
                    if (_local_2.length > 2)
                    {
                        this._Str_3310("hotel_view", _local_2[2]);
                    }
                    return;
                case "tag":
                    if (_local_2.length > 2)
                    {
                        this._Str_3310("hotel_view", _local_2[2]);
                    }
                    return;
                case "tab":
                    if (_local_2.length > 2)
                    {
                        this._Str_3310(_local_2[2]);
                    }
                    return;
                case "report":
                    if (_local_2.length > 3)
                    {
                        this._legacyNavigator._Str_24971(_local_2[2], Base64.decode(_local_2[3]));
                    }
                    return;
                default:
                    Logger.log(("Navigator unknown link-type received: " + _local_2[1]));
            }
        }

        public function showOwnRooms():void
        {
        }

        public function showToolbarHover(k:Point):void
        {
        }

        public function hideToolbarHover(k:Boolean):void
        {
        }

        public function get isReady():Boolean
        {
            return (!(this._contextContainer == null)) && (this._contextContainer.isReady());
        }

        public function get _Str_7014():ContextContainer
        {
            return this._contextContainer;
        }

        public function get _Str_26311():SearchContextHistoryManager
        {
            return this._searchContextHistoryManager;
        }

        public function get _Str_7977():LiftDataContainer
        {
            return this._liftDataContainer;
        }

        public function get _Str_3440():_Str_4173
        {
            return this._currentResults;
        }

        public function goToRoom(k:int, _arg_2:String="mainview"):void
        {
            this.communication.connection.send(new _Str_3570(k, false, true));
            this._navigatorView.visible = false;
            var _local_3:String = this._currentResultRoomNameData.getValue(k);
            this.trackEventLog("go", _arg_2, ((_local_3) ? _local_3 : ""), k);
        }

        public function _Str_12024(k:int):void
        {
            this.communication.connection.send(new _Str_2553(k));
        }

        public function get _Str_25225():String
        {
            return context.configuration.getProperty("image.library.url");
        }

        public function performTagSearch(k:String):void
        {
            this._Str_3310("hotel_view", ("tag:" + k));
        }

        public function createRoom():void
        {
            this._legacyNavigator._Str_15114.show();
        }

        public function open():void
        {
            if (this._navigatorView == null)
            {
                return;
            }
            if (!this._navigatorView.visible)
            {
                this._navigatorView.visible = true;
            }
        }

        public function close():void
        {
            if (this._navigatorView.visible)
            {
                this._navigatorView.visible = false;
            }
        }

        public function toggle():void
        {
            if (this._navigatorView == null)
            {
                return;
            }
            this._navigatorView.visible = (!(this._navigatorView.visible));
            if (this._navigatorView.visible)
            {
                this._Str_20175();
            }
        }

        public function get mainWindow():IFrameWindow
        {
            return this._navigatorView.mainWindow;
        }

        public function refresh():void
        {
            if (this._currentResults)
            {
                this._navigatorView._Str_18091(this._currentResults);
            }
        }

        public function get _Str_2559():IHabboNavigator
        {
            return this._legacyNavigator;
        }

        public function get data():NavigatorData
        {
            return this._legacyNavigator.data;
        }

        public function _Str_10331(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:int):void
        {
            this._communication.connection.send(new _Str_11137(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function _Str_18961(k:int, _arg_2:Boolean=true):void
        {
            this._communication.connection.send(new _Str_2863(k, _arg_2));
        }

        public function _Str_23169(k:String):void
        {
            this._communication.connection.send(new _Str_12436(k));
        }

        public function _Str_23630(k:String):void
        {
            this._communication.connection.send(new _Str_11341(k));
        }

        public function goToHomeRoom():void
        {
            this.goToRoom(this._legacyNavigator.data.homeRoomId, "external");
        }

        public function trackEventLog(k:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            if (this._tracking)
            {
                this._tracking.trackEventLog("NewNavigator", _arg_2, k, _arg_3, _arg_4);
            }
        }

        public function get view():NavigatorView
        {
            return this._navigatorView;
        }

        public function _Str_25231(k:String, _arg_2:int):void
        {
            this._communication.connection.send(new _Str_9918(k, _arg_2));
            this.trackEventLog("browse.toggleviewmode", "ViewMode", "", _arg_2);
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function performTextSearch(k:String):void
        {
        }

        public function performGuildBaseSearch():void
        {
        }

        public function performCompetitionRoomsSearch(k:int, _arg_2:int):void
        {
        }
    }
}
