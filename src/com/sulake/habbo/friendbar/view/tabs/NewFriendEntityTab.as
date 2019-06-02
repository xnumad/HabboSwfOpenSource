package com.sulake.habbo.friendbar.view.tabs
{
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
    import com.sulake.habbo.friendbar.data.FriendNotification;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.motion.Combo;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.ResizeTo;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IBubbleWindow;
    import com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.QuestToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.GameToken;
    import com.sulake.habbo.friendbar.view.tabs.tokens.GameInviteToken;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.core.window.events.WindowEvent;
    import flash.utils.getQualifiedClassName;
    import __AS3__.vec.*;

    public class NewFriendEntityTab extends Tab 
    {
        private static const NEW_FRIEND_ENTITY_XML:String = "new_friend_entity_xml";
        private static const FACEBOOK_PIECE_XML:String = "facebook_piece_xml";
        private static const NEW_CONTROLS_PIECE_XML:String = "new_controls_piece_xml";
        protected static const PIECES:String = "pieces";
        protected static const ICONS:String = "icons";
        protected static const HEADER:String = "header";
        protected static const REGION_PROFILE:String = "region_profile";
        protected static const FACEBOOK:String = "facebook";
        protected static const CONTROLS:String = "controls";
        protected static const CANVAS:String = "canvas";
        protected static const NAME:String = "name";
        protected static const MESSAGE:String = "btn_message";
        protected static const ICON_MESSAGE:String = "icon_message";
        protected static const BTN_VISIT:String = "btn_visit";
        protected static const ICON:String = "icon";
        protected static const LABEL:String = "label";
        protected static const NOTIFICATION:String = "notification";
        protected static const BUTTON_PROFILE:String = "button_profile";
        protected static const BTN_CHAT:String = "btn_chat";
        protected static const BTN_GAME:String = "btn_game";
        protected static const ICON_GAME:String = "icon_game";
        protected static const ICON_GAME_INVITE:String = "icon_game_invite";
        protected static const BUBBLE:String = "bubble";
        protected static const BUBBLE_MESSAGE:String = "bubble_message";
        protected static const BUBBLE_BUTTON_ACCEPT:String = "bubble_button_accept";
        protected static const BUBBLE_BUTTON_CLOSE:String = "bubble_button_close";
        protected static const BUBBLE_CLICK_REGION_REJECT:String = "bubble_click_region_reject";
        private static const DEFAULT_COLOR:uint = 10338138;
        private static const _Str_2841:uint = 13891476;
        private static const _Str_5837:String = null;
        private static const ICON_TAG_NOTIFY:String = "icon_tag_notify";
        private static const ICON_TAG_MESSAGE:String = "icon_tag_message";
        private static const ICON_TAG_GAME:String = "icon_tag_game";
        private static const ICON_TAG_GAME_INVITE:String = "icon_tag_game_invite";
        private static const POOL:Vector.<NewFriendEntityTab> = new Vector.<NewFriendEntityTab>();
        private static const _Str_4561:Vector.<IWindowContainer> = new Vector.<IWindowContainer>();

        protected var _Str_2568:IFriendEntity;
        protected var _Str_2765:Vector.<Token>;
        protected var _Str_5783:Boolean = false;
        protected var _Str_4947:Boolean = false;
        protected var _Str_4018:String;


        public static function _Str_2363(k:IFriendEntity):NewFriendEntityTab
        {
            var _local_3:FriendNotification;
            var _local_2:NewFriendEntityTab = ((POOL.length > 0) ? POOL.pop() : new (NewFriendEntityTab)());
            _local_2._Str_2638 = false;
            _local_2.friend = k;
            if (k.notifications.length > 0)
            {
                for each (_local_3 in k.notifications)
                {
                    _local_2._Str_15853(_local_3);
                }
            }
            return _local_2;
        }

        private static function _Str_5803(k:IWindowContainer):void
        {
            var _local_3:IWindowContainer;
            var _local_5:IWindow;
            var _local_2:IItemListWindow = IItemListWindow(k.getChildByName(PIECES));
            _local_3 = (_local_2.getListItemByName(FACEBOOK) as IWindowContainer);
            if (_local_3)
            {
                _local_3.dispose();
            }
            _local_3 = (_local_2.getListItemByName(CONTROLS) as IWindowContainer);
            if (_local_3)
            {
                _local_3.dispose();
            }
            var _local_4:Array = [];
            _local_2.groupListItemsWithTag(NOTIFICATION, _local_4);
            if (_local_4.length > 0)
            {
                for each (_local_5 in _local_4)
                {
                    _local_5.parent = null;
                }
            }
            k.height = HEIGHT;
            k.y = 0;
        }


        public function set friend(k:IFriendEntity):void
        {
            this._Str_2568 = k;
            this.refresh();
        }

        public function get friend():IFriendEntity
        {
            return this._Str_2568;
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_Str_2638)
                {
                    if (_window)
                    {
                        this._Str_17565(_window);
                        _window = null;
                    }
                    if (this._Str_2765)
                    {
                        while (this._Str_2765.length > 0)
                        {
                            this._Str_2765.pop().dispose();
                        }
                        this._Str_2765 = null;
                    }
                    this._Str_2568 = null;
                    this._Str_5783 = false;
                    this._Str_4947 = false;
                    this._Str_4018 = "";
                    _Str_2638 = true;
                    POOL.push(this);
                }
            }
        }

        override public function select(k:Boolean):void
        {
            var _local_2:IItemListWindow;
            var _local_3:IWindowContainer;
            var _local_4:IBitmapWrapperWindow;
            var _local_5:Boolean;
            var _local_6:ITextWindow;
            var _local_7:Token;
            var _local_8:IWindow;
            var _local_9:IWindow;
            var _local_10:IWindow;
            var _local_11:String;
            if (!selected)
            {
                _local_2 = IItemListWindow(window.getChildByName(PIECES));
                _local_5 = false;
                if (((!(this.friend.realName == null)) && (!(this.friend.realName == ""))))
                {
                    _local_3 = (_Str_3684.buildFromXML((_Str_2787.getAssetByName(FACEBOOK_PIECE_XML).content as XML)) as IWindowContainer);
                    _local_3.name = FACEBOOK;
                    _local_6 = (_local_3.getChildByName(NAME) as ITextWindow);
                    _local_6.caption = this.friend.realName;
                    if (!_local_6.wordWrap)
                    {
                        _Str_9890.crop(_local_6);
                    }
                    _local_4 = IBitmapWrapperWindow(_local_3.getChildByName(ICON));
                    _local_4.bitmap = (_Str_2787.getAssetByName(_local_4.bitmapAssetName).content as BitmapData);
                    _local_4.width = _local_4.bitmap.width;
                    _local_4.height = _local_4.bitmap.height;
                    _local_2.addListItem(_local_3);
                    _local_5 = true;
                }
                if (this._Str_2765)
                {
                    for each (_local_7 in this._Str_2765)
                    {
                        _local_2.addListItem(_local_7._Str_21233);
                        _local_5 = true;
                    }
                }
                if (this.friend.online)
                {
                    _local_3 = (_Str_3684.buildFromXML((_Str_2787.getAssetByName(NEW_CONTROLS_PIECE_XML).content as XML)) as IWindowContainer);
                    _local_3.name = CONTROLS;
                    _local_8 = _local_3.getChildByName(MESSAGE);
                    if (_local_8)
                    {
                        _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                    }
                    if (((!(this._Str_5783)) && (!(this._Str_4947))))
                    {
                        _local_9 = _local_3.getChildByName(BTN_GAME);
                        if (_local_9)
                        {
                            _local_9.visible = false;
                        }
                        _local_8 = _local_3.getChildByName(BTN_VISIT);
                        if (_local_8)
                        {
                            if (this.friend.allowFollow)
                            {
                                _local_8.visible = true;
                                _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                            }
                            else
                            {
                                _local_8.visible = false;
                            }
                        }
                    }
                    else
                    {
                        _local_10 = _local_3.getChildByName(BTN_VISIT);
                        if (_local_10)
                        {
                            _local_10.visible = false;
                        }
                        _local_8 = _local_3.getChildByName(BTN_GAME);
                        if (_local_8)
                        {
                            _local_11 = _Str_3840.getLocalization((("gamecenter." + this._Str_4018) + ".name"));
                            _Str_3840.registerParameter("friend.bar.game", "game", _local_11);
                            _Str_3840.registerParameter("friend.bar.game.tip", "game", _local_11);
                            _local_8.visible = true;
                            _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                        }
                    }
                    _local_8 = _local_3.getChildByName(BUTTON_PROFILE);
                    if (_local_8)
                    {
                        _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                    }
                    _local_8 = _local_3.getChildByName(BTN_CHAT);
                    if (_local_8)
                    {
                        _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                    }
                    _local_2.addListItem(_local_3);
                    _local_3.x = 30;
                    _local_5 = true;
                }
                if (((((k) && (_Str_11139)) && (_local_5)) && (Motions._Str_9810(window) == null)))
                {
                    Motions._Str_4598(new Combo(new EaseOut(new ResizeTo(window, _Str_6722, window.width, _local_2.height), _Str_6252), new EaseOut(new MoveTo(window, _Str_6722, window.x, (HEIGHT - _local_2.height)), _Str_6252)));
                }
                else
                {
                    if (_local_5)
                    {
                        window.height = _local_2.height;
                    }
                    window.y = (HEIGHT - window.height);
                }
                super.select(k);
                if (k)
                {
                    if (_Str_4533)
                    {
                        _Str_4533.trackEventLog("FriendBar", "", "clicked", "", ((this.friend.logEventId > 0) ? this.friend.logEventId : 0));
                    }
                    this.friend.logEventId = -1;
                }
            }
        }

        override public function deselect(k:Boolean):void
        {
            var _local_3:int;
            var _local_4:Token;
            if (selected)
            {
                if (window)
                {
                    _Str_5803(window);
                    if (this._Str_2765)
                    {
                        _local_3 = (this._Str_2765.length - 1);
                        while (_local_3 > -1)
                        {
                            _local_4 = this._Str_2765[_local_3];
                            if (_local_4._Str_6239)
                            {
                                this._Str_5518(_local_4._Str_3293, k);
                            }
                            _local_3--;
                        }
                    }
                }
                super.deselect(k);
            }
            var _local_2:IWindow = window.findChildByName(BUBBLE);
            if (_local_2)
            {
                _local_2.visible = false;
            }
        }

        override protected function expose():void
        {
            super.expose();
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
        }

        override protected function conceal():void
        {
            super.conceal();
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
        }

        protected function refresh():void
        {
            var k:IWindowContainer;
            var _local_2:IBitmapWrapperWindow;
            if (!_window)
            {
                _window = this._Str_16688();
            }
            if (this._Str_2568)
            {
                window.id = this._Str_2568.id;
                k = (IItemListWindow(window.getChildByName(PIECES)).getListItemByName(HEADER) as IWindowContainer);
                k.findChildByName(NAME).caption = this._Str_2568.name;
                _Str_9890.crop((k.getChildByName(NAME) as ITextWindow));
                _local_2 = IBitmapWrapperWindow(k.findChildByName(CANVAS));
                if (this._Str_2568.id > 0)
                {
                    _local_2.bitmap = _Str_3553.getAvatarFaceBitmap(this._Str_2568.figure);
                }
                else
                {
                    _local_2.bitmap = _Str_3553.getGroupIconBitmap(this._Str_2568.figure);
                }
                _local_2.width = _local_2.bitmap.width;
                _local_2.height = _local_2.bitmap.height;
            }
        }

        private function _Str_16688():IWindowContainer
        {
            var k:IWindowContainer = ((_Str_4561.length > 0) ? _Str_4561.pop() : (_Str_3684.buildFromXML((_Str_2787.getAssetByName(NEW_FRIEND_ENTITY_XML).content as XML)) as IWindowContainer));
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName(CANVAS));
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName(HEADER));
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName(REGION_PROFILE));
            var _local_5:IWindow = k.findChildByName(ICONS);
            var _local_6:IBubbleWindow = (k.findChildByName(BUBBLE) as IBubbleWindow);
            k.x = 0;
            k.y = 0;
            k.width = WIDTH;
            k.height = HEIGHT;
            k.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            k.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            k.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_3.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            _local_3.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_3.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_5926);
            _local_4._Str_2613 = _Str_3840.getLocalization("infostand.profile.link.tooltip", "");
            _local_4._Str_3099 = 100;
            _local_5.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            _local_5.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_5.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_2.disposesBitmap = true;
            _local_6.procedure = this._Str_5860;
            _local_6.y = -(_local_6.height + 5);
            _local_6.visible = false;
            return k;
        }

        private function _Str_17565(k:IWindowContainer):void
        {
            var _local_2:IRegionWindow;
            var _local_3:IWindow;
            var _local_4:IRegionWindow;
            var _local_5:IBitmapWrapperWindow;
            if (((k) && (!(k.disposed))))
            {
                k.procedure = null;
                k.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                k.removeEventListener(WindowMouseEvent.OVER, onMouseOver);
                k.removeEventListener(WindowMouseEvent.OUT, onMouseOut);
                _local_2 = IRegionWindow(k.findChildByName(HEADER));
                _local_2.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                _local_2.removeEventListener(WindowMouseEvent.OVER, onMouseOver);
                _local_2.removeEventListener(WindowMouseEvent.OUT, onMouseOut);
                _local_3 = k.findChildByName(ICONS);
                _local_3.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                _local_3.removeEventListener(WindowMouseEvent.OVER, onMouseClick);
                _local_3.removeEventListener(WindowMouseEvent.OUT, onMouseClick);
                _local_4 = IRegionWindow(k.findChildByName(REGION_PROFILE));
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_5926);
                k.width = WIDTH;
                k.height = HEIGHT;
                k.color = DEFAULT_COLOR;
                _local_5 = IBitmapWrapperWindow(k.findChildByName(CANVAS));
                _local_5.bitmap = null;
                ITextWindow(k.findChildByTag("label")).underline = false;
                _Str_5803(k);
                if (_Str_4561.indexOf(k) == -1)
                {
                    _Str_4561.push(k);
                }
            }
        }

        private function _Str_3369(k:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(_Str_6044))))
            {
                switch (k.window.name)
                {
                    case MESSAGE:
                    case ICON_MESSAGE:
                        _Str_3553.removeMessengerNotifications();
                        if (((_Str_2925) && (this._Str_2568)))
                        {
                            _Str_2925.startConversation(this._Str_2568.id);
                            this.deselect(true);
                            if (k.window.name == ICON_MESSAGE)
                            {
                                _Str_3553.setMessengerIconNotify(false);
                            }
                        }
                        return;
                    case BTN_VISIT:
                        if (((_Str_2925) && (this._Str_2568)))
                        {
                            _Str_2925.followToRoom(this._Str_2568.id);
                            this.deselect(true);
                        }
                        return;
                    case BUTTON_PROFILE:
                        if (((_Str_2925) && (this._Str_2568)))
                        {
                            _Str_4533.trackGoogle("extendedProfile", "friendToolbar_friendButton");
                            _Str_2925.showProfile(this._Str_2568.id);
                            this.deselect(true);
                        }
                        return;
                    case BTN_CHAT:
                        if (((_Str_2925) && (this._Str_2568)))
                        {
                            _Str_2925.startConversation(this._Str_2568.id);
                            this.deselect(true);
                        }
                        return;
                    case BTN_GAME:
                    case ICON_GAME:
                        if (GAMES)
                        {
                            this.deselect(true);
                            if (this._Str_4947)
                            {
                                this._Str_10193();
                            }
                            else
                            {
                                GAMES.showGameCenterByGameName("showGameCenter.friendEntityTab", this._Str_4018);
                            }
                        }
                        return;
                    case ICON_GAME_INVITE:
                        this.deselect(true);
                        this._Str_10193();
                        return;
                }
            }
        }

        private function _Str_10193():void
        {
            var k:IWindow;
            if (window)
            {
                k = window.findChildByName(BUBBLE);
                window.findChildByName(BUBBLE_MESSAGE).caption = _Str_3840.getLocalization((("gamecenter." + this._Str_4018) + ".name"));
                k.visible = false;
            }
        }

        protected function _Str_5926(k:WindowMouseEvent):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                _Str_4533.trackGoogle("extendedProfile", "friendBar_friendAvatar");
                _Str_2925.showProfile(this._Str_2568.id);
                this.deselect(true);
            }
        }

        public function _Str_15853(k:IFriendNotification):void
        {
            var _local_3:Token;
            var _local_5:Vector.<Token>;
            var _local_6:IItemListWindow;
            var _local_7:IWindow;
            this._Str_5518(k._Str_3293, false);
            if (!this._Str_2765)
            {
                this._Str_2765 = new Vector.<Token>();
            }
            var _local_2:Boolean = selected;
            if (_local_2)
            {
                _local_5 = this._Str_2765;
                this._Str_2765 = null;
                this.deselect(false);
                this._Str_2765 = _local_5;
            }
            var _local_4:String = _Str_5837;
            switch (k._Str_3293)
            {
                case FriendNotification._Str_12027:
                    _local_3 = new RoomEventToken(this.friend, k);
                    _local_3._Str_3614.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
                    _local_4 = ICON_TAG_NOTIFY;
                    break;
                case FriendNotification._Str_10801:
                    _local_3 = new AchievementToken(this.friend, k, _Str_3840);
                    _local_3._Str_3614.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
                    _local_4 = ICON_TAG_NOTIFY;
                    break;
                case FriendNotification._Str_10634:
                    _local_3 = new QuestToken(this.friend, k);
                    _local_3._Str_3614.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
                    _local_4 = ICON_TAG_NOTIFY;
                    break;
                case FriendNotification._Str_6485:
                    break;
                case FriendNotification._Str_5815:
                    _local_3 = new GameToken(this.friend, k);
                    _local_3._Str_3614.name = ICON_GAME;
                    _local_3._Str_3614.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
                    _local_4 = ICON_TAG_GAME;
                    this._Str_5783 = true;
                    this._Str_4018 = _local_3.notification.message;
                    break;
                case FriendNotification._Str_9572:
                    this._Str_5518(FriendNotification._Str_5815, true);
                    this._Str_5783 = false;
                    return;
                case FriendNotification._Str_6669:
                    _local_3 = new GameInviteToken(this.friend, k);
                    _local_3._Str_3614.name = ICON_GAME_INVITE;
                    _local_3._Str_3614.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                    _local_4 = ICON_TAG_GAME_INVITE;
                    this._Str_4947 = true;
                    this._Str_4018 = _local_3.notification.message;
                    break;
                default:
                    throw (new Error((("Unknown friend notification type: " + k._Str_3293) + "!")));
            }
            if (_local_3)
            {
                this._Str_2765.push(_local_3);
                if (_local_4 != _Str_5837)
                {
                    _local_6 = IItemListWindow(window.findChildByName(ICONS));
                    if (!_local_6.getListItemByTag(_local_4))
                    {
                        _local_7 = _local_3._Str_3614;
                        if (_local_7.tags.indexOf(_local_4) == -1)
                        {
                            _local_7.tags.push(_local_4);
                        }
                        _local_6.addListItemAt(_local_7, 0);
                    }
                }
            }
            if (_local_2)
            {
                this.select(false);
            }
        }

        public function _Str_5518(k:int, _arg_2:Boolean):void
        {
            var _local_4:Token;
            if (!this._Str_2765)
            {
                return;
            }
            var _local_3:int = (this._Str_2765.length - 1);
            while (_local_3 > -1)
            {
                _local_4 = this._Str_2765[_local_3];
                if (_local_4._Str_3293 == k)
                {
                    this._Str_2765.splice(_local_3, 1);
                    if (_arg_2)
                    {
                        this._Str_2568.notifications.splice(this._Str_2568.notifications.indexOf(_local_4.notification), 1);
                    }
                    _local_4.dispose();
                    return;
                }
                _local_3--;
            }
        }

        private function _Str_5860(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case BUBBLE_BUTTON_ACCEPT:
                        if (GAMES)
                        {
                            _local_3 = GAMES.getGameId(this._Str_4018);
                            GAMES.showGameCenter("showGameCenter.friendEntityTab", _local_3);
                            GAMES.acceptGameInvite(_local_3, this._Str_2568.id);
                        }
                    case BUBBLE_BUTTON_CLOSE:
                    case BUBBLE_CLICK_REGION_REJECT:
                        this._Str_4947 = false;
                        this._Str_5518(FriendNotification._Str_6669, true);
                        this.deselect(true);
                        return;
                }
            }
        }

        public function toString():String
        {
            return (getQualifiedClassName(this) + " ") + this._Str_2568.name;
        }
    }
}












