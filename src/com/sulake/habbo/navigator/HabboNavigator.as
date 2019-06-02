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
    import com.sulake.habbo.navigator.mainview.MainViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.navigator.toolbar._Str_8760;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.core.runtime.IContext;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
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
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11608;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10878;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4374;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7393;
    import com.sulake.habbo.navigator.inroom.*;

    public class HabboNavigator extends Component implements IHabboNavigator, IHabboTransitionalNavigator, ILinkEventTracker 
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
        private var _mainViewCtrl:MainViewCtrl;
        private var _roomInfoViewCtrl:RoomEventViewCtrl;
        private var _roomCreateViewCtrl:RoomCreateViewCtrl;
        private var _data:NavigatorData;
        private var _tabs:Tabs;
        private var _assetLibrary:IAssetLibrary;
        private var _incomingMessages:IncomingMessages;
        private var _toolbar:IHabboToolbar;
        private var _roomSettingsCtrl:RoomSettingsCtrl;
        private var _passwordInput:GuestRoomPasswordInput;
        private var _doorbell:GuestRoomDoorbell;
        private var _officialRoomEntryManager:OfficialRoomEntryManager;
        private var _roomEventViewCtrl:RoomInfoViewCtrl;
        private var _roomEventInfoCtrl:RoomEventInfoCtrl;
        private var _roomFilterCtrl:RoomFilterCtrl;
        private var _toolbarHover:_Str_8760;
        private var _enforceCategoryCtrl:EnforceCategoryCtrl;
        private var _webRoomReport:Boolean = true;
        private var _webRoomReportedName:String = null;

        public function HabboNavigator(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._assetLibrary = new AssetLibraryCollection("NavigatorComponent");
            this._data = new NavigatorData(this);
            this._mainViewCtrl = new MainViewCtrl(this);
            this._roomInfoViewCtrl = new RoomEventViewCtrl(this);
            this._roomCreateViewCtrl = new RoomCreateViewCtrl(this);
            this._passwordInput = new GuestRoomPasswordInput(this);
            this._doorbell = new GuestRoomDoorbell(this);
            this._tabs = new Tabs(this);
            this._officialRoomEntryManager = new OfficialRoomEntryManager(this);
            this._roomEventViewCtrl = new RoomInfoViewCtrl(this);
            this._roomEventInfoCtrl = new RoomEventInfoCtrl(this);
            this._roomFilterCtrl = new RoomFilterCtrl(this);
            this._enforceCategoryCtrl = new EnforceCategoryCtrl(this);
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get data():NavigatorData
        {
            return this._data;
        }

        public function get _Str_2813():ITransitionalMainViewCtrl
        {
            return this._mainViewCtrl;
        }

        public function get tabs():Tabs
        {
            return this._tabs;
        }

        public function get _Str_4012():RoomEventViewCtrl
        {
            return this._roomInfoViewCtrl;
        }

        public function get _Str_15114():RoomCreateViewCtrl
        {
            return this._roomCreateViewCtrl;
        }

        public function get assetLibrary():IAssetLibrary
        {
            return this._assetLibrary;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get _Str_3188():RoomSettingsCtrl
        {
            return this._roomSettingsCtrl;
        }

        public function get _Str_2627():ISessionDataManager
        {
            return this._sessionData;
        }

        public function get _Str_7174():GuestRoomPasswordInput
        {
            return this._passwordInput;
        }

        public function get doorbell():GuestRoomDoorbell
        {
            return this._doorbell;
        }

        public function get _Str_6939():RoomInfoViewCtrl
        {
            return this._roomEventViewCtrl;
        }

        public function get _Str_7596():OfficialRoomEntryManager
        {
            return this._officialRoomEntryManager;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function get _Str_5048():RoomEventInfoCtrl
        {
            return this._roomEventInfoCtrl;
        }

        public function get _Str_6472():RoomFilterCtrl
        {
            return this._roomFilterCtrl;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get _Str_17937():EnforceCategoryCtrl
        {
            return this._enforceCategoryCtrl;
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
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._incomingMessages = new IncomingMessages(this);
            this._roomSessionManager.events.addEventListener(RoomSessionEvent.CREATED, this._Str_19913);
            if (!this._sessionData.isPerkAllowed(PerkEnum.NAVIGATOR_PHASE_TWO_2014))
            {
                context.addLinkEventTracker(this);
            }
            var k:String = getProperty("navigator.default_tab");
            if (getInteger("new.identity", 0) > 0)
            {
                k = getProperty("new.identity.navigator.default_tab");
            }
            this.tabs._Str_13005(Tabs._Str_20758(k, Tabs._Str_3866));
            this._roomSettingsCtrl = new RoomSettingsCtrl(this);
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(HabboWebTools.OPENROOM, this._Str_17932);
            }
        }

        public function _Str_17932(k:String, _arg_2:Boolean=false, _arg_3:String=null):void
        {
            this._webRoomReport = _arg_2;
            this._webRoomReportedName = _arg_3;
            this.send(new _Str_11608(k));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._mainViewCtrl)
            {
                this._mainViewCtrl.dispose();
                this._mainViewCtrl = null;
            }
            if (this._roomSessionManager != null)
            {
                this._roomSessionManager.events.removeEventListener(RoomSessionEvent.CREATED, this._Str_19913);
            }
            context.removeLinkEventTracker(this);
            if (((!(this._toolbar == null)) && (!(this._toolbar.events == null))))
            {
                this._toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this._Str_3304);
            }
            if (this._roomInfoViewCtrl)
            {
                this._roomInfoViewCtrl.dispose();
                this._roomInfoViewCtrl = null;
            }
            if (this._roomFilterCtrl)
            {
                this._roomFilterCtrl.dispose();
                this._roomFilterCtrl = null;
            }
            if (this._roomCreateViewCtrl)
            {
                this._roomCreateViewCtrl.dispose();
                this._roomCreateViewCtrl = null;
            }
            if (this._officialRoomEntryManager)
            {
                this._officialRoomEntryManager.dispose();
                this._officialRoomEntryManager = null;
            }
            if (this._roomEventViewCtrl)
            {
                this._roomEventViewCtrl.dispose();
                this._roomEventViewCtrl = null;
            }
            if (this._roomSettingsCtrl)
            {
                this._roomSettingsCtrl.dispose();
                this._roomSettingsCtrl = null;
            }
            if (this._toolbarHover)
            {
                this._toolbarHover.dispose();
                this._toolbarHover = null;
            }
            super.dispose();
        }

        public function startRoomCreation():void
        {
            this._roomCreateViewCtrl.show();
        }

        public function goToPrivateRoom(k:int):void
        {
            this.send(new _Str_3570(k, false, true));
        }

        public function removeRoomRights(k:int):void
        {
            this.send(new _Str_10878(k));
        }

        public function hasRoomRightsButIsNotOwner(k:int):Boolean
        {
            var _local_2:IRoomSession;
            if (this._roomSessionManager)
            {
                _local_2 = this._roomSessionManager.getSession(k);
                return (_local_2.roomControllerLevel == RoomControllerLevel.GUEST) && (!(_local_2.isRoomController));
            }
            return false;
        }

        public function goToRoomNetwork(k:int, _arg_2:Boolean):void
        {
            var _local_3:int;
            if (this._roomSessionManager)
            {
                this._roomInfoViewCtrl.close();
                _local_3 = 0;
                if (((_arg_2) && (this._data.homeRoomId > 0)))
                {
                    _local_3 = this._data.homeRoomId;
                }
                this._roomSessionManager._Str_21545(k, _local_3);
            }
        }

        public function goToRoom(k:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void
        {
            var _local_5:int;
            Logger.log(("GO TO ROOM: " + k));
            if (this._roomSessionManager)
            {
                if (_arg_2)
                {
                    this._mainViewCtrl.close();
                }
                this._roomSessionManager._Str_10094(k, _arg_3);
                if (this.tabs.getSelected())
                {
                    _local_5 = ((_arg_4 > -1) ? (_arg_4 + 1) : 0);
                    switch (this.tabs.getSelected().id)
                    {
                        case Tabs._Str_6250:
                            this._Str_4051(this.tabs.getSelected()._Str_5252._Str_5960, "go.official", String(k), _local_5);
                            return;
                        case Tabs._Str_5203:
                            this._Str_4051(this.tabs.getSelected()._Str_5252._Str_5960, "go.me", String(k), _local_5);
                            return;
                        case Tabs._Str_3866:
                            this._Str_4051(this.tabs.getSelected()._Str_5252._Str_5960, "go.rooms", String(k), _local_5);
                            return;
                        case Tabs._Str_6209:
                            this._Str_4051("Events", "go.events", String(k), _local_5);
                            return;
                        case Tabs._Str_3813:
                            this._Str_4051("Search", "go.search", String(k), _local_5);
                            return;
                    }
                }
            }
        }

        public function goToHomeRoom():Boolean
        {
            if (this._data.homeRoomId < 1)
            {
                Logger.log("No home room set while attempting to go to home room");
                return false;
            }
            this.goToRoom(this._data.homeRoomId, true);
            return true;
        }

        public function send(k:IMessageComposer, _arg_2:Boolean=false):void
        {
            this._communication.connection.send(k);
        }

        public function getXmlWindow(name:String, layer:uint=1):IWindow
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:IWindow;
            try
            {
                asset = assets.getAssetByName((name + "_xml"));
                xmlAsset = XmlAsset(asset);
                window = this._windowManager.buildFromXML(XML(xmlAsset.content), layer);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + _windowManager) + "!"));
                throw (e);
            }
            return window;
        }

        public function getText(k:String):String
        {
            var _local_2:String = this._localization.getLocalization(k);
            if (((_local_2 == null) || (_local_2 == "")))
            {
                _local_2 = k;
            }
            return _local_2;
        }

        public function registerParameter(k:String, _arg_2:String, _arg_3:String):String
        {
            return this._localization.registerParameter(k, _arg_2, _arg_3);
        }

        public function _Str_10781(k:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):IBitmapWrapperWindow
        {
            var _local_7:BitmapData = this._Str_3122(_arg_2);
            var _local_8:IBitmapWrapperWindow = IBitmapWrapperWindow(this._windowManager.createWindow(k, "", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, _Str_3108.NULL, (WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT), new Rectangle(_arg_4, _arg_5, _local_7.width, _local_7.height), _arg_3, _arg_6));
            _local_8.bitmap = _local_7;
            _local_8.disposesBitmap = false;
            return _local_8;
        }

        public function refreshButton(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            if (!_arg_6)
            {
                _arg_6 = _arg_2;
            }
            var _local_7:IBitmapWrapperWindow = (k.findChildByName(_arg_2) as IBitmapWrapperWindow);
            if (!_local_7)
            {
                Logger.log(("Could not locate button in navigator: " + _arg_2));
            }
            if (!_arg_3)
            {
                _local_7.visible = false;
            }
            else
            {
                this._Str_11416(_local_7, _arg_6, _arg_4, _arg_5);
                _local_7.visible = true;
            }
        }

        private function _Str_11416(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            k.id = _arg_4;
            k.procedure = _arg_3;
            if (k.bitmap != null)
            {
                return;
            }
            k.bitmap = this._Str_3122(_arg_2);
            k.disposesBitmap = false;
            k.width = k.bitmap.width;
            k.height = k.bitmap.height;
        }

        public function _Str_3122(k:String, _arg_2:String="_png"):BitmapData
        {
            var _local_3:String = (k + _arg_2);
            var _local_4:IAsset = assets.getAssetByName(_local_3);
            var _local_5:BitmapDataAsset = BitmapDataAsset(_local_4);
            var _local_6:BitmapData = BitmapData(_local_5.content);
            return _local_6;
        }

        private function _Str_19913(k:RoomSessionEvent):void
        {
            if (((this._roomSessionManager) && (this._roomInfoViewCtrl)))
            {
                this._roomInfoViewCtrl.close();
            }
        }

        public function openCatalogClubPage(k:String):void
        {
            if (this._catalog == null)
            {
                return;
            }
            this._catalog.openClubCenter();
        }

        public function _Str_12506():void
        {
            if (this._catalog == null)
            {
                return;
            }
            this._catalog.openCatalogPage("room_ad");
        }

        public function _Str_14281(k:String, _arg_2:String, _arg_3:Date, _arg_4:int):void
        {
            if (this._catalog == null)
            {
                return;
            }
            var _local_5:String = this._data._Str_2678.roomName;
            this._catalog.openRoomAdCatalogPageInExtendedMode("room_ad", k, _arg_2, _local_5, _arg_3, _arg_4);
        }

        private function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                switch (k._Str_3378)
                {
                    case HabboToolbarIconEnum.ROOMINFO:
                        this.toggleRoomInfoVisibility();
                        return;
                    case HabboToolbarIconEnum.NAVIGATOR_ME_TAB:
                        this.showOwnRooms();
                        return;
                    case HabboToolbarIconEnum.GAMES:
                        if (getBoolean("game.center.enabled"))
                        {
                            this.closeNavigator();
                        }
                        return;
                    case HabboToolbarIconEnum.HOME:
                        this.goToHomeRoom();
                        return;
                }
            }
        }

        public function toggleRoomInfoVisibility():void
        {
            if (this._roomCreateViewCtrl)
            {
                this._roomInfoViewCtrl.toggle();
            }
        }

        public function performTagSearch(k:String):void
        {
            if (this._mainViewCtrl == null)
            {
                return;
            }
            if (k.indexOf(" ") != -1)
            {
                k = (('"' + k) + '"');
            }
            this._mainViewCtrl._Str_2798(Tabs._Str_3813, Tabs._Str_5383, k);
            this._Str_4051("Search", "search.tag", k);
            this._mainViewCtrl.mainWindow.activate();
        }

        public function performTextSearch(k:String):void
        {
            if (this._mainViewCtrl == null)
            {
                return;
            }
            this._mainViewCtrl._Str_2798(Tabs._Str_3813, Tabs._Str_5622, k);
            this._Str_4051("Search", "search", k);
            this._mainViewCtrl.mainWindow.activate();
            this._mainViewCtrl._Str_6414._Str_17634._Str_2497(k);
        }

        public function performCompetitionRoomsSearch(k:int, _arg_2:int):void
        {
            if (((this._mainViewCtrl == null) || ((!(this._data == null)) && (this._data._Str_19838()))))
            {
                return;
            }
            this._data._Str_4079 = new _Str_4374(null, k, _arg_2);
            this._mainViewCtrl._Str_2798(Tabs._Str_3813, Tabs._Str_9891, "");
            this._mainViewCtrl.mainWindow.activate();
            this._mainViewCtrl._Str_6414._Str_17634._Str_2497("");
        }

        public function performGuildBaseSearch():void
        {
            if (this._mainViewCtrl == null)
            {
                return;
            }
            this._mainViewCtrl._Str_2798(Tabs._Str_3813, Tabs._Str_10120, "");
            this._mainViewCtrl.mainWindow.activate();
            this._mainViewCtrl._Str_6414._Str_17634._Str_2497("");
        }

        public function showOwnRooms():void
        {
            if (this._mainViewCtrl == null)
            {
                return;
            }
            this._mainViewCtrl._Str_2798(Tabs._Str_5203, Tabs._Str_4869);
            this._tabs._Str_9436(Tabs._Str_5203)._Str_5252._Str_6883();
        }

        public function _Str_18427():void
        {
            this._Str_18163(Tabs._Str_8122);
        }

        public function _Str_16885():void
        {
            this._Str_18163(Tabs._Str_8161);
        }

        public function _Str_17131():void
        {
            this._Str_18163(Tabs._Str_7094);
        }

        private function _Str_18163(k:int):void
        {
            if (this._mainViewCtrl == null)
            {
                return;
            }
            this._mainViewCtrl._Str_2798(Tabs._Str_5203, k);
            this._tabs._Str_9436(Tabs._Str_5203)._Str_5252._Str_8025(k);
        }

        public function _Str_4051(k:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            if (this._tracking)
            {
                this._tracking.trackEventLog("Navigation", k, _arg_2, _arg_3, _arg_4);
            }
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (this._tracking)
            {
                this._tracking.trackGoogle(k, _arg_2, _arg_3);
            }
        }

        public function get tracking():IHabboTracking
        {
            return this._tracking;
        }

        public function openNavigator(k:Point=null):void
        {
        }

        public function closeNavigator():void
        {
            this._mainViewCtrl.close();
        }

        public function _Str_10330():void
        {
            this._roomCreateViewCtrl.hide();
            this._roomInfoViewCtrl.close();
        }

        public function get homeRoomId():int
        {
            return (this._data) ? this._data.homeRoomId : -1;
        }

        public function get _Str_25806():Boolean
        {
            return this._webRoomReport;
        }

        public function get _Str_23036():String
        {
            return this._webRoomReportedName;
        }

        public function get enteredGuestRoomData():_Str_2370
        {
            if (this._data)
            {
                return this._data._Str_2678;
            }
            return null;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
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
                                this.goToHomeRoom();
                                break;
                            default:
                                _local_3 = int(_local_2[2]);
                                if (_local_3 > 0)
                                {
                                    this.goToPrivateRoom(_local_3);
                                }
                                else
                                {
                                    this.send(new _Str_7393(_local_2[2]));
                                }
                        }
                    }
                    return;
                case "search":
                    if (_local_2.length > 2)
                    {
                        this.performTextSearch(_local_2[2]);
                    }
                    return;
                case "tag":
                    if (_local_2.length > 2)
                    {
                        this.performTagSearch(_local_2[2]);
                    }
                    return;
                case "tab":
                    if (_local_2.length > 2)
                    {
                        this.tabs._Str_13005(Tabs._Str_20758(_local_2[2], Tabs._Str_3866));
                        this.openNavigator(null);
                    }
                    return;
                case "report":
                    if (_local_2.length > 3)
                    {
                        this._Str_17932(_local_2[2], true, _local_2[3]);
                    }
                    return;
                default:
                    Logger.log(("Navigator unknown link-type received: " + _local_2[1]));
            }
        }

        private function _Str_12137(k:PerksUpdatedEvent):void
        {
            if (!this._sessionData.isPerkAllowed(PerkEnum.NAVIGATOR_PHASE_TWO_2014))
            {
                if (((this._mainViewCtrl) && (!(this._mainViewCtrl._Str_13071 == this.isPerkAllowed("NAVIGATOR_PHASE_ONE_2014")))))
                {
                    this._mainViewCtrl.close();
                }
                context.addLinkEventTracker(this);
            }
            else
            {
                context.removeLinkEventTracker(this);
            }
        }

        public function showToolbarHover(k:Point):void
        {
            if (!this._toolbarHover)
            {
                this._toolbarHover = new _Str_8760(this);
            }
            this._toolbarHover.show(k);
        }

        public function hideToolbarHover(k:Boolean):void
        {
            if (!this._toolbarHover)
            {
                return;
            }
            if (k)
            {
                this._toolbarHover._Str_14093();
            }
            else
            {
                this._toolbarHover.hide();
            }
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            return this._catalog.isDoorModeOverriddenInCurrentRoom;
        }

        public function isPerkAllowed(k:String):Boolean
        {
            if (this._sessionData)
            {
                return this._sessionData.isPerkAllowed(k);
            }
            return false;
        }

        public function canRateRoom():Boolean
        {
            if (!this.data)
            {
                return false;
            }
            return this.data._Str_5090;
        }

        public function _Str_12281(k:int):Boolean
        {
            if (!this.data)
            {
                return false;
            }
            return this.data._Str_20543(k);
        }

        public function _Str_8458(k:int):Boolean
        {
            if (!this.data)
            {
                return false;
            }
            return this.data._Str_8458(k);
        }

        public function get _Str_8075():Array
        {
            if (!this.data)
            {
                return [];
            }
            return this.data._Str_8075;
        }
    }
}
