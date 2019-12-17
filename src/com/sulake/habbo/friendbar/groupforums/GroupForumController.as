package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.notifications.IHabboNotifications;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_3372;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboToolbar;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_9509;
    import com.sulake.habbo.communication.messages.incoming.groupforums.GuildForumThreadsEvent;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_8526;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_8758;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_9446;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_8331;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_9630;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_9518;
    import com.sulake.habbo.communication.messages.incoming.groupforums._Str_8905;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.outgoing.groupforums._Str_9897;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.ModerateMessageMessageComposer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5953;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.GetThreadsMessageComposer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.GetForumsListMessageComposer;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThreadsParser;
    import com.sulake.habbo.communication.messages.outgoing.groupforums._Str_9983;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2814;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_7217;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThread;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateForumSettingsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.PostMessageMessageComposer;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2807;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5956;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5975;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.ModerateThreadMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateThreadMessageComposer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_8101;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.GetThreadMessageComposer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_7149;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.UpdateForumReadMarkerMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.groupforums.GetUnreadForumsCountMessageComposer;

    public class GroupForumController extends Component implements IGroupForumController, ILinkEventTracker 
    {
        public static const _Str_18201:int = 0;
        public static const _Str_17967:int = 1;
        public static const _Str_8757:int = 2;
        public static const _Str_9418:int = -1;

        private var _configurationManager:IHabboConfigurationManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _help:IHabboHelp;
        private var _notifications:IHabboNotifications;
        private var _soundManager:IHabboSoundManager;
        private var _habboTracking:IHabboTracking;
        private var _mainView:GroupForumView;
        private var _composeMessageView:ComposeMessageView;
        private var _forumSettingsView:GroupForumViewController;
        private var _requestedForumsListCode:int = -1;
        private var _requestedGroupID:int = -1;
        private var _forumData:_Str_3372;
        private var _currentThreadID:int;
        private var _lastReadMessageId:int = 0;
        private var _forumsListData:ForumsListData;
        private var _threadsListData:ThreadsListData;
        private var _messagesListData:MessagesListData;
        private var _lastReadMessageIndexByThread:Dictionary;
        private var _goToThreadID:int = -1;
        private var _goToMessageIndex:int;
        private var _lastPostTime:int;
        private var _unreadForumsCount:int = 0;
        private var _unreadForumsCountUpdateTimer:Timer;

        public function GroupForumController(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._lastReadMessageIndexByThread = new Dictionary();
            this._lastPostTime = -(ComposeMessageView._Str_12067);
            super(k, _arg_2, _arg_3);
        }

        public function get _Str_10252():ComposeMessageView
        {
            return this._composeMessageView;
        }

        public function set _Str_10252(k:ComposeMessageView):void
        {
            this._composeMessageView = k;
        }

        public function get _Str_11338():GroupForumViewController
        {
            return this._forumSettingsView;
        }

        public function set _Str_11338(k:GroupForumViewController):void
        {
            this._forumSettingsView = k;
        }

        public function get notifications():IHabboNotifications
        {
            return this._notifications;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get _Str_25668():int
        {
            return this._lastPostTime;
        }

        public function get _Str_9052():int
        {
            return this._unreadForumsCount;
        }

        public function get tracking():IHabboTracking
        {
            return this._habboTracking;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), function (k:IHabboConfigurationManager):void
            {
                _configurationManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _help = k;
            }), new ComponentDependency(new IIDHabboNotifications(), function (k:IHabboNotifications):void
            {
                _notifications = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _habboTracking = k;
            }), new ComponentDependency(new IIDHabboToolbar(), null)]));
        }

        override protected function initComponent():void
        {
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9509(this._Str_22851));
            this._communicationManager.addHabboConnectionMessageEvent(new GuildForumThreadsEvent(this._Str_24478));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_8526(this._Str_25325));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_8758(this._parser8));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9446(this._Str_25777));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_8331(this._Str_25702));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9630(this._Str_24297));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9518(this._Str_22869));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_8905(this._Str_23952));
            context.addLinkEventTracker(this);
            this._Str_22401();
        }

        override public function dispose():void
        {
            if (this._unreadForumsCountUpdateTimer != null)
            {
                this._unreadForumsCountUpdateTimer.stop();
                this._unreadForumsCountUpdateTimer = null;
            }
            super.dispose();
        }

        private function _Str_22401():void
        {
            var k:int = this._configurationManager.getInteger("groupforum.poll.period", (5 * 60));
            this._unreadForumsCountUpdateTimer = new Timer((k * 1000), 0);
            this._unreadForumsCountUpdateTimer.addEventListener(TimerEvent.TIMER, this._Str_21019);
            this._unreadForumsCountUpdateTimer.start();
            this._Str_21019(null);
        }

        public function _Str_13647(k:int):void
        {
            if (!this._communicationManager)
            {
                return;
            }
            this._Str_21628(k);
            this._Str_14770(k, 0);
        }

        public function get eventUrlPrefix():String
        {
            return "groupforum/";
        }

        public function linkReceived(k:String):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (!this._communicationManager)
            {
                return;
            }
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            if (_local_2[1] == "list")
            {
                if (_local_2.length == 3)
                {
                    switch (_local_2[2])
                    {
                        case "active":
                            _local_3 = _Str_18201;
                            break;
                        case "popular":
                            _local_3 = _Str_17967;
                            break;
                        case "my":
                            _local_3 = _Str_8757;
                            break;
                        default:
                            return;
                    }
                    this._Str_12395(_local_3);
                }
            }
            else
            {
                _local_4 = _local_2[1];
                if (_local_4 == 0)
                {
                    return;
                }
                this._forumsListData = null;
                if (_local_2.length == 2)
                {
                    this._Str_13647(_local_4);
                }
                else
                {
                    _local_5 = _local_2[2];
                    _local_6 = 0;
                    if (_local_2.length > 3)
                    {
                        _local_6 = _local_2[3];
                    }
                    this._Str_21628(_local_4);
                    this._communicationManager.connection.send(new _Str_9897(_local_4, _local_5));
                    this._Str_20033(_local_4, _local_5, _local_6);
                }
            }
        }

        public function _Str_12395(k:int, _arg_2:int=0):void
        {
            this._Str_13365();
            this._requestedForumsListCode = k;
            this._requestedGroupID = _Str_9418;
            this._communicationManager.connection.send(new ModerateMessageMessageComposer(k, _arg_2, ThreadsListData._Str_3331));
        }

        private function _Str_22851(k:_Str_9509):void
        {
            var _local_2:_Str_5953 = k.getParser();
            var _local_3:ForumsListData = new ForumsListData(_local_2);
            if (((!(this._forumData == null)) && (this._lastReadMessageId > 0)))
            {
                _local_3._Str_20834(this._forumData, this._lastReadMessageId);
            }
            if (_local_3._Str_5154 == _Str_8757)
            {
                this._Str_7256(_local_3._Str_9052);
            }
            if (this._requestedForumsListCode != _local_3._Str_5154)
            {
                return;
            }
            this._forumsListData = _local_3;
            if (!this._mainView)
            {
                this._mainView = new GroupForumView(this);
            }
            this._mainView._Str_12395(this._forumsListData);
        }

        private function _Str_21628(k:int):void
        {
            this._Str_13365();
            this._requestedForumsListCode = _Str_9418;
            this._requestedGroupID = k;
            this._lastReadMessageId = 0;
            this._communicationManager.connection.send(new GetThreadsMessageComposer(k));
        }

        private function _Str_25702(k:_Str_8331):void
        {
            var _local_3:Map;
            var _local_4:String;
            var _local_2:_Str_3372 = k.getParser()._Str_22345;
            if (this._requestedGroupID != _local_2.groupId)
            {
                return;
            }
            if (!_local_2._Str_22865)
            {
                if (this._mainView != null)
                {
                    this._mainView.dispose();
                }
                this._forumData = null;
                this._requestedGroupID = 0;
                _local_3 = new Map();
                _local_4 = this.localizationManager.getLocalization("groupforum.view.error.operation_read");
                _local_3.add("message", this.localizationManager.getLocalizationWithParams(("groupforum.view.error." + _local_2._Str_24689), "", "operation", _local_4));
                this.notifications._Str_10093("forums.error.access_denied", _local_3);
                return;
            }
            this._forumData = _local_2;
            this._lastReadMessageId = _local_2._Str_12786;
        }

        public function _Str_14770(k:int, _arg_2:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new GetForumsListMessageComposer(k, _arg_2, ThreadsListData._Str_3331));
            }
        }

        private function _Str_24478(k:GuildForumThreadsEvent):void
        {
            var _local_2:GuildForumThreadsParser = k.getParser();
            if (((this._forumData == null) || (!(this._forumData.groupId == _local_2.groupId))))
            {
                return;
            }
            this._threadsListData = new ThreadsListData(this._forumData._Str_18760, _local_2.startIndex, _local_2._Str_8372);
            if (!this._mainView)
            {
                this._mainView = new GroupForumView(this);
            }
            this._mainView._Str_25219(this._forumsListData, this._forumData, this._threadsListData);
        }

        public function _Str_17032(k:int, _arg_2:int, _arg_3:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new _Str_9983(k, _arg_2, _arg_3, ThreadsListData._Str_3331));
            }
        }

        private function _Str_25777(k:_Str_9446):void
        {
            var _local_6:_Str_2814;
            var _local_2:_Str_7217 = k.getParser();
            if ((((this._forumData == null) || (!(this._forumData.groupId == _local_2.groupId))) || (this._threadsListData == null)))
            {
                return;
            }
            this._currentThreadID = _local_2.threadId;
            var _local_3:GuildForumThread = this._threadsListData._Str_6700[this._currentThreadID];
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_2.startIndex;
            var _local_5:int = _local_3.totalMessages;
            this._messagesListData = new MessagesListData(this._currentThreadID, _local_5, _local_4, _local_2.messages);
            if (!this._mainView)
            {
                this._mainView = new GroupForumView(this);
            }
            this._mainView._Str_24648(this._forumsListData, this._forumData, this._threadsListData, this._messagesListData);
            if (_local_2.messages.length > 0)
            {
                _local_6 = _Str_2814(_local_2.messages[(_local_2.messages.length - 1)]);
                if (_local_6)
                {
                    this._Str_20284(_local_6.messageId, _local_6.threadId, _local_6.messageIndex);
                }
            }
        }

        public function _Str_25084(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new UpdateForumSettingsMessageComposer(k, _arg_2, _arg_3, _arg_4, _arg_5));
            }
        }

        public function _Str_23775(k:int, _arg_2:String, _arg_3:String):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new PostMessageMessageComposer(k, 0, _arg_2, _arg_3));
                this._lastPostTime = getTimer();
            }
        }

        private function _Str_22869(k:_Str_9518):void
        {
            var _local_3:_Str_2807;
            var _local_2:_Str_5956 = _Str_5956(k.getParser());
            if (this._composeMessageView)
            {
                this._composeMessageView.dispose();
            }
            if (((!(this._forumData == null)) && (this._forumData.groupId == _local_2.groupId)))
            {
                this._Str_20284(_local_2.thread._Str_10610, _local_2.thread.threadId, (_local_2.thread.totalMessages - 1));
            }
            if (this._forumsListData != null)
            {
                _local_3 = this._forumsListData._Str_20077(_local_2.groupId);
                if (_local_3 != null)
                {
                    _local_3._Str_23783(_local_2.thread);
                }
            }
            if (this._mainView == null)
            {
                return;
            }
            if (((this._forumData == null) || (!(_local_2.groupId == this._forumData.groupId))))
            {
                return;
            }
            this._Str_14770(this._forumData.groupId, 0);
        }

        public function _Str_24484(k:int, _arg_2:int, _arg_3:String):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new PostMessageMessageComposer(k, _arg_2, "", _arg_3));
                this._lastPostTime = getTimer();
            }
        }

        private function _Str_24297(k:_Str_9630):void
        {
            if (this._composeMessageView)
            {
                this._composeMessageView.dispose();
            }
            if (this._mainView == null)
            {
                return;
            }
            var _local_2:_Str_5975 = _Str_5975(k.getParser());
            if ((((this._forumData == null) || (!(_local_2.groupId == this._forumData.groupId))) || (!(_local_2.threadId == this._currentThreadID))))
            {
                return;
            }
            var _local_3:int = (_local_2.message.messageIndex - (_local_2.message.messageIndex % ThreadsListData._Str_3331));
            this._Str_17032(this._forumData.groupId, this._currentThreadID, _local_3);
        }

        public function _Str_24351(k:_Str_3372, _arg_2:int):void
        {
            var _local_3:int;
            if (this._communicationManager)
            {
                if (k._Str_7246)
                {
                    _local_3 = ForumModerationState._Str_5466;
                }
                if (k._Str_7449)
                {
                    _local_3 = ForumModerationState._Str_4415;
                }
                this._communicationManager.connection.send(new ModerateThreadMessageComposer(k.groupId, _arg_2, _local_3));
            }
        }

        public function _Str_24798(k:_Str_2807, _arg_2:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new ModerateThreadMessageComposer(k.groupId, _arg_2, 1));
            }
        }

        public function _Str_24793(k:_Str_2807, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new UpdateThreadMessageComposer(k.groupId, _arg_2, _arg_3, _arg_4));
            }
        }

        public function _Str_22439(k:_Str_2807, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new UpdateThreadMessageComposer(k.groupId, _arg_2, _arg_3, _arg_4));
            }
        }

        public function _Str_10138(k:_Str_2807, _arg_2:int):void
        {
            if (this._help)
            {
                this._help._Str_10138(k.groupId, _arg_2);
            }
        }

        private function _Str_25325(k:_Str_8526):void
        {
            var _local_2:_Str_8101 = k.getParser();
            if (((this._forumData == null) || (!(this._forumData.groupId == _local_2.groupId))))
            {
                return;
            }
            var _local_3:GuildForumThread = _local_2.thread;
            if (((this._threadsListData) && (this._mainView)))
            {
                if (this._threadsListData._Str_16120(_local_3))
                {
                    this._mainView._Str_16120(_local_3);
                    return;
                }
            }
            this._threadsListData = new ThreadsListData(1, 0, [_local_3]);
        }

        public function _Str_24225(k:_Str_3372, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            if (this._communicationManager)
            {
                _local_4 = ForumModerationState._Str_5466;
                if (k._Str_7449)
                {
                    _local_4 = ForumModerationState._Str_4415;
                }
                this._communicationManager.connection.send(new GetThreadMessageComposer(this._forumData.groupId, _arg_2, _arg_3, _local_4));
            }
        }

        public function _Str_25066(k:_Str_2807, _arg_2:int, _arg_3:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new GetThreadMessageComposer(k.groupId, _arg_2, _arg_3, 1));
            }
        }

        public function _Str_11424(k:_Str_2807, _arg_2:int, _arg_3:int):void
        {
            if (this._help)
            {
                this._help._Str_11424(k.groupId, _arg_2, _arg_3);
            }
        }

        private function _parser8(k:_Str_8758):void
        {
            var _local_6:_Str_2814;
            var _local_2:_Str_7149 = k.getParser();
            if ((((this._forumData == null) || (!(this._forumData.groupId == _local_2.groupId))) || (!(this._currentThreadID == _local_2.threadId))))
            {
                return;
            }
            var _local_3:_Str_2814 = _local_2.message;
            var _local_4:Array = this._messagesListData["messages"];
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = _local_4[_local_5];
                if (_local_6.messageId == _local_3.messageId)
                {
                    _local_4[_local_5] = _local_3;
                    if (this._mainView)
                    {
                        this._mainView._Str_25031(_local_3);
                    }
                    return;
                }
                _local_5++;
            }
        }

        public function _Str_20033(k:int, _arg_2:int, _arg_3:int):void
        {
            this._goToThreadID = _arg_2;
            var _local_4:int = Math.floor((_arg_3 / ThreadsListData._Str_3331));
            this._goToMessageIndex = (_arg_3 % ThreadsListData._Str_3331);
            this._Str_17032(k, _arg_2, (_local_4 * ThreadsListData._Str_3331));
        }

        public function _Str_23450(k:int):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(new _Str_2553(k));
            }
        }

        public function _Str_24639():void
        {
            this._Str_13365();
            this._mainView = null;
            this._forumData = null;
            this._requestedForumsListCode = _Str_9418;
            this._requestedGroupID = _Str_9418;
        }

        public function _Str_13365(k:Boolean=false):void
        {
            var _local_2:UpdateForumReadMarkerMessageComposer;
            if (((this._communicationManager) && (this._forumData)))
            {
                if (((k) || (this._lastReadMessageId > this._forumData._Str_12786)))
                {
                    _local_2 = new UpdateForumReadMarkerMessageComposer();
                    if (k)
                    {
                        _local_2.add(this._forumData.groupId, Math.max(this._forumData._Str_8598, this._lastReadMessageId), (this._lastReadMessageId == 0));
                    }
                    else
                    {
                        _local_2.add(this._forumData.groupId, this._lastReadMessageId, false);
                    }
                    this._communicationManager.connection.send(_local_2);
                }
            }
            this._lastReadMessageId = 0;
            this._lastReadMessageIndexByThread = new Dictionary();
        }

        public function _Str_23963():void
        {
            var k:UpdateForumReadMarkerMessageComposer;
            var _local_2:_Str_2807;
            if (((this._communicationManager) && (this._forumsListData)))
            {
                k = new UpdateForumReadMarkerMessageComposer();
                for each (_local_2 in this._forumsListData.forums)
                {
                    if (_local_2._Str_18237 > 0)
                    {
                        k.add(_local_2.groupId, _local_2._Str_8598, true);
                    }
                }
                if (k.size > 0)
                {
                    this._communicationManager.connection.send(k);
                    this._Str_7256(0);
                }
            }
        }

        public function _Str_16072(k:int):int
        {
            var _local_3:GuildForumThread;
            var _local_2:* = this._lastReadMessageIndexByThread[k];
            if (_local_2 != null)
            {
                return int(_local_2);
            }
            if (this._threadsListData)
            {
                _local_3 = this._threadsListData._Str_6700[k];
                if (_local_3)
                {
                    return (_local_3.totalMessages - _local_3.unreadMessagesCount) - 1;
                }
            }
            return -1;
        }

        public function _Str_20284(k:int, _arg_2:int, _arg_3:int):void
        {
            if (k > this._lastReadMessageId)
            {
                this._lastReadMessageId = k;
                if (this._forumsListData)
                {
                    this._forumsListData._Str_20834(this._forumData, k);
                    if (this._forumsListData._Str_5154 == _Str_8757)
                    {
                        this._Str_7256(this._forumsListData._Str_9052);
                    }
                }
            }
            this._lastReadMessageIndexByThread[_arg_2] = _arg_3;
        }

        public function _Str_20049():int
        {
            return this._goToMessageIndex;
        }

        public function _Str_25071():int
        {
            return this._goToThreadID;
        }

        public function _Str_23416():void
        {
            this._goToThreadID = -1;
            this._goToMessageIndex = -1;
        }

        public function _Str_7256(k:int):void
        {
            if (this._unreadForumsCount == k)
            {
                return;
            }
            if (k > this._unreadForumsCount)
            {
                if (this._soundManager != null)
                {
                }
            }
            this._unreadForumsCount = k;
            events.dispatchEvent(new UnseenForumsCountUpdatedEvent(UnseenForumsCountUpdatedEvent.UNSEEN_FORUMS_COUNT, k));
            if (this._mainView != null)
            {
                this._mainView._Str_7256(k);
            }
        }

        private function _Str_21019(k:TimerEvent):void
        {
            if (this._mainView != null)
            {
                this._communicationManager.connection.send(new ModerateMessageMessageComposer(_Str_8757, 0, ThreadsListData._Str_3331));
            }
            else
            {
                this._communicationManager.connection.send(new GetUnreadForumsCountMessageComposer());
            }
        }

        private function _Str_23952(k:_Str_8905):void
        {
            this._Str_7256(k.getParser()._Str_9052);
        }
    }
}
