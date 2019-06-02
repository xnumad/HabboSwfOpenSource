package com.sulake.habbo.friendbar.view
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.friendbar.view.tabs.ITab;
    import com.sulake.habbo.friendbar.view.utils.TextCropper;
    import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
    import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
    import com.sulake.habbo.friendbar.view.tabs.NewOpenMessengerTab;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboFriendBarData;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboGameManager;
    import flash.events.TimerEvent;
    import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
    import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
    import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
    import com.sulake.habbo.friendbar.events.NewMessageEvent;
    import com.sulake.habbo.friendbar.events.NotificationEvent;
    import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.habbo.friendbar.data.IFriendRequest;
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.view.tabs.Tab;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.friendbar.view.tabs.NewFriendRequestTab;
    import com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab;
    import com.sulake.habbo.friendbar.view.tabs.NewFriendEntityTab;
    import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
    import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
    import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.friendbar.data.FriendRequest;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.view.tabs.FriendRequestTab;
    import flash.events.Event;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.habbo.session.UIFlags;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
    import com.sulake.habbo.friendbar.data.FriendNotification;
    import __AS3__.vec.*;

    public class HabboFriendBarView extends AbstractView implements IHabboFriendBarView, IAvatarImageListener, ILinkEventTracker 
    {
        private static const _Str_18952:int = 127;
        private static const _Str_3446:int = 1;
        private static const _Str_17134:Boolean = false;
        private static const _Str_9726:int = 3;
        private static const NEW_BAR_XML:String = "new_bar_xml";
        private static const TOGGLE_XML:String = "toggle_xml";
        private static const BORDER:String = "border";
        private static const LIST:String = "list";
        private static const HEADER:String = "header";
        private static const CANVAS:String = "canvas";
        private static const PIECES:String = "pieces";
        private static const FRIENDTOOLS:String = "friendtools";
        private static const COLLAPSE_LEFT:String = "collapse_left";
        private static const COLLAPSE_RIGHT:String = "collapse_right";
        private static const BUTTON_LEFT:String = "button_left";
        private static const BUTTON_RIGHT:String = "button_right";
        private static const BUTTON_LEFT_PAGE:String = "button_left_page";
        private static const BUTTON_RIGHT_PAGE:String = "button_right_page";
        private static const BUTTON_LEFT_END:String = "button_left_end";
        private static const BUTTON_RIGHT_END:String = "button_right_end";
        private static const BUTTON_CLOSE:String = "button_close";
        private static const BUTTON_OPEN:String = "button_open";
        private static const LINK_FRIENDLIST:String = "link_friendlist";
        private static const ICON_FIND_FRIENDS:String = "icon_find_friends";
        private static const ICON_ALL_FRIENDS:String = "icon_all_friends";
        private static const _Str_6651:int = 150;
        private static const _Str_16889:int = 1;
        private static const _Str_17338:int = 16;

        private var _Str_2780:IHabboFriendBarData;
        private var _gameManager:IHabboGameManager;
        private var _friendsList:IHabboFriendsList;
        private var _toolbar:IHabboToolbar;
        private var _Str_2563:IWindowContainer;
        private var _Str_4452:IWindowContainer;
        private var _Str_3984:IWindowContainer;
        private var _Str_2868:Vector.<ITab>;
        private var _Str_11900:ITab;
        private var _Str_7119:int = -1;
        private var _Str_2748:int = 0;
        private var _Str_15295:TextCropper;
        private var _Str_8151:FriendListIcon;
        private var _Str_9738:MessengerIcon;
        private var _Str_4075:IWindowContainer;
        private var _Str_22151:NewOpenMessengerTab;
        private var _Str_14931:Boolean = true;
        private var _Str_2978:Timer;
        private var _Str_3312:Boolean = false;
        private var _Str_11102:IRegionWindow;
        private var _Str_10857:IRegionWindow;
        private var _Str_21385:Boolean = false;
        private var _Str_5894:IStaticBitmapWrapperWindow;
        private var _Str_2364:Timer;
        private var _Str_21460:Boolean = false;
		private var playSnowstormEnabled:Boolean = false;
		private var snowstormFriendsThreshold:int = 0;

        public function HabboFriendBarView(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
            this._Str_15295 = new TextCropper();
            this._Str_2868 = new Vector.<ITab>();
            this._Str_2868 = new Vector.<ITab>();
        }

        public function setMessengerIconNotify(k:Boolean):void
        {
            if (this._Str_9738)
            {
                this._Str_9738.notify(k);
            }
            if (this._Str_4075)
            {
                this._Str_12109(k);
            }
        }

        public function get _Str_20387():int
        {
            return (this._Str_2563 == null) ? 0 : ((this._Str_3312) ? _Str_6651 : this._Str_2563.width);
        }

        public function _Str_25574(k:Boolean):void
        {
            if (this._Str_8151)
            {
                this._Str_8151.notify(k);
            }
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendsList = k;
            }), new ComponentDependency(new IIDHabboFriendBarData(), function (k:IHabboFriendBarData):void
            {
                _Str_2780 = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }), new ComponentDependency(new IIDHabboGameManager(), function (k:IHabboGameManager):void
            {
                _gameManager = k;
            })]));
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._Str_2364 != null)
                {
                    this._Str_2364.removeEventListener(TimerEvent.TIMER, this.onTimerEvent);
                    this._Str_2364.stop();
                    this._Str_2364 = null;
                }
                if (this._Str_2978)
                {
                    this._Str_2978.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                    this._Str_2978 = null;
                }
                if (this._Str_9738)
                {
                    this._Str_9738.dispose();
                    this._Str_9738 = null;
                }
                if (this._Str_8151)
                {
                    this._Str_8151.dispose();
                    this._Str_8151 = null;
                }
                if (this._Str_3984)
                {
                    this._Str_3984.dispose();
                    this._Str_3984 = null;
                }
                if (this._Str_2563)
                {
                    this._Str_2563.dispose();
                    this._Str_2563 = null;
                }
                if (this._Str_4452)
                {
                    this._Str_4452.dispose();
                    this._Str_4452 = null;
                }
                while (this._Str_2868.length > 0)
                {
                    ITab(this._Str_2868.pop()).dispose();
                }
                while (this._Str_2868.length > 0)
                {
                    ITab(this._Str_2868.pop()).dispose();
                }
                if ((((!(this._Str_2780 == null)) && (!(this._Str_2780.disposed))) && (!(this._Str_2780.events == null))))
                {
                    this._Str_2780.events.removeEventListener(FriendBarUpdateEvent.FBE_UPDATED, this._Str_21453);
                    this._Str_2780.events.removeEventListener(FindFriendsNotificationEvent.FIND_FRIENDS_RESULT, this._Str_19962);
                    this._Str_2780.events.removeEventListener(FriendRequestUpdateEvent.FBE_REQUESTS, this._Str_21633);
                    this._Str_2780.events.removeEventListener(NewMessageEvent.FBE_MESSAGE, this._Str_20447);
                    this._Str_2780.events.removeEventListener(NotificationEvent.FBE_NOTIFICATION_EVENT, this._Str_15197);
                    this._Str_2780.events.removeEventListener(ActiveConversationsCountEvent.AMC_EVENT, this._Str_21657);
                }
                if (_Str_2318)
                {
                    _Str_2318.events.removeEventListener(SessionDataPreferencesEvent.APUE_UPDATED, this._Str_10326);
                }
                if (((!(_Str_2277 == null)) && (!(_Str_2277.disposed))))
                {
                    _Str_2277.getWindowContext(_Str_3446).getDesktopWindow().removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                }
                this._Str_15295.dispose();
                this._Str_15295 = null;
                super.dispose();
            }
        }

        override protected function initComponent():void
        {
            context.addLinkEventTracker(this);
            this._Str_2780.events.addEventListener(FriendBarUpdateEvent.FBE_UPDATED, this._Str_21453);
            this._Str_2780.events.addEventListener(FindFriendsNotificationEvent.FIND_FRIENDS_RESULT, this._Str_19962);
            this._Str_2780.events.addEventListener(FriendRequestUpdateEvent.FBE_REQUESTS, this._Str_21633);
            this._Str_2780.events.addEventListener(NewMessageEvent.FBE_MESSAGE, this._Str_20447);
            this._Str_2780.events.addEventListener(NotificationEvent.FBE_NOTIFICATION_EVENT, this._Str_15197);
            this._Str_2780.events.addEventListener(ActiveConversationsCountEvent.AMC_EVENT, this._Str_21657);
            _Str_2318.events.addEventListener(SessionDataPreferencesEvent.APUE_UPDATED, this._Str_10326);
        }

        public function set visible(k:Boolean):void
        {
            if (this._Str_2563)
            {
                this._Str_2563.visible = k;
                this._Str_2563.activate();
            }
            if (this._Str_3984)
            {
                this._Str_3984.visible = (!(k));
                if (this._Str_2563)
                {
                    this._Str_3984.x = this._Str_2563.x;
                    this._Str_3984.y = this._Str_2563.y;
                    this._Str_3984.activate();
                }
            }
        }

        private function _Str_25736():void
        {
            var k:IWindow = _Str_2277.createWindow("bar_dimmer", "", WindowType.WINDOW_TYPE_BORDER, _Str_3108._Str_9798, ((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(0, 0, this._Str_2563.width, this._Str_2563.height), null, 0);
            k.color = 0;
            k.blend = 0.3;
            this._Str_2563.addChild(k);
            this._Str_2563.invalidate();
            if (this._Str_2978 == null)
            {
                this._Str_2978 = new Timer(RoomEnterEffect.totalRunningTime, 1);
                this._Str_2978.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                this._Str_2978.start();
            }
        }

        private function _Str_5360(k:TimerEvent):void
        {
            this._Str_2978.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
            this._Str_2978 = null;
            var _local_2:IWindow = this._Str_2563.findChildByName("bar_dimmer");
            if (_local_2 != null)
            {
                this._Str_2563.removeChild(_local_2);
                _Str_2277.destroy(_local_2);
            }
        }

        public function get visible():Boolean
        {
            return (this._Str_2563) && (this._Str_2563.visible);
        }

        public function populate():void
        {
            var _local_4:int;
            var _local_11:IFriendRequest;
            var _local_12:IFriendEntity;
            var _local_13:Tab;
            var _local_14:int;
            var _local_15:Tab;
            if (!(!(this._Str_2563 == null)))
            {
                return;
            }
            var k:int = this._Str_7119;
            this.deSelect(false);
            var _local_2:IItemListWindow = (this._Str_2563.findChildByName(LIST) as IItemListWindow);
            if (!(!(_local_2 == null)))
            {
                return;
            }
			
            this.playSnowstormEnabled = true;// configurationManager.getBoolean("friendbar.playSnowStorm.enabled");
            this.snowstormFriendsThreshold = int(configurationManager.getProperty("friendbar.playSnowStorm.friendsThreshold"));
            _local_2.autoArrangeItems = false;
            var _local_3:int = _local_2.numListItems;
            _local_4 = _local_3;
            while (_local_4 > 0)
            {
                _local_2.removeListItemAt((_local_4 - 1));
                _local_4--;
            }
            while (this._Str_2868.length > 0)
            {
                this._Str_2868.pop().recycle();
            }
            this._Str_21482(this._Str_2780._Str_10570);
            var _local_5:int = this._Str_2780._Str_7830;
            var _local_6:int;
            var _local_7:int = this._Str_7488;
            var _local_8:int = ((_local_5 + ((this._Str_14931) ? 1 : 0)) + ((_local_6 > 0) ? 1 : 0));
            var _local_9:int = Math.min(_local_7, _local_8);
            if ((this._Str_2748 + _local_9) > _local_8)
            {
                this._Str_2748 = Math.max(0, (this._Str_2748 - ((this._Str_2748 + _local_9) - _local_8)));
            }
            var _local_10:int = this._Str_2748;
            if (_local_6 > 0)
            {
                if (this._Str_2748 == 0)
                {
                    if (this._Str_2868.length < _local_7)
                    {
                        if (_local_6 == 1)
                        {
                            _local_11 = this._Str_2780._Str_21160(0);
                            _local_13 = NewFriendRequestTab._Str_2363(_local_11);
                            this._Str_2868.push(_local_13);
                            _local_2.addListItem(_local_13.window);
                        }
                        else
                        {
                            if (_local_6 > 1)
                            {
                                _local_13 = FriendRequestsTab._Str_2363(this._Str_2780._Str_16405());
                                this._Str_2868.push(_local_13);
                                _local_2.addListItem(_local_13.window);
                            }
                        }
                    }
                }
                else
                {
                    _local_10--;
                }
            }
            _local_4 = _local_10;
            while (_local_4 < (_local_5 + _local_10))
            {
                if (_local_4 >= _local_5)
                {
                    break;
                }
                if (this._Str_2868.length >= _local_7)
                {
                    break;
                }
                _local_12 = this._Str_2780._Str_17238(_local_4);
                _local_13 = NewFriendEntityTab._Str_2363(_local_12);
                this._Str_2868.push(_local_13);
                _local_2.addListItem(_local_13.window);
                _local_4++;
            }
            if (this._Str_14931)
            {
                _local_14 = this._Str_22580(_local_7, _local_8, _local_5, _local_6);
                _local_8 = ((_local_5 + _local_14) + ((_local_6 > 0) ? 1 : 0));
                while (_local_14-- > 0)
                {
                    _local_15 = AddFriendsTab._Str_2363();
                    _local_2.addListItem(_local_15.window);
                    this._Str_2868.push(_local_15);
                }
            }
            _local_2.autoArrangeItems = true;
            if (k > -1)
            {
                this._Str_24826(k);
            }
            this._Str_20124();
            this._Str_22571(((this._Str_2868.length < _local_8) && (_local_8 > 0)), (!(this._Str_2748 == 0)), ((this._Str_2748 + this._Str_2868.length) < _local_8));
            if (!this._Str_21385)
            {
                this._Str_21385 = true;
                this._Str_6258(false);
                this._Str_6258(true);
            }
        }

        private function _Str_22580(k:int, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            if (this._Str_2868.length >= k)
            {
                return 0;
            }
            if (this._Str_2868.length >= k)
            {
                return 0;
            }
            var _local_5:int = 1;
			var offset:int = ((this._SafeStr_16451(k, (_arg_2 + _local_5), _arg_3)) ? 1 : 0);
            if ((this._Str_2868.length + _local_5) < (_Str_9726) - offset)
            {
                _local_5 = Math.min((k - this._Str_2868.length), (_Str_9726 - this._Str_2868.length) - offset);
            }
            return _local_5;
        }
		
		private function _SafeStr_16451(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            if ((((this.playSnowstormEnabled) && (_arg_2 < k)) && (_arg_3 <= this.snowstormFriendsThreshold)))
            {
                return true;
            }
            return false;
        }

        private function _Str_21564(k:int):FriendEntityTab
        {
            var _local_2:FriendEntityTab;
            var _local_3:int = this._Str_2868.length;
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_2 = (this._Str_2868[_local_4] as FriendEntityTab);
                if (_local_2)
                {
                    if (_local_2.friend.id == k)
                    {
                        return _local_2;
                    }
                }
                _local_4++;
            }
            return null;
        }

        private function _Str_22610():Boolean
        {
            return (this._Str_2563) && (!(this._Str_2563.disposed));
        }

        private function _Str_20691():void
        {
            Tab._Str_2925 = this._Str_2780;
            Tab.GAMES = this._gameManager;
            Tab.FRIENDS = this._friendsList;
            Tab._Str_3553 = this;
            Tab._Str_2787 = assets;
            Tab._Str_3684 = _Str_2277;
            Tab._Str_3840 = _Str_2904;
            Tab._Str_9890 = this._Str_15295;
            Tab._Str_4533 = habboTracking;
            Token._Str_3684 = _Str_2277;
            Token._Str_2787 = assets;
            Token.GAMES = this._gameManager;
            var k:IAsset = assets.getAssetByName(NEW_BAR_XML);
            this._Str_2563 = (_Str_2277.buildFromXML((k.content as XML), _Str_3446) as IWindowContainer);
            this._Str_2563.y = (this._Str_2563.parent.height - (this._Str_2563.height + _Str_16889));
            this._Str_2563.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_MOVE, true);
            this._Str_2563.procedure = this._Str_22794;
            if (_Str_17134)
            {
                k = assets.getAssetByName(TOGGLE_XML);
                this._Str_3984 = (_Str_2277.buildFromXML((k.content as XML), _Str_3446) as IWindowContainer);
                this._Str_3984.x = this._Str_2563.x;
                this._Str_3984.y = this._Str_2563.y;
                this._Str_3984.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_MOVE, true);
                this._Str_3984.visible = false;
                this._Str_3984.procedure = this._Str_24861;
            }
            if (RoomEnterEffect.isRunning())
            {
                this._Str_25736();
            }
            var _local_2:IWindowContainer = (this._Str_2563.findChildByName(FRIENDTOOLS) as IWindowContainer);
            this._Str_5894 = (_local_2.getChildByName("line") as IStaticBitmapWrapperWindow);
            this._Str_4075 = IWindowContainer(_local_2.findChildByName("icon_messenger"));
            if (this._Str_4075)
            {
                this._Str_4075.addEventListener(WindowMouseEvent.CLICK, this._Str_24031);
                this._Str_4075.visible = false;
            }
            var _local_3:IWindowContainer = IWindowContainer(_local_2.findChildByName(ICON_ALL_FRIENDS));
            if (_local_3)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_24062);
            }
            var _local_4:IWindowContainer = IWindowContainer(_local_2.findChildByName(ICON_FIND_FRIENDS));
            if (_local_4)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_22502);
            }
            this._Str_10857 = (this._Str_2563.findChildByName(COLLAPSE_LEFT) as IRegionWindow);
            if (this._Str_10857)
            {
                this._Str_10857.addEventListener(WindowMouseEvent.CLICK, this._Str_20689);
            }
            this._Str_11102 = (this._Str_2563.findChildByName(COLLAPSE_RIGHT) as IRegionWindow);
            if (this._Str_11102)
            {
                this._Str_11102.addEventListener(WindowMouseEvent.CLICK, this._Str_20689);
            }
            _Str_2277.getWindowContext(_Str_3446).getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
            this.populate();
            if (this._Str_21460)
            {
                this._Str_12109(true);
            }
        }

        public function getAvatarFaceBitmap(k:String):BitmapData
        {
            var _local_2:BitmapData;
            var _local_3:IAvatarImage;
            if (_Str_3470)
            {
                _local_3 = _Str_3470.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
                if (_local_3)
                {
                    _local_2 = _local_3._Str_818(AvatarSetType.HEAD);
                    _local_3.dispose();
                }
            }
            return _local_2;
        }

        public function getGroupIconBitmap(k:String):BitmapData
        {
            return _Str_2318.getGroupBadgeImage(k);
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IFriendEntity;
            var _local_7:FriendRequest;
            var _local_8:BitmapData;
            var _local_9:IWindowContainer;
            var _local_10:IItemListWindow;
            var _local_11:IWindowContainer;
            var _local_12:IBitmapWrapperWindow;
            var _local_13:Tab;
            var _local_3:IItemListWindow = (this._Str_2563.findChildByName(LIST) as IItemListWindow);
            var _local_4:int = this._Str_2780._Str_7830;
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_2 = this._Str_2780._Str_17238(_local_5);
                if (_local_2.figure == k)
                {
                    _local_8 = null;
                    if (_local_2.id > 0)
                    {
                        _local_8 = this.getAvatarFaceBitmap(_local_2.figure);
                    }
                    else
                    {
                        _local_8 = this.getGroupIconBitmap(_local_2.figure);
                    }
                    if (_local_8)
                    {
                        _local_9 = (_local_3.getListItemByID(_local_2.id) as IWindowContainer);
                        if (_local_9)
                        {
                            _local_10 = (_local_9.getChildByName(PIECES) as IItemListWindow);
                            if (_local_10)
                            {
                                _local_11 = IWindowContainer(_local_10.getListItemByName(HEADER));
                                if (_local_11)
                                {
                                    _local_12 = (_local_11.findChildByName(CANVAS) as IBitmapWrapperWindow);
                                    _local_12.bitmap = _local_8;
                                    _local_12.width = _local_8.width;
                                    _local_12.height = _local_8.height;
                                }
                            }
                        }
                    }
                    return;
                }
                _local_5++;
            }
            var _local_6:Array = this._Str_2780._Str_16405();
            for each (_local_7 in _local_6)
            {
                if (_local_7.figure == k)
                {
                    for each (_local_13 in this._Str_2868)
                    {
                        if ((_local_13 is FriendRequestTab))
                        {
                            FriendRequestTab(_local_13)._Str_840(_local_7, this.getAvatarFaceBitmap(k));
                            return;
                        }
                        if ((_local_13 is NewFriendRequestTab))
                        {
                            NewFriendRequestTab(_local_13)._Str_840(_local_7, this.getAvatarFaceBitmap(k));
                            return;
                        }
                        if ((_local_13 is FriendRequestsTab))
                        {
                            FriendRequestsTab(_local_13)._Str_840(_local_7, this.getAvatarFaceBitmap(k));
                            return;
                        }
                    }
                }
            }
        }

        private function _Str_26154(k:IFriendEntity):Boolean
        {
            return this._Str_7119 == k.id;
        }

        public function _Str_8513(k:ITab, _arg_2:Boolean):void
        {
            if (!k.selected)
            {
                if (this._Str_11900)
                {
                    this.deSelect(true);
                }
                k.select(_arg_2);
                this._Str_11900 = k;
                if ((k is FriendEntityTab))
                {
                    this._Str_7119 = FriendEntityTab(k).friend.id;
                }
                if ((k is NewFriendEntityTab))
                {
                    this._Str_7119 = NewFriendEntityTab(k).friend.id;
                }
            }
        }

        public function _Str_24826(k:int):void
        {
            if (this._Str_7119 == k)
            {
                return;
            }
            var _local_2:FriendEntityTab = this._Str_21564(k);
            if (_local_2)
            {
                this._Str_8513(_local_2, false);
                this._Str_7119 = k;
            }
        }

        public function deSelect(k:Boolean):void
        {
            if (this._Str_11900)
            {
                this._Str_11900.deselect(k);
                this._Str_11900 = null;
                this._Str_7119 = -1;
            }
        }

        public function getIconLocation(k:String):IWindowContainer
        {
            var _local_2:IWindowContainer;
            _local_2 = IWindowContainer(this._Str_2563.findChildByName(k));
            return _local_2;
        }

        private function _Str_21453(k:Event):void
        {
            if (!this._Str_22610())
            {
                this._Str_20691();
            }
            else
            {
                this._Str_6258(true);
            }
        }

        private function _Str_19962(event:FindFriendsNotificationEvent):void
        {
            var title:String = ((event.success) ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}");
            var text:String = ((event.success) ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}");
            _Str_2277.notify(title, text, function (k:_Str_2418, _arg_2:WindowEvent):void
            {
                k.dispose();
            }, _Str_3023.BUTTON_OK);
        }

        private function _Str_21633(k:FriendRequestUpdateEvent):void
        {
            if (this._Str_8151)
            {
                this._Str_8151.notify((this._Str_2780._Str_10570 > 0));
            }
            if (this._Str_2563)
            {
                this._Str_21482(this._Str_2780._Str_10570);
                this._Str_6258(true);
            }
            else
            {
                this._Str_20691();
            }
        }

        protected function onTimerEvent(k:TimerEvent):void
        {
            this._Str_4075.visible = true;
            var _local_2:IWindow = (this._Str_4075.getChildByName("icon_1") as IWindow);
            var _local_3:IWindow = (this._Str_4075.getChildByName("icon_2") as IWindow);
            if (((_local_2) && (_local_3)))
            {
                if (_local_2.visible)
                {
                    _local_2.visible = false;
                    _local_3.visible = true;
                }
                else
                {
                    if (_local_3.visible)
                    {
                        _local_3.visible = false;
                        _local_2.visible = true;
                    }
                }
            }
        }

        private function _Str_12109(k:Boolean):void
        {
            var _local_2:IWindow = (this._Str_4075.getChildByName("icon") as IWindow);
            var _local_3:IWindow = (this._Str_4075.getChildByName("icon_1") as IWindow);
            if (k)
            {
                if (!this._Str_2364)
                {
                    _local_2.visible = false;
                    _local_3.visible = true;
                    this._Str_2364 = new Timer(500, 0);
                    this._Str_2364.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
                    this._Str_2364.start();
                }
            }
            else
            {
                if (this._Str_2364 != null)
                {
                    this._Str_2364.removeEventListener(TimerEvent.TIMER, this.onTimerEvent);
                    this._Str_2364.stop();
                    this._Str_2364 = null;
                }
                _local_2.visible = true;
                _local_3.visible = false;
                (this._Str_4075.getChildByName("icon_2") as IWindow).visible = false;
            }
        }

        private function _Str_20447(k:NewMessageEvent):void
        {
            if (k.notify)
            {
                this._Str_21460 = true;
            }
            if (this._Str_4075)
            {
                if (k.notify)
                {
                    this._Str_12109(true);
                }
                else
                {
                    this._Str_4075.visible = true;
                    this._Str_12109(false);
                }
            }
            if (this._Str_22151)
            {
                if (k.notify)
                {
                    this._Str_22151.window.visible = true;
                }
            }
        }

        private function _Str_15197(k:NotificationEvent):void
        {
            var _local_2:FriendEntityTab = this._Str_21564(k._Str_9566);
            if (!_local_2)
            {
                return;
            }
            _local_2._Str_15853(k.notification);
        }

        private function _Str_21657(k:ActiveConversationsCountEvent):void
        {
            if (this._Str_4075 != null)
            {
                this._Str_4075.visible = (!(k._Str_18689 == 0));
            }
        }

        private function _Str_10326(k:SessionDataPreferencesEvent):void
        {
            if (!(k._Str_8444 & UIFlags._Str_14290))
            {
                if (!this._Str_3312)
                {
                    this._Str_20336();
                }
            }
        }

        private function _Str_22794(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:int;
            if (k.type == WindowMouseEvent.DOWN)
            {
                _local_3 = this._Str_2748;
                _local_4 = ((this._Str_2780._Str_7830 + ((this._Str_14931) ? 1 : 0)) + ((this._Str_2780._Str_10570 > 0) ? 1 : 0));
                switch (_arg_2.name)
                {
                    case BUTTON_LEFT:
                        _local_3 = Math.max(0, (this._Str_2748 - 1));
                        break;
                    case BUTTON_LEFT_PAGE:
                        _local_3 = Math.max(0, (this._Str_2748 - this._Str_7488));
                        break;
                    case BUTTON_LEFT_END:
                        _local_3 = 0;
                        break;
                    case BUTTON_RIGHT:
                        _local_3 = Math.max(0, Math.min((_local_4 - this._Str_7488), (this._Str_2748 + 1)));
                        break;
                    case BUTTON_RIGHT_PAGE:
                        _local_3 = Math.max(0, Math.min((_local_4 - this._Str_7488), (this._Str_2748 + this._Str_7488)));
                        break;
                    case BUTTON_RIGHT_END:
                        _local_3 = Math.max(0, (_local_4 - this._Str_7488));
                        break;
                    case BUTTON_CLOSE:
                        this.visible = false;
                        break;
                    case BORDER:
                        this.deSelect(true);
                        break;
                    case LINK_FRIENDLIST:
                        this._Str_2780._Str_18959();
                        break;
                }
                if (_local_3 != this._Str_2748)
                {
                    this.deSelect(true);
                    this._Str_2748 = _local_3;
                    this._Str_6258(true);
                }
            }
            if (k.type == WindowEvent.WINDOW_EVENT_DEACTIVATED)
            {
                this.deSelect(true);
            }
        }

        private function _Str_20124():void
        {
            if (this._Str_10857)
            {
                this._Str_10857.visible = this._Str_3312;
            }
            if (this._Str_11102)
            {
                this._Str_11102.visible = (!(this._Str_3312));
            }
        }

        private function _Str_20689(k:WindowMouseEvent):void
        {
            this._Str_20336();
        }

        private function _Str_20336():void
        {
            this._Str_3312 = (!(this._Str_3312));
            _Str_2318.setFriendBarState((!(this._Str_3312)));
            this.deSelect(true);
            this._Str_6258(true);
            this._Str_20124();
            if (!this._Str_3312)
            {
                this._Str_6258(true);
            }
            var k:FriendBarResizeEvent = new FriendBarResizeEvent();
            events.dispatchEvent(k);
        }

        private function _Str_24031(k:WindowMouseEvent):void
        {
            this._Str_2780.toggleMessenger();
            this._Str_12109(false);
        }

        private function _Str_24062(k:WindowMouseEvent):void
        {
            this._Str_2780._Str_18959();
        }

        private function _Str_22502(k:WindowMouseEvent):void
        {
            this._Str_2780._Str_21870();
        }

        public function removeMessengerNotifications():void
        {
            var k:ITab;
            for each (k in this._Str_2868)
            {
                if ((k is FriendEntityTab))
                {
                    FriendEntityTab(k)._Str_5518(FriendNotification._Str_6485, true);
                }
            }
        }

        public function _Str_21482(k:int):void
        {
            var _local_2:IRegionWindow;
            if (!this._Str_4452)
            {
                this._Str_4452 = _Str_2277.createUnseenItemCounter();
            }
            if (this._Str_4452)
            {
                _local_2 = (this._Str_2563.findChildByName("icon_all_friends") as IRegionWindow);
                if (_local_2)
                {
                    _local_2.addChild(this._Str_4452);
                    this._Str_4452.x = ((_local_2.width - this._Str_4452.width) - 5);
                    this._Str_4452.y = 0;
                    if (k > 0)
                    {
                        this._Str_4452.visible = true;
                        this._Str_4452.findChildByName("count").caption = k.toString();
                    }
                    else
                    {
                        this._Str_4452.visible = false;
                    }
                }
            }
        }

        private function _Str_24861(k:WindowEvent, _arg_2:IWindow):void
        {
            if (this._Str_3984.visible)
            {
                if (k.type == WindowMouseEvent.DOWN)
                {
                    switch (_arg_2.name)
                    {
                        case BUTTON_OPEN:
                            this.visible = true;
                            return;
                    }
                }
            }
        }

        private function _Str_22571(k:Boolean, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:IRegionWindow = (this._Str_2563.findChildByName(BUTTON_LEFT_PAGE) as IRegionWindow);
            var _local_5:IRegionWindow = (this._Str_2563.findChildByName(BUTTON_RIGHT_PAGE) as IRegionWindow);
            if (_local_4 != null)
            {
                _local_4.visible = k;
                if (_arg_2)
                {
                    _local_4.enable();
                    _local_4.blend = 1;
                }
                else
                {
                    _local_4.disable();
                    _local_4.blend = 0.2;
                }
            }
            if (_local_5 != null)
            {
                _local_5.visible = k;
                if (_arg_3)
                {
                    _local_5.enable();
                    _local_5.blend = 1;
                }
                else
                {
                    _local_5.disable();
                    _local_5.blend = 0.2;
                }
            }
            this._Str_22020();
        }

        private function _Str_6258(k:Boolean=false):void
        {
            var _local_2:Rectangle;
            var _local_3:int;
            if (!disposed)
            {
                if (this._Str_2563)
                {
                    _local_2 = this._toolbar.getRect();
                    this._Str_2563.width = (this._Str_2563.parent.width - _local_2.right);
                    this._Str_5894.visible = (!(this._Str_3312));
                    if (!k)
                    {
                        _local_3 = this._Str_7488;
                        if (_local_3 < this._Str_2868.length)
                        {
                            k = true;
                        }
                        else
                        {
                            if (_local_3 > this._Str_2868.length)
                            {
                                if (this._Str_2868.length < _Str_9726)
                                {
                                    k = true;
                                }
                                else
                                {
                                    if (this._Str_2868.length < (this._Str_2780._Str_7830 + ((this._Str_14931) ? 1 : 0)))
                                    {
                                        k = true;
                                    }
                                    else
                                    {
                                        if (this._Str_24539 < this._Str_2780._Str_7830)
                                        {
                                            k = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (k)
                    {
                        this.populate();
                        this._Str_22020();
                    }
                    if (this._Str_3312)
                    {
                        this._Str_2563.x = (this._Str_2563.desktop.width - _Str_6651);
                    }
                    else
                    {
                        this._Str_2563.x = (this._Str_2563.desktop.width - this._Str_2563.width);
                        this._Str_5894.x = 1;
                    }
                }
            }
        }

        private function _Str_22020():void
        {
            var _local_2:IWindow;
            var k:int;
            for each (_local_2 in this._Str_2563.iterator)
            {
                if (!_local_2.visible)
                {
                }
                else
                {
                    _local_2.x = k;
                    k = (k + _local_2.width);
                }
            }
            this._Str_2563.width = k;
        }

        private function get _Str_24539():int
        {
            var k:int;
            var _local_2:int = this._Str_2868.length;
            while (_local_2-- > 0)
            {
                if ((this._Str_2868[_local_2] is FriendEntityTab))
                {
                    k++;
                }
            }
            var _local_3:int = this._Str_2868.length;
            while (_local_3-- > 0)
            {
                if ((this._Str_2868[_local_3] is FriendEntityTab))
                {
                    k++;
                }
            }
            return k;
        }

        private function get _Str_7488():int
        {
            var k:IItemListWindow = (this._Str_2563.findChildByName(LIST) as IItemListWindow);
            var _local_2:IWindowContainer = (this._Str_2563.findChildByName(FRIENDTOOLS) as IWindowContainer);
            var _local_3:int = (((this._Str_2563.width - _local_2.width) - _Str_17338) / (_Str_18952 + k.spacing));
            return _local_3;
        }

        private function _Str_3630(k:WindowEvent):void
        {
            this._Str_6258(true);
        }

        public function get eventUrlPrefix():String
        {
            return "friendbar/";
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
                case "findfriends":
                    this._Str_2780.findNewFriends();
                    return;
                case "user":
                    if (_local_2.length > 2)
                    {
                        this._Str_2780._Str_19230(_local_2[2]);
                    }
                    return;
                default:
                    Logger.log(("HabboFriendBarView unknown link-type received: " + _local_2[1]));
            }
        }
    }
}
