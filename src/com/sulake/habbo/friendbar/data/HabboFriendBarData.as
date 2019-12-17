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
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4035;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_5641;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_8800;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4696;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3873;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.GameInviteMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_5567;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4841;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_8552;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4851;
    import com.sulake.habbo.friendlist.events._Str_2948;
    import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_7285;
    import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_4348;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.friendbar.events.NewMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_11815;
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.habbo.messenger.events.ActiveConversationEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_4925;
    import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3742;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6189;
    import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_5791;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameInviteMessageParser;
    import com.sulake.habbo.gamecenter.GameConfigurations;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_7819;
    import com.sulake.habbo.friendbar.events.NotificationEvent;

    public class HabboFriendBarData extends Component implements IHabboFriendBarData 
    {
        private static const _Str_6664:Boolean = false;
        private static const _Str_12913:Boolean = false;
        private static const NAVIGATION:String = "Navigation";
        private static const FRIEND_BAR:String = "Friend Bar";
        private static const GO_FRIENDBAR:String = "go.friendbar";
        private static const CHAT_BTN_CLICK:String = "chat_btn_click";
        private static const FIND_FRIENDS_BTN_CLICK:String = "find_friends_btn_click";
		
        public static const PLAY_SNOWSTORM_TAB_CLICK:String = "play_snowstorm_tab_click";
        public static const PLAY_SNOWSTORM_BTN_CLICK:String = "play_snowstorm_btn_click";
		
        private static const TOOLBAR:String = "Toolbar";
        private static const OPEN:String = "open";
        private static const CLOSE:String = "close";
        private static const FRIENDLIST:String = "FRIENDLIST";
        private static const MESSENGER:String = "MESSENGER";

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
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_4035(this._Str_4132));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_5641(this._Str_22480));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_8800(this._Str_24044));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_4696(this._Str_10457));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_3873(this._Str_5276));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new GameInviteMessageEvent(this._Str_25411));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_5567(this._Str_24730));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_4841(this._Str_16886));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_8552(this._Str_15197));
            this._habboCommunicationManager.addHabboConnectionMessageEvent(new _Str_4851(this._Str_18650));
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

        public function get _Str_7830():int
        {
            return this._friendEntityList.length;
        }

        public function _Str_17238(k:int):IFriendEntity
        {
            return this._friendEntityList[k];
        }

        public function _Str_19609(k:int):IFriendEntity
        {
            return this._friendMappedByID.getValue(k);
        }

        public function _Str_25174(k:String):IFriendEntity
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

        public function _Str_24339(k:IFriendEntity, _arg_2:int):void
        {
            var _local_3:int = this._friendEntityList.indexOf(k);
            if (((_local_3 > -1) && (!(_local_3 == _arg_2))))
            {
                this._friendEntityList.splice(_local_3, 1);
                this._friendEntityList.splice(_arg_2, 0, k);
                events.dispatchEvent(new FriendBarUpdateEvent());
            }
        }

        public function get _Str_10570():int
        {
            return (this._friendRequests) ? this._friendRequests.length : 0;
        }

        public function _Str_21160(k:int):IFriendRequest
        {
            return (this._friendRequests) ? this._friendRequests[k] : null;
        }

        public function _Str_23651(k:int):IFriendRequest
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

        public function _Str_23043(k:String):IFriendRequest
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

        public function _Str_16405():Array
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
                    this._habboCommunicationManager.connection.send(new _Str_2553(k));
                }
                else
                {
                    this._habboCommunicationManager.connection.send(new _Str_2863(Math.abs(k), true));
                }
            }
        }

        public function _Str_19230(k:String):void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new _Str_7285(k));
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
                this._habboCommunicationManager.connection.send(new _Str_4348(k));
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(NAVIGATION, FRIEND_BAR, GO_FRIENDBAR));
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
                    this._habboCommunicationManager.connection.send(new EventLogMessageComposer(NAVIGATION, FRIEND_BAR, CHAT_BTN_CLICK));
                }
            }
        }

        public function findNewFriends():void
        {
            if (this._habboCommunicationManager)
            {
                this._habboCommunicationManager.connection.send(new _Str_11815());
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(NAVIGATION, FRIEND_BAR, FIND_FRIENDS_BTN_CLICK));
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
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(NAVIGATION, FRIEND_BAR, k, _arg_2, this._Str_7830));
            }
        }

        public function _Str_21870():void
        {
            if (this._habboFriendListComponent._Str_19440() != _Str_2777._Str_5722)
            {
                this._habboFriendListComponent._Str_22200();
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
                this._habboCommunicationManager.connection.send(new EventLogMessageComposer(NAVIGATION, FRIEND_BAR, k, _arg_2, this._Str_7830));
            }
        }

        public function _Str_18959():void
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
                            this._habboFriendListComponent._Str_19682();
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
                        this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TOOLBAR, FRIENDLIST, ((this._habboFriendListComponent.isOpen()) ? OPEN : CLOSE)));
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
                        this._habboCommunicationManager.connection.send(new EventLogMessageComposer(TOOLBAR, MESSENGER, ((this._habboMessengerComponent.isOpen()) ? OPEN : CLOSE)));
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

        private function _Str_5276(k:IMessageEvent):void
        {
            this._Str_25150(_Str_3873(k).getParser()._Str_16756);
        }

        private function _Str_4132(k:IMessageEvent):void
        {
            var _local_3:FriendEntity;
            var _local_4:FriendParser;
            var _local_8:int;
            var _local_2:_Str_4925 = _Str_4035(k).getParser();
            var _local_5:Array = _local_2._Str_12515;
            var _local_6:Array = _local_2._Str_20668;
            var _local_7:Array = _local_2._Str_14430;
            for each (_local_8 in _local_5)
            {
                _local_3 = this._friendMappedByID.getValue(_local_8);
                if (_local_3)
                {
                    this._friendMappedByID.remove(_local_8);
                    this._friendEntityList.splice(this._friendEntityList.indexOf(_local_3), 1);
                    this._habboMessengerComponent._Str_20291(_local_8);
                }
            }
            for each (_local_4 in _local_6)
            {
                _local_3 = this._friendMappedByID.getValue(_local_4.id);
                if (_local_3)
                {
                    if (((_local_4.online) || (_Str_6664)))
                    {
                        _local_3.name = _local_4.name;
                        _local_3.realName = _local_4.realName;
                        _local_3.motto = _local_4.motto;
                        _local_3.gender = _local_4.gender;
                        _local_3.online = _local_4.online;
                        _local_3.allowFollow = _local_4._Str_4501;
                        _local_3.figure = _local_4.figure;
                        _local_3._Str_2712 = _local_4._Str_2712;
                        _local_3._Str_5261 = _local_4._Str_5261;
                    }
                    else
                    {
                        this._friendMappedByID.remove(_local_4.id);
                        this._friendEntityList.splice(this._friendEntityList.indexOf(_local_3), 1);
                    }
                }
                else
                {
                    if (((_local_4.online) || (_Str_6664)))
                    {
                        _local_3 = new FriendEntity(_local_4.id, _local_4.name, _local_4.realName, _local_4.motto, _local_4.gender, _local_4.online, _local_4._Str_4501, _local_4.figure, _local_4._Str_2712, _local_4._Str_5261);
                        this._friendEntityList.splice(0, 0, _local_3);
                        this._friendMappedByID.add(_local_3.id, _local_3);
                    }
                }
            }
            for each (_local_4 in _local_7)
            {
                if (((_local_4.online) || (_Str_6664)))
                {
                    if (this._friendMappedByID.getValue(_local_4.id) == null)
                    {
                        _local_3 = new FriendEntity(_local_4.id, _local_4.name, _local_4.realName, _local_4.motto, _local_4.gender, _local_4.online, _local_4._Str_4501, _local_4.figure, _local_4._Str_2712, _local_4._Str_5261);
                        this._friendEntityList.push(_local_3);
                        this._friendMappedByID.add(_local_3.id, _local_3);
                    }
                }
                this._Str_15774(_local_4.id);
            }
            if (((_local_7.length > 0) || (_local_6.length > 0)))
            {
                this._friendEntityList = ((_Str_6664) ? this._Str_19624(this._friendEntityList) : this._Str_21818(this._friendEntityList));
            }
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function _Str_24044(k:_Str_8800):void
        {
            events.dispatchEvent(new FindFriendsNotificationEvent(k.success));
        }

        private function _Str_16886(k:_Str_4841):void
        {
            var _local_2:_Str_3742;
            if (this._Str_19444)
            {
                _local_2 = k.getParser().req;
                this._friendRequests.push(new FriendRequest(_local_2.requestId, _local_2.requesterName, _local_2.figureString));
                events.dispatchEvent(new FriendRequestUpdateEvent());
            }
        }

        private function _Str_22480(k:_Str_5641):void
        {
            var _local_2:Array;
            var _local_3:_Str_3742;
            if (this._Str_19444)
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

        private function _Str_18650(k:_Str_4851):void
        {
            var _local_2:_Str_6189 = k.getParser();
            this._lastMessageSenderId = _local_2.senderId;
            var _local_3:Boolean = true;
            if (this._habboMessengerComponent)
            {
                if (this._habboMessengerComponent.isOpen())
                {
                    _local_3 = false;
                }
            }
            if (this._habboFriendListComponent._Str_7577)
            {
                events.dispatchEvent(new NewMessageEvent(_local_3, this._lastMessageSenderId));
            }
            if (_local_3)
            {
                this._Str_14341(String(this._lastMessageSenderId), FriendNotification._Str_6485, null, false, false);
            }
        }

        private function _Str_24647(k:ActiveConversationEvent):void
        {
            events.dispatchEvent(new ActiveConversationsCountEvent(k._Str_18689));
        }

        private function _Str_10457(k:_Str_4696):void
        {
            var _local_2:_Str_5791 = k.getParser();
            this._lastMessageSenderId = _local_2.senderId;
            if (((this._habboMessengerComponent) && (!(this._habboMessengerComponent.isOpen()))))
            {
                events.dispatchEvent(new NewMessageEvent(true, this._lastMessageSenderId));
                this._Str_14341(String(this._lastMessageSenderId), FriendNotification._Str_6485, null, true, false);
            }
        }

        private function _Str_25411(k:GameInviteMessageEvent):void
        {
            var _local_2:GameInviteMessageParser = k.getParser();
            var _local_3:String = GameConfigurations.getNameId(_local_2.gameTypeId);
            if (_local_3)
            {
                this._Str_14341(String(_local_2.inviterId), FriendNotification._Str_6669, _local_3, false, true);
            }
        }

        private function _Str_15197(k:_Str_8552):void
        {
            var _local_2:_Str_7819 = k.getParser();
            var _local_3:* = (!(_local_2._Str_3293 == FriendNotification._Str_5815));
            var _local_4:* = (!(_local_2._Str_3293 == FriendNotification._Str_9572));
            var _local_5:* = (!(_local_2._Str_3293 == FriendNotification._Str_5815));
            this._Str_14341(_local_2._Str_3251, _local_2._Str_3293, _local_2.message, _local_3, _local_4, _local_5);
        }

        private function _Str_14341(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=true):void
        {
            var _local_7:IFriendEntity;
            var _local_8:FriendNotification;
            var _local_9:Vector.<IFriendNotification>;
            if (this._Str_22383)
            {
                _local_7 = this._Str_19609(parseInt(k));
                if (_local_7)
                {
                    _local_9 = _local_7.notifications;
                    for each (_local_8 in _local_9)
                    {
                        if (_local_8._Str_3293 == _arg_2)
                        {
                            _local_8.message = _arg_3;
                            _local_8._Str_6239 = _arg_4;
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
                        this._Str_24339(_local_7, 0);
                    }
                    if (_local_7.logEventId < 0)
                    {
                        _local_7.logEventId = _local_7._Str_20577();
                    }
                    if (this._tracking)
                    {
                        this._tracking.trackEventLog("FriendBar", FriendNotification._Str_23838(_arg_2), "notified", "", ((_local_7.logEventId > 0) ? _local_7.logEventId : 0));
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
                if (((_local_2.online) || (_Str_6664)))
                {
                    _local_3 = new FriendEntity(_local_2.id, _local_2.name, _local_2.realName, _local_2.motto, _local_2.gender, _local_2.online, _local_2._Str_4501, _local_2.figure, _local_2._Str_2712, _local_2._Str_5261);
                    this._friendEntityList.push(_local_3);
                    this._friendMappedByID.add(_local_3.id, _local_3);
                }
            }
            this._friendEntityList = ((_Str_6664) ? this._Str_19624(this._friendEntityList) : this._Str_21818(this._friendEntityList));
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function _Str_21818(k:Array):Array
        {
            if (_Str_12913)
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
            if (_Str_12913)
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

        public function get _Str_22383():Boolean
        {
            return getBoolean("friendbar.notifications.enabled");
        }

        public function get _Str_19444():Boolean
        {
            return getBoolean("friendbar.requests.enabled");
        }
    }
}
