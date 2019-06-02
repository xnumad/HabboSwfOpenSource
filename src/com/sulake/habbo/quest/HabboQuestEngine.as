package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.notifications.IHabboNotifications;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_11854;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7461;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4916;

    public class HabboQuestEngine extends Component implements IHabboQuestEngine, IUpdateReceiver, ILinkEventTracker 
    {
        private static const _Str_16631:int = 5;
        private static const _Str_18373:int = 800;
        private static const _Str_16236:int = 15;
        private static const _Str_16080:int = 300;
        private static const _Str_18303:Array = ["MOVEITEM", "ENTEROTHERSROOM", "CHANGEFIGURE", "FINDLIFEGUARDTOWER", "SCRATCHAPET"];

        private var _windowManager:IHabboWindowManager;
        private var _communication:IHabboCommunicationManager;
        private var _localization:IHabboLocalizationManager;
        private var _configuration:IHabboConfigurationManager;
        private var _incomingMessages:IncomingMessages;
        private var _questController:QuestController;
        private var _achievementController:AchievementController;
        private var _roomCompetitionController:RoomCompetitionController;
        private var _toolbar:IHabboToolbar;
        private var _catalog:IHabboCatalog;
        private var _navigator:IHabboNewNavigator;
        private var _notifications:IHabboNotifications;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboHelp:IHabboHelp;
        private var _tracking:IHabboTracking;
        private var _twinkleImages:TwinkleImages;
        private var _currentlyInRoom:Boolean = false;
        private var _roomEngine:IRoomEngine;
        private var _isFirstLoginOfDay:Boolean = false;
        private var _achievementsResolutionController:AchievementsResolutionController;

        public function HabboQuestEngine(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._questController = new QuestController(this);
            this._achievementController = new AchievementController(this);
            this._achievementsResolutionController = new AchievementsResolutionController(this);
            this._roomCompetitionController = new RoomCompetitionController(this);
            queueInterface(new IIDHabboCommunicationManager(), this.onCommunicationManagerReady);
            queueInterface(new IIDHabboWindowManager(), this.onWindowManagerReady);
            queueInterface(new IIDHabboLocalizationManager(), this.onLocalizationManagerReady);
            queueInterface(new IIDHabboConfigurationManager(), this.onConfigurationManagerReady);
            queueInterface(new IIDHabboToolbar(), this.onToolbarReady);
            queueInterface(new IIDHabboCatalog(), this.onCatalogReady);
            queueInterface(new IIDHabboNotifications(), this.onNotificationsReady);
            queueInterface(new IIDHabboHelp(), this.onHelpReady);
            queueInterface(new IIDHabboNewNavigator(), this.onNavigatorReady);
            queueInterface(new IIDSessionDataManager(), this.onSessionDataManagerReady);
            queueInterface(new IIDRoomEngine(), this.onRoomEngineReady);
            queueInterface(new IIDHabboTracking(), this.onTrackingReady);
            k.addLinkEventTracker(this);
            registerUpdateReceiver(this, _Str_16631);
        }

        public static function _Str_5055(k:IWindowContainer, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            var childName:String;
            var window:IWindow;
            for each (childName in _arg_2)
            {
                window = k.getChildByName(childName);
                if (((!(window == null)) && (window.visible)))
                {
                    window.x = _arg_3;
                    _arg_3 = (_arg_3 + (window.width + _arg_4));
                }
            }
        }


        override public function dispose():void
        {
            removeUpdateReceiver(this);
            context.removeLinkEventTracker(this);
            if (this._toolbar)
            {
                this._toolbar.release(new IIDHabboToolbar());
                this._toolbar = null;
            }
            if (this._catalog != null)
            {
                this._catalog.release(new IIDHabboCatalog());
                this._catalog = null;
            }
            if (this._notifications != null)
            {
                this._notifications.release(new IIDHabboNotifications());
                this._notifications = null;
            }
            if (this._windowManager != null)
            {
                this._windowManager.release(new IIDHabboWindowManager());
                this._windowManager = null;
            }
            if (this._localization != null)
            {
                this._localization.release(new IIDHabboLocalizationManager());
                this._localization = null;
            }
            if (this._configuration != null)
            {
                this._configuration.release(new IIDHabboConfigurationManager());
                this._configuration = null;
            }
            if (this._communication != null)
            {
                this._communication.release(new IIDHabboCommunicationManager());
                this._communication = null;
            }
            if (this._sessionDataManager != null)
            {
                this._sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this._achievementController.onBadgeImageReady);
                this._sessionDataManager.release(new IIDSessionDataManager());
                this._sessionDataManager = null;
            }
            if (this._incomingMessages)
            {
                this._incomingMessages.dispose();
            }
            if (this._habboHelp != null)
            {
                this._habboHelp.release(new IIDHabboHelp());
                this._habboHelp = null;
            }
            if (this._navigator != null)
            {
                this._navigator.release(new IIDHabboNewNavigator());
                this._navigator = null;
            }
            if (this._tracking != null)
            {
                this._tracking.release(new IIDHabboTracking());
                this._tracking = null;
            }
            if (this._twinkleImages)
            {
                this._twinkleImages.dispose();
                this._twinkleImages = null;
            }
            if (this._roomEngine)
            {
                this._roomEngine.release(new IIDRoomEngine());
                this._roomEngine = null;
            }
            if (this._achievementsResolutionController)
            {
                this._achievementsResolutionController.dispose();
                this._achievementsResolutionController = null;
            }
            super.dispose();
        }

        public function getXmlWindow(k:String, _arg_2:int=1):IWindow
        {
            var _local_4:IAsset;
            var _local_5:XmlAsset;
            var _local_3:IWindow;
            try
            {
                _local_4 = assets.getAssetByName(k);
                _local_5 = XmlAsset(_local_4);
                _local_3 = this._windowManager.buildFromXML(XML(_local_5.content), _arg_2);
            }
            catch(e:Error)
            {
            }
            return _local_3;
        }

        private function onCommunicationManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._communication = IHabboCommunicationManager(_arg_2);
            this._incomingMessages = new IncomingMessages(this);
        }

        private function onWindowManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._windowManager = IHabboWindowManager(_arg_2);
        }

        private function onLocalizationManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._localization = IHabboLocalizationManager(_arg_2);
        }

        private function onConfigurationManagerReady(k:IID, _arg_2:IUnknown):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            this._configuration = (_arg_2 as IHabboConfigurationManager);
        }

        private function onCatalogReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._catalog = (_arg_2 as IHabboCatalog);
        }

        private function onNotificationsReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._notifications = (_arg_2 as IHabboNotifications);
        }

        private function onSessionDataManagerReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._sessionDataManager = (_arg_2 as ISessionDataManager);
            this._sessionDataManager.events.addEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this._achievementController.onBadgeImageReady);
        }

        private function onHelpReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._habboHelp = (_arg_2 as IHabboHelp);
        }

        private function onNavigatorReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._navigator = (_arg_2 as IHabboNewNavigator);
        }

        private function onRoomEngineReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._roomEngine = (_arg_2 as IRoomEngine);
        }

        private function onTrackingReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            }
            this._tracking = (_arg_2 as IHabboTracking);
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get _Str_3398():QuestController
        {
            return this._questController;
        }

        public function get _Str_8189():RoomCompetitionController
        {
            return this._roomCompetitionController;
        }

        public function get _Str_17659():AchievementController
        {
            return this._achievementController;
        }

        public function get _Str_10255():AchievementsResolutionController
        {
            return this._achievementsResolutionController;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get tracking():IHabboTracking
        {
            return this._tracking;
        }

        public function openCatalog(k:_Str_2455):void
        {
            var _local_2:String = k._Str_23842;
            if (_local_2 != "")
            {
                Logger.log(("Questing->Open Catalog: " + _local_2));
                this._catalog.openCatalogPage(_local_2);
            }
            else
            {
                Logger.log("Questing->Open Catalog: Quest Catalog page name not defined");
                this._catalog.openCatalog();
            }
        }

        public function openNavigator(k:_Str_2455):void
        {
            var _local_3:String;
            var _local_2:Boolean = this._Str_17631((k._Str_5688() + ".searchtag"));
            if (_local_2)
            {
                _local_3 = (k._Str_5688() + ".searchtag");
            }
            else
            {
                _local_3 = (k._Str_9246() + ".searchtag");
            }
            var _local_4:String = this._localization.getLocalization(_local_3);
            Logger.log(("Questing->Open Navigator: " + _local_4));
            this._navigator.performTagSearch(_local_4);
        }

        public function _Str_20111():Boolean
        {
            var k:String = this._Str_19935();
            return (!(k == null)) && (!(k == ""));
        }

        private function _Str_19935():String
        {
            return this._localization.getLocalization((("quests." + this._Str_9628()) + ".roomids"));
        }

        public function _Str_13260():void
        {
            if (!this._Str_20111())
            {
                return;
            }
            var k:String = this._Str_19935();
            var _local_2:Array = k.split(",");
            if (_local_2.length == 0)
            {
                return;
            }
            var _local_3:int = Math.max(0, Math.min((_local_2.length - 1), Math.floor((Math.random() * _local_2.length))));
            var _local_4:String = _local_2[_local_3];
            var _local_5:int = int(_local_4);
            Logger.log(("Forwarding to a guest room: " + _local_5));
            this._navigator.goToRoom(_local_5);
        }

        private function onToolbarReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            this._toolbar = (IHabboToolbar(_arg_2) as IHabboToolbar);
            this._toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this._Str_3304);
        }

        private function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                if (k._Str_3378 == HabboToolbarIconEnum.QUESTS)
                {
                    this._questController.onToolbarClick();
                }
                if (k._Str_3378 == HabboToolbarIconEnum.ACHIEVEMENTS)
                {
                    this._achievementController.onToolbarClick();
                }
            }
        }

        public function _Str_12909():void
        {
            if (this._achievementController != null)
            {
                this._achievementController._Str_12909();
            }
        }

        public function showAchievements():void
        {
            if (this._achievementController != null)
            {
                this._achievementController.show();
            }
        }

        public function _Str_23387():void
        {
        }

        public function _Str_13119(k:String, _arg_2:String):int
        {
            if (this._achievementController != null)
            {
                return this._achievementController._Str_13119(k, _arg_2);
            }
            return 0;
        }

        public function reenableRoomCompetitionWindow():void
        {
            this._roomCompetitionController._Str_23471 = false;
        }

        public function get notifications():IHabboNotifications
        {
            return this._notifications;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function send(k:IMessageComposer):void
        {
            this.communication.connection.send(k);
        }

        public function _Str_23424():Boolean
        {
            return this._questController._Str_20198.isVisible();
        }

        public function _Str_23055(k:_Str_2455):String
        {
            var _local_2:String = ((k._Str_3935 < 1) ? (k._Str_5688() + ".name") : "quests.list.questdelayed");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_10470(k:_Str_2455):String
        {
            var _local_2:* = (k._Str_5688() + ".name");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_20120(k:_Str_2455):String
        {
            var _local_2:* = (k._Str_5688() + ".desc");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_23561(k:_Str_2455):String
        {
            var _local_2:* = (k._Str_5688() + ".hint");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_26148(k:int):String
        {
            var _local_2:String = ("achievements.activitypoint." + k);
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_21680(k:String):String
        {
            var _local_2:* = (k + ".name");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_15926(k:_Str_2455):String
        {
            return this._Str_21680(k._Str_9246());
        }

        public function _Str_21442(k:String):String
        {
            var _local_2:* = (("quests." + k) + ".name");
            return this._localization.getLocalization(_local_2, _local_2);
        }

        public function _Str_19955(k:IWindowContainer, _arg_2:_Str_2455):void
        {
            var _local_3:IStaticBitmapWrapperWindow = (k.findChildByName("quest_pic_bitmap") as IStaticBitmapWrapperWindow);
            var _local_4:String = ((_arg_2._Str_3935 > 0) ? ("quest_timer_questionmark") : ((((_arg_2._Str_6549 + "_") + _arg_2._Str_5961) + _arg_2._Str_22072) + ((this._Str_17760(_arg_2)) ? "_a" : "")).toLowerCase());
            _local_3.assetUri = (("${image.library.questing.url}" + _local_4) + ".png");
        }

        public function _Str_22546(k:IWindowContainer, _arg_2:_Str_2455, _arg_3:String):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (k.findChildByName(("prompt_pic_" + _arg_3)) as IStaticBitmapWrapperWindow);
            _local_4.assetUri = (("${image.library.questing.url}" + (((((_arg_2._Str_6549 + "_") + _arg_2._Str_5961) + _arg_2._Str_22072) + "_") + _arg_3).toLowerCase()) + ".png");
        }

        public function _Str_24530(k:IWindowContainer, _arg_2:int):void
        {
            var _local_3:IWindow = k.findChildByName("currency_icon");
            _local_3.style = ActivityPointTypeEnum._Str_5251(_arg_2, this, true);
        }

        public function _Str_19396(k:IWindowContainer, _arg_2:_Str_2455, _arg_3:Boolean):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (k.findChildByName("campaign_pic_bitmap") as IStaticBitmapWrapperWindow);
            if (!_arg_3)
            {
                _local_4.visible = false;
                return;
            }
            _local_4.visible = true;
            var _local_5:String = _arg_2._Str_6549;
            if (this._Str_7575(_arg_2))
            {
                _local_5 = (this._Str_9628() + "_campaign_icon");
            }
            _local_4.assetUri = (("${image.library.questing.url}" + _local_5) + ".png");
        }

        public function _Str_21694(k:IWindowContainer, _arg_2:AchievementCategory, _arg_3:Boolean):void
        {
            var _local_4:IStaticBitmapWrapperWindow = (k.findChildByName("category_pic_bitmap") as IStaticBitmapWrapperWindow);
            _local_4.assetUri = (("${image.library.questing.url}" + ((_arg_3) ? ((("achcategory_" + _arg_2.code) + ((_arg_2._Str_9594() > 0) ? "_active" : "_inactive"))) : (("achicon_" + _arg_2.code)))) + ".png");
        }

        public function _Str_17760(k:_Str_2455):Boolean
        {
            return _Str_18303.indexOf(k._Str_5961) > -1;
        }

        public function _Str_19816(k:Boolean, _arg_2:IWindowContainer, _arg_3:int, _arg_4:int):void
        {
            k = (((_arg_3 < 0) || (_arg_4 < 1)) ? false : k);
            var _local_5:IWindow = _arg_2.findChildByName("reward_caption_txt");
            var _local_6:IWindow = _arg_2.findChildByName("reward_amount_txt");
            var _local_7:IWindow = _arg_2.findChildByName("currency_icon");
            _local_6.visible = k;
            _local_5.visible = k;
            _local_7.visible = k;
            if (!k)
            {
                return;
            }
            _local_6.caption = ("" + _arg_4);
            _Str_5055(_arg_2, ["reward_caption_txt", "reward_amount_txt", "currency_icon"], _local_5.x, 3);
            this._Str_24530(_arg_2, _arg_3);
        }

        public function update(k:uint):void
        {
            this._questController.update(k);
            this._achievementController.update(k);
        }

        public function _Str_22854(k:IWindowContainer):Animation
        {
            if (this._twinkleImages == null)
            {
                this._twinkleImages = new TwinkleImages(this);
            }
            var _local_2:int = _Str_18373;
            var _local_3:Animation = new Animation(IBitmapWrapperWindow(k.findChildByName("twinkle_bitmap")));
            var _local_4:int;
            while (_local_4 < _Str_16236)
            {
                _local_3.addObject(new Twinkle(this._twinkleImages, _local_2));
                _local_2 = (_local_2 + _Str_16080);
                _local_4++;
            }
            return _local_3;
        }

        public function get _Str_6927():Boolean
        {
            return this._currentlyInRoom;
        }

        public function set _Str_6927(k:Boolean):void
        {
            this._currentlyInRoom = k;
        }

        public function _Str_19304():Boolean
        {
            return this._configuration.getBoolean("seasonalQuestCalendar.enabled");
        }

        public function _Str_7575(k:_Str_2455):Boolean
        {
            var _local_2:String = this._Str_9628();
            return (!(_local_2 == "")) && (k._Str_6549.indexOf(_local_2) == 0);
        }

        public function _Str_9628():String
        {
            return getProperty("seasonalQuestCalendar.campaignPrefix");
        }

        public function _Str_25830(k:Boolean):void
        {
            this._isFirstLoginOfDay = k;
        }

        public function get _Str_18128():Boolean
        {
            return this._isFirstLoginOfDay;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._configuration;
        }

        public function _Str_17631(k:String):Boolean
        {
            return !(this._localization.getLocalization(k, "") == "");
        }

        public function get navigator():IHabboNewNavigator
        {
            return this._navigator;
        }

        public function _Str_9649():void
        {
            this.send(new _Str_11854());
        }

        public function _Str_18428():void
        {
            this.send(new _Str_7461());
        }

        public function _Str_23483(k:int):void
        {
            this.send(new _Str_4916(k));
        }

        public function get eventUrlPrefix():String
        {
            return "questengine/";
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
                case "gotorooms":
                    this._Str_13260();
                    return;
                case "achievements":
                    if (_local_2.length == 3)
                    {
                        this._achievementController.show();
                        this._achievementController._Str_23567(_local_2[2]);
                    }
                    else
                    {
                        this.showAchievements();
                    }
                    return;
                case "calendar":
                    this._questController._Str_13628.onToolbarClick();
                    return;
                case "quests":
                    this._questController.onToolbarClick();
                    return;
                default:
                    Logger.log(("QuestEngine unknown link-type received: " + _local_2[1]));
            }
        }
    }
}
