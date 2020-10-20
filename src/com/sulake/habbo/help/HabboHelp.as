package com.sulake.habbo.help
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.help.cfh.registry.chat.ChatEventHandler;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageEventHandler;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistry;
    import com.sulake.habbo.help.cfh.registry.chat.ChatRegistry;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistry;
    import com.sulake.habbo.help.namechange.NameChangeController;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UsersEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsEvent;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsDeletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpDisabledNotifyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideReportingStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CfhTopicsInitEvent;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.SanctionStatusEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.habbo.communication.messages.outgoing.help.GetPendingCallsForHelpMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.talent.GuideAdvertisementReadMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.GetGuideReportingStatusMessageComposer;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideReportingStatusMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.RemoveFriendMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.IgnoreUserIdMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhTopicsInitMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.help.GetCfhStatusMessageComposer;
    import com.sulake.habbo.utils.StringUtil;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import __AS3__.vec.*;

    public class HabboHelp extends Component implements IHabboHelp, ILinkEventTracker 
    {
        public static const REPORT_TYPE_EMERGENCY:int = 1;
        public static const REPORT_TYPE_GUIDE:int = 2;
        public static const REPORT_TYPE_IM:int = 3;
        public static const REPORT_TYPE_ROOM:int = 4;
        public static const REPORT_TYPE_BULLY:int = 6;
        public static const REPORT_TYPE_THREAD:int = 7;
        public static const REPORT_TYPE_MESSAGE:int = 8;
        public static const REPORT_TYPE_PHOTO:int = 9;

        private var _toolbar:IHabboToolbar;
        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _navigator:IHabboNavigator;
        private var _tracking:IHabboTracking;
        private var _soundManager:IHabboSoundManager;
        private var _friendList:IHabboFriendsList;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _chatEventHandler:ChatEventHandler;
        private var _instantMessageEventHandler:InstantMessageEventHandler;
        private var _guideHelpManager:GuideHelpManager;
        private var _userRegistry:UserRegistry;
        private var _chatRegistry:ChatRegistry;
        private var _instantMessageRegistry:InstantMessageRegistry;
        private var _nameChangeController:NameChangeController;
        private var _callForHelpManager:CallForHelpManager;
        private var _welcomeScreenController:WelcomeScreenController;
        private var _habboWayController:HabboWayController;
        private var _habboWayQuizController:HabboWayQuizController;
        private var _safetyBookletController:SafetyBookletController;
        private var _outsideRoom:Boolean;
        private var _reportType:int;
        private var _reportMessage:IMessageComposer;
        private var _requestType:int = -1;
        private var _currentRoomId:int;
        private var _callForHelpCategories:Vector.<CallForHelpCategoryData>;
        private var _topicsFlowHelpController:TopicsFlowHelpController;
        private var _sanctionInfo:SanctionInfo;

        public function HabboHelp(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._userRegistry = new UserRegistry();
            this._chatRegistry = new ChatRegistry();
            this._instantMessageRegistry = new InstantMessageRegistry();
            super(k, _arg_2, _arg_3);
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get tracking():IHabboTracking
        {
            return this._tracking;
        }

        public function get _Str_2476():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get _Str_19829():Boolean
        {
            return getBoolean("guide.help.new.user.tour.enabled");
        }

        public function get newIdentity():Boolean
        {
            return getInteger("new.identity", 0) > 0;
        }

        public function get _Str_9968():Boolean
        {
            return getBoolean("talent.track.citizenship.enabled");
        }

        public function get _Str_19563():Boolean
        {
            return getBoolean("safety_quiz.disabled");
        }

        public function requestGuide():void
        {
            this._guideHelpManager.createHelpRequest(_Str_2849._Str_4268);
        }

        public function reportBully(k:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager.reportBully(k, this._currentRoomId);
            }
        }

        public function startPhotoReportingInNewCfhFlow(k:int, _arg_2:String, _arg_3:String, _arg_4:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_3469 = this._currentRoomId;
                this._callForHelpManager.reportedUserId = k;
                this._callForHelpManager.reportedUserName = _arg_2;
                this._callForHelpManager._Str_10658 = _arg_4;
                this._callForHelpManager._Str_11455 = _arg_3;
                this._topicsFlowHelpController._Str_15173(HabboHelp.REPORT_TYPE_PHOTO);
            }
        }

        public function reportUser(k:int, _arg_2:int, _arg_3:String):void
        {
            this._callForHelpManager.reportedUserId = k;
            this._topicsFlowHelpController._Str_25197();
        }

        public function reportUserName(k:int, _arg_2:String):void
        {
            this._callForHelpManager.reportedUserId = k;
            this._callForHelpManager.reportedUserName = _arg_2;
            this._callForHelpManager._Str_3469 = -1;
            this._topicsFlowHelpController._Str_24232();
        }

        public function reportUserFromIM(k:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager.reportedUserId = k;
                this._topicsFlowHelpController._Str_23015();
            }
        }

        public function reportRoom(k:int, _arg_2:String, _arg_3:String):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_3469 = k;
                this._callForHelpManager._Str_16366 = _arg_2;
                this._callForHelpManager.reportedUserId = -1;
                this._callForHelpManager.reportedUserName = "";
                this._topicsFlowHelpController._Str_15173(REPORT_TYPE_ROOM);
            }
        }

        public function reportThread(k:int, _arg_2:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_11420 = k;
                this._callForHelpManager._Str_10392 = _arg_2;
                this._topicsFlowHelpController._Str_15173(HabboHelp.REPORT_TYPE_THREAD);
            }
        }

        public function reportSelfie(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (this._callForHelpManager != null)
            {
                if (_arg_2.length < getInteger("help.cfh.length.minimum", 15))
                {
                    this.windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                    return false;
                }
                this._callForHelpManager.reportSelfie(k, _arg_2, _arg_3, _arg_4, _arg_5);
                return true;
            }
            return false;
        }

        public function reportPhoto(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (this._callForHelpManager != null)
            {
                if (_arg_2 == 0)
                {
                    this.windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                    return false;
                }
                this._callForHelpManager.reportPhoto(k, _arg_2, _arg_3, _arg_4, _arg_5);
                return true;
            }
            return false;
        }

        public function reportMessage(k:int, _arg_2:int, _arg_3:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_11420 = k;
                this._callForHelpManager._Str_10392 = _arg_2;
                this._callForHelpManager._Str_16155 = _arg_3;
                this._topicsFlowHelpController._Str_15173(HabboHelp.REPORT_TYPE_MESSAGE);
            }
        }

        public function startNameChange():void
        {
            if (this._nameChangeController != null)
            {
                this._nameChangeController.showView();
            }
        }

        public function _Str_22356():void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager.openEmergencyHelpRequest();
            }
        }

        public function showWelcomeScreen(k:String, _arg_2:String, _arg_3:int, _arg_4:String=null):void
        {
            if (((this._welcomeScreenController == null) || (this._welcomeScreenController.disposed)))
            {
                this._welcomeScreenController = new WelcomeScreenController(this);
            }
            this._welcomeScreenController.showWelcomeScreen(k, _arg_2, _arg_3, _arg_4);
        }

        public function showHabboWay():void
        {
            if (!this._habboWayController)
            {
                this._habboWayController = new HabboWayController(this);
            }
            this._habboWayController.showHabboWay();
        }

        public function _Str_24844():void
        {
            if (this._habboWayController != null)
            {
                this._habboWayController.closeWindow();
            }
        }

        public function showSafetyBooklet():void
        {
            if (!this._safetyBookletController)
            {
                this._safetyBookletController = new SafetyBookletController(this);
            }
            this._safetyBookletController._Str_24968();
        }

        public function _Str_21195():void
        {
            if (this._safetyBookletController != null)
            {
                this._safetyBookletController.closeWindow();
            }
        }

        public function showHabboWayQuiz():void
        {
            if (((this._habboWayQuizController == null) || (this._habboWayQuizController.disposed)))
            {
                this._habboWayQuizController = new HabboWayQuizController(this);
            }
            this._habboWayQuizController.showHabboWayQuiz();
        }

        public function showSafetyQuiz():void
        {
            if (((this._habboWayQuizController == null) || (this._habboWayQuizController.disposed)))
            {
                this._habboWayQuizController = new HabboWayQuizController(this);
            }
            this._habboWayQuizController.showSafetyQuiz();
        }

        public function showTourPopup():void
        {
            this._guideHelpManager.openTourPopup();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }, true, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this.onHabboToolbarEvent
            }, {
                "type":HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK,
                "callback":this.onHabboToolbarEvent
            }, {
                "type":HabboToolbarEvent.HTE_RESIZED,
                "callback":this.onHabboToolbarEvent
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, true), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }, false), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            }, false), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }, false), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendList = k;
            }, false)]));
        }

        override protected function initComponent():void
        {
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new UsersEvent(this.onUsers));
            this.addMessageEvent(new RoomReadyMessageEvent(this.onRoomReady));
            this.addMessageEvent(new GetGuestRoomResultEvent(this.onGuestRoomResult));
            this.addMessageEvent(new CallForHelpPendingCallsEvent(this.onPendingCallsForHelp));
            this.addMessageEvent(new CallForHelpPendingCallsDeletedMessageEvent(this.onPendingCallsForHelpDeleted));
            this.addMessageEvent(new CallForHelpDisabledNotifyMessageEvent(this.onCallForHelpDisabledNotify));
            this.addMessageEvent(new GuideReportingStatusMessageEvent(this.onGuideReportingStatus));
            this.addMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            this.addMessageEvent(new CfhTopicsInitEvent(this.onCfhTopics));
            this.addMessageEvent(new SanctionStatusEvent(this.onSanctionStatusEvent));
            this._chatEventHandler = new ChatEventHandler(this);
            this._guideHelpManager = new GuideHelpManager(this);
            this._callForHelpManager = new CallForHelpManager(this);
            this._nameChangeController = new NameChangeController(this);
            this._instantMessageEventHandler = new InstantMessageEventHandler(this);
            this._topicsFlowHelpController = new TopicsFlowHelpController(this);
            this._sanctionInfo = new SanctionInfo(this);
            context.addLinkEventTracker(this);
            if (((getBoolean("show.sanction.info.on.login")) && (Math.random() < 0.2)))
            {
                this.requestSanctionInfo(true);
            }
        }

        public function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            if (((!(this._messageEvents == null)) && (!(this._communicationManager == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
            }
            if (this._safetyBookletController != null)
            {
                this._safetyBookletController.dispose();
                this._safetyBookletController = null;
            }
            if (this._habboWayController != null)
            {
                this._habboWayController.dispose();
                this._habboWayController = null;
            }
            if (this._welcomeScreenController != null)
            {
                this._welcomeScreenController.dispose();
                this._welcomeScreenController = null;
            }
            if (this._nameChangeController != null)
            {
                this._nameChangeController.dispose();
                this._nameChangeController = null;
            }
            if (this._guideHelpManager)
            {
                this._guideHelpManager.dispose();
                this._guideHelpManager = null;
            }
            if (this._callForHelpManager)
            {
                this._callForHelpManager.dispose();
                this._callForHelpManager = null;
            }
            if (this._habboWayQuizController)
            {
                this._habboWayQuizController.dispose();
                this._habboWayQuizController = null;
            }
            if (this._topicsFlowHelpController)
            {
                this._topicsFlowHelpController.dispose();
                this._topicsFlowHelpController = null;
            }
            if (this._sanctionInfo)
            {
                this._sanctionInfo.dispose();
                this._sanctionInfo = null;
            }
            super.dispose();
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

        public function getModalXmlWindow(name:String):IModalDialog
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var dialog:IModalDialog;
            try
            {
                asset = assets.getAssetByName((name + "_xml"));
                xmlAsset = XmlAsset(asset);
                dialog = this._windowManager.buildModalDialogFromXML(XML(xmlAsset.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + _windowManager) + "!"));
                throw (e);
            }
            return dialog;
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (this._tracking)
            {
                this._tracking.trackGoogle(k, _arg_2, _arg_3);
            }
        }

        public function _Str_25749(k:IMessageComposer):void
        {
            this._reportMessage = k;
        }

        public function sendMessage(k:IMessageComposer):void
        {
            if (((!(this._communicationManager == null)) && (!(k == null))))
            {
                this._communicationManager.connection.send(k);
            }
        }

        public function get _Str_16805():String
        {
            return this._nameChangeController._Str_16805;
        }

        public function get _Str_6240():int
        {
            return this._nameChangeController._Str_6240;
        }

        public function get outsideRoom():Boolean
        {
            return this._outsideRoom;
        }

        public function set outsideRoom(k:Boolean):void
        {
            this._outsideRoom = k;
        }

        public function queryForPendingCallsForHelp(k:int):void
        {
            this._reportType = k;
            this.sendMessage(new GetPendingCallsForHelpMessageComposer());
        }

        public function queryForGuideReportingStatus(k:int):void
        {
            this._requestType = k;
            this.sendMessage(new GuideAdvertisementReadMessageComposer());
            this.sendMessage(new GetGuideReportingStatusMessageComposer());
        }

        private function onPendingCallsForHelp(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_2:CallForHelpPendingCallsMessageParser = CallForHelpPendingCallsEvent(k).getParser();
            if (((_local_2.count == 0) || ((this._reportType == REPORT_TYPE_PHOTO) && (_local_2.count < 3))))
            {
                this.proceedWithReporting();
            }
            else
            {
                _local_3 = "";
                _local_4 = 0;
                while (((_local_4 < _local_2.pendingCalls.length) && (_local_4 < 10)))
                {
                    _local_3 = (_local_3 + _local_2.pendingCalls[_local_4].message);
                    if (((_local_4 < (_local_2.pendingCalls.length - 1)) && (_local_4 < 9)))
                    {
                        _local_3 = (_local_3 + "\n");
                    }
                    _local_4++;
                }
                this._callForHelpManager.showPendingRequest(_local_3);
            }
        }

        private function onPendingCallsForHelpDeleted(k:IMessageEvent):void
        {
            this._topicsFlowHelpController.submitCallForHelp(false);
        }

        private function onGuideReportingStatus(k:GuideReportingStatusMessageEvent):void
        {
            var _local_2:GuideReportingStatusMessageParser = k.getParser();
            switch (_local_2.statusCode)
            {
                case GuideReportingStatusMessageParser.GUIDE_REPORTING_STATUS_OK:
                    this.toggleNewHelpWindow();
                    return;
                case GuideReportingStatusMessageParser.GUIDE_REPORTING_STATUS_PENDING_TICKET:
                    this._guideHelpManager.showPendingTicket(_local_2.pendingTicket);
                    return;
                default:
                    this._guideHelpManager.showFeedback(_local_2.localizationCode);
            }
        }

        private function proceedWithReporting():void
        {
            switch (this._reportType)
            {
                case REPORT_TYPE_EMERGENCY:
                case REPORT_TYPE_IM:
                case REPORT_TYPE_ROOM:
                case REPORT_TYPE_THREAD:
                case REPORT_TYPE_MESSAGE:
                    this._callForHelpManager.showEmergencyHelpRequest(this._reportType);
                    break;
                case REPORT_TYPE_GUIDE:
                    this._guideHelpManager.openReportWindow();
                    break;
                case REPORT_TYPE_PHOTO:
                    if (this._reportMessage != null)
                    {
                        this.sendMessage(this._reportMessage);
                        this._reportMessage = null;
                    }
                    break;
            }
            this._reportType = 0;
        }

        private function onCallForHelpDisabledNotify(k:CallForHelpDisabledNotifyMessageEvent):void
        {
            this._windowManager.simpleAlert("${help.emergency.global_mute.caption}", "${help.emergency.global_mute.subtitle}", "${help.emergency.global_mute.message}", "${help.emergency.global_mute.link}", k.getParser()._Str_23798);
        }

        public function get friendList():IHabboFriendsList
        {
            return this._friendList;
        }

        public function ignoreAndUnfriendReportedUser():void
        {
            var k:RemoveFriendMessageComposer;
            if (this._callForHelpManager.reportedUserId > 0)
            {
                this.sendMessage(new IgnoreUserIdMessageComposer(this._callForHelpManager.reportedUserId));
                if (this._friendList.getFriend(this._callForHelpManager.reportedUserId) != null)
                {
                    k = new RemoveFriendMessageComposer();
                    k.addRemovedFriend(this._callForHelpManager.reportedUserId);
                    this.sendMessage(k);
                }
            }
        }

        private function onUsers(k:IMessageEvent):void
        {
            var _local_4:UserMessageData;
            var _local_2:UsersMessageParser = UsersEvent(k).getParser();
            var _local_3:int;
            while (_local_3 < _local_2.getUserCount())
            {
                _local_4 = _local_2.getUser(_local_3);
                if (((!(_local_4.id == this._Str_6240)) && (_local_4.userType == RoomObjectTypeEnum.HABBO)))
                {
                    this._userRegistry._Str_23385(_local_4.id, _local_4.name, _local_4.figure);
                }
                _local_3++;
            }
        }

        private function onRoomReady(k:IMessageEvent):void
        {
            var _local_2:RoomReadyMessageParser = RoomReadyMessageEvent(k).getParser();
            this._userRegistry._Str_19528(_local_2.roomId, "");
        }

        private function onGuestRoomResult(k:IMessageEvent):void
        {
            var _local_2:GetGuestRoomResultMessageParser = GetGuestRoomResultEvent(k).getParser();
            this._userRegistry._Str_19528(_local_2.data.flatId, _local_2.data.roomName);
        }

        public function get userRegistry():UserRegistry
        {
            return this._userRegistry;
        }

        public function get chatRegistry():ChatRegistry
        {
            return this._chatRegistry;
        }

        public function get instantMessageRegistry():InstantMessageRegistry
        {
            return this._instantMessageRegistry;
        }

        private function onRoomEnter(k:RoomEntryInfoMessageEvent):void
        {
            var _local_2:RoomEntryInfoMessageParser = RoomEntryInfoMessageEvent(k).getParser();
            this._currentRoomId = _local_2.guestRoomId;
        }

        private function onCfhTopics(k:CfhTopicsInitEvent):void
        {
            var _local_2:CfhTopicsInitMessageParser = k.getParser();
            this._callForHelpCategories = _local_2.callForHelpCategories;
        }

        public function get callForHelpCategories():Vector.<CallForHelpCategoryData>
        {
            return this._callForHelpCategories;
        }

        public function get _Str_16486():Boolean
        {
            return getBoolean("guardians.enabled");
        }

        public function get linkPattern():String
        {
            return "help/";
        }

        public function get reportedUserId():int
        {
            return this._callForHelpManager.reportedUserId;
        }

        public function get reportedUserName():String
        {
            return this._callForHelpManager.reportedUserName;
        }

        public function get _Str_3469():int
        {
            return this._callForHelpManager._Str_3469;
        }

        public function get _Str_11455():String
        {
            return this._callForHelpManager._Str_11455;
        }

        public function get _Str_10658():int
        {
            return this._callForHelpManager._Str_10658;
        }

        public function set reportedUserId(k:int):void
        {
            this._callForHelpManager.reportedUserId = k;
        }

        public function set _Str_3469(k:int):void
        {
            this._callForHelpManager._Str_3469 = k;
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array;
            var _local_3:*;
            var _local_4:*;
            if (k == "help/tour")
            {
                this.requestGuide();
            }
            if (k.indexOf("help/report/room/") == 0)
            {
                _local_2 = k.split("/");
                if (_local_2.length >= 5)
                {
                    _local_3 = parseInt(_local_2[3]);
                    _local_4 = unescape(_local_2.splice(4).join("/"));
                    this.reportRoom(_local_3, _local_4, "");
                }
            }
        }

        private function onHabboToolbarEvent(k:HabboToolbarEvent):void
        {
            if (this._welcomeScreenController != null)
            {
                this._welcomeScreenController.onHabboToolbarEvent(k);
            }
            if (this._guideHelpManager != null)
            {
                this._guideHelpManager.onHabboToolbarEvent(k);
            }
        }

        public function get _Str_5721():CallForHelpManager
        {
            return this._callForHelpManager;
        }

        public function toggleNewHelpWindow():void
        {
            this._topicsFlowHelpController._Str_19572();
        }

        public function requestSanctionInfo(k:Boolean):void
        {
            this.sendMessage(new GetCfhStatusMessageComposer(k));
        }

        private function onSanctionStatusEvent(k:SanctionStatusEvent):void
        {
            this._sanctionInfo.openWindow(k);
        }

        public function openCfhFaq():void
        {
            var k:String = context.configuration.getProperty("cfh.faq.url");
            if (!StringUtil.isEmpty(k))
            {
                navigateToURL(new URLRequest(k));
            }
        }

        public function get _Str_21711():GuideHelpManager
        {
            return this._guideHelpManager;
        }
    }
}
