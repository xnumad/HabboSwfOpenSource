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
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4085;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3407;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2929;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsEvent;
    import com.sulake.habbo.communication.messages.incoming.help._Str_11155;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9121;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9074;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_5578;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_7391;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_10695;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_6216;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_12273;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsMessageParser;
    import com.sulake.habbo.communication.messages.parser.help._Str_5731;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.RemoveFriendMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5697;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3548;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5199;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_4537;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhTopicsInitMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_11701;
    import com.sulake.habbo.utils.StringUtil;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import __AS3__.vec.*;

    public class HabboHelp extends Component implements IHabboHelp, ILinkEventTracker 
    {
        public static const _Str_5723:int = 1;
        public static const _Str_15870:int = 2;
        public static const _Str_4315:int = 3;
        public static const _Str_4786:int = 4;
        public static const _Str_15144:int = 6;
        public static const _Str_4459:int = 7;
        public static const _Str_4490:int = 8;
        public static const _Str_7161:int = 9;

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

        public function get _Str_7478():Boolean
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

        public function _Str_18271():void
        {
            this._guideHelpManager._Str_6255(_Str_2849._Str_4268);
        }

        public function _Str_17200(k:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_17200(k, this._currentRoomId);
            }
        }

        public function _Str_21718(k:int, _arg_2:String, _arg_3:String, _arg_4:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_3469 = this._currentRoomId;
                this._callForHelpManager._Str_2662 = k;
                this._callForHelpManager._Str_5842 = _arg_2;
                this._callForHelpManager._Str_10658 = _arg_4;
                this._callForHelpManager._Str_11455 = _arg_3;
                this._topicsFlowHelpController._Str_15173(HabboHelp._Str_7161);
            }
        }

        public function _Str_6694(k:int, _arg_2:int, _arg_3:String):void
        {
            this._callForHelpManager._Str_2662 = k;
            this._topicsFlowHelpController._Str_25197();
        }

        public function _Str_25290(k:int, _arg_2:String):void
        {
            this._callForHelpManager._Str_2662 = k;
            this._callForHelpManager._Str_5842 = _arg_2;
            this._callForHelpManager._Str_3469 = -1;
            this._topicsFlowHelpController._Str_24232();
        }

        public function _Str_19984(k:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_2662 = k;
                this._topicsFlowHelpController._Str_23015();
            }
        }

        public function reportRoom(k:int, _arg_2:String, _arg_3:String):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_3469 = k;
                this._callForHelpManager._Str_16366 = _arg_2;
                this._callForHelpManager._Str_2662 = -1;
                this._callForHelpManager._Str_5842 = "";
                this._topicsFlowHelpController._Str_15173(_Str_4786);
            }
        }

        public function _Str_10138(k:int, _arg_2:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_11420 = k;
                this._callForHelpManager._Str_10392 = _arg_2;
                this._topicsFlowHelpController._Str_15173(HabboHelp._Str_4459);
            }
        }

        public function _Str_12812(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (this._callForHelpManager != null)
            {
                if (_arg_2.length < getInteger("help.cfh.length.minimum", 15))
                {
                    this.windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                    return false;
                }
                this._callForHelpManager._Str_12812(k, _arg_2, _arg_3, _arg_4, _arg_5);
                return true;
            }
            return false;
        }

        public function _Str_14206(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (this._callForHelpManager != null)
            {
                if (_arg_2 == 0)
                {
                    this.windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                    return false;
                }
                this._callForHelpManager._Str_14206(k, _arg_2, _arg_3, _arg_4, _arg_5);
                return true;
            }
            return false;
        }

        public function _Str_11424(k:int, _arg_2:int, _arg_3:int):void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_11420 = k;
                this._callForHelpManager._Str_10392 = _arg_2;
                this._callForHelpManager._Str_16155 = _arg_3;
                this._topicsFlowHelpController._Str_15173(HabboHelp._Str_4490);
            }
        }

        public function _Str_1131():void
        {
            if (this._nameChangeController != null)
            {
                this._nameChangeController._Str_4731();
            }
        }

        public function _Str_22356():void
        {
            if (this._callForHelpManager != null)
            {
                this._callForHelpManager._Str_22391();
            }
        }

        public function _Str_8205(k:String, _arg_2:String, _arg_3:int, _arg_4:String=null):void
        {
            if (((this._welcomeScreenController == null) || (this._welcomeScreenController.disposed)))
            {
                this._welcomeScreenController = new WelcomeScreenController(this);
            }
            this._welcomeScreenController._Str_8205(k, _arg_2, _arg_3, _arg_4);
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

        public function _Str_8723():void
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

        public function _Str_16933():void
        {
            if (((this._habboWayQuizController == null) || (this._habboWayQuizController.disposed)))
            {
                this._habboWayQuizController = new HabboWayQuizController(this);
            }
            this._habboWayQuizController._Str_16933();
        }

        public function _Str_14041():void
        {
            if (((this._habboWayQuizController == null) || (this._habboWayQuizController.disposed)))
            {
                this._habboWayQuizController = new HabboWayQuizController(this);
            }
            this._habboWayQuizController._Str_14041();
        }

        public function _Str_24154():void
        {
            this._guideHelpManager._Str_15702();
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
                "callback":this._Str_3304
            }, {
                "type":HabboToolbarEvent.HTE_GROUP_ROOM_INFO_CLICK,
                "callback":this._Str_3304
            }, {
                "type":HabboToolbarEvent.HTE_RESIZED,
                "callback":this._Str_3304
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
            this.addMessageEvent(new _Str_4085(this._Str_10523));
            this.addMessageEvent(new _Str_3407(this._Str_5963));
            this.addMessageEvent(new _Str_2929(this._Str_24404));
            this.addMessageEvent(new CallForHelpPendingCallsEvent(this._Str_23679));
            this.addMessageEvent(new _Str_11155(this._Str_24610));
            this.addMessageEvent(new _Str_9121(this._Str_24314));
            this.addMessageEvent(new _Str_9074(this._Str_23107));
            this.addMessageEvent(new _Str_2752(this.onCreditBalance));
            this.addMessageEvent(new _Str_5578(this._Str_17604));
            this.addMessageEvent(new _Str_7391(this._Str_22418));
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
                this._Str_19612(true);
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

        public function _Str_4804(name:String):_Str_2784
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var dialog:_Str_2784;
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

        public function _Str_2488(k:IMessageComposer):void
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

        public function get _Str_16063():Boolean
        {
            return this._outsideRoom;
        }

        public function set _Str_16063(k:Boolean):void
        {
            this._outsideRoom = k;
        }

        public function _Str_8128(k:int):void
        {
            this._reportType = k;
            this._Str_2488(new _Str_10695());
        }

        public function _Str_24148(k:int):void
        {
            this._requestType = k;
            this._Str_2488(new _Str_6216());
            this._Str_2488(new _Str_12273());
        }

        private function _Str_23679(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_2:CallForHelpPendingCallsMessageParser = CallForHelpPendingCallsEvent(k).getParser();
            if (((_local_2.count == 0) || ((this._reportType == _Str_7161) && (_local_2.count < 3))))
            {
                this._Str_24430();
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
                this._callForHelpManager._Str_23281(_local_3);
            }
        }

        private function _Str_24610(k:IMessageEvent):void
        {
            this._topicsFlowHelpController._Str_10791(false);
        }

        private function _Str_23107(k:_Str_9074):void
        {
            var _local_2:_Str_5731 = k.getParser();
            switch (_local_2._Str_23632)
            {
                case _Str_5731._Str_17350:
                    this._Str_14807();
                    return;
                case _Str_5731._Str_15134:
                    this._guideHelpManager._Str_17964(_local_2._Str_25474);
                    return;
                default:
                    this._guideHelpManager._Str_22714(_local_2._Str_5961);
            }
        }

        private function _Str_24430():void
        {
            switch (this._reportType)
            {
                case _Str_5723:
                case _Str_4315:
                case _Str_4786:
                case _Str_4459:
                case _Str_4490:
                    this._callForHelpManager._Str_25017(this._reportType);
                    break;
                case _Str_15870:
                    this._guideHelpManager._Str_18954();
                    break;
                case _Str_7161:
                    if (this._reportMessage != null)
                    {
                        this._Str_2488(this._reportMessage);
                        this._reportMessage = null;
                    }
                    break;
            }
            this._reportType = 0;
        }

        private function _Str_24314(k:_Str_9121):void
        {
            this._windowManager.simpleAlert("${help.emergency.global_mute.caption}", "${help.emergency.global_mute.subtitle}", "${help.emergency.global_mute.message}", "${help.emergency.global_mute.link}", k.getParser()._Str_23798);
        }

        public function get friendList():IHabboFriendsList
        {
            return this._friendList;
        }

        public function _Str_19312():void
        {
            var k:RemoveFriendMessageComposer;
            if (this._callForHelpManager._Str_2662 > 0)
            {
                this._Str_2488(new _Str_5697(this._callForHelpManager._Str_2662));
                if (this._friendList.getFriend(this._callForHelpManager._Str_2662) != null)
                {
                    k = new RemoveFriendMessageComposer();
                    k.addRemovedFriend(this._callForHelpManager._Str_2662);
                    this._Str_2488(k);
                }
            }
        }

        private function _Str_10523(k:IMessageEvent):void
        {
            var _local_4:_Str_3548;
            var _local_2:UsersMessageParser = _Str_4085(k).getParser();
            var _local_3:int;
            while (_local_3 < _local_2.getUserCount())
            {
                _local_4 = _local_2._Str_5126(_local_3);
                if (((!(_local_4._Str_2394 == this._Str_6240)) && (_local_4._Str_2908 == RoomObjectTypeEnum.HABBO)))
                {
                    this._userRegistry._Str_23385(_local_4._Str_2394, _local_4.name, _local_4.figure);
                }
                _local_3++;
            }
        }

        private function _Str_5963(k:IMessageEvent):void
        {
            var _local_2:_Str_5199 = _Str_3407(k).getParser();
            this._userRegistry._Str_19528(_local_2.roomId, "");
        }

        private function _Str_24404(k:IMessageEvent):void
        {
            var _local_2:_Str_4537 = _Str_2929(k).getParser();
            this._userRegistry._Str_19528(_local_2.data.flatId, _local_2.data.roomName);
        }

        public function get _Str_17447():UserRegistry
        {
            return this._userRegistry;
        }

        public function get _Str_3531():ChatRegistry
        {
            return this._chatRegistry;
        }

        public function get _Str_3977():InstantMessageRegistry
        {
            return this._instantMessageRegistry;
        }

        private function onCreditBalance(k:_Str_2752):void
        {
            var _local_2:_Str_4522 = _Str_2752(k).getParser();
            this._currentRoomId = _local_2._Str_6550;
        }

        private function _Str_17604(k:_Str_5578):void
        {
            var _local_2:CfhTopicsInitMessageParser = k.getParser();
            this._callForHelpCategories = _local_2._Str_9001;
        }

        public function get _Str_9001():Vector.<CallForHelpCategoryData>
        {
            return this._callForHelpCategories;
        }

        public function get _Str_16486():Boolean
        {
            return getBoolean("guardians.enabled");
        }

        public function get eventUrlPrefix():String
        {
            return "help/";
        }

        public function get _Str_2662():int
        {
            return this._callForHelpManager._Str_2662;
        }

        public function get _Str_5842():String
        {
            return this._callForHelpManager._Str_5842;
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

        public function set _Str_2662(k:int):void
        {
            this._callForHelpManager._Str_2662 = k;
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
                this._Str_18271();
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

        private function _Str_3304(k:HabboToolbarEvent):void
        {
            if (this._welcomeScreenController != null)
            {
                this._welcomeScreenController._Str_3304(k);
            }
            if (this._guideHelpManager != null)
            {
                this._guideHelpManager._Str_3304(k);
            }
        }

        public function get _Str_5721():CallForHelpManager
        {
            return this._callForHelpManager;
        }

        public function _Str_14807():void
        {
            this._topicsFlowHelpController._Str_19572();
        }

        public function _Str_19612(k:Boolean):void
        {
            this._Str_2488(new _Str_11701(k));
        }

        private function _Str_22418(k:_Str_7391):void
        {
            this._sanctionInfo._Str_2826(k);
        }

        public function _Str_19088():void
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
