package com.sulake.habbo.friendbar.data
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDHabboTracking;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestsEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FindFriendsProcessResultEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.GameInviteMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewFriendRequestEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
    import com.sulake.habbo.friendlist.events._Str_2948;
    import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupDetailsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileByNameMessageComposer;
    import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.VisitUserMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.friendbar.events.NewMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.FindNewFriendsMessageComposer;
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.habbo.messenger.events.ActiveConversationEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;
    import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;
    import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameInviteMessageParser;
    import com.sulake.habbo.gamecenter.GameConfigurations;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser;
    import com.sulake.habbo.friendbar.events.NotificationEvent;

    public class HabboFriendBarData extends Component implements IHabboFriendBarData 
    {
        private static const SHOW_OFFLINE_FRIENDS:Boolean = false;
        private static const SORT_ALPHABETICALLY:Boolean = false;
        private static const TRACKING_EVENT_CATEGORY:String = "Navigation";
        private static const TRACKING_EVENT_TYPE:String = "Friend Bar";
        private static const TRACKING_EVENT_ACTION_VISIT:String = "go.friendbar";
        private static const TRACKING_EVENT_ACTION_CHAT:String = "chat_btn_click";
        private static const TRACKING_EVENT_ACTION_FIND_FRIENDS:String = "find_friends_btn_click";
		
        public static const PLAY_SNOWSTORM_TAB_CLICK:String = "play_snowstorm_tab_click";
        public static const PLAY_SNOWSTORM_BTN_CLICK:String = "play_snowstorm_btn_click";
		
        private static const LEGACY_TRACKING_EVENT_CATEGORY:String = "Toolbar";
        private static const LEGACY_TRACKING_EVENT_ACTION_OPEN:String = "open";
        private static const LEGACY_TRACKING_EVENT_ACTION_CLOSE:String = "close";
        private static const LEGACY_TRACKING_EVENT_TYPE_FRIENDLIST:String = "FRIENDLIST";
        private static const LEGACY_TRACKING_EVENT_TYPE_MESSENGER:String = "MESSENGER";

        private var _habboCommunicationManager:IHabboCommunicationManager;
        private var _habboFriendListComponent:IHabboFriendsList;
        private var _habboMessengerComponent:IHabboMessenger;
        private var _tracking:IHabboTracking;
        private var _friendEntityList:Array;
        private var _friendMappedByID:Map;
        private var _friendRequests:Array;
        private var _lastMessageSenderId:int;

        public function HabboFriendBarData(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._friendEntityList = [];
            this._friendMappedByID = new Map();
            this._friendRequests = [];
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _habboCommunicationManager = k;
            }), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _habboFriendListComponent = k;
            }), new ComponentDependency(new IIDHabboMessenger(), function (k:IHabboMessenger):void
            {
                _habboMessengerComponent = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new FriendRequestsEvent(this._Str_22480));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new FindFriendsProcessResultEvent(this._Str_24044));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new RoomInviteEvent(this.onRoomInvite));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new FriendListFragmentMessageEvent(this.onFriendsListFragment));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new GameInviteMessageEvent(this.onGameInvite));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new MessengerInitEvent(this._Str_24730));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new NewFriendRequestEvent(this._Str_16886));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new FriendNotificationEvent(this.onFriendNotification));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new NewConsoleMessageEvent(this.onNewConsoleMessage));
            this._habboFriendListComponent.events.addEventListener(_Str_2948.FRE_ACCEPTED, this._Str_14893);
            this._habboFriendListComponent.events.addEventListener(_Str_2948.FRE_DECLINED, this._Str_14893);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (((!(this._habboFriendListComponent == null)) && (!(this._habboFriendListComponent.disposed))))
                {
                    this._habboFriendListComponent.events.removeEventListener(_Str_2948.FRE_ACCEPTED, this._Str_14893);
                    this._habboFriendListComponent.events.removeEventListener(_Str_2948.FRE_DECLINED, this._Str_14893);
                }
                this._friendEntityList = null;
                this._friendMappedByID.dispose();
                this._friendMappedByID = null;
                this._friendRequests = null;
                super.dispose();
            }
        }

        public function get numFriends():int
        {
            return this._friendEntityList.length;
        }

        public function getFriendAt(k:int):IFriendEntity
        {
            return this._friendEntityList[k];
        }

        public function getFriendByID(k:int):IFriendEntity
        {
            return this._friendMappedByID.getValue(k);
        }

        public function getFriendByName(k:String):IFriendEntity
        {
            var _local_2:FriendEntity;
            for each (_local_2 in this._friendEntityList)
            {
                if (_local_2.name == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function setFriendAt(k:IFriendEntity, _arg_2:int):void
        {
            var _local_3:int = this._friendEntityList.indexOf(k);
            if (((_local_3 > -1) && (!(_local_3 == _arg_2))))
            {
                this._friendEntityList.splice(_local_3, 1);
                this._friendEntityList.splice(_arg_2, 0, k);
                events.dispatchEvent(new FriendBarUpdateEvent());
            }
        }

        public function get numFriendRequests():int
        {
            return (this._friendRequests) ? this._friendRequests.length : 0;
        }

        public function getFriendRequestAt(k:int):IFriendRequest
        {
            return (this._friendRequests) ? this._friendRequests[k] : null;
        }

        public function getFriendRequestByID(k:int):IFriendRequest
        {
            var _local_2:IFriendRequest;
            if (this._friendRequests)
            {
                for each (_local_2 in this._friendRequests)
                {
                    if (_local_2.id == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function getFriendRequestByName(k:String):IFriendRequest
        {
            var _local_2:IFriendRequest;
            if (this._friendRequests)
            {
                for each (_local_2 in this._friendRequests)
                {
                    if (_local_2.name == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function getFriendRequestList():Array
        {
            return this._friendRequests;
        }

        public function acceptFriendRequest(k:int):void
        {
            this._Str_15774(k);
            if (this._habboFriendListComponent)
            {
                if (!this._habboFriendListComponent.disposed)
                {
                    this._habboFriendListComponent.acceptFriendRequest(k);
                }
            }
        }

        public function showProfile(k:int):void
        {
            if (this._habboCommunicationManager)
            {
                if (k > 0)
                {
                    this._habboCommunicationManager.connection.send(new GetExtendedProfileMessageComposer(k));
                }
                else
                {
                    this._habboCommunicationManager.connection.send(new GetHabboGroupDetailsMessageComposer(Math.abs(k), true));
                }
            }
        }

        public function showProfileByName(k:String):void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new GetExtendedProfileByNameMessageComposer(k));
            }
        }

        public function acceptAllFriendRequests():void
        {
            this._friendRequests = [];
            this._habboFriendListComponent.acceptAllFriendRequests();
            events.dispatchEvent(new FriendRequestUpdateEvent());
        }

        public function declineFriendRequest(k:int):void
        {
            this._Str_15774(k);
            if (this._habboFriendListComponent)
            {
                if (!this._habboFriendListComponent.disposed)
                {
                    this._habboFriendListComponent.declineFriendRequest(k);
                }
            }
        }

        public function declineAllFriendRequests():void
        {
            this._friendRequests = [];
            this._habboFriendListComponent.declineAllFriendRequests();
            events.dispatchEvent(new FriendRequestUpdateEvent());
        }

        private function _Str_15774(k:int):void
        {
            var _local_2:FriendRequest;
            if (this._friendRequests)
            {
                for each (_local_2 in this._friendRequests)
                {
                    if (_local_2.id == k)
                    {
                        this._friendRequests.splice(this._friendRequests.indexOf(_local_2), 1);
                        events.dispatchEvent(new FriendRequestUpdateEvent());
                        return;
                    }
                }
            }
        }

        public function followToRoom(k:int):void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new VisitUserMessageComposer(k));
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TRACKING_EVENT_CATEGORY, TRACKING_EVENT_TYPE, TRACKING_EVENT_ACTION_VISIT));
            }
        }

        public function startConversation(k:int):void
        {
            if (this._habboMessengerComponent)
            {
                this._habboMessengerComponent.startConversation(k);
                events.dispatchEvent(new NewMessageEvent(false, k));
                if (this._habboCommunicationManager)
                {
                    this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TRACKING_EVENT_CATEGORY, TRACKING_EVENT_TYPE, TRACKING_EVENT_ACTION_CHAT));
                }
            }
        }

        public function findNewFriends():void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new FindNewFriendsMessageComposer());
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TRACKING_EVENT_CATEGORY, TRACKING_EVENT_TYPE, TRACKING_EVENT_ACTION_FIND_FRIENDS));
            }
        }
		
		public function sendGameTabTracking(k:String):void
        {
            this.gameTabEvent(PLAY_SNOWSTORM_TAB_CLICK, k);
        }

        public function sendGameButtonTracking(k:String):void
        {
            this.gameTabEvent(PLAY_SNOWSTORM_BTN_CLICK, k);
        }
		
		private function gameTabEvent(k:String, _arg_2:String):void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TRACKING_EVENT_CATEGORY, TRACKING_EVENT_TYPE, k, _arg_2, this.numFriends));
            }
        }

        public function openUserTextSearch():void
        {
            if (this._habboFriendListComponent.currentTabId() != _Str_2777._Str_5722)
            {
                this._habboFriendListComponent.openFriendSearch();
            }
            else
            {
                this._habboFriendListComponent.close();
            }
        }

        private function _Str_26269(k:String, _arg_2:String):void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TRACKING_EVENT_CATEGORY, TRACKING_EVENT_TYPE, k, _arg_2, this.numFriends));
            }
        }

        public function toggleFriendList():void
        {
            var _local_1:IWindowContainer;
            if (this._habboFriendListComponent)
            {
                if (!this._habboFriendListComponent.disposed)
                {
                    if (!this._habboFriendListComponent.isOpen())
                    {
                        if (this._friendRequests.length > 0)
                        {
                            this._habboFriendListComponent.openFriendRequests();
                        }
                        else
                        {
                            this._habboFriendListComponent.openFriendList();
                        }
                    }
                    else
                    {
                        _local_1 = this._habboFriendListComponent.mainWindow;
                        if (((!(_local_1 == null)) && (_Str_3942._Str_9211(_local_1))))
                        {
                            _local_1.activate();
                            return;
                        }
                        this._habboFriendListComponent.close();
                    }
                    if (this._habboCommunicationManager)
                    {
                        this._habboCommunicationManager.connection.send(new EventLogMessageComposer(LEGACY_TRACKING_EVENT_CATEGORY, LEGACY_TRACKING_EVENT_TYPE_FRIENDLIST, ((this._habboFriendListComponent.isOpen()) ? LEGACY_TRACKING_EVENT_ACTION_OPEN : LEGACY_TRACKING_EVENT_ACTION_CLOSE)));
                    }
                }
            }
        }

        public function toggleMessenger():void
        {
            if (this._habboMessengerComponent)
            {
                if (!this._habboMessengerComponent.disposed)
                {
                    this._habboMessengerComponent.toggleMessenger();
                    if (this._habboCommunicationManager)
                    {
                        this._habboCommunicationManager.connection.send(new EventLogMessageComposer(LEGACY_TRACKING_EVENT_CATEGORY, LEGACY_TRACKING_EVENT_TYPE_MESSENGER, ((this._habboMessengerComponent.isOpen()) ? LEGACY_TRACKING_EVENT_ACTION_OPEN : LEGACY_TRACKING_EVENT_ACTION_CLOSE)));
                    }
                }
            }
        }

        private function _Str_24730(k:IMessageEvent):void
        {
            if (this._habboMessengerComponent)
            {
                this._habboMessengerComponent.events.addEventListener(ActiveConversationEvent.ACCE_CHANGED, this._Str_24647);
            }
        }

        private function onFriendsListFragment(k:IMessageEvent):void
        {
            this._Str_25150(FriendListFragmentMessageEvent(k).getParser().friendFragment);
        }

        private function onFriendListUpdate(k:IMessageEvent):void
        {
            var _local_3:FriendEntity;
            var _local_4:FriendParser;
            var _local_8:int;
            var _local_2:FriendListUpdateMessageParser = FriendListUpdateEvent(k).getParser();
            var _local_5:Array = _local_2.removedFriendIds;
            var _local_6:Array = _local_2.updatedFriends;
            var _local_7:Array = _local_2.addedFriends;
            for each (_local_8 in _local_5)
            {
                _local_3 = this._friendMappedByID.getValue(_local_8);
                if (_local_3)
                {
                    this._friendMappedByID.remove(_local_8);
                    this._friendEntityList.splice(this._friendEntityList.indexOf(_local_3), 1);
                    this._habboMessengerComponent.closeConversation(_local_8);
                }
            }
            for each (_local_4 in _local_6)
            {
                _local_3 = this._friendMappedByID.getValue(_local_4.id);
                if (_local_3)
                {
                    if (((_local_4.online) || (SHOW_OFFLINE_FRIENDS)))
                    {
                        _local_3.name = _local_4.name;
                        _local_3.realName = _local_4.realName;
                        _local_3.motto = _local_4.motto;
                        _local_3.gender = _local_4.gender;
                        _local_3.online = _local_4.online;
                        _local_3.allowFollow = _local_4.followingAllowed;
                        _local_3.figure = _local_4.figure;
                        _local_3.categoryId = _local_4.categoryId;
                        _local_3.lastAccess = _local_4.lastAccess;
                    }
                    else
                    {
                        this._friendMappedByID.remove(_local_4.id);
                        this._friendEntityList.splice(this._friendEntityList.indexOf(_local_3), 1);
                    }
                }
                else
                {
                    if (((_local_4.online) || (SHOW_OFFLINE_FRIENDS)))
                    {
                        _local_3 = new FriendEntity(_local_4.id, _local_4.name, _local_4.realName, _local_4.motto, _local_4.gender, _local_4.online, _local_4.followingAllowed, _local_4.figure, _local_4.categoryId, _local_4.lastAccess);
                        this._friendEntityList.splice(0, 0, _local_3);
                        this._friendMappedByID.add(_local_3.id, _local_3);
                    }
                }
            }
            for each (_local_4 in _local_7)
            {
                if (((_local_4.online) || (SHOW_OFFLINE_FRIENDS)))
                {
                    if (this._friendMappedByID.getValue(_local_4.id) == null)
                    {
                        _local_3 = new FriendEntity(_local_4.id, _local_4.name, _local_4.realName, _local_4.motto, _local_4.gender, _local_4.online, _local_4.followingAllowed, _local_4.figure, _local_4.categoryId, _local_4.lastAccess);
                        this._friendEntityList.push(_local_3);
                        this._friendMappedByID.add(_local_3.id, _local_3);
                    }
                }
                this._Str_15774(_local_4.id);
            }
            if (((_local_7.length > 0) || (_local_6.length > 0)))
            {
                this._friendEntityList = ((SHOW_OFFLINE_FRIENDS) ? this._Str_19624(this._friendEntityList) : this._Str_21818(this._friendEntityList));
            }
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function _Str_24044(k:FindFriendsProcessResultEvent):void
        {
            events.dispatchEvent(new FindFriendsNotificationEvent(k.success));
        }

        private function _Str_16886(k:NewFriendRequestEvent):void
        {
            var _local_2:FriendRequestData;
            if (this.showFriendRequests)
            {
                _local_2 = k.getParser().req;
                this._friendRequests.push(new FriendRequest(_local_2.requestId, _local_2.requesterName, _local_2.figureString));
                events.dispatchEvent(new FriendRequestUpdateEvent());
            }
        }

        private function _Str_22480(k:FriendRequestsEvent):void
        {
            var _local_2:Array;
            var _local_3:FriendRequestData;
            if (this.showFriendRequests)
            {
                _local_2 = k.getParser()._Str_17539;
                for each (_local_3 in _local_2)
                {
                    this._friendRequests.push(new FriendRequest(_local_3.requestId, _local_3.requesterName, _local_3.figureString));
                }
                events.dispatchEvent(new FriendRequestUpdateEvent());
            }
        }

        private function _Str_14893(k:_Str_2948):void
        {
            this._Str_15774(k.requestId);
        }

        private function onNewConsoleMessage(k:NewConsoleMessageEvent):void
        {
            var _local_2:NewConsoleMessageMessageParser = k.getParser();
            this._lastMessageSenderId = _local_2.senderId;
            var _local_3:Boolean = true;
            if (this._habboMessengerComponent)
            {
                if (this._habboMessengerComponent.isOpen())
                {
                    _local_3 = false;
                }
            }
            if (this._habboFriendListComponent.hasfriendsListInitialized)
            {
                events.dispatchEvent(new NewMessageEvent(_local_3, this._lastMessageSenderId));
            }
            if (_local_3)
            {
                this.makeNotification(String(this._lastMessageSenderId), FriendNotification.TYPE_MESSENGER, null, false, false);
            }
        }

        private function _Str_24647(k:ActiveConversationEvent):void
        {
            events.dispatchEvent(new ActiveConversationsCountEvent(k._Str_18689));
        }

        private function onRoomInvite(k:RoomInviteEvent):void
        {
            var _local_2:RoomInviteMessageParser = k.getParser();
            this._lastMessageSenderId = _local_2.senderId;
            if (((this._habboMessengerComponent) && (!(this._habboMessengerComponent.isOpen()))))
            {
                events.dispatchEvent(new NewMessageEvent(true, this._lastMessageSenderId));
                this.makeNotification(String(this._lastMessageSenderId), FriendNotification.TYPE_MESSENGER, null, true, false);
            }
        }

        private function onGameInvite(k:GameInviteMessageEvent):void
        {
            var _local_2:GameInviteMessageParser = k.getParser();
            var _local_3:String = GameConfigurations.getNameId(_local_2.gameTypeId);
            if (_local_3)
            {
                this.makeNotification(String(_local_2.inviterId), FriendNotification.TYPE_GAME_INVITE, _local_3, false, true);
            }
        }

        private function onFriendNotification(k:FriendNotificationEvent):void
        {
            var _local_2:FriendNotificationMessageParser = k.getParser();
            var _local_3:* = (!(_local_2.typeCode == FriendNotification.TYPE_PLAYING_GAME));
            var _local_4:* = (!(_local_2.typeCode == FriendNotification.TYPE_FINISHED_GAME));
            var _local_5:* = (!(_local_2.typeCode == FriendNotification.TYPE_PLAYING_GAME));
            this.makeNotification(_local_2.avatarId, _local_2.typeCode, _local_2.message, _local_3, _local_4, _local_5);
        }

        private function makeNotification(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=true):void
        {
            var _local_7:IFriendEntity;
            var _local_8:FriendNotification;
            var _local_9:Vector.<IFriendNotification>;
            if (this.showFriendNotifications)
            {
                _local_7 = this.getFriendByID(parseInt(k));
                if (_local_7)
                {
                    _local_9 = _local_7.notifications;
                    for each (_local_8 in _local_9)
                    {
                        if (_local_8.typeCode == _arg_2)
                        {
                            _local_8.message = _arg_3;
                            _local_8.viewOnce = _arg_4;
                            break;
                        }
                        _local_8 = null;
                    }
                    if (!_local_8)
                    {
                        _local_8 = new FriendNotification(_arg_2, _arg_3, _arg_4);
                        _local_9.push(_local_8);
                    }
                    else
                    {
                        if (!_arg_6)
                        {
                            return;
                        }
                    }
                    events.dispatchEvent(new NotificationEvent(_local_7.id, _local_8));
                    if (_arg_5)
                    {
                        this.setFriendAt(_local_7, 0);
                    }
                    if (_local_7.logEventId < 0)
                    {
                        _local_7.logEventId = _local_7.getNextLogEventId();
                    }
                    if (this._tracking)
                    {
                        this._tracking.trackEventLog("FriendBar", FriendNotification.typeCodeToString(_arg_2), "notified", "", ((_local_7.logEventId > 0) ? _local_7.logEventId : 0));
                    }
                }
            }
        }

        private function _Str_25150(k:Array):void
        {
            var _local_2:FriendParser;
            var _local_3:FriendEntity;
            for each (_local_2 in k)
            {
                if (((_local_2.online) || (SHOW_OFFLINE_FRIENDS)))
                {
                    _local_3 = new FriendEntity(_local_2.id, _local_2.name, _local_2.realName, _local_2.motto, _local_2.gender, _local_2.online, _local_2.followingAllowed, _local_2.figure, _local_2.categoryId, _local_2.lastAccess);
                    this._friendEntityList.push(_local_3);
                    this._friendMappedByID.add(_local_3.id, _local_3);
                }
            }
            this._friendEntityList = ((SHOW_OFFLINE_FRIENDS) ? this._Str_19624(this._friendEntityList) : this._Str_21818(this._friendEntityList));
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function _Str_21818(k:Array):Array
        {
            if (SORT_ALPHABETICALLY)
            {
                k.sortOn("name", [Array.CASEINSENSITIVE]);
            }
            return k;
        }

        private function _Str_19624(k:Array):Array
        {
            var _local_4:FriendEntity;
            var _local_2:Array = [];
            var _local_3:Array = [];
            var _local_5:int = k.length;
            while (_local_5-- > 0)
            {
                _local_4 = k[_local_5];
                if (_local_4.online)
                {
                    _local_2.push(_local_4);
                }
                else
                {
                    _local_3.push(_local_4);
                }
            }
            if (SORT_ALPHABETICALLY)
            {
                _local_2.sortOn("name", [Array.CASEINSENSITIVE]);
                _local_3.sortOn("name", [(Array.CASEINSENSITIVE | Array.DESCENDING)]);
            }
            _local_5 = _local_3.length;
            while (_local_5-- > 0)
            {
                _local_2.push(_local_3.pop());
            }
            return _local_2;
        }

        public function get showFriendNotifications():Boolean
        {
            return getBoolean("friendbar.notifications.enabled");
        }

        public function get showFriendRequests():Boolean
        {
            return getBoolean("friendbar.requests.enabled");
        }
    }
}
