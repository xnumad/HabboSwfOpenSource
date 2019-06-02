package snowwar
{
	import com.sulake.habbo.game.HabboGames;
	import com.sulake.core.runtime.Component;
	import com.sulake.core.runtime.IHabboConfigurationManager;
	import com.sulake.core.runtime.IUpdateReceiver;
	import com.sulake.core.runtime.IContext;
	import com.sulake.core.runtime.IUnknown;
	import com.sulake.core.runtime.IID;
	import com.sulake.habbo.session.IRoomSessionManager;
	import com.sulake.habbo.session.ISessionDataManager;
	import com.sulake.habbo.catalog.IHabboCatalog;
	import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
	import com.sulake.habbo.toolbar.WingCodeEnum;
	import com.sulake.habbo.ui.IRoomUI;
	import com.sulake.habbo.window.IHabboWindowManager;
	import com.sulake.habbo.friendlist.IHabboFriendsList;
	import com.sulake.habbo.window.utils._Str_2418;
	import com.sulake.habbo.sound.IHabboSoundManager;
	import com.sulake.habbo.sound.HabboSoundConstants;
	import com.sulake.habbo.help.IHabboHelp;
	import com.sulake.habbo.localization.IHabboLocalizationManager;
	import com.sulake.habbo.avatar.enum.AvatarAction;
	import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
	import com.sulake.habbo.groups.IHabboGroupsManager;
	import com.sulake.habbo.game.HabboGameManager;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.habbo.avatar.AvatarRenderManager;
	import com.sulake.habbo.avatar.IAvatarRenderManager;
	import com.sulake.habbo.help.enum.WelcomeNotificationAlignment;
	import com.sulake.core.assets.AssetLibraryCollection;
	import com.sulake.core.assets.XmlAsset;
	import com.sulake.core.assets.IAssetLibrary;
	import com.sulake.core.utils.Map;
	import com.sulake.core.communication.messages.IMessageComposer;
	import com.sulake.core.window.events.WindowEvent;
	import com.sulake.habbo.communication.IHabboCommunicationManager;
	import snowwar._Str_496.Game2GameResult;
	import snowwar._Str_496.Game2SnowWarGameStats;
	import snowwar._Str_496._SafeStr_4018;
	import snowwar._Str_496._SafeStr_4032;
	import com.sulake.habbo.game.events.GameChatEvent;
	import com.sulake.habbo.room.events.RoomEngineEvent;
	import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
	import com.sulake.habbo.room.IRoomEngine;
	import com.sulake.iid.IIDAvatarRenderManager;
	import com.sulake.iid.IIDHabboCatalog;
	import com.sulake.iid.IIDHabboCommunicationManager;
	import com.sulake.iid.IIDHabboConfigurationManager;
	import com.sulake.iid.IIDHabboFriendList;
	import com.sulake.iid.IIDHabboGroupsManager;
	import com.sulake.iid.IIDHabboHelp;
	import com.sulake.iid.IIDHabboLocalizationManager;
	import com.sulake.iid.IIDHabboRoomSessionManager;
	import com.sulake.iid.IIDHabboRoomUI;
	import com.sulake.iid.IIDHabboSoundManager;
	import com.sulake.iid.IIDHabboWindowManager;
	import com.sulake.iid.IIDRoomEngine;
	import com.sulake.iid.IIDSessionDataManager;
	import com.sulake.habbo.catalog.enum._SafeStr_2308;
	import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;
	import flash.events.Event;
	import flash.net.URLRequest;
	import snowwar._Str_231.SynchronizedGameArena;
	import snowwar._Str_231.SynchronizedGameStage;
	import snowwar._Str_231._SafeStr_4019;
	import snowwar._Str_254.Location;
	import snowwar._Str_267.LeaderboardViewController;
	import snowwar._Str_345._SafeStr_1434;
	import snowwar._Str_373.*;
	import snowwar._Str_373._SafeStr_3643;
	import snowwar._Str_373._SafeStr_3918;
	import snowwar._Str_39.HumanGameObject;
	import snowwar._Str_39._SafeStr_4035;
	import snowwar._Str_400.*;
	import snowwar._Str_400._SafeStr_2507;
	import snowwar._Str_400._SafeStr_2513;
	import snowwar._Str_400._SafeStr_2519;
	import snowwar._Str_400._SafeStr_3624;
	import snowwar._Str_427._SafeStr_4021;
	import snowwar._Str_496.*;
	import snowwar.outgoing._SafeStr_3806;
	import snowwar.outgoing._SafeStr_3904;
	import snowwar.outgoing._SafeStr_3908;
	import snowwar.outgoing._SafeStr_3935;
	import snowwar.outgoing._SafeStr_3969;
	import snowwar.ui.GameArenaView;
	import snowwar.ui.GameEndingViewController;
	import snowwar.ui.GameLobbyViewController;
	import snowwar.ui.GamesMainViewController;
	import snowwar.ui.GameStartingViewController;
	import com.sulake.core.runtime.ComponentDependency;

    public class SnowWarEngine extends Component implements IUpdateReceiver 
    {
        private static const UI_ELEMENTS:Array = ["add_friend_icon_blue", "add_friend_icon_green", "add_friend_icon_red", "arena_10_preview", "arena_11_preview", "arena_1_preview", "arena_8_preview", "arena_9_preview", "bg_sky", "bg_sunshine", "bg_vista_1", "bg_vista_2", "bg_vista_3", "blue_ball", "blue_ball_rematch", "blue_glove", "blue_infobox", "blue_infobox_rematch_1", "blue_infobox_rematch_2", "blue_infobox_shuffle", "blue_square", "blue_square_shuffle", "free_games_bg", "gray_ball_left", "gray_ball", "gray_ball_right", "gray_infobox", "gray_square", "green_square", "leaderboard_bg", "leaderboard_divider", "leaderboard_highlighter", "left_black", "left_blue", "load_1", "load_2", "load_3", "load_4", "load_5", "load_6", "load_7", "load_8", "quick_play_background", "quick_play_instructions", "quick_play_teaser", "red_ball", "red_ball_rematch", "red_glove", "red_infobox", "red_infobox_rematch_1", "red_infobox_rematch_2", "red_infobox_shuffle", "red_square", "red_square_shuffle", "rematch_1", "rematch_2", "rematch_3", "rematch_4", "rematch_5", "rematch_6", "right_black", "right_blue", "scroll_down_click", "scroll_down_hilite", "scroll_down_inactive", "scroll_down_normal", "scroll_left", "scroll_right", "scroll_up_click", "scroll_up_hilite", "scroll_up_inactive", "scroll_up_normal", "snowstorm_logo", "star_empty", "star_filled_bronze", "star_filled_gold", "star_filled", "star_filled_silver", "ui_ball_indicator_bg", "ui_ball", "ui_exit_down", "ui_exit_up", "ui_make_balls_down", "ui_make_balls_up", "ui_me_bg", "ui_me_health_0", "ui_me_health_1", "ui_me_health_2", "ui_me_health_3", "ui_me_health_4", "ui_me_health_5", "ui_me_minus_1", "ui_me_minus_2", "ui_me_minus_3", "ui_me_minus_4", "ui_me_plus_1", "ui_me_plus_2", "ui_me_plus_3", "ui_me_plus_4", "ui_no_balls_1", "ui_no_balls_2", "ui_no_balls_3", "ui_no_balls_4", "ui_timer_and_points", "throw_1_1", "throw_1_2", "throw_1_3", "throw_1_4", "throw_2_1", "throw_2_2", "throw_2_3", "throw_2_4", "throw_2_5", "throw_3_1", "throw_3_2", "throw_3_3", "throw_3_4", "throw_3_5", "balls_1", "balls_2", "balls_3", "balls_4", "balls_5", "move_1", "move_2", "move_3", "move_4", "pagination_ball", "pagination_ball_hilite"];
        private static const CONST_CHECKSUM_3:int = 3;
        public static const STATUS_0:int = 0; //_SafeStr_13134
        public static const GAME_STARTED:int = 1; //_SafeStr_13135
        public static const STAGE_LOADING:int = 2; //_SafeStr_13136
        public static const STAGE_STARTED:int = 3; //_SafeStr_13137
        public static const STAGE_RUNNING:int = 4; //_SafeStr_13138
        public static const STAGE_ENDED:int = 5; //_SafeStr_13139
        public static const GAME_ENDED:int = 6; //_SafeStr_13140
        public static const STATUS_7:int = 7; //_SafeStr_13141
        private static var soundManager:IHabboSoundManager;

        private var _habboGameManager:HabboGameManager;
        private var _communication:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _config:IHabboConfigurationManager;
        private var _localization:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _groupsManager:IHabboGroupsManager;
        private var _roomEngine:IRoomEngine;
        private var _roomUI:IRoomUI;
        private var _catalog:IHabboCatalog;
        private var _messageHandler:IncomingMessages;
        private var _habboHelp:IHabboHelp;
        private var _friendList:IHabboFriendsList;
        private var _synchronizedGameArena:SynchronizedGameArena;
        private var _gameArenaView:GameArenaView;
        private var _SafeStr_13145:int;
        private var _gameState:int = 0;
        private var _alertWindow:_Str_2418;
        private var _gamePlayerId:int;
        private var _SafeStr_13149:Map;
        private var _currentSubTurn:int = 0;
        private var _maxSubTurn:int = 0;
        private var _currentTurn:int = 0;
        private var _serverChecksums:Map;
        private var _SafeStr_13154:Boolean = false;
        private var _gameStartingViewController:GameStartingViewController;
        private var _gameEndingViewController:GameEndingViewController;
        private var _gameMainViewController:GamesMainViewController;
        private var _leaderBoardViewController:LeaderboardViewController;
        private var _ghostEnabled:Boolean = false;
        private var _ghostVisualizationEnabled:Boolean = false;
        private var _ghostImmediateEnabled:Boolean = false;
        private var _forceFullStatusRequest:Boolean = false;
        private var _time:int;
        private var _SafeStr_13164:Boolean = false;
        private var _infiniteGames:Boolean = false;
        private var _gamesLeft:int = 0;
        private var _rejoinRoom:int = -1;
        private var _promotionId:int = -1;
        private var _shownPromotion:Boolean = false;
        private var _assetsLoaded:Boolean = false;

        public function SnowWarEngine(habboGameManager:HabboGameManager, _arg_2:IContext, _arg_3:uint=0, _arg_4:IAssetLibrary=null)
        {
            super(_arg_2, _arg_3, _arg_4);
            this._habboGameManager = habboGameManager;
            queueInterface(new IIDHabboWindowManager(), this.onHabboWindowManagerReady);
            queueInterface(new IIDHabboCommunicationManager(), this.onCommunicationManagerReady);
            queueInterface(new IIDHabboConfigurationManager(), this.onConfigurationManagerReady);
            queueInterface(new IIDHabboLocalizationManager(), this.onLocalizationManagerReady);
            queueInterface(new IIDHabboRoomSessionManager(), this.onRoomSessionManagerReady);
            queueInterface(new IIDSessionDataManager(), this.onSessionDataManagerReady);
            queueInterface(new IIDAvatarRenderManager(), this.onAvatarRenderManagerReady);
            queueInterface(new IIDRoomEngine(), this.onRoomEngineReady);
            queueInterface(new IIDHabboSoundManager(), this.onSoundManagerReady);
            queueInterface(new IIDHabboRoomUI(), this.onRoomUIReady);
            queueInterface(new IIDHabboCatalog(), this.onCatalogReady);
            queueInterface(new IIDHabboHelp(), this.onHelpReady);
            queueInterface(new IIDHabboFriendList(), this.onFriendListReady);
            queueInterface(new IIDHabboGroupsManager(), this.onGroupsManagerReady);
			
			
            HabboGamesCom.log(("SnowWarEngine initialized: " + _arg_4));
            this._gameMainViewController = new GamesMainViewController(this);
        }
		
		override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[
			new ComponentDependency(new IIDHabboWindowManager(), 		  function (k:IHabboWindowManager):void 	   { _windowManager = k; }), 
			new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void { _communication = k; }), 
			new ComponentDependency(new IIDHabboConfigurationManager(), function (k:IHabboConfigurationManager):void { _config = k; }),
			new ComponentDependency(new IIDHabboLocalizationManager(),  function (k:IHabboLocalizationManager):void  { _localization = k; }),
			new ComponentDependency(new IIDHabboRoomSessionManager(),   function (k:IRoomSessionManager):void   { _roomSessionManager = k; }),
			new ComponentDependency(new IIDSessionDataManager(), 		  function (k:ISessionDataManager):void 	   { _sessionDataManager = k; }), 
			new ComponentDependency(new IIDAvatarRenderManager(), 	  function (k:IAvatarRenderManager):void 	   { _avatarRenderManager = k; }),
			new ComponentDependency(new IIDRoomEngine(), 				  function (k:IRoomEngine):void 		       { _roomEngine = k; }),
			new ComponentDependency(new IIDHabboSoundManager(), 		  function (k:IHabboSoundManager):void 		   { soundManager = k }), 
			new ComponentDependency(new IIDHabboRoomUI(), 		      function (k:IRoomUI):void 			   { _roomUI = k; }),
			new ComponentDependency(new IIDHabboCatalog(), 			  function (k:IHabboCatalog):void 			   { _catalog = k; }),
			new ComponentDependency(new IIDHabboHelp(), 				  function (k:IHabboHelp):void 				   { _habboHelp = k; }),
			new ComponentDependency(new IIDHabboFriendList(), 		  function (k:IHabboFriendsList):void 		   { _friendList = k; }), 
			new ComponentDependency(new IIDHabboGroupsManager(), 		  function (k:IHabboGroupsManager):void 	   { _groupsManager = k; }, false)]
			));
        }

        public static function _Str_4375(k:String, _arg_2:int=0):void //_SafeStr_6795
        {
            if (soundManager != null)
            {
                soundManager._Str_4375(k, _arg_2);
            }
        }

        public static function _Str_25775(k:String):void //_SafeStr_7041
        {
            if (soundManager != null)
            {
                soundManager._Str_25775(k);
            }
        }


        public function get gameCenterEnabled():Boolean
        {
            return this._habboGameManager.gameCenterEnabled;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
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
            return this._communication;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get config():IHabboConfigurationManager
        {
            return this._config;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get groupsManager():IHabboGroupsManager
        {
            return this._groupsManager;
        }

        public function get roomUI():IRoomUI
        {
            return this._roomUI;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get friendList():IHabboFriendsList
        {
            return this._friendList;
        }

        public function get synchronizedGameArena():SynchronizedGameArena
        {
            return this._synchronizedGameArena;
        }

        public function get currentSubTurn():int
        {
            return this._currentSubTurn;
        }

        public function get gameDuration():int
        {
            return this._time;
        }

        public function get rejoinRoom():int
        {
            return this._rejoinRoom;
        }

        public function get ghostEnabled():Boolean
        {
            return this._ghostEnabled;
        }

        public function get ghostVisualizationEnabled():Boolean
        {
            return this._ghostVisualizationEnabled;
        }

        public function gameArenaName(k:_SafeStr_4018):String //_SafeStr_13178
        {
            var key:String = ("snowwar.field.name." + k.fieldName);
            return this._localization.getLocalization(key, key);
        }

        override public function dispose():void
        {
            if (this._communication)
            {
                this._communication.release(new IIDHabboCommunicationManager());
                this._communication = null;
            }
            if (this._windowManager)
            {
                this._windowManager.release(new IIDHabboWindowManager());
                this._windowManager = null;
            }
            if (this._config)
            {
                this._config.release(new IIDHabboConfigurationManager());
                this._config = null;
            }
            if (this._localization)
            {
                this._localization.release(new IIDHabboLocalizationManager());
                this._localization = null;
            }
            if (this._roomSessionManager)
            {
                this._roomSessionManager.release(new IIDHabboRoomSessionManager());
                this._roomSessionManager = null;
            }
            if (this._sessionDataManager != null)
            {
                this._sessionDataManager.release(new IIDSessionDataManager());
                this._sessionDataManager = null;
            }
            if (this._roomEngine != null)
            {
                this._roomEngine.events.removeEventListener(RoomEngineEvent.OBJECTS_INITIALIZED, this.onGameObjectsInitialized);
                this._roomEngine.release(new IIDRoomEngine());
                this._roomEngine = null;
            }
            if (soundManager != null)
            {
                soundManager.release(new IIDHabboSoundManager());
                soundManager = null;
            }
            if (this._habboHelp != null)
            {
                this._habboHelp.release(new IIDHabboHelp());
                this._habboHelp = null;
            }
            if (this._avatarRenderManager != null)
            {
                this._avatarRenderManager.release(new IIDAvatarRenderManager());
                this._avatarRenderManager = null;
            }
            if (this._groupsManager != null)
            {
                this._groupsManager.release(new IIDHabboGroupsManager());
                this._groupsManager = null;
            }
            if (this._roomUI != null)
            {
                this._roomUI.release(new IIDHabboRoomUI());
                this._roomUI = null;
            }
            if (this._catalog != null)
            {
                this._catalog.release(new IIDHabboCatalog());
                this._catalog = null;
            }
            if (this._friendList != null)
            {
                this._friendList.release(new IIDHabboFriendList());
                this._friendList = null;
            }
            if (this._alertWindow != null)
            {
                this._alertWindow.dispose();
                this._alertWindow = null;
            }
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController.dispose();
                this._gameEndingViewController = null;
            }
            this.disposeGameStartingViewController();
            if (this._synchronizedGameArena != null)
            {
                this._synchronizedGameArena.dispose();
                this._synchronizedGameArena = null;
            }
            if (this._gameArenaView != null)
            {
                this._gameArenaView.dispose();
                this._gameArenaView = null;
            }
            if (this._gameMainViewController)
            {
                this._gameMainViewController.dispose();
                this._gameMainViewController = null;
            }
            if (this._messageHandler)
            {
                this._messageHandler.dispose();
                this._messageHandler = null;
            }
            if (this._leaderBoardViewController)
            {
                this._leaderBoardViewController.dispose();
                this._leaderBoardViewController = null;
            }
            super.dispose();
        }

        private function onHabboWindowManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._windowManager = (_arg_2 as IHabboWindowManager);
            WindowUtils.init(assets, this._windowManager);
        }

        private function onCommunicationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._communication = (_arg_2 as IHabboCommunicationManager);
            this._messageHandler = new IncomingMessages(this);
        }

        private function onConfigurationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._config = (_arg_2 as IHabboConfigurationManager);
            this._ghostEnabled = this._config.getBoolean("snowwar.ghost.enabled");
            if (this._ghostEnabled)
            {
                this._ghostVisualizationEnabled = this._config.getBoolean("snowwar.ghost.visualization.enabled");
                this._ghostImmediateEnabled = this._config.getBoolean("snowwar.ghost.immediate.enabled");
            }
            HabboGamesCom.logEnabled = this._config.getBoolean("snowwar.log.enabled");
        }

        private function onLocalizationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            this._localization = (_arg_2 as IHabboLocalizationManager);
        }

        private function onSessionDataManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._sessionDataManager = (_arg_2 as ISessionDataManager);
        }

        private function onRoomSessionManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._roomSessionManager = (_arg_2 as IRoomSessionManager);
        }

        private function onAvatarRenderManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._avatarRenderManager = (_arg_2 as IAvatarRenderManager);
            this._avatarRenderManager.events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY, this.onAvatarRenderReady);
        }

        private function onGroupsManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._groupsManager = (_arg_2 as IHabboGroupsManager);
        }

        private function onAvatarRenderReady(event:Event):void
        {
            if (!(this.context.assets as AssetLibraryCollection).hasAssetLibrary(assets.name))
            {
                HabboGamesCom.log(assets.manifest);
                (context.assets as AssetLibraryCollection).addAssetLibrary(assets);
                var asset:XmlAsset = (assets.getAssetByName("figure") as XmlAsset);
                this._avatarRenderManager._Str_882((asset.content as XML));
                this._avatarRenderManager.resetAssetManager();
            }
        }

        private function onRoomEngineReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._roomEngine = (_arg_2 as IRoomEngine);
            this._roomEngine.events.addEventListener(RoomEngineEvent.OBJECTS_INITIALIZED, this.onGameObjectsInitialized);
        }

        private function onGameObjectsInitialized(k:RoomEngineEvent):void //_SafeStr_13179
        {
            if (this._synchronizedGameArena)
            {
                this.send(new _SafeStr_3918(100));
            }
        }

        public function send(k:IMessageComposer):void
        {
            if (this._communication)
            {
                this._communication.connection.send(k);
            }
        }

        private function onSoundManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            soundManager = IHabboSoundManager(_arg_2);
        }

        private function onRoomUIReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._roomUI = (_arg_2 as IRoomUI);
        }

        private function onCatalogReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._catalog = (_arg_2 as IHabboCatalog);
        }

        public function _SafeStr_13181():void
        {
            this._gameMainViewController._SafeStr_7703();
        }

        private function onHelpReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._habboHelp = (_arg_2 as IHabboHelp);
        }

        private function onFriendListReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._friendList = (_arg_2 as IHabboFriendsList);
        }

        public function _SafeStr_13182(k:Boolean):void
        {
            if (k)
            {
                this._SafeStr_13181();
            }
        }

        public function initializeGameArena(k:int, _arg_2:int, _arg_3:int, _arg_4:Array):void
        {
            if (!this._synchronizedGameArena)
            {
                this._synchronizedGameArena = new SynchronizedGameArena();
                this._synchronizedGameArena.registerExtension(new _SafeStr_4034());
                this._synchronizedGameArena.initialize(this, _arg_3);
                this._gameArenaView = new GameArenaView(this);
                this._roomSessionManager._Str_7613(-1, false);
                this._roomSessionManager._Str_24970();
                registerUpdateReceiver(this, 1);
                this._SafeStr_13145 = 0;
                this._currentSubTurn = 0;
                this._maxSubTurn = 0;
            }
        }

		//Seems unused
        public function _SafeStr_13184(k:String):void
        {
            this.initGameDirectoryConnection();
            this.send(new _SafeStr_2507(k));
        }

        public function initGameDirectoryConnection():void
        {
            this.send(new _SafeStr_2519());
        }

        public function _SafeStr_13185():void
        {
            this.send(new _SafeStr_2513());
        }

        private function synchronizedGameStage():SnowWarGameStage
        {
            if (!this._synchronizedGameArena)
            {
                return null;
            }
            var k:SnowWarGameStage = (this._synchronizedGameArena.synchronizedGameStage() as SnowWarGameStage);
            return k;
        }

        public function _SafeStr_13187():HumanGameObject
        {
            return this.getHumanGameObject(this._gamePlayerId);
        }

        public function getHumanGameObject(k:int):HumanGameObject
        {
            var gameStage:SynchronizedGameStage = this.synchronizedGameStage();
            if (!gameStage)
            {
                return null;
            }
            return gameStage.getGameObject(k) as HumanGameObject;
        }

        public function _SafeStr_7622(k:RoomObjectTileMouseEvent):void
        {
            if (this._gameState != STAGE_RUNNING)
            {
                return;
            }
            var _local_2:int = _SafeStr_4031._SafeStr_13233(k.altKey, k.shiftKey);
            if (_local_2 == _SafeStr_4031._SafeStr_13234)
            {
                this._SafeStr_13189(k.tileXAsInt, k.tileYAsInt);
            }
            else
            {
                this._SafeStr_13192(k.tileXAsInt, k.tileYAsInt, this._SafeStr_13193(_local_2));
            }
        }

        public function _SafeStr_7623(k:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_5:HumanGameObject;
            var _local_6:HumanGameObject;
            var _local_7:int;
            if (this._gameState != STAGE_RUNNING)
            {
                return;
            }
            var _local_4:HumanGameObject = this._SafeStr_13190();
            if (((k == this._gamePlayerId) || (((this._ghostEnabled) && (_local_4)) && (k == _local_4._SafeStr_13236))))
            {
                if (((this._SafeStr_13194()) && (this._gameArenaView)))
                {
                    this._gameArenaView._SafeStr_13237();
                }
            }
            else
            {
                _local_5 = this._SafeStr_13187();
                _local_6 = this.getHumanGameObject(k);
                if ((((_local_5) && (_local_6)) && (!(_local_5.team == _local_6.team))))
                {
                    _local_7 = _SafeStr_4031._SafeStr_13235(_arg_2, _arg_3);
                    this._SafeStr_13191(k, this._SafeStr_13193(_local_7));
                }
            }
        }

        public function _SafeStr_7625(k:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_5:uint; //If colors do not work properly for username, try changing this back to int.
            var _local_6:int;
            var playerObject:HumanGameObject = this.getHumanGameObject(k);
            if (!playerObject)
            {
                return;
            }
            if (this._config.getBoolean("snowstorm.settings.show_user_names"))
            {
                _local_5 = ((playerObject.team == 1) ? 4281310921 : 4290988872);
                _local_6 = 500;
                this._roomUI._Str_9753(playerObject._SafeStr_13236, playerObject.name, _local_5, _local_6);
            }
            if (this._gameState == STAGE_RUNNING)
            {
                this._gameArenaView._SafeStr_13238(playerObject.team);
            }
        }

        public function _SafeStr_13189(x:int, y:int):void
        {
            var targetX:int;
            var targetY:int;
            var gameStage:SnowWarGameStage;
            if (this._gameState != STAGE_RUNNING)
            {
                return;
            }
            var _local_3:HumanGameObject = this._SafeStr_13187();
            if (_local_3)
            {
                targetX = (x * Tile.COST);
                targetY = (y * Tile.COST);
                gameStage = this.synchronizedGameStage();
                if (gameStage)
                {
                    this.send(new _SafeStr_3806(targetX, targetY, this._synchronizedGameArena.getTurn(), this._synchronizedGameArena.subturn));
                    this._SafeStr_13195(_local_3, targetX, targetY);
                }
            }
        }

        public function _SafeStr_13190():HumanGameObject
        {
            var k:HumanGameObject = this._SafeStr_13187();
            if (k)
            {
                return this.getHumanGameObject(k._SafeStr_13241);
            }
            return null;
        }

        private function _SafeStr_13191(k:int, _arg_2:int):void
        {
            var _local_3:HumanGameObject = this._SafeStr_13187();
            if (((_local_3) && (_local_3._SafeStr_13242())))
            {
                this.send(new _SafeStr_3904(k, _arg_2, this._synchronizedGameArena.getTurn(), this._synchronizedGameArena.subturn));
                this._SafeStr_13196();
            }
        }

        private function _SafeStr_13192(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_4:HumanGameObject = this._SafeStr_13187();
            if (((_local_4) && (_local_4._SafeStr_13242())))
            {
                _local_5 = (k * Tile.COST);
                _local_6 = (_arg_2 * Tile.COST);
                this.send(new _SafeStr_3908(_local_5, _local_6, _arg_3, this._synchronizedGameArena.getTurn(), this._synchronizedGameArena.subturn));
                this._SafeStr_13196();
            }
        }

        private function _SafeStr_13193(k:int):int
        {
            var _local_2:int;
            switch (k)
            {
                case _SafeStr_4031._SafeStr_13244:
                    _local_2 = _SafeStr_4035._SafeStr_13243;
                    break;
                case _SafeStr_4031._SafeStr_13246:
                    _local_2 = _SafeStr_4035._SafeStr_13245;
                    break;
                case _SafeStr_4031._SafeStr_13248:
                    _local_2 = _SafeStr_4035._SafeStr_13247;
                    break;
                default:
                    _local_2 = _SafeStr_4035._SafeStr_13249;
            }
            return _local_2;
        }

        public function _SafeStr_13194():Boolean
        {
            if (this._gameState != STAGE_RUNNING)
            {
                return false;
            }
            var k:HumanGameObject = this._SafeStr_13187();
            if (((k) && (k._SafeStr_13250())))
            {
                this.send(new _SafeStr_3969(this._synchronizedGameArena.getTurn(), this._synchronizedGameArena.subturn));
                this._SafeStr_13196();
                return true;
            }
            return false;
        }

        private function _SafeStr_13195(k:HumanGameObject, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Boolean;
            var _local_5:HumanGameObject;
            var _local_6:_SafeStr_4019;
            if (this._ghostEnabled)
            {
                _local_4 = (((k) && (!(k.posture == AvatarAction.SNOWWAR_DIE_BACK))) && (!(k.posture == AvatarAction.SNOWWAR_DIE_FRONT)));
                _local_5 = this._SafeStr_13190();
                if (((_local_5) && (_local_4)))
                {
                    _local_6 = new _SafeStr_4021(_local_5, _arg_2, _arg_3);
                    if (this._ghostImmediateEnabled)
                    {
                        _local_6.apply(this._synchronizedGameArena.synchronizedGameStage());
                    }
                    else
                    {
                        this._synchronizedGameArena.addGameEvent(this._synchronizedGameArena.getTurn(), this._synchronizedGameArena.subturn, _local_6);
                    }
                }
            }
        }

        private function _SafeStr_13196():void
        {
            var k:HumanGameObject;
            if (this._ghostEnabled)
            {
                k = this._SafeStr_13190();
                if (k)
                {
                    k._SafeStr_13252();
                }
            }
        }

        public function update(k:uint):void
        {
			try
			{
            var checksumDiff:int;
            var previousTurn:int;
            var clientChecksum:int;
            var serverChecksum:int;
            var checksumBehind:Boolean;
            var checksumMismatch:Boolean;
            var errorStatus:int;
            var checksumIndicatorColor:uint;
            if ((((!(this._synchronizedGameArena)) || ((!(this._gameState)) == STAGE_RUNNING)) || ((!(this._gameState)) == STAGE_STARTED)))
            {
                return;
            }
            if (((this._gameArenaView) && (this._gameState == STAGE_STARTED)))
            {
                this._gameArenaView.update(k, (this._synchronizedGameArena.subturn == 0));
            }
            this._SafeStr_13145 = (this._SafeStr_13145 + k);
            var _local_2:int = (this._synchronizedGameArena.getExtension() as _SafeStr_4034)._SafeStr_13253(); //Returns 50
            if ((((!(this._SafeStr_13154)) && (this._SafeStr_13145 > _local_2)) && (this._currentSubTurn < this._maxSubTurn)))
            {
                this._synchronizedGameArena.handleTurn();
                this._SafeStr_13145 = (this._SafeStr_13145 - _local_2);
                this._currentSubTurn++;
                if (this._SafeStr_13145 > _local_2)
                {
                    this._SafeStr_13145 = 0;
                }
                checksumDiff = (this._maxSubTurn - this.currentSubTurn);
                while (checksumDiff-- > 3)
                {
                    this._synchronizedGameArena.handleTurn();
                    this._currentSubTurn++;
                }
                if (((this._gameArenaView) && (this._gameState == STAGE_RUNNING)))
                {
                    this._gameArenaView.update(k, (this._synchronizedGameArena.subturn == 0));
                }
                if ((this._currentSubTurn % this._synchronizedGameArena.maxSubTurns()) == 0)
                {
                    previousTurn = (this._synchronizedGameArena.getTurn() - 1);
                    clientChecksum = this._synchronizedGameArena._SafeStr_13254(previousTurn);
                    serverChecksum = this._serverChecksums[previousTurn];
                    this._SafeStr_13197(previousTurn);
                    /*checksumBehind = (previousTurn < (this._currentTurn - 3));
                    checksumMismatch = (!(serverChecksum == clientChecksum));
                    if ((((checksumBehind) || (checksumMismatch)) || (this._forceFullStatusRequest)))
                    {
                        HabboGamesCom.log(((((((((("Turn: " + [previousTurn, this._currentTurn]) + " currentSubTurn:") + this._currentSubTurn) + " maxSubTurn:") + this._maxSubTurn) + " serverChecksum:") + serverChecksum) + " clientChecksum:") + clientChecksum));
                        if (checksumBehind)
                        {
                            errorStatus = 0;
                            checksumIndicatorColor = 0xFF00FF;
                            HabboGamesCom.log("CLIENT TOO MUCH BEHIND, requesting full status!");
                        }
                        else
                        {
                            if (checksumMismatch)
                            {
                                errorStatus = 1;
                                checksumIndicatorColor = 0xFF0000;
                                HabboGamesCom.log("CHECKSUM MISMATCH, requesting full status!");
                            }
                            else
                            {
                                errorStatus = -1;
                                checksumIndicatorColor = 0xFF;
                                HabboGamesCom.log("ERROR WAS GENERATED! Requesting full status!");
                            }
                        }
                        this._gameArenaView.setChecksumIndicatorColor(checksumIndicatorColor);
                        this.requestFullGameStatus(errorStatus);
                        this._forceFullStatusRequest = false;
                        this._SafeStr_13154 = true;
                    };*/
                }
            }
			}
			catch (e:Error)
			{
				HabboGamesCom.log(e.getStackTrace());
				HabboGamesCom.log(e.message);
				Habbo.trackLoginStep(e.getStackTrace());
				Habbo.trackLoginStep(e.message);
			}
        }

        private function _SafeStr_13197(checksumTurn:int):void
        {
            var playerObject:HumanGameObject;
            var currentLocation:Location;
            var humanGameObject:HumanGameObject;
            var _local_5:Boolean;
            var _local_6:int;
            if (this._ghostEnabled)
            {
                playerObject = this._SafeStr_13187();
                currentLocation = playerObject.currentLocation;
                humanGameObject = this._SafeStr_13190();
                _local_5 = false;
                _local_6 = -(CONST_CHECKSUM_3);
                while (_local_6 < CONST_CHECKSUM_3) //-3 -> 3
                {
                    _local_5 = humanGameObject._SafeStr_13259((checksumTurn + _local_6), currentLocation);
                    if (_local_5)
                    {
                        break;
                    }
                    _local_6++;
                }
                humanGameObject._SafeStr_13260((checksumTurn - CONST_CHECKSUM_3));
                if (((!(_local_5)) && (checksumTurn > CONST_CHECKSUM_3)))
                {
                    HabboGamesCom.log(((("GHOST CHECKSUM MISMATCH, checksumTurn:" + checksumTurn) + " currentLocation:") + currentLocation));
                    humanGameObject._SafeStr_13261(playerObject);
                    humanGameObject._SafeStr_13262(checksumTurn);
                    this._gameArenaView.setChecksumIndicatorColor(0xFF00);
                }
            }
        }

        public function _SafeStr_13198(turn:int, checksum:int, nextTurn:Boolean=false):void
        {
            this._currentTurn = turn;
            this._serverChecksums[this._currentTurn] = checksum;
            this._maxSubTurn = ((turn + 1) * this._synchronizedGameArena.maxSubTurns());
            if (nextTurn)
            {
                this._currentSubTurn = (this._maxSubTurn - this._synchronizedGameArena.maxSubTurns());
                this._SafeStr_13145 = (this._synchronizedGameArena.getExtension() as _SafeStr_4034)._SafeStr_13253();
                this._SafeStr_13154 = false;
                if (this._ghostEnabled)
                {
                    this._SafeStr_13190()._SafeStr_13262(this._currentTurn);
                }
            }
        }

        public function requestFullGameStatus(errorStatus:int):void
        {
            this.send(new _SafeStr_3935(errorStatus));
        }

        public function alert(message:String):void
        {
            this.disposeAlertWindow();
            if (!this._alertWindow)
            {
                this._alertWindow = this._windowManager.alert("SnowWar Alert", message, 0, this._SafeStr_8319);
            }
            else
            {
                this._alertWindow.summary = message;
            }
            HabboGamesCom.log(("[HabboGameManager.alert] " + message));
        }

        public function disposeGameStartingViewController():void
        {
            if (this._gameStartingViewController)
            {
                this._gameStartingViewController.dispose();
                this._gameStartingViewController = null;
            }
        }

        public function disposeAlertWindow():void
        {
            if (this._alertWindow)
            {
                this._alertWindow.dispose();
                this._alertWindow = null;
            }
        }

        public function _SafeStr_7624():void
        {
            if (this._gameState != STAGE_RUNNING)
            {
                return;
            }
            this._forceFullStatusRequest = true;
        }

        private function _SafeStr_8319(k:_Str_2418, _arg_2:WindowEvent):void
        {
            this.disposeAlertWindow();
        }

        public function set gamePlayerId(k:int):void
        {
            this._gamePlayerId = k;
        }

        public function get gamePlayerId():int
        {
            return this._gamePlayerId;
        }

        public function initializeGameArenaView():void
        {
            if (this._gameArenaView)
            {
				HabboGamesCom.log("SnowWarEngine: Intializing _gameArenaView");
                this._gameArenaView.init();
            }
			else
			{
				HabboGamesCom.log("SnowWarEngine: Tried to initialize _gameArenaView but is null");
			};
        }

        public function get gameMainViewController():GamesMainViewController
        {
            return this._gameMainViewController;
        }

        public function get gameLobbyViewController():GameLobbyViewController
        {
            if (this._gameMainViewController)
            {
                return this._gameMainViewController.gameLobbyViewController;
            }
            return null;
        }

        public function playersInitialized(k:int, players:Array):void
        {
            if (this._gameStartingViewController != null)
            {
                this._gameState = STAGE_LOADING;
                this._gameStartingViewController.playersInitialized(players);
            }
        }

        public function onStageStart(k:int):void //_SafeStr_13206
        {
            if (this._gameArenaView)
            {
                this._roomUI.visible = true;
                this.disposeGameStartingViewController();
                _Str_4375(HabboSoundConstants.GAMES_IG_COUNTDOWN);
                this._gameArenaView._SafeStr_13264(k);
                this._gameState = STAGE_STARTED;
            }
        }

        public function onStageRunning(time:int):void //_SafeStr_13207
        {
            if (time > 0)
            {
                this._time = time;
                this._gameState = STAGE_RUNNING;
            }
            else
            {
                this._gameState = STAGE_ENDED;
            }
            this._currentSubTurn = 0;
            this._maxSubTurn = 0;
        }

        public function onStageEnding():void //_SafeStr_13208
        {
            this._roomEngine.setIsSelectedObjectInValidPosition = false;
            this._gameState = STAGE_ENDED;
            removeUpdateReceiver(this);
            if (this._synchronizedGameArena)
            {
                this._synchronizedGameArena.dispose();
                this._synchronizedGameArena = null;
            }
            _Str_25775(HabboSoundConstants.GAMES_SW_WALK);
            this.send(new _SafeStr_3624(HabboGames._SafeStr_7697));
        }

        public function _SafeStr_13209():void
        {
            this._roomSessionManager._Str_22920();
            if (this._gameArenaView)
            {
                this._gameArenaView.dispose();
                this._gameArenaView = null;
            }
        }

        public function onGameEnding(k:int, _arg_2:Array, _arg_3:Game2SnowWarGameStats, _arg_4:Game2GameResult):void //_SafeStr_13210
        {
            this._gameState = GAME_ENDED;
            this._gameMainViewController.close(false);
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController.dispose();
                this._gameEndingViewController = null;
            }
            if (this._gameArenaView)
            {
                this._gameArenaView.disposeUI();
            }
            this._gameEndingViewController = new GameEndingViewController(this, _arg_2, _arg_3, _arg_4, k);
        }

        public function onGameStart(k:_SafeStr_4018):void //_SafeStr_13211
        {
            var _local_2:_SafeStr_4032;
            this._gameState = GAME_STARTED;
            this._SafeStr_13164 = false;
            this._SafeStr_13149 = new Map();
            this._serverChecksums = new Map();
            for each (_local_2 in k._SafeStr_13266)
            {
                this._SafeStr_13149.add(_local_2.userId, _local_2);
            }
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController.dispose();
                this._gameEndingViewController = null;
            }
            if (!this._gameStartingViewController)
            {
                this._gameStartingViewController = new GameStartingViewController(this);
            }
            this._gameStartingViewController.show(k);
        }

        public function setRejoinRoom(id:int):void
        {
            this._gameState = ((this._SafeStr_13164) ? STATUS_7 : GAME_ENDED);
            this._rejoinRoom = id;
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController._SafeStr_13267(this._SafeStr_13164);
                this._SafeStr_13164 = false;
            }
        }

        public function rematchPlayer(id:int):void
        {
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController.rematchPlayer(id);
            }
        }

        public function onStartLobbyCounter(time:int):void //_SafeStr_13214
        {
            if (((this._gameState == STATUS_7) && (!(this._gameEndingViewController == null))))
            {
                this._gameEndingViewController._SafeStr_13268(time);
            }
            else
            {
                if (this.gameLobbyViewController)
                {
                    this.gameLobbyViewController._SafeStr_13269(time);
                }
            }
        }

        public function _SafeStr_13215():void
        {
            this._SafeStr_13164 = true;
            this.send(new _SafeStr_3643());
        }

        public function _SafeStr_13216(k:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_4:_SafeStr_4032 = this._SafeStr_13149.getValue(k);
            var _local_5:int = ((_local_4.final == 1) ? -300 : 300);
            var _local_6:uint = ((_local_4.final == 1) ? 0xFF : 0xFF0000);
            this._habboGameManager.events.dispatchEvent(new GameChatEvent(GameChatEvent.GCE_GAME_CHAT, k, _arg_2, _local_5, _local_6, _local_4.figure, _local_4.gender, _local_4.name, _arg_3));
        }

        public function _SafeStr_13217():void
        {
            if (((this._gameState == STATUS_7) && (!(this._gameEndingViewController == null))))
            {
                this._SafeStr_13164 = true;
                this._gameEndingViewController._SafeStr_13267(this._SafeStr_13164);
            }
            else
            {
                if (this.gameLobbyViewController)
                {
                    this.gameLobbyViewController._SafeStr_13270();
                }
            }
        }

        public function onLongDataReceived(k:_SafeStr_4018):void
        {
            var _local_2:_SafeStr_4032;
            if (this._gameState == GAME_ENDED)
            {
                this._SafeStr_13164 = true;
            }
            if (((!(this._gameEndingViewController == null)) && (!(this._gameState == STATUS_7))))
            {
                this._gameEndingViewController._SafeStr_13267(this._SafeStr_13164);
                this._gameState = STATUS_7;
                this._SafeStr_13164 = false;
            }
            if (((this._gameState == STATUS_7) && (!(this._gameEndingViewController == null))))
            {
                this._gameEndingViewController._SafeStr_13271(k);
                for each (_local_2 in k._SafeStr_13266)
                {
                    this._gameEndingViewController._SafeStr_13272(_local_2);
                }
            }
            else
            {
                this._gameState = STATUS_0;
                this.gameMainViewController._SafeStr_13273(this.gameArenaName(k), k._SafeStr_13274, k._SafeStr_13275);
                for each (_local_2 in k._SafeStr_13266)
                {
                    this.gameLobbyViewController._SafeStr_13272(_local_2);
                }
            }
        }

        public function _SafeStr_13219(k:_SafeStr_4032):void
        {
            if (((this._gameState == STATUS_7) && (!(this._gameEndingViewController == null))))
            {
                this._gameEndingViewController._SafeStr_13272(k);
            }
            else
            {
                this._gameState = STATUS_0;
                if (this.gameLobbyViewController)
                {
                    this.gameLobbyViewController._SafeStr_13272(k);
                }
            }
        }

        public function _SafeStr_13220(k:int):void
        {
            if (((this._gameState == STATUS_7) && (!(this._gameEndingViewController == null))))
            {
                this._gameEndingViewController._SafeStr_13276(k);
            }
            else
            {
                this._gameState = STATUS_0;
                if (this.gameLobbyViewController)
                {
                    this.gameLobbyViewController._SafeStr_13276(k);
                }
            }
        }

        public function _SafeStr_13221(k:int, infiniteGames:Boolean, gamesLeft:int):void
        {
            if (k == HabboGames._SafeStr_7697)
            {
                this._infiniteGames = infiniteGames;
                this._gamesLeft = gamesLeft;
                if (this._gameEndingViewController)
                {
                    this._gameEndingViewController._SafeStr_13277();
                }
                if (this._gameMainViewController)
                {
                    this._gameMainViewController._SafeStr_13278();
                }
            }
        }

        public function get _SafeStr_7687():Boolean
        {
            return (this._gameState == GAME_STARTED) || (this._gameState == STATUS_7);
        }

        public function _SafeStr_7688():void
        {
            this.onStageEnding();
            this._SafeStr_13209();
            if (this._gameEndingViewController)
            {
                this._gameEndingViewController.dispose();
                this._gameEndingViewController = null;
            }
            if (this._gameMainViewController)
            {
                this._gameMainViewController.createAndVisible(false);
            }
        }

        public function _SafeStr_13222(k:Boolean):void
        {
            this._SafeStr_7688();
            if (k)
            {
                this._habboGameManager._SafeStr_7621();
            }
        }

        public function get _SafeStr_13223():Boolean
        {
            return this._infiniteGames;
        }

        public function get _SafeStr_13224():int
        {
            return this._gamesLeft;
        }

        public function _SafeStr_13225(k:int):void
        {
            if (((!(this._gameArenaView == null)) && (k == this._gamePlayerId)))
            {
                this._gameArenaView._SafeStr_13225();
            }
        }

        public function _SafeStr_13226(k:String):void
        {
            //this._catalog.buySnowWarTokensOffer(); //TODO: Purchasing game tokens.
            this._SafeStr_7665(k);
        }

        public function _SafeStr_13227(k:String):Boolean
        {
            var _local_2:Boolean = this._catalog.videoOffers.launch(VideoOfferTypeEnum._SafeStr_7697);
            this._SafeStr_7665(k);
            return _local_2;
        }

        public function _SafeStr_7664(k:String):void
        {
            this._catalog.openClubCenter() //_SafeStr_2308.ANY, "HabboGameManager");
            this._SafeStr_7665(k);
        }

        private function _SafeStr_7665(k:String):void
        {
            this.send(new _SafeStr_1434("GameFramework", "SnowStorm", k, "", this._SafeStr_13224));
        }

        public function _SafeStr_13228(k:HumanGameObject, _arg_2:HumanGameObject):void
        {
            if (this._gamePlayerId == k._SafeStr_13236)
            {
                this._gameArenaView._SafeStr_13280(false);
            }
            else
            {
                if (this._gamePlayerId == _arg_2._SafeStr_13236)
                {
                    this._gameArenaView._SafeStr_13280(true);
                }
            }
        }

        public function set _SafeStr_13229(k:int):void
        {
            this._promotionId = k;
        }

        public function _SafeStr_7663():void
        {
            if (((this._shownPromotion) || (!(this._promotionId == 0))))
            {
                return;
            }
            this._shownPromotion = true;
            var newIdentityEnabled:Boolean = this.config.getBoolean("new.identity");
            var _local_2:String = this.config.getProperty("new.user.wing");
            if (((newIdentityEnabled) && (!(_local_2 == WingCodeEnum.GAME))))
            {
                return;
            }
            this._habboHelp._Str_8205(HabboToolbarIconEnum.GAMES, "snowwar.promotion", WelcomeNotificationAlignment.LEFT, "GAMES");
        }

        public function showLeaderboard():void
        {
            this.leaderboard._SafeStr_13281 = HabboGames._SafeStr_7697;
            this.leaderboard._SafeStr_13282();
        }

        public function get leaderboard():LeaderboardViewController
        {
            if (!(this._leaderBoardViewController) && this.gameCenterEnabled)
            {
                this._leaderBoardViewController = new LeaderboardViewController(this);
            }
            return this._leaderBoardViewController;
        }

        public function loadUIElements():void
        {
            var k:String;
            var _local_2:String;
            if (!this._assetsLoaded)
            {
                for each (k in UI_ELEMENTS)
                {
                    if (!assets.hasAsset(k))
                    {
                        _local_2 = this.config.interpolate((("${image.library.url}snowstorm_client/" + k) + ".png"));
                        assets.loadAssetFromFile(k, new URLRequest(_local_2));
                    }
                }
                this._assetsLoaded = true;
            }
        }

        public function _SafeStr_7702():Boolean
        {
            var k:String;
            for each (k in SnowWarEngine.UI_ELEMENTS)
            {
                if (!assets.hasAsset(k))
                {
                    return false;
                }
            }
            return true;
        }
    }
}
