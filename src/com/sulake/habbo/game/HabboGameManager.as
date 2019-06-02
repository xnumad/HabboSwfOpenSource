package com.sulake.habbo.game
{
	import com.sulake.core.runtime.Component;
	import com.sulake.core.runtime.IContext;
	import com.sulake.core.runtime.IUnknown;
	import com.sulake.core.runtime.IID;
	import com.sulake.habbo.session.IRoomSessionManager;
	import com.sulake.habbo.session.ISessionDataManager;
	import com.sulake.habbo.session.SecurityLevelEnum;
	import com.sulake.habbo.navigator.IHabboNavigator;
	import com.sulake.habbo.catalog.IHabboCatalog;
	import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
	import com.sulake.habbo.toolbar.IHabboToolbar;
	import com.sulake.habbo.toolbar.HabboToolbarEnum;
	import com.sulake.habbo.window.IHabboWindowManager;
	import com.sulake.habbo.help.IHabboHelp;
	import com.sulake.habbo.inventory.IHabboInventory;
	import com.sulake.habbo.localization.IHabboLocalizationManager;
	import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
	import com.sulake.habbo.gamecenter.GameConfigurations;
	import com.sulake.habbo.gamecenter.GameCenterView;
	import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
	import com.sulake.habbo.utils.HabboWebTools;
	import com.sulake.core.communication.connection.IConnection;
	import com.sulake.habbo.avatar.IAvatarRenderManager;
	import com.sulake.core.runtime.events.ILinkEventTracker;
	import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
	import com.sulake.habbo.help.enum.WelcomeNotificationAlignment;
	import com.sulake.core.assets.IAssetLibrary;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_10650;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_11836;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_12297;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_7312;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_8040;
	import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_8138;
	import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
	import snowwar._Str_400._SafeStr_2513;
	import com.sulake.core.utils.PlayerVersionCheck;
	import com.sulake.core.Core;
	import com.sulake.habbo.friendbar.IHabboLandingView;
	import com.sulake.core.communication.messages.IMessageComposer;
	import com.sulake.habbo.events.js.JsMessageHandler;
	import com.sulake.habbo.communication.IHabboCommunicationManager;
	import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;
	import com.sulake.habbo.room.IRoomEngine;
	import com.sulake.iid.IIDAvatarRenderManager;
	import com.sulake.iid.IIDHabboCatalog;
	import com.sulake.iid.IIDHabboCommunicationManager;
	import com.sulake.iid.IIDHabboConfigurationManager;
	import com.sulake.iid.IIDHabboHelp;
	import com.sulake.iid.IIDHabboInventory;
	import com.sulake.iid.IIDHabboLandingView;
	import com.sulake.iid.IIDHabboLocalizationManager;
	import com.sulake.iid.IIDHabboNavigator;
	import com.sulake.iid.IIDHabboRoomSessionManager;
	import com.sulake.iid.IIDHabboToolbar;
	import com.sulake.iid.IIDHabboWindowManager;
	import com.sulake.iid.IIDRoomEngine;
	import com.sulake.iid.IIDSessionDataManager;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.UncaughtErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.sendToURL;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import snowwar.SnowWarEngine;
	import snowwar._Str_400._SafeStr_2507;
	import snowwar._Str_400._SafeStr_2519;

    public class HabboGameManager extends Component implements IHabboGameManager, ILinkEventTracker 
    {
        private static const EMBEDDED:int = 0;
        private static const IFRAME:int = 1;

        private var _communicationManager:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _toolbar:IHabboToolbar;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _catalog:IHabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _help:IHabboHelp;
        private var _inventory:IHabboInventory;
        private var _navigator:IHabboNavigator;
        private var _incomingMessages:IncomingMessages;
        private var _sharedMessageHandler:SharedMessageHandler;
		private var _snowWarEngine:SnowWarEngine;
        private var _jsMessageHandler:JsMessageHandler;
        private var _gameCenterEnabled:Boolean = false;
        private var _gameCenterEnabledForStaff:Boolean = false;
        private var _Str_19179:Boolean = false;
        private var _Str_2368:GameCenterView;
        private var _landingView:IHabboLandingView;
        private var _loader:Loader;
        private var _Str_3852:String;
        private var _Str_21150:String;
        private var _Str_20873:String;
        private var _Str_19202:int;
        private var _Str_20663:String;
        private var _Str_21692:int;
        private var _Str_9452:int = -1;
        private var _Str_4091:int = -1;
        private var _Str_17758:int = -1;
        private var _Str_11302:Array;
        private var _Str_19843:Boolean = false;
        private var _Str_19735:int = 0;
        private var _Str_16346:String = "";

        public function HabboGameManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            queueInterface(new IIDHabboWindowManager(), this.onHabboWindowManagerReady);
            queueInterface(new IIDHabboCommunicationManager(), this.onHabboCommunicationManagerReady);
            queueInterface(new IIDHabboConfigurationManager(), this.onHabboConfigurationManagerReady);
            queueInterface(new IIDHabboLocalizationManager(), this.onHabboLocalizationReady);
            queueInterface(new IIDSessionDataManager(), this.onSessionDataManagerReady);
            queueInterface(new IIDHabboRoomSessionManager(), this.onHabboRoomSessionManagerReady);
            queueInterface(new IIDAvatarRenderManager(), this.onAvatarRenderManagerReady);
            queueInterface(new IIDHabboToolbar(), this.onHabboToolbarReady);
            queueInterface(new IIDHabboCatalog(), this.onHabboCatalogReady);
            queueInterface(new IIDHabboLandingView(), this.onHabboLandingViewReady);
            queueInterface(new IIDRoomEngine(), this.onRoomEngineReady);
            queueInterface(new IIDHabboHelp(), this.onHabboHelpReady);
            queueInterface(new IIDHabboInventory(), this.onHabboInventoryReady);
            queueInterface(new IIDHabboNavigator(), this.onHabboNavigatorReady);
            this._snowWarEngine = new SnowWarEngine(this, k, 0, _arg_3);
            this._jsMessageHandler = new JsMessageHandler(this, true);
            k.addLinkEventTracker(this);
            HabboGamesCom.log(("HabboGameManager initialized: " + _arg_3));
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get inventory():IHabboInventory
        {
            return this._inventory;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get gameCenterEnabled():Boolean
        {
            return (this._gameCenterEnabled) || ((this._gameCenterEnabledForStaff) && (this._sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751)));
        }

        public function get _Str_12938():Boolean
        {
            return this._Str_19179;
        }

        public function set _Str_25498(k:Boolean):void
        {
            this._Str_19179 = k;
        }

        override public function dispose():void
        {
            if (this._communicationManager)
            {
                this._communicationManager.release(new IIDHabboCommunicationManager());
                this._communicationManager = null;
            }
            context.removeLinkEventTracker(this);
            if (this._windowManager)
            {
                this._windowManager.release(new IIDHabboWindowManager());
                this._windowManager = null;
            }
            if (this._localizationManager)
            {
                this._localizationManager.release(new IIDHabboLocalizationManager());
                this._localizationManager = null;
            }
            if (this._sessionDataManager != null)
            {
                this._sessionDataManager.release(new IIDSessionDataManager());
                this._sessionDataManager = null;
            }
            if (this._help != null)
            {
                this._help.release(new IIDHabboHelp());
                this._help = null;
            }
            if (this._toolbar)
            {
                if (this._toolbar.events)
                {
                    this._toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
                }
                this._toolbar.release(new IIDHabboToolbar());
                this._toolbar = null;
            }
            if (this._avatarRenderManager != null)
            {
                this._avatarRenderManager.release(new IIDAvatarRenderManager());
                this._avatarRenderManager = null;
            }
            if (this._catalog != null)
            {
                this._catalog.release(new IIDHabboCatalog());
                this._catalog = null;
            }
            if (this._incomingMessages)
            {
                this._incomingMessages.dispose();
                this._incomingMessages = null;
            }
            if (this._landingView)
            {
                this._landingView.release(new IIDHabboLandingView());
                this._landingView = null;
            }
            if (this._roomEngine)
            {
                this._roomEngine.release(new IIDRoomEngine());
                this._roomEngine = null;
            }
            if (this._inventory)
            {
                this._inventory.release(new IIDHabboInventory());
                this._inventory = null;
            }
            if (this._navigator)
            {
                this._navigator.release(new IIDHabboNavigator());
                this._navigator = null;
            }
            if (this._sharedMessageHandler)
            {
                this._sharedMessageHandler.dispose();
                this._sharedMessageHandler = null;
            }
            if (this._jsMessageHandler)
            {
                this._jsMessageHandler.dispose();
                this._jsMessageHandler = null;
            }
            this._Str_4091 = -1;
            super.dispose();
        }

        private function onHabboWindowManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._windowManager = (_arg_2 as IHabboWindowManager);
            WindowUtils.init(assets, this._windowManager);
        }

        private function onHabboCommunicationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._communicationManager = (_arg_2 as IHabboCommunicationManager);
            this._incomingMessages = new IncomingMessages(this);
        }

        private function onHabboConfigurationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._gameCenterEnabled = getBoolean("game.center.enabled");
            this._gameCenterEnabledForStaff = getBoolean("game.center.enabled.forStaff");
        }

        private function onHabboLocalizationReady(k:IID, _arg_2:IUnknown):void
        {
            this._localizationManager = (_arg_2 as IHabboLocalizationManager);
        }

        private function onSessionDataManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._sessionDataManager = (_arg_2 as ISessionDataManager);
        }

        private function onHabboRoomSessionManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._roomSessionManager = (_arg_2 as IRoomSessionManager);
        }

        private function onAvatarRenderManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._avatarRenderManager = (_arg_2 as IAvatarRenderManager);
        }

        private function onHabboToolbarReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._toolbar = (_arg_2 as IHabboToolbar);
            this._toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
        }

        private function onHabboCatalogReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._catalog = (_arg_2 as IHabboCatalog);
        }

        private function onHabboLandingViewReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._landingView = (_arg_2 as IHabboLandingView);
        }

        private function onRoomEngineReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._roomEngine = (_arg_2 as IRoomEngine);
        }

        private function onHabboHelpReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._help = (_arg_2 as IHabboHelp);
        }

        private function onHabboInventoryReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._inventory = (_arg_2 as IHabboInventory);
        }

        private function onHabboNavigatorReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._navigator = (_arg_2 as IHabboNavigator);
        }

        public function _Str_23215(k:int):void
        {
            this._Str_19735 = k;
        }

        public function promotedGameId():int
        {
            var k:String = getProperty("game.center.promoted_game");
            var _local_2:int = GameConfigurations.getId(k);
            return _local_2;
        }

        public function _Str_22499():void
        {
            var k:String = GameConfigurations.getNameId(this.promotedGameId());
            if ((((!(k == null)) && (!(this._Str_19843))) && (this._Str_19735 == 0)))
            {
                this._Str_19843 = true;
                this._help._Str_8205(HabboToolbarIconEnum.GAMES, (k.toLowerCase() + ".promotion"), WelcomeNotificationAlignment.LEFT, "GAMES");
            }
        }

		//START NEW FROM SNOWSTORM
        public function initGameDirectoryConnection():void
        {
            this.send(new _SafeStr_2519());
        }

        public function _SafeStr_7619(k:String):void
        {
            this.initGameDirectoryConnection();
            this.send(new _SafeStr_2507(k));
        }

        public function _SafeStr_7620():void
        {
            this.send(new _SafeStr_2513());
        }
		
        public function _SafeStr_7621():void
        {
            if (!this._snowWarEngine._SafeStr_7687)
            {
                this._snowWarEngine._SafeStr_7688();
                this._Str_9452 = -1;
                if (this.gameCenterEnabled)
                {
                    this.showGameCenter("showGameCenter.gameEnd");
                }
                else
                {
                    if (this._landingView != null)
                    {
                        this._landingView.activate();
                    }
                }
            }
        }

        public function _SafeStr_7624():void
        {
            if (this._snowWarEngine)
            {
                this._snowWarEngine._SafeStr_7624();
            }
        }

        public function _SafeStr_7622(k:RoomObjectTileMouseEvent):void
        {
            if (this._snowWarEngine)
            {
                this._snowWarEngine._SafeStr_7622(k);
            }
        }

        public function _SafeStr_7623(k:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            if (this._snowWarEngine)
            {
                this._snowWarEngine._SafeStr_7623(k, _arg_2, _arg_3);
            }
        }

        public function _SafeStr_7625(k:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            if (this._snowWarEngine)
            {
                this._snowWarEngine._SafeStr_7625(k, _arg_2, _arg_3);
            }
        }
		
		///EDN NEW FROM SNOWSTORM

        public function send(k:IMessageComposer):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(k);
            }
        }

        public function _Str_22538(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            this._catalog.openClubCenter();
            this._Str_3777(k, _arg_2);
        }

        public function alert(k:String):void
        {
            if (((this.gameCenterEnabled) && (this._Str_2368)))
            {
                this._Str_2368._Str_5104(k);
            }
        }

        public function _Str_3777(k:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            var _local_5:IConnection = this._communicationManager.connection;
            if (((_local_5) && (!(_arg_2 == ""))))
            {
                this.send(new EventLogMessageComposer("GameCenter", k, _arg_2, _arg_3, _arg_4));
            }
        }

        private function onToolbarClick(k:HabboToolbarEvent):void
        {
            switch (k._Str_3378)
            {
                case HabboToolbarIconEnum.GAMES:
                    if (this.gameCenterEnabled)
                    {
                        this.showGameCenterByGameName("showGameCenter.toolBarClick", this.defaultGameName);
                    }
                    else
                    {
                        this.initGameDirectoryConnection();
                        //this.send(new _SafeStr_2201()); //TODO: Snowstorm
                    }
                    return;
                case HabboToolbarIconEnum.STORIES:
                    Logger.log("stories button click");
                    if (this.gameCenterEnabled)
                    {
                        if (getInteger("spaweb", 0) == 1)
                        {
                            HabboWebTools.openPage("/stories");
                            Logger.log("calling openPage to stories");
                        }
                        else
                        {
                            this.showGameCenterByGameName("showGameCenter.toolBarClick", "elisa_habbo_stories", true);
                            Logger.log("old game center opening of stories");
                        }
                    }
                    return;
                case HabboToolbarIconEnum.RECEPTION:
                    this._Str_15814();
                    return;
            }
        }

        private function get defaultGameName():String
        {
            return (propertyExists("game.center.default_game")) ? getProperty("game.center.default_game") : HabboGames.SNOWWAR;
        }

        public function showGameCenterByGameName(k:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_4:Array = _arg_2.split("?");
            _arg_2 = _local_4[0];
            if (_local_4.length > 1)
            {
                this._Str_16346 = ("?" + _local_4[1]);
            }
            var _local_5:int = GameConfigurations.getId(_arg_2);
            if (_local_5 > -1)
            {
                this.showGameCenter(k, _local_5, _arg_3);
            }
            else
            {
                _local_5 = GameConfigurations.getId(this.defaultGameName);
                this.showGameCenter(k, _local_5);
            }
        }

        public function showGameCenter(k:String, _arg_2:int=0, _arg_3:Boolean=false):void
        {
            this._Str_24183();
            if (!this._Str_2368)
            {
                this._Str_2368 = new GameCenterView(this);
            }
            if (((this._roomSessionManager) && (this._roomSessionManager.getSession(-1))))
            {
                this._roomSessionManager._Str_7613(-1, false);
                this.send(new _Str_3719());
            }
            this._toolbar.updateVisibility(HabboToolbarEnum.HTE_STATE_HOTEL_VIEW);
            this._Str_2368.initialize(_arg_2, _arg_3);
            this._Str_3777(GameConfigurations.getNameId(_arg_2), k);
            if (this._navigator)
            {
                this._navigator.closeNavigator();
            }
        }

        private function _Str_24183():void
        {
            GameConfigurations._Str_3961 = false;
            this.send(new _Str_7312());
            this.send(new _Str_8040());
        }

        public function _Str_15814():void
        {
            if (this._Str_2368)
            {
                this._Str_2368.disable();
            }
        }

        public function loadGameClient(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Object):void
        {
            var _local_12:LoaderContext;
            if (!PlayerVersionCheck.isVersionAtLeast(_arg_7, _arg_8))
            {
                this._Str_3777(GameConfigurations.getNameId(k), "versionCheckFailed");
                this.send(new _Str_8138(k));
                this._localizationManager.registerParameter("gamecenter.flash_version_required", "version", ((_arg_7 + ".") + _arg_8));
                this.alert("${gamecenter.flash_version_required}");
                return;
            }
            var _local_10:Loader = new Loader();
            var _local_11:URLRequest = new URLRequest(_arg_3);
            _local_10.addEventListener(MouseEvent.CLICK, this._Str_5609);
            _local_10.addEventListener(MouseEvent.DOUBLE_CLICK, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_UP, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_DOWN, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_OVER, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_OUT, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_5609);
            _local_10.addEventListener(MouseEvent.MOUSE_WHEEL, this._Str_5609);
            _local_10.addEventListener(MouseEvent.ROLL_OVER, this._Str_5609);
            _local_10.addEventListener(MouseEvent.ROLL_OUT, this._Str_5609);
            _local_10.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onGameClientLoadCompleted);
            _local_10.contentLoaderInfo.addEventListener(Event.INIT, this.onGameClientLoadInit);
            _local_10.contentLoaderInfo.addEventListener(Event.UNLOAD, this.onGameClientLoadUnload);
            _local_10.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onGameClientLoadIOError);
            _local_10.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onGameClientLoadSecurityError);
            _local_10.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onGameClientLoadProgress);
            if (_local_10.contentLoaderInfo.hasOwnProperty("uncaughtErrorEvents"))
            {
                _local_10.contentLoaderInfo["uncaughtErrorEvents"].addEventListener("uncaughtError", this._Str_6861, true, int.MAX_VALUE);
                _local_10.contentLoaderInfo["uncaughtErrorEvents"].addEventListener("uncaughtError", this._Str_6861, false, int.MAX_VALUE);
            }
            this._loader = _local_10;
            this._Str_3852 = _arg_2;
            if (this._sharedMessageHandler)
            {
                this._sharedMessageHandler.dispose();
            }
            this._sharedMessageHandler = new SharedMessageHandler(this, _local_10.contentLoaderInfo.sharedEvents);
            this._Str_21150 = _arg_4;
            this._Str_20873 = _arg_5;
            this._Str_19202 = _arg_6;
            if (Capabilities.playerType == "StandAlone")
            {
                _local_12 = new LoaderContext(false, new ApplicationDomain());
            }
            else
            {
                _local_12 = new LoaderContext(false, new ApplicationDomain(), SecurityDomain.currentDomain);
            }
            _local_11.data = this._Str_23032(_arg_9);
            if (PlayerVersionCheck.isVersionAtLeast(10, 2))
            {
                _local_11.data = null;
                _local_12.parameters = _arg_9;
            }
            _local_10.load(_local_11, _local_12);
            _local_10.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, this._Str_6861, true, int.MAX_VALUE);
            _local_10.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, this._Str_6861, false, int.MAX_VALUE);
            var _local_13:Stage = context.displayObjectContainer.stage;
            this._Str_20663 = _local_13.quality;
            this._Str_21692 = _local_13.frameRate;
            this._Str_4091 = k;
            this._Str_17758 = EMBEDDED;
            this._Str_3777(GameConfigurations.getNameId(k), "loadGameClient");
            this.inventory._Str_3455._Str_18075(UnseenItemCategoryEnum.GAMES, [k]);
            if (this._Str_2368)
            {
                this._Str_2368._Str_18594(k);
            }
        }

        public function _Str_19055(k:int, _arg_2:String, _arg_3:String, _arg_4:String=""):void
        {
            if (_arg_3.indexOf("?") != -1)
            {
                _arg_4.replace("?", "&");
            }
            HabboWebTools.showGame((_arg_3 + this._Str_16346));
            this._Str_16346 = "";
            this._Str_4091 = k;
            this._Str_17758 = IFRAME;
            this._Str_3852 = _arg_2;
            this._Str_3777(GameConfigurations.getNameId(k), "loadGameClient");
            this.inventory._Str_3455._Str_18075(UnseenItemCategoryEnum.GAMES, [k]);
            if (this._Str_2368)
            {
                this._Str_2368._Str_18594(k);
            }
        }

        private function _Str_23032(k:Object):URLVariables
        {
            var _local_3:String;
            var _local_2:URLVariables = new URLVariables();
            for (_local_3 in k)
            {
                _local_2[_local_3] = k[_local_3];
            }
            return _local_2;
        }

        private function onGameClientLoadInit(k:Event):void
        {
            var _local_4:DisplayObject;
            var _local_2:Stage = context.displayObjectContainer.stage;
            _local_2.quality = this._Str_21150;
            _local_2.frameRate = this._Str_19202;
            this._Str_11302 = new Array();
            var _local_3:int = (_local_2.numChildren - 1);
            while (_local_3 >= 0)
            {
                _local_4 = _local_2.getChildAt(_local_3);
                this._Str_11302.push(_local_4);
                _local_2.removeChildAt(_local_3);
                _local_3--;
            }
            this._Str_11302.reverse();
            _local_2.addEventListener(Event.RESIZE, this._Str_1001);
            _local_2.addChild(this._loader);
            Core.instance.hibernate(0);
            this._Str_1001();
        }

        private function onGameClientLoadCompleted(event:Event):void
        {
            HabboGamesCom.log("[HabboGameManager] external game client complete");
            this._Str_1001();
            this._Str_22015();
        }

        public function _Str_22015():void
        {
            this._Str_3777(GameConfigurations.getNameId(this._Str_4091), "gameClientLoaded");
        }

        private function _Str_1001(k:Event=null):void
        {
            var _local_2:Stage;
            var _local_3:Number;
            var _local_4:Number;
            if (disposed)
            {
                return;
            }
            _local_2 = context.displayObjectContainer.stage;
            if (this._loader)
            {
                switch (this._Str_20873)
                {
                    case StageScaleMode.SHOW_ALL:
                        _local_3 = (this._loader.width / this._loader.height);
                        _local_4 = (_local_2.stageWidth / _local_2.stageHeight);
                        if (_local_3 > _local_4)
                        {
                            this._loader.width = _local_2.stageWidth;
                            this._loader.scaleY = this._loader.scaleX;
                        }
                        else
                        {
                            this._loader.height = _local_2.stageHeight;
                            this._loader.scaleX = this._loader.scaleY;
                        }
                        this._loader.x = ((_local_2.stageWidth - this._loader.width) / 2);
                        this._loader.y = ((_local_2.stageHeight - this._loader.height) / 2);
                        break;
                    case StageScaleMode.NO_SCALE:
                        this._loader.width = _local_2.stageWidth;
                        this._loader.height = _local_2.stageHeight;
                        this._loader.scaleX = 1;
                        this._loader.scaleY = 1;
                        this._loader.x = 0;
                        this._loader.y = 0;
                        break;
                }
                if (((this._sharedMessageHandler) && (this._sharedMessageHandler._Str_20452 > -1)))
                {
                    this._sharedMessageHandler.send(this._sharedMessageHandler._Str_20452, SharedEventToGameEnum.RESIZE_UPDATE, new Array(_local_2.stageWidth, _local_2.stageHeight));
                }
            }
        }

        private function onGameClientLoadIOError(event:IOErrorEvent):void
        {
            HabboGamesCom.log("[HabboGameManager] external game client IO error");
            context.error(("IOError while loading game client for " + this._Str_4091), false);
            this._Str_8716(this._Str_4091, this._Str_3852, "loadGameClientError");
        }

        private function onGameClientLoadSecurityError(event:SecurityErrorEvent):void
        {
            HabboGamesCom.log("[HabboGameManager] external game client security error");
            context.error(("SecurityError while loading game client for " + this._Str_4091), false);
            this._Str_8716(this._Str_4091, this._Str_3852, "loadGameClientError");
        }

        private function onGameClientLoadProgress(event:ProgressEvent):void
        {
            HabboGamesCom.log(((("[HabboGameManager] external game client progress " + event.bytesLoaded) + "/") + event.bytesTotal));
        }

        private function _Str_5609(k:Event):void
        {
            k.stopImmediatePropagation();
        }

        public function joinPlayerQueue(k:int):void
        {
            this._Str_20329();
			if (k == HabboGames._SafeStr_7697)
			{
				this._SafeStr_7620();
			}
			else
			{
				this.send(new _Str_11836(k));
				if (this._Str_2368)
				{
					this._Str_2368._Str_19498(k);
				};
			}
            this._Str_9452 = k;
            this._Str_3777(GameConfigurations.getNameId(k), "joinPlayerQueue");
        }

        private function _Str_20329():void
        {
            if (this._Str_9452 != -1)
            {
                this._Str_10458(this._Str_9452);
            }
        }

        public function _Str_10458(k:int):void
        {
            this.send(new _Str_10650(k));
            this._Str_9452 = -1;
        }

        public function acceptGameInvite(k:int, _arg_2:int):void
        {
            this._Str_20329();
            this.send(new _Str_12297(k, _arg_2));
            this._Str_9452 = k;
            this._Str_3777(GameConfigurations.getNameId(k), "joinPlayerQueue", "", _arg_2);
            if (this._Str_2368)
            {
                this._Str_2368._Str_19498(k);
            }
        }

        public function onGameClientLoadUnload(k:Event):void
        {
            HabboGamesCom.log("[HabboGameManager] external game client unloaded");
        }

        public function _Str_8716(k:int, _arg_2:String, _arg_3:String):void
        {
            var _local_4:HabboToolbarEvent;
            this._Str_9452 = -1;
            if (this._Str_2368)
            {
                this._Str_2368._Str_18594(k);
            }
            if (((this._Str_4091 > -1) && (this._Str_3852 == _arg_2)))
            {
                this._Str_3777(GameConfigurations.getNameId(this._Str_4091), _arg_3);
                this._Str_4091 = -1;
                Core.instance.resume();
                switch (this._Str_17758)
                {
                    case EMBEDDED:
                        this.unloadGameClient();
                        break;
                    case IFRAME:
                        this._Str_24319();
                        break;
                }
                if (GameConfigurations.getNameId(k) == "elisa_habbo_stories")
                {
                    if (this._landingView)
                    {
                        this._landingView.activate();
                    }
                    _local_4 = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
                    _local_4._Str_3378 = HabboToolbarIconEnum.RECEPTION;
                    this._toolbar.events.dispatchEvent(_local_4);
                }
                else
                {
                    if (this._Str_2368)
                    {
                        this._Str_2368.activate(k, false);
                        this._Str_3777(GameConfigurations.getNameId(k), "showGameCenter.gameEnd");
                    }
                }
                this.send(new _Str_8138(k));
            }
        }

        public function _Str_20515():void
        {
            if (this._Str_4091 > -1)
            {
                this._Str_8716(this._Str_4091, this._Str_3852, "unloadGameClient");
            }
        }

        private function unloadGameClient():void
        {
            var _local_2:DisplayObject;
            var k:Stage = context.displayObjectContainer.stage;
            k.removeEventListener(Event.RESIZE, this._Str_1001);
            if (this._loader)
            {
                if (k.contains(this._loader))
                {
                    k.removeChild(this._loader);
                }
                if (this._loader.contentLoaderInfo.hasOwnProperty("uncaughtErrorEvents"))
                {
                    this._loader.contentLoaderInfo["uncaughtErrorEvents"].removeEventListener("uncaughtError", this._Str_6861, true);
                    this._loader.contentLoaderInfo["uncaughtErrorEvents"].removeEventListener("uncaughtError", this._Str_6861, false);
                }
                this._loader.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, this._Str_6861, true);
                this._loader.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, this._Str_6861, false);
                this._loader.unloadAndStop();
                this._loader = null;
            }
            for each (_local_2 in this._Str_11302)
            {
                k.addChild(_local_2);
            }
            this._Str_11302 = null;
            k.quality = this._Str_20663;
            k.frameRate = this._Str_21692;
        }

        private function _Str_24319():void
        {
            HabboWebTools.hideGame();
        }

        public function _Str_22863(k:int):String
        {
            return GameConfigurations.getNameId(k);
        }

        public function getGameId(k:String):int
        {
            return GameConfigurations.getId(k);
        }

        public function getGameAssetURL(k:int, _arg_2:String):String
        {
            return GameConfigurations.getAssetUrl(k, _arg_2);
        }

        private function _Str_6861(k:UncaughtErrorEvent):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_5:Error;
            var _local_6:ErrorEvent;
            HabboGamesCom.log(((("[HabboGameManager] external game client crashed, eventType:" + k.type) + " errorID:") + k.errorID));
            var _local_4:String;
            if ((k.error is Error))
            {
                _local_5 = (k.error as Error);
                _local_2 = _local_5.errorID.toString();
                _local_3 = _local_5.message;
                _local_4 = _local_5.getStackTrace();
            }
            else
            {
                if ((k.error is ErrorEvent))
                {
                    _local_6 = (k.error as ErrorEvent);
                    _local_2 = _local_6.errorID.toString();
                    _local_3 = _local_6.type;
                    _local_4 = _local_6.toString();
                }
                else
                {
                    _local_2 = k.errorID.toString();
                    _local_3 = k.type;
                    _local_4 = k.error.toString();
                }
            }
            this._Str_21246(_local_2, _local_3, _local_4);
            k.stopImmediatePropagation();
        }

        public function _Str_21246(k:String, _arg_2:String, _arg_3:String=null):void
        {
            this._Str_24065(this._Str_4091, k, _arg_2, _arg_3);
            this._Str_8716(this._Str_4091, this._Str_3852, "gameClientCrash");
            this.alert("${gamecenter.game_crashed}");
        }

        private function _Str_24065(gameTypeId:int, errorId:String, errorMessage:String, debugData:String=null):void
        {
            var url:String = getProperty("game.center.error.url");
            var variables:URLVariables = new URLVariables();
            var request:URLRequest = new URLRequest(url);
            variables.gameTypeId = gameTypeId;
            variables.flashVersion = Capabilities.version;
            variables.errorId = errorId;
            variables.errorMessage = errorMessage;
            if (debugData)
            {
                variables.debugData = debugData;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            if (Capabilities.playerType != "StandAlone")
            {
                try
                {
                    sendToURL(request);
                }
                catch(e:Error)
                {
                    Logger.log(("Error while sending error report: " + e.message));
                }
            }
        }

		//TODO: SnowStorm function. Check public calls.
		//DONE. Loads Snowstorm Assets.
		public function _SafeStr_7683():void
        {
            this._snowWarEngine.loadUIElements();
        }

		//TODO: SnowStorm function. Check public calls.
		//DONE
        public function _SafeStr_7684():Boolean
        {
            return this._snowWarEngine._SafeStr_7702();
        }
		
        public function get eventUrlPrefix():String
        {
            return "games/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    if (_local_2.length > 2)
                    {
                        this.showGameCenterByGameName("", _local_2[2]);
                    }
                    return;
                case "play":
                    if (_local_2.length > 2)
                    {
                        this.showGameCenterByGameName("", _local_2[2], true);
                    }
                    return;
            }
        }
    }
}
