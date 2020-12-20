package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.friendlist.domain.FriendListTabs;
    import com.sulake.habbo.friendlist.domain.FriendCategories;
    import com.sulake.habbo.friendlist.domain._Str_9210;
    import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
    import com.sulake.habbo.notifications.IHabboNotifications;
    import flash.utils.Timer;
    import com.sulake.habbo.friendlist.domain._Str_10966;
    import com.sulake.habbo.friendlist.domain._Str_10395;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDSessionDataManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.MessengerInitMessageComposer;
    import flash.events.TimerEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.utils.Dictionary;
    import com.sulake.habbo.friendlist.domain.Friend;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.RequestFriendMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.quest.FriendRequestQuestCompleteMessageComposer;
    import flash.geom.Point;
    import com.sulake.habbo.friendlist.domain._Str_2740;
    import flash.display.BitmapData;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendsListFragmentMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
    import com.sulake.habbo.friendlist.domain.FriendCategory;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;
    import com.sulake.habbo.friendlist.domain._Str_11887;
    import com.sulake.habbo.friendlist.domain._Str_11703;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FollowFriendFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestsEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewFriendRequestEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptFriendResultEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.GetFriendRequestsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.FriendListUpdateMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendRequestsMessageParser;
    import com.sulake.habbo.friendlist.domain.FriendRequest;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewFriendRequestMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptFriendFailureData;
    import com.sulake.habbo.communication.messages.parser.friendlist.AcceptFriendResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.SetRelationshipStatusMessageComposer;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.incoming.friendlist.*;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.*;
    import com.sulake.habbo.friendlist.domain.*;
    import com.sulake.habbo.communication.messages.parser.friendlist.*;

    public class HabboFriendList extends Component implements IHabboFriendsList, IAvatarImageListener, ILinkEventTracker 
    {
        public static const FACE:String = "face";

        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _messenger:IHabboMessenger;
        private var _localizationManager:IHabboLocalizationManager;
        private var _avatarManager:IAvatarRenderManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _tracking:IHabboTracking;
        private var _Str_19590:_Str_8767;
        private var _tabs:FriendListTabs;
        private var _view:FriendListView;
        private var _Str_16825:_Str_9313;
        private var _avatarId:int;
        internal var _categories:FriendCategories;
        private var _friendRequests:_Str_9210;
        private var _avatarSearchResults:AvatarSearchResults;
        private var _notifications:IHabboNotifications;
        private var _Str_6311:Timer;
        private var _Str_21357:int;
        private var _Str_5982:Array;
        private var _Str_3489:Timer;
        private var _Str_21697:Boolean = false;
        private var _Str_18300:int;

        public function HabboFriendList(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._Str_18300 = -(FriendsView._Str_13372);
            super(k, _arg_2, _arg_3);
            this._categories = new FriendCategories(new _Str_10966(this));
            this._avatarSearchResults = new AvatarSearchResults(new _Str_10395(this));
            this._Str_19590 = new _Str_8767();
            this._Str_5982 = [];
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            }), new ComponentDependency(new IIDHabboMessenger(), function (k:IHabboMessenger):void
            {
                _messenger = k;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboNotifications(), function (k:IHabboNotifications):void
            {
                _notifications = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
            this._communicationManager.addHabboConnectionMessageEvent(new MessengerInitEvent(this.onMessengerInit));
            this._communicationManager.addHabboConnectionMessageEvent(new FriendListFragmentMessageEvent(this.onFriendsListFragment));
            context.addLinkEventTracker(this);
            this.send(new MessengerInitMessageComposer());
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            context.removeLinkEventTracker(this);
            if (this._Str_6311)
            {
                this._Str_6311.stop();
                this._Str_6311.removeEventListener(TimerEvent.TIMER, this._Str_20682);
                this._Str_6311 = null;
            }
            if (this._Str_3489)
            {
                if (this._Str_3489.running)
                {
                    this._Str_3489.stop();
                }
                this._Str_3489.removeEventListener(TimerEvent.TIMER, this._Str_20052);
                this._Str_3489 = null;
            }
            super.dispose();
        }

        public function send(k:IMessageComposer):void
        {
            this._communicationManager.connection.send(k);
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (this._tracking != null)
            {
                this._tracking.trackGoogle(k, _arg_2, _arg_3);
            }
        }

        public function openHabboWebPage(linkAlias:String, params:Dictionary, x:int, y:int):void
        {
            var url:String = getProperty(linkAlias, params);
            var webWindowName:String = "habboMain";
            try
            {
                HabboWebTools.navigateToURL(url, webWindowName);
            }
            catch(e:Error)
            {
                Logger.log(("GOT ERROR: " + e));
            }
            if (this._Str_16825 == null)
            {
                this._Str_16825 = new _Str_9313(this);
            }
            this._Str_16825.show(x, y);
        }

        public function getText(k:String):String
        {
            return this._localizationManager.getLocalization(k);
        }

        public function registerParameter(k:String, _arg_2:String, _arg_3:String):void
        {
            this._localizationManager.registerParameter(k, _arg_2, _arg_3);
        }

        public function _Str_18624():void
        {
            this.registerParameter("friendlist.listfull.text", "mylimit", ("" + this.friendRequests.limit));
            this.registerParameter("friendlist.listfull.text", "clublimit", ("" + this.friendRequests._Str_17940));
            this.simpleAlert("${friendlist.listfull.title}", "${friendlist.listfull.text}");
        }

        public function _Str_23469(k:String):void
        {
            this.registerParameter("friendlist.friendrequestsent.text", "user_name", k);
            this.simpleAlert("${friendlist.friendrequestsent.title}", "${friendlist.friendrequestsent.text}");
        }

        public function getFriend(k:int):IFriend
        {
            if (this._view == null)
            {
                Logger.log("Cannot process getFriend. Friendlist not initialized.");
                return null;
            }
            var _local_2:Friend = this._categories._Str_13534(k);
            return _local_2;
        }

        public function canBeAskedForAFriend(k:int):Boolean
        {
            if (this._view == null)
            {
                Logger.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
                return false;
            }
            return ((this.getFriend(k) == null) && (!(this.searchResults.isRequestFriend(k)))) && (this.categories.getFriendCount(false) < this.friendRequests.limit);
        }

        public function askForAFriend(k:int, _arg_2:String):Boolean
        {
            if (this._view == null)
            {
                Logger.log("Cannot ask for friend. Friendlist not initialized.");
                return false;
            }
            if (this.searchResults.isRequestFriend(k))
            {
                return true;
            }
            if (!this.canBeAskedForAFriend(k))
            {
                return false;
            }
            this.send(new RequestFriendMessageComposer(_arg_2));
            this.searchResults.setFriendRequestSent(k);
            this.send(new FriendRequestQuestCompleteMessageComposer());
            return true;
        }

        public function openFriendList():void
        {
            this._Str_17876(_Str_2777._Str_4113);
        }

        public function openFriendRequests():void
        {
            this._Str_17876(_Str_2777._Str_3798);
        }

        public function openFriendSearch():void
        {
            this._Str_17876(_Str_2777._Str_5722);
            SearchView(this._tabs._Str_4403(_Str_2777._Str_5722)._Str_4621).focus();
        }

        public function close():void
        {
            if (this._view)
            {
                this._view.close();
            }
        }

        public function alignBottomLeftTo(k:Point):void
        {
            if (this._view)
            {
                this._view.alignBottomLeftTo(k);
            }
        }

        public function isOpen():Boolean
        {
            if (this._view)
            {
                return this._view.isOpen();
            }
            return false;
        }

        public function currentTabId():int
        {
            if (((this._view == null) || (!(this._view.isOpen()))))
            {
                return _Str_2777._Str_18955;
            }
            return this._Str_21357;
        }

        private function _Str_17876(k:int):void
        {
            if (this._view == null)
            {
                Logger.log("Cannot open friendlist. Friendlist not initialized.");
                return;
            }
            this._view.openFriendList();
            var _local_2:_Str_2740 = this.tabs._Str_4403(k);
            if (_local_2 != this.tabs._Str_14015())
            {
                this.tabs._Str_16257(_local_2);
                this.view.refresh("openFriendList");
            }
            this._view.mainWindow.activate();
            this._Str_21357 = k;
        }

        public function getFriendCount(k:Boolean, _arg_2:Boolean):int
        {
            if (this._view == null)
            {
                Logger.log("Cannot get friend count. Friendlist not initialized.");
                return 0;
            }
            return this._categories.getFriendCount(k, _arg_2);
        }

        public function getButton(k:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):IBitmapWrapperWindow
        {
            var _local_7:BitmapData = this.getButtonImage(_arg_2);
            var _local_8:IBitmapWrapperWindow = (this._windowManager.createWindow(k, "", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, HabboWindowStyle.NULL, (WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT), new Rectangle(_arg_4, _arg_5, _local_7.width, _local_7.height), _arg_3, _arg_6) as IBitmapWrapperWindow);
            _local_8.bitmap = _local_7;
            return _local_8;
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_2:IAsset = assets.getAssetByName((k + "_xml"));
            var _local_3:XmlAsset = XmlAsset(_local_2);
            return this._windowManager.buildFromXML(XML(_local_3.content));
        }

        public function _Str_21131():Boolean
        {
            return getBoolean("friend_list.persistent_message_status.enabled");
        }

        public function _Str_17617(k:String):BitmapData
        {
            if (this._sessionDataManager)
            {
                return this._sessionDataManager.getGroupBadgeSmallImage(k);
            }
            return null;
        }

        public function getAvatarFaceBitmap(k:String):BitmapData
        {
            var _local_2:Boolean = getBoolean("zoom.enabled");
            var _local_3:IAvatarImage = this._avatarManager.createAvatarImage(k, ((_local_2) ? AvatarScaleType.LARGE : AvatarScaleType.SMALL), null, this);
            if (!_local_3)
            {
                return null;
            }
            var _local_4:BitmapData = _local_3._Str_818(AvatarSetType.HEAD, ((_local_2) ? 0.5 : 1));
            _local_3.dispose();
            return _local_4;
        }

        public function _Str_17007():Boolean
        {
            var k:String = getProperty("client.minimail.embed.enabled");
            return k == "true";
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = (k as UserObjectEvent).getParser();
            this._avatarId = int(_local_2.id);
        }

        private function onFriendsListFragment(k:IMessageEvent):void
        {
            var _local_3:FriendParser;
            var _local_2:FriendsListFragmentMessageParser = (k as FriendListFragmentMessageEvent).getParser();
            for each (_local_3 in _local_2.friendFragment)
            {
                this._Str_5982.push(_local_3);
            }
            if ((_local_2.fragmentNo + 1) >= _local_2.totalFragments)
            {
                this._Str_3489 = new Timer(5000, Math.ceil((this._Str_5982.length / 300)));
                this._Str_3489.addEventListener(TimerEvent.TIMER, this._Str_20052);
                this._Str_3489.start();
            }
        }

        private function _Str_20052(k:TimerEvent):void
        {
            var _local_4:FriendParser;
            var _local_2:int;
            if (this._Str_5982.length > 300)
            {
                _local_2 = (this._Str_5982.length - 300);
            }
            var _local_3:int = (this._Str_5982.length - 1);
            while (_local_3 >= _local_2)
            {
                _local_4 = this._Str_5982[_local_3];
                this._categories._Str_11247(new Friend(_local_4));
                this._Str_5982.splice(_local_3, 1);
                _local_3--;
            }
            if (this._Str_5982.length == 0)
            {
                this._Str_21697 = true;
            }
        }

        private function onMessengerInit(k:IMessageEvent):void
        {
            var _local_3:FriendCategoryData;
            var _local_4:FriendCategory;
            this._view = new FriendListView(this);
            var _local_2:MessengerInitMessageParser = (k as MessengerInitEvent).getParser();
            this._friendRequests = new _Str_9210(new _Str_11887(this), _local_2._Str_22808, _local_2._Str_23653);
            for each (_local_3 in _local_2.categories)
            {
                this._categories._Str_15664(new FriendCategory(_local_3.id, _local_3.name));
            }
            this._categories._Str_15664(new FriendCategory(FriendCategory._Str_15031, this.getText("friendlist.friends")));
            this._categories._Str_15664(new FriendCategory(FriendCategory._Str_7666, this.getText("friendlist.friends.offlinecaption")));
            this._tabs = new FriendListTabs(new _Str_11703(this));
            if (!this._Str_6311)
            {
                this._Str_6311 = new Timer(120000);
                this._Str_6311.addEventListener(TimerEvent.TIMER, this._Str_20682);
                this._Str_6311.start();
            }
            this._Str_22340();
            this._Str_22421();
            if (this._categories.getFriendCount(true, false) == 0)
            {
                _local_4 = this._categories._Str_5067(FriendCategory._Str_7666);
                if (_local_4)
                {
                    _local_4._Str_22255(true);
                }
            }
            Logger.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
        }

        public function _Str_9727(k:String):void
        {
            events.dispatchEvent(new Event(k));
        }

        private function _Str_25996(k:Array):Array
        {
            var _local_4:FriendParser;
            var _local_5:Array;
            var _local_6:String;
            var _local_2:Array = new Array();
            var _local_3:Dictionary = new Dictionary();
            for each (_local_4 in k)
            {
                _local_2.push(_local_4.name.toLowerCase());
                _local_3[_local_4.name.toLowerCase()] = _local_4;
            }
            _local_2.sort();
            _local_5 = new Array();
            for each (_local_6 in _local_2)
            {
                _local_5.push(_local_3[_local_6]);
            }
            return _local_5;
        }

        private function _Str_22421():void
        {
            this._communicationManager.addHabboConnectionMessageEvent(new FollowFriendFailedEvent(this._Str_24032));
            this._communicationManager.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
            this._communicationManager.addHabboConnectionMessageEvent(new FriendRequestsEvent(this._Str_24954));
            this._communicationManager.addHabboConnectionMessageEvent(new NewFriendRequestEvent(this._Str_16886));
            this._communicationManager.addHabboConnectionMessageEvent(new AcceptFriendResultEvent(this._Str_22373));
            this._communicationManager.addHabboConnectionMessageEvent(new MessengerErrorEvent(this._Str_23472));
            this._communicationManager.addHabboConnectionMessageEvent(new HabboSearchResultEvent(this._Str_23021));
            this._communicationManager.addHabboConnectionMessageEvent(new RoomInviteErrorEvent(this._Str_22762));
            this._communicationManager.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
        }

        private function _Str_22340():void
        {
            Logger.log("Sending friend requests request");
            this.send(new GetFriendRequestsMessageComposer());
        }

        protected function _Str_20682(k:Event):void
        {
            Logger.log("Sending update request");
            this.send(new FriendListUpdateMessageComposer());
        }

        private function _Str_24954(k:IMessageEvent):void
        {
            var _local_3:FriendRequestData;
            var _local_2:FriendRequestsMessageParser = (k as FriendRequestsEvent).getParser();
            this._friendRequests._Str_20199(false);
            for each (_local_3 in _local_2._Str_17539)
            {
                this._friendRequests._Str_8472(new FriendRequest(_local_3));
            }
            if (_local_2._Str_17539.length > 0)
            {
                this._tabs._Str_4403(_Str_2777._Str_3798)._Str_9276(true);
            }
            this._view.refresh("friendRequests");
        }

        private function _Str_16886(k:IMessageEvent):void
        {
            Logger.log("Received new friend request");
            var _local_2:NewFriendRequestMessageParser = (k as NewFriendRequestEvent).getParser();
            var _local_3:FriendRequest = new FriendRequest(_local_2.req);
            this._friendRequests._Str_24807(_local_3);
            var _local_4:_Str_2740 = this._tabs._Str_4403(_Str_2777._Str_3798);
            _local_4._Str_9276(true);
            this._view.refresh("newFriendRequest");
        }

        private function _Str_22373(k:IMessageEvent):void
        {
            var _local_3:AcceptFriendFailureData;
            var _local_2:AcceptFriendResultMessageParser = (k as AcceptFriendResultEvent).getParser();
            for each (_local_3 in _local_2._Str_22533)
            {
                this.friendRequests._Str_25626(_local_3.senderId);
                this._Str_20985(_local_3.errorCode);
            }
        }

        private function _Str_23021(k:IMessageEvent):void
        {
            var _local_2:HabboSearchResultMessageParser = (k as HabboSearchResultEvent).getParser();
            this._avatarSearchResults._Str_22668(_local_2.friends, _local_2.others);
            this._view.refresh("search");
        }

        private function _Str_23472(k:IMessageEvent):void
        {
            var _local_2:MessengerErrorMessageParser = (k as MessengerErrorEvent).getParser();
            this._Str_20985(_local_2.errorCode, _local_2._Str_23408);
        }

        private function _Str_20985(k:int, _arg_2:int=0):void
        {
            var _local_3:String = "";
            switch (k)
            {
                case 1:
                    _local_3 = "${friendlist.error.friendlistownlimit}";
                    break;
                case 2:
                    _local_3 = "${friendlist.error.friendlistlimitofrequester}";
                    break;
                case 3:
                    _local_3 = "${friendlist.error.friend_requests_disabled}";
                    break;
                case 4:
                    _local_3 = "${friendlist.error.requestnotfound}";
                    break;
                default:
                    _local_3 = ((("Received messenger error: msg: " + _arg_2) + ", errorCode: ") + k);
            }
            this.simpleAlert("${friendlist.alert.title}", _local_3);
        }

        private function _Str_22762(k:IMessageEvent):void
        {
            var _local_2:RoomInviteErrorMessageParser = (k as RoomInviteErrorEvent).getParser();
            var _local_3:String = ((("Received room invite error: errorCode: " + _local_2.errorCode) + ", recipients: ") + Util.arrayToString(_local_2._Str_25393));
            this.simpleAlert("${friendlist.alert.title}", _local_3);
        }

        private function onFriendListUpdate(k:IMessageEvent):void
        {
            this._categories.onFriendListUpdate(k);
            this._view.refresh("friendListUpdate");
        }

        private function _Str_24032(k:IMessageEvent):void
        {
            var _local_2:FollowFriendFailedMessageParser = (k as FollowFriendFailedEvent).getParser();
            var _local_3:String = this._Str_25719(_local_2.errorCode);
            Logger.log(((("Received follow friend failed: " + _local_2.errorCode) + ", ") + _local_3));
            this.simpleAlert("${friendlist.alert.title}", _local_3);
        }

        public function simpleAlert(k:String, _arg_2:String):void
        {
            this.windowManager.simpleAlert(k, null, _arg_2);
        }

        private function _Str_25719(k:int):String
        {
            if (k == 0)
            {
                return "${friendlist.followerror.notfriend}";
            }
            if (k == 1)
            {
                return "${friendlist.followerror.offline}";
            }
            if (k == 2)
            {
                return "${friendlist.followerror.hotelview}";
            }
            if (k == 3)
            {
                return "${friendlist.followerror.prevented}";
            }
            return "Unknown follow friend error " + k;
        }

        public function _Str_6498(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:String):void
        {
            var _local_5:IWindow = k.getChildByName(_arg_2);
            if (!_arg_3)
            {
                _local_5.visible = false;
            }
            else
            {
                _local_5.visible = true;
                _local_5.caption = _arg_4;
            }
        }

        public function refreshButton(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:IWindow = (k.findChildByName(_arg_2) as IWindow);
            if (!_arg_3)
            {
                _local_6.visible = false;
            }
            else
            {
                this._Str_11416(_local_6, _arg_2, _arg_4, _arg_5);
                _local_6.visible = true;
            }
        }

        public function _Str_25274(k:IWindowContainer, _arg_2:String, _arg_3:int, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:IRegionWindow = IRegionWindow(k.findChildByName(_arg_2));
            var _local_7:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_local_6.findChildByTag("bitmap"));
            var _local_8:String = "relationship_status_none";
            switch (_arg_3)
            {
                case RelationshipStatusEnum._Str_9205:
                    _local_8 = "relationship_status_heart";
                    break;
                case RelationshipStatusEnum._Str_8388:
                    _local_8 = "relationship_status_smile";
                    break;
                case RelationshipStatusEnum._Str_8824:
                    _local_8 = "relationship_status_bobba";
                    break;
            }
            _local_7.assetUri = _local_8;
            _local_7.visible = true;
            _local_6.id = _arg_5;
            _local_6.procedure = _arg_4;
            _local_6.visible = ((_arg_5 > 0) && (getBoolean("relationship.status.enabled")));
        }

        public function _Str_17821(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int):void
        {
            var _local_6:IWindow = k.findChildByName(_arg_2);
            if (!_arg_3)
            {
                _local_6.visible = false;
            }
            else
            {
                _local_6.id = _arg_5;
                _local_6.procedure = _arg_4;
                _local_6.visible = true;
            }
        }

        private function _Str_11416(k:IWindow, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            var _local_5:IBitmapWrapperWindow;
            k.id = _arg_4;
            if ((k is IBitmapWrapperWindow))
            {
                _local_5 = (k as IBitmapWrapperWindow);
            }
            else
            {
                _local_5 = (IWindowContainer(k).findChildByTag("bitmap") as IBitmapWrapperWindow);
            }
            if (_local_5.bitmap != null)
            {
                return;
            }
            _local_5.bitmap = this.getButtonImage(_arg_2);
            _local_5.width = _local_5.bitmap.width;
            _local_5.height = _local_5.bitmap.height;
            k.procedure = _arg_3;
        }

        public function getButtonImage(k:String):BitmapData
        {
            var _local_5:BitmapData;
            var _local_2:IAsset = assets.getAssetByName((k + "_png"));
            var _local_3:BitmapDataAsset = (_local_2 as BitmapDataAsset);
            Logger.log(("GETTING ASSET: " + k));
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            Logger.log(((("GOT ASSET: " + _local_2) + ", ") + _local_4));
            _local_5 = new BitmapData(_local_4.width, _local_4.height, true, 0);
            _local_5.draw(_local_4);
            return _local_5;
        }

        public function get _Str_23875():*
        {
            return this._Str_18300;
        }

        public function resetLastRoomInvitationTime():void
        {
            this._Str_18300 = getTimer();
        }

        public function get hasfriendsListInitialized():Boolean
        {
            return this._Str_21697;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get categories():FriendCategories
        {
            return this._categories;
        }

        public function get friendRequests():_Str_9210
        {
            return this._friendRequests;
        }

        public function get searchResults():AvatarSearchResults
        {
            return this._avatarSearchResults;
        }

        public function get view():FriendListView
        {
            return this._view;
        }

        public function get tabs():FriendListTabs
        {
            return this._tabs;
        }

        public function get _Str_4930():_Str_8767
        {
            return this._Str_19590;
        }

        public function get messenger():IHabboMessenger
        {
            return this._messenger;
        }

        public function get avatarId():int
        {
            return this._avatarId;
        }

        public function get notifications():IHabboNotifications
        {
            return this._notifications;
        }

        public function get tracking():IHabboTracking
        {
            return this._tracking;
        }

        public function get mainWindow():IWindowContainer
        {
            if (this._view == null)
            {
                return null;
            }
            return this._view.mainWindow;
        }

        public function getFriendNames():Array
        {
            if (this._categories == null)
            {
                return [];
            }
            return this._categories.getFriendNames();
        }

        public function acceptFriendRequest(k:int):void
        {
            if (!this._tabs)
            {
                return;
            }
            var _local_2:_Str_2740 = this._tabs._Str_4403(_Str_2777._Str_3798);
            if (!_local_2)
            {
                return;
            }
            var _local_3:_Str_4097 = (_local_2._Str_4621 as _Str_4097);
            if (!_local_3)
            {
                return;
            }
            _local_3._Str_11273(k);
        }

        public function acceptAllFriendRequests():void
        {
            var k:_Str_2740 = this._tabs._Str_4403(_Str_2777._Str_3798);
            if (!k)
            {
                return;
            }
            var _local_2:_Str_4097 = (k._Str_4621 as _Str_4097);
            if (!_local_2)
            {
                return;
            }
            _local_2._Str_17684();
        }

        public function declineFriendRequest(k:int):void
        {
            var _local_2:_Str_2740 = this._tabs._Str_4403(_Str_2777._Str_3798);
            if (!_local_2)
            {
                return;
            }
            var _local_3:_Str_4097 = (_local_2._Str_4621 as _Str_4097);
            if (!_local_3)
            {
                return;
            }
            _local_3._Str_12175(k);
        }

        public function declineAllFriendRequests():void
        {
            var k:_Str_2740 = this._tabs._Str_4403(_Str_2777._Str_3798);
            if (!k)
            {
                return;
            }
            var _local_2:_Str_4097 = (k._Str_4621 as _Str_4097);
            if (!_local_2)
            {
                return;
            }
            _local_2._Str_17225();
        }

        public function setRelationshipStatus(k:int, _arg_2:int):void
        {
            this.send(new SetRelationshipStatusMessageComposer(k, _arg_2));
        }

        public function getRelationshipStatus(k:int):int
        {
            var _local_2:Friend = this._categories._Str_13534(k);
            if (_local_2)
            {
                return _local_2.relationshipStatus;
            }
            return RelationshipStatusEnum.NONE;
        }

        private function onUserRights(k:IMessageEvent):void
        {
            if (((!(this._sessionDataManager)) || (!(this._friendRequests))))
            {
                return;
            }
            var _local_2:int;
            if (this._sessionDataManager.clubLevel >= HabboClubLevelEnum.VIP)
            {
                _local_2 = this._friendRequests._Str_17940;
            }
            else
            {
                if (this._sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB)
                {
                    _local_2 = this._friendRequests._Str_17940;
                }
            }
            if (_local_2 > this._friendRequests.limit)
            {
                this._friendRequests.limit = _local_2;
            }
        }

        public function avatarImageReady(k:String):void
        {
            var _local_3:Friend;
            var _local_4:IWindowContainer;
            var _local_5:IBitmapWrapperWindow;
            var _local_6:BitmapData;
            if (((disposed) || (this._categories == null)))
            {
                return;
            }
            var _local_2:Dictionary = this._categories._Str_22560();
            if (_local_2 == null)
            {
                return;
            }
            for each (_local_3 in _local_2)
            {
                if ((((!(_local_3 == null)) && (!(_local_3.disposed))) && (_local_3.figure == k)))
                {
                    if (_local_3._Str_19416())
                    {
                        _local_3.face = this._Str_17617(_local_3.figure);
                    }
                    else
                    {
                        _local_3.face = this.getAvatarFaceBitmap(_local_3.figure);
                    }
                    if (_local_3.face != null)
                    {
                        _local_4 = _local_3.view;
                        if (_local_4 != null)
                        {
                            _local_5 = (_local_4.getChildByName(FACE) as IBitmapWrapperWindow);
                            if (((!(_local_5 == null)) && (!(_local_5.disposed))))
                            {
                                _local_6 = _local_5.bitmap;
                                if (_local_6 != null)
                                {
                                    _local_6.fillRect(_local_6.rect, 0);
                                    _local_6.copyPixels(_local_3.face, _local_3.face.rect, new Point(0, 0), null, null, true);
                                }
                                _local_5.invalidate();
                            }
                        }
                    }
                }
            }
        }

        public function get linkPattern():String
        {
            return "friendlist/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:int;
            _local_2 = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    this.openFriendList();
                    return;
                case "openchat":
                    if (((_local_2.length < 3) || (this._messenger == null)))
                    {
                        return;
                    }
                    _local_3 = _local_2[2].split(":");
                    if (_local_3.length < 2)
                    {
                        return;
                    }
                    if (int(_local_3[0]) == this._avatarId)
                    {
                        _local_4 = int(_local_3[1]);
                    }
                    else
                    {
                        _local_4 = int(_local_3[0]);
                    }
                    if (((_local_4) && (_local_4 > 0)))
                    {
                        this.openFriendList();
                        this._messenger.startConversation(_local_4);
                    }
                    return;
                default:
                    Logger.log(("FriendList unknown link-type received: " + _local_2[1]));
            }
        }
    }
}
