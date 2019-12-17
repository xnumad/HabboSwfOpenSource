package com.sulake.habbo.gamecenter
{
    import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.game.HabboGames;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.UserGameAchievementsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_8191;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_5142;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_6994;
    import com.sulake.habbo.communication.messages.incoming._Str_348._Str_5416;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.GameStatusMessageEvent;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.game.GameAssetEnum;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IRectLimiter;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_12437;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_11951;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_5198;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_10594;
    import com.sulake.habbo.communication.messages.outgoing._Str_497._Str_7123;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_11560;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.communication.messages.parser.game.lobby.UserGameAchievementsMessageParser;
    import com.sulake.habbo.game.WindowUtils;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_3326;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_4574;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_7552;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_7341;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6554;
    import com.sulake.habbo.window.enum._Str_12232;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameStatusMessageParser;

    public class GameCenterLayout implements IDisposable, IAvatarImageListener, IGameRewardListener 
    {
        private static const GAME_CENTER_VIEW_GENERIC_XML:String = "game_center_view_generic_xml";
        private static const _Str_4658:Rectangle = new Rectangle(0, 0, 0, 0);
        private static const _Str_3446:int = 0;

        private var _selectedGame:int = -1;
        private var _gamesLeft:int = 0;
        private var _gameEnabled:Boolean = true;
        private var _disposed:Boolean = false;
        private var _gameCenterView:GameCenterView;
        private var _gameCenterViewWindow:IWindowContainer;
        private var _gameCenterContainer:IWindowContainer;
        private var _storiesEntryContainer:IWindowContainer;
        private var _gameContentScrollContainer:IScrollableListWindow;
        private var _gameContent:IWindowContainer;
        private var _gameListScroller:IScrollbarWindow;
        private var _gameListContainer:IItemListWindow;
        private var _gameListItemBase:IWindowContainer;
        private var _gameSelectionIcon:IBitmapWrapperWindow;
        private var _themeImage:IStaticBitmapWrapperWindow;
        private var _logoImage:IStaticBitmapWrapperWindow;
        private var _achievementList:IItemListWindow;
        private var _leaderboardList:IItemListWindow;
        private var _luckyLosersList:IItemListWindow;
        private var _gamesLeftContainer:IWindowContainer;
        private var _playNowLimitedButton:IWindowContainer;
        private var _playNowUnlimitedButton:IWindowContainer;
        private var _gameOfflineText:ITextWindow;
        private var _achievementsContainer:IWindowContainer;
        private var _leaderboardContainer:IWindowContainer;
        private var _filterTextField:ITextFieldWindow;
        private var _gameGeneralInfoContainer:IWindowContainer;

        public function GameCenterLayout(k:GameCenterView)
        {
            this._gameCenterView = k;
            this._gameCenterView._Str_3479.inventory.events.addEventListener(HabboUnseenItemsUpdatedEvent.HUIUE_UNSEEN_ITEMS_CHANGED, this._Str_14461);
            this._gameCenterView._Str_3479.events.addEventListener(GameCenterEvent.GAME_CONFIGURATIONS_INITIALIZED, this._Str_25836);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                this._filterTextField = null;
                if (this._achievementList)
                {
                    this._achievementList.dispose();
                    this._achievementList = null;
                }
                if (this._leaderboardList)
                {
                    this._leaderboardList.dispose();
                    this._leaderboardList = null;
                }
                if (this._luckyLosersList)
                {
                    this._luckyLosersList.dispose();
                    this._luckyLosersList = null;
                }
                if (this._gamesLeftContainer)
                {
                    this._gamesLeftContainer.dispose();
                    this._gamesLeftContainer = null;
                }
                if (this._gameSelectionIcon)
                {
                    this._gameSelectionIcon.dispose();
                    this._gameSelectionIcon = null;
                }
                if (this._gameCenterContainer)
                {
                    this._gameCenterContainer.dispose();
                    this._gameCenterContainer = null;
                }
                if (this._gameCenterViewWindow)
                {
                    this._gameCenterViewWindow.dispose();
                    this._gameCenterViewWindow = null;
                }
                if (((this._gameCenterView.windowManager) && (!(this._gameCenterView.windowManager.disposed))))
                {
                    this._gameCenterView.windowManager.getWindowContext(_Str_3446).getDesktopWindow().removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                }
                if (this._gameCenterView._Str_3479.inventory.events)
                {
                    this._gameCenterView._Str_3479.inventory.events.removeEventListener(HabboUnseenItemsUpdatedEvent.HUIUE_UNSEEN_ITEMS_CHANGED, this._Str_14461);
                }
                this._playNowLimitedButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_13877);
                this._playNowUnlimitedButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_13877);
                if (this._playNowLimitedButton)
                {
                    this._playNowLimitedButton.dispose();
                    this._playNowLimitedButton = null;
                }
                if (this._playNowUnlimitedButton)
                {
                    this._playNowUnlimitedButton.dispose();
                    this._playNowUnlimitedButton = null;
                }
                this._gameOfflineText = null;
                this._gameCenterViewWindow.findChildByName("leaderboard_link").removeEventListener(WindowMouseEvent.CLICK, this._Str_20562);
                this._gameCenterViewWindow.findChildByName("support_link").removeEventListener(WindowMouseEvent.CLICK, this._Str_21942);
                this._themeImage = null;
                this._logoImage = null;
                this._gameListContainer = null;
                this._gameListItemBase = null;
                this._gameContent = null;
                this._gameContentScrollContainer = null;
                this._gameCenterViewWindow = null;
                this._gameCenterView = null;
                this._gameListScroller = null;
                this._disposed = true;
            }
        }

        private function createWindow():void
        {
            var k:IWindowContainer;
            if (!this._gameCenterViewWindow)
            {
                this._gameCenterViewWindow = (this._gameCenterView.windowManager.buildFromXML((this._gameCenterView.assets.getAssetByName(GAME_CENTER_VIEW_GENERIC_XML).content as XML), _Str_3446) as IWindowContainer);
                this._gameCenterContainer = (this._gameCenterViewWindow.findChildByName("game_center_container") as IWindowContainer);
                this._storiesEntryContainer = (this._gameCenterViewWindow.findChildByName("entering_stories_container") as IWindowContainer);
                this._gameContentScrollContainer = (this._gameCenterViewWindow.findChildByName("game_content_container") as IScrollableListWindow);
                this._gameContent = (this._gameContentScrollContainer.getListItemByName("game_content") as IWindowContainer);
                this._themeImage = (this._gameCenterViewWindow.findChildByName("theme_image") as IStaticBitmapWrapperWindow);
                this._logoImage = (this._gameCenterViewWindow.findChildByName("logo_image") as IStaticBitmapWrapperWindow);
                this._playNowLimitedButton = (this._gameCenterViewWindow.findChildByName("playnow_limited_button") as IWindowContainer);
                this._playNowUnlimitedButton = (this._gameCenterViewWindow.findChildByName("playnow_unlimited_button") as IWindowContainer);
                this._gameOfflineText = (this._gameCenterViewWindow.findChildByName("game_offline_description") as ITextWindow);
                this._playNowLimitedButton.addEventListener(WindowMouseEvent.CLICK, this._Str_13877);
                this._playNowUnlimitedButton.addEventListener(WindowMouseEvent.CLICK, this._Str_13877);
                this._gameListContainer = (this._gameCenterViewWindow.findChildByName("game_icon_list") as IItemListWindow);
                this._gameListItemBase = (this._gameListContainer.getListItemAt(0) as IWindowContainer);
                this._gameListContainer.removeListItemAt(0);
                this._gameSelectionIcon = (this._gameListItemBase.findChildByName("selected_icon") as IBitmapWrapperWindow);
                this._gameListItemBase.removeChild(this._gameSelectionIcon);
                this._gameListScroller = (this._gameCenterViewWindow.findChildByName("game_icon_list_scroll") as IScrollbarWindow);
                this._gameCenterViewWindow.findChildByName("game_center_filter_container").visible = this._gameCenterView._Str_3479.getBoolean("games.filter.enabled");
                this._filterTextField = (this._gameCenterViewWindow.findChildByName("game_center_filter") as ITextFieldWindow);
                this._filterTextField.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_25099);
                this._Str_16015();
                this._Str_2972(this._gameSelectionIcon, this.getBitmap("game_center_icon_selected"));
                this._gameCenterView.windowManager.getWindowContext(_Str_3446).getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                this._achievementList = (this._gameCenterViewWindow.findChildByName("achievements_list") as IItemListWindow);
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new UserGameAchievementsMessageEvent(this._Str_24687));
                this._leaderboardList = (this._gameCenterViewWindow.findChildByName("leaderboard_list") as IItemListWindow);
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_8191(this._Str_25658));
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_5142(this._Str_23128));
                this._luckyLosersList = (this._gameCenterViewWindow.findChildByName("lucky_losers_list") as IItemListWindow);
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_6994(this._Str_22600));
                this._gameCenterViewWindow.findChildByName("leaderboard_link").addEventListener(WindowMouseEvent.CLICK, this._Str_20562);
                this._gameCenterViewWindow.findChildByName("support_link").addEventListener(WindowMouseEvent.CLICK, this._Str_21942);
                this._gameCenterViewWindow.findChildByName("room_link").addEventListener(WindowMouseEvent.CLICK, this._Str_17423);
                this._gamesLeftContainer = this._gameCenterView.windowManager.createUnseenItemCounter();
                k = (this._playNowLimitedButton.findChildByName("games_left_container") as IWindowContainer);
                k.addChild(this._gamesLeftContainer);
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_5416(this._Str_16577));
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new GameStatusMessageEvent(this._Str_25204));
                this._Str_22075(this._gameCenterView._Str_3479.inventory._Str_3455._Str_11239(UnseenItemCategoryEnum.GAMES));
                this._achievementsContainer = (this._gameCenterViewWindow.findChildByName("achievements_container") as IWindowContainer);
                this._leaderboardContainer = (this._gameCenterViewWindow.findChildByName("leaderboard_container") as IWindowContainer);
                this._gameGeneralInfoContainer = (this._gameCenterViewWindow.findChildByName("game_general_info_container") as IWindowContainer);
            }
        }

        private function _Str_25099(k:WindowKeyboardEvent):void
        {
            if (k.keyCode == 13)
            {
                this._Str_16015();
            }
        }

        private function _Str_25836(k:GameCenterEvent):void
        {
            this._Str_16015();
        }

        public function _Str_16015():void
        {
            var _local_2:int;
            if (this._gameListContainer)
            {
                this._gameListContainer.removeListItems();
            }
            var k:Array = GameConfigurations.gameIds();
            for each (_local_2 in k)
            {
                this._Str_24792(_local_2);
            }
            this._Str_20470();
            this._Str_20908(this._selectedGame);
        }

        private function _Str_20470():void
        {
            this._gameListScroller.visible = (this._gameListContainer.maxScrollH > 0);
        }

        private function _Str_24792(k:int):void
        {
            var _local_2:String = GameConfigurations.getNameId(k);
            if ((((!(this._filterTextField == null)) && (!(this._filterTextField.caption == ""))) && (_local_2.toLowerCase().indexOf(this._filterTextField.caption.toLowerCase()) < 0)))
            {
                return;
            }
            var _local_3:IRegionWindow = (this._gameListItemBase.clone() as IRegionWindow);
            var _local_4:String = GameConfigurations.getAssetUrl(k, GameAssetEnum.ICON);
            _local_3.name = _local_2;
            this._gameListContainer.addListItem(_local_3);
            _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_23441);
            var _local_5:IWindow = _local_3.findChildByTag("ICON");
            var _local_6:IStaticBitmapWrapperWindow = (_local_5 as IStaticBitmapWrapperWindow);
            _local_6.assetUri = "game_center_loading_icon";
            _local_6.assetUri = _local_4;
            _local_3._Str_2613 = this._gameCenterView.localization.getLocalization((("gamecenter." + _local_2) + ".name"), (("gamecenter." + _local_2) + ".name"));
        }

        public function activate(k:int, _arg_2:Boolean):void
        {
            if (!this._gameCenterViewWindow)
            {
                this.createWindow();
                this._gameCenterView._Str_3479._SafeStr_7683();
            }
            this._selectedGame = -1;
            this._gameCenterViewWindow.invalidate();
            this._gameCenterViewWindow.visible = true;
            this.selectGame(k, _arg_2);
            this._Str_5127();
        }

        public function disable():void
        {
            if (!this._gameCenterViewWindow)
            {
                return;
            }
            this._gameCenterViewWindow.visible = false;
        }

        private function _Str_5127():void
        {
            if (!this._gameCenterViewWindow)
            {
                return;
            }
            this._gameCenterViewWindow.x = _Str_4658.x;
            this._gameCenterViewWindow.y = _Str_4658.y;
            this._gameCenterViewWindow.width = (this._gameCenterViewWindow.desktop.width - _Str_4658.right);
            this._gameCenterViewWindow.height = (this._gameCenterViewWindow.desktop.height - _Str_4658.bottom);
            this._gameCenterViewWindow.invalidate();
            if (!this._gameCenterContainer)
            {
                return;
            }
            var k:IRectLimiter = this._gameCenterContainer.limits;
            if (this._gameCenterViewWindow.width > k.maxWidth)
            {
                this._gameCenterContainer.width = k.maxWidth;
            }
            else
            {
                if (this._gameCenterViewWindow.width < k.minWidth)
                {
                    this._gameCenterContainer.width = k.minWidth;
                }
                else
                {
                    this._gameCenterContainer.width = this._gameCenterContainer.width;
                }
            }
            this._gameCenterContainer.x = ((this._gameCenterViewWindow.width - this._gameCenterContainer.width) / 2);
            this._gameContent.height = this._gameContentScrollContainer.height;
            this._gameContent.width = this._gameContentScrollContainer.width;
            this._gameCenterContainer.invalidate();
            this._Str_20470();
        }

        private function _Str_3630(k:WindowEvent):void
        {
            this._Str_5127();
        }

        private function _Str_23441(k:WindowMouseEvent):void
        {
            var _local_2:int;
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    _local_2 = GameConfigurations.getId(k.target.name);
                    this.selectGame(_local_2, false);
                    this._gameCenterView._Str_3777(GameConfigurations.getNameId(_local_2), "showGameCenter.selectGame");
                    return;
            }
        }

        private function _Str_13877(k:WindowMouseEvent):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    this._Str_21892();
                    return;
            }
        }

        private function _Str_21892():void
        {
            if (this._gamesLeft != 0)
            {
				if (((this._selectedGame == HabboGames._SafeStr_7697) && (!(this._gameCenterView._Str_3479._SafeStr_7684()))))
                {
                    return;
                }
                this._playNowUnlimitedButton.disable();
                this._playNowLimitedButton.disable();
                this._gameCenterView.joinPlayerQueue(this._selectedGame);
            }
            else
            {
                this._gameCenterView._Str_24458(this._selectedGame);
            }
        }

        private function _Str_6199(k:Boolean):void
        {
            var _local_2:String = GameConfigurations.getNameId(this._selectedGame);
            this._gameCenterContainer.color = GameConfigurations.getBgColor(this._selectedGame);
            this._themeImage.assetUri = null;
            this._logoImage.assetUri = null;
            this._gameCenterContainer.visible = (!((k) && (_local_2 == "elisa_habbo_stories")));
            this._storiesEntryContainer.visible = (!(this._gameCenterContainer.visible));
            this._storiesEntryContainer.x = ((this._storiesEntryContainer.desktop.width / 2) - (this._storiesEntryContainer.width / 2));
            this._storiesEntryContainer.y = ((this._storiesEntryContainer.desktop.height / 2) - (this._storiesEntryContainer.height / 2));
            this._themeImage.assetUri = GameConfigurations.getAssetUrl(this._selectedGame, GameAssetEnum.THEME);
            this._logoImage.assetUri = GameConfigurations.getAssetUrl(this._selectedGame, GameAssetEnum.LOGO);
            this._Str_4343(this._gameCenterViewWindow, "description_title", (("gamecenter." + _local_2) + ".description_title"), true);
            this._Str_4343(this._gameCenterViewWindow, "game_description", (("${gamecenter." + _local_2) + ".description_content}"));
            this._Str_4343(this._gameCenterViewWindow, "achievements_title", "${gamecenter.achievements_title}");
            this._Str_4343(this._gameCenterViewWindow, "leaderboard_title", "${gamecenter.leaderboard_title}");
            this._Str_4343(this._gameCenterViewWindow, "leaderboard_link", "${gamecenter.leaderboard_link}");
            this._Str_4343(this._gameCenterViewWindow, "game_offline_description", "${gamecenter.game_offline}");
            var _local_3:String = GameConfigurations.getSupportUrl(this._selectedGame);
            var _local_4:String = (((_local_3) && (!(_local_3 == ""))) ? "${gamecenter.support_link_text}" : null);
            this._Str_4343(this._gameCenterViewWindow, "support_link", _local_4);
            this._gameOfflineText.visible = false;
            this._gameCenterView.localization.registerParameter("gamecenter.achievements_title", "game", this._gameCenterView.getLocalization(this._selectedGame));
            this._gameCenterViewWindow.findChildByName("play_now_unlimited_button_text").caption = "${gamecenter.play_now}";
            this._achievementList.destroyListItems();
            this._leaderboardList.destroyListItems();
            this._achievementsContainer.visible = false;
            this._gameCenterView.send(new _Str_12437(this._selectedGame));
            this._leaderboardContainer.visible = false;
            this._gameCenterView.send(new _Str_11951(this._selectedGame, 1));
            this._gameCenterView.send(new _Str_5198(this._selectedGame, 0, 0, 0, 1, 1));
            this._gameCenterView.send(new _Str_5198(this._selectedGame, 1, 0, 0, 1, 1));
            this._gameCenterView.send(new _Str_10594(this._selectedGame));
            this._playNowLimitedButton.visible = false;
            this._playNowUnlimitedButton.visible = false;
            this._gameCenterViewWindow.findChildByName("playnow_text").caption = "";
            this._gameCenterView.send(new _Str_7123(this._selectedGame));
            this._gameCenterView.send(new _Str_11560(this._selectedGame));
            this._gameCenterView._Str_20681(this);
            var _local_5:String = ("gamecenter.roomlink." + _local_2);
            var _local_6:String = this._gameCenterView._Str_3479.getProperty(_local_5);
            var _local_7:IWindowContainer = (this._gameCenterViewWindow.findChildByName("room_link_container") as IWindowContainer);
            _local_7.visible = ((_local_6) && (!(_local_6 == "")));
            if (_local_2 == "elisa_habbo_stories")
            {
                this._gameGeneralInfoContainer.visible = false;
            }
            else
            {
                this._gameGeneralInfoContainer.visible = true;
                this._Str_4343(this._gameCenterViewWindow, "game_general_info_text", "${gamecenter.game_info.text}");
            }
        }

        private function _Str_2972(k:IBitmapWrapperWindow, _arg_2:BitmapData):void
        {
            if (_arg_2)
            {
                k.bitmap = _arg_2.clone();
                k.invalidate();
            }
        }

        private function _Str_4343(k:IWindowContainer, _arg_2:String, _arg_3:String=null, _arg_4:Boolean=false):void
        {
            var _local_5:ITextWindow = (k.findChildByName(_arg_2) as ITextWindow);
            _local_5.textColor = GameConfigurations.getTextColor(this._selectedGame);
            if (_arg_3)
            {
                _local_5.caption = ((_arg_4) ? this._gameCenterView.localization.getLocalization(_arg_3, "") : _arg_3);
            }
            else
            {
                _local_5.caption = "";
            }
        }

        private function selectGame(k:int, _arg_2:Boolean):void
        {
            if (this._selectedGame == k)
            {
                return;
            }
            var _local_3:Array = GameConfigurations.gameIds();
            if (((!(_local_3)) || (_local_3.length == 0)))
            {
                return;
            }
            if (_local_3.indexOf(k) == -1)
            {
                HabboGamesCom.log((((("Game id '" + k) + "' was not enabled, defaulting select to '") + _local_3[0]) + "'!"));
                k = 1;
            }
            this._selectedGame = k;
            this._gamesLeft = 0;
            this._gamesLeftContainer.caption = "0";
            this._Str_20908(k);
            this._Str_6199(_arg_2);
            this._gameCenterView._Str_18157(k);
        }

        private function _Str_20908(k:int):void
        {
            var _local_2:IWindowContainer = (this._gameListContainer.getListItemByName(GameConfigurations.getNameId(k)) as IWindowContainer);
            if (_local_2)
            {
                _local_2.removeChild(this._gameSelectionIcon);
                _local_2.addChildAt(this._gameSelectionIcon, 0);
            }
        }

        private function getBitmap(k:String):BitmapData
        {
            var _local_2:IAsset = this._gameCenterView.assets.getAssetByName(k);
            if (_local_2)
            {
                return _local_2.content as BitmapData;
            }
            return null;
        }

        private function _Str_24687(k:IMessageEvent):void
        {
            var _local_4:IWindowContainer;
            var _local_5:Achievement;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:IWindowContainer;
            var _local_10:_Str_2402;
            var _local_2:UserGameAchievementsMessageEvent = (k as UserGameAchievementsMessageEvent);
            var _local_3:UserGameAchievementsMessageParser = (_local_2.getParser() as UserGameAchievementsMessageParser);
            if (((this._achievementList) && (_local_3.gameTypeId == this._selectedGame)))
            {
                this._achievementList.destroyListItems();
                if (_local_3.achievements.length > 0)
                {
                    this._achievementsContainer.visible = true;
                }
                _local_4 = (WindowUtils.createWindow("game_achievement_entry_xml") as IWindowContainer);
                for each (_local_5 in _local_3.achievements)
                {
                    _local_6 = (((_local_5._Str_10438) && (!(_local_5._Str_7518))) ? (this._gameCenterView.localization._Str_18179(_local_5.badgeId)) : _local_5.badgeId);
                    _local_7 = this._gameCenterView.localization.getBadgeName(_local_6);
                    _local_8 = this._gameCenterView.localization.getBadgeDesc(_local_6);
                    _local_9 = (_local_4.clone() as IWindowContainer);
                    this._Str_4343(_local_9, "achievement_name", _local_7);
                    this._Str_4343(_local_9, "achievement_desc", _local_8);
                    _local_10 = (IWidgetWindow(_local_9.findChildByName("achievement_image")).widget as _Str_2402);
                    _local_10.badgeId = _local_6;
                    _local_10.greyscale = (!(_local_5._Str_10438));
                    _local_9.findChildByName("achievement_locked_image").visible = (!(_local_5._Str_10438));
                    this._achievementList.addListItem(_local_9);
                }
            }
        }

        private function _Str_25658(k:IMessageEvent):void
        {
            var _local_4:IWindowContainer;
            var _local_5:_Str_3326;
            var _local_6:_Str_3326;
            var _local_7:IWindowContainer;
            var _local_8:IBitmapWrapperWindow;
            var _local_2:_Str_8191 = (k as _Str_8191);
            var _local_3:_Str_4574 = _local_2.getParser();
            if (((this._leaderboardList) && (_local_3.gameTypeId == this._selectedGame)))
            {
                this._leaderboardList.destroyListItems();
                if (_local_3.leaderboard.length > 0)
                {
                    _local_6 = _local_3.leaderboard[0];
                    if (_local_6.score > 0)
                    {
                        this._leaderboardContainer.visible = true;
                    }
                }
                _local_4 = (WindowUtils.createWindow("game_leaderboard_entry_xml") as IWindowContainer);
                for each (_local_5 in _local_3.leaderboard)
                {
                    _local_7 = (_local_4.clone() as IWindowContainer);
                    if (_local_3.leaderboard.length == 1)
                    {
                        _local_7.findChildByName("avatar_rank_name").visible = false;
                        _local_7.findChildByName("avatar_score").visible = false;
                        _local_7.findChildByName("empty_leaderboard_text").visible = true;
                        this._Str_4343(_local_7, "empty_leaderboard_text", "${gamecenter.leaderboard_empty}");
                    }
                    else
                    {
                        this._Str_4343(_local_7, "avatar_rank_name", ((_local_5.rank + ". ") + _local_5.name));
                        this._Str_4343(_local_7, "avatar_score", this._gameCenterView.localization.registerParameter("gamecenter.leaderboard_score", "score", _local_5.score.toString()));
                    }
                    _local_7.name = _local_5.figure;
                    _local_8 = (_local_7.findChildByName("avatar_image") as IBitmapWrapperWindow);
                    this._Str_7967(_local_8, _local_5.figure, _local_5.gender);
                    this._leaderboardList.addListItem(_local_7);
                }
            }
        }

        private function _Str_23128(k:IMessageEvent):void
        {
            var _local_4:_Str_3326;
            var _local_2:_Str_5142 = (k as _Str_5142);
            var _local_3:Game2WeeklyLeaderboardParser = _local_2.getParser();
            if (((_local_3.gameTypeId == this._selectedGame) && (_local_3.leaderboard.length > 0)))
            {
                _local_4 = _local_3.leaderboard[0];
                if (_local_4.score > 0)
                {
                    this._leaderboardContainer.visible = true;
                }
            }
        }

        private function _Str_22600(k:IMessageEvent):void
        {
            var _local_4:IWindowContainer;
            var _local_5:_Str_7552;
            var _local_6:IWindowContainer;
            var _local_2:_Str_6994 = (k as _Str_6994);
            var _local_3:_Str_7341 = _local_2.getParser();
            if (((this._luckyLosersList) && (_local_3.gameTypeId == this._selectedGame)))
            {
                this._gameCenterViewWindow.findChildByName("previous_winner").visible = false;
                this._luckyLosersList.destroyListItems();
                _local_4 = (WindowUtils.createWindow("game_center_lucky_loser_entry_xml") as IWindowContainer);
                for each (_local_5 in _local_3._Str_24920)
                {
                    if (_local_5.rank == 1)
                    {
                        this._gameCenterViewWindow.findChildByName("previous_winner").visible = true;
                        this._gameCenterViewWindow.findChildByName("previous_winner_name").caption = _local_5.name;
                        this._gameCenterViewWindow.findChildByName("previous_winner_score").caption = this._gameCenterView.localization.registerParameter("gamecenter.featured_player_points", "score", _local_5.score.toString());
                        ((this._gameCenterViewWindow.findChildByName("previous_winner_avatar") as IWidgetWindow).widget as _Str_2483).figure = _local_5.figure;
                    }
                    else
                    {
                        _local_6 = (_local_4.clone() as IWindowContainer);
                        _local_6.findChildByName("avatar_rank_name").caption = ((_local_5.rank + ". ") + _local_5.name);
                        _local_6.findChildByName("avatar_score").caption = this._gameCenterView.localization.registerParameter("gamecenter.featured_player_points", "score", _local_5.score.toString());
                        _local_6.name = _local_5.figure;
                        this._luckyLosersList.addListItem(_local_6);
                    }
                }
            }
        }

        private function _Str_7967(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:String=null):void
        {
            var _local_4:BitmapData;
            var _local_5:IAvatarImage = this._gameCenterView.avatarRenderManager.createAvatarImage(_arg_2, AvatarScaleType.LARGE, _arg_3, this);
            if (_local_5)
            {
                _local_5.setDirection(AvatarSetType.FULL, 2);
                _local_4 = _local_5._Str_818(AvatarSetType.HEAD);
                WindowUtils._Str_2972(k, _local_4);
                _local_4.dispose();
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:int;
            var _local_3:IWindowContainer;
            var _local_4:IBitmapWrapperWindow;
            if (this._leaderboardList)
            {
                _local_2 = 0;
                while (_local_2 < this._leaderboardList.iterator.length)
                {
                    _local_3 = (this._leaderboardList.getListItemAt(_local_2) as IWindowContainer);
                    _local_4 = (_local_3.findChildByName("avatar_image") as IBitmapWrapperWindow);
                    if (_local_3.name == k)
                    {
                        this._Str_7967(_local_4, k);
                    }
                    _local_2++;
                }
            }
        }

        public function _Str_16195(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = (this._gameCenterViewWindow.findChildByName("reward_bitmap") as IBitmapWrapperWindow);
            this._Str_14846(_local_2, k);
        }

        public function _Str_20140(k:String):void
        {
        }

        public function _Str_20559(k:int):void
        {
        }

        public function _Str_18928():int
        {
            return this._selectedGame;
        }

        public function _Str_21957(k:Boolean):void
        {
        }

        private function _Str_14846(k:IBitmapWrapperWindow, _arg_2:BitmapData):void
        {
            if (_arg_2)
            {
                WindowUtils._Str_2972(k, _arg_2);
            }
            else
            {
                k.bitmap = null;
                k.invalidate();
            }
        }

        private function _Str_20562(k:WindowMouseEvent):void
        {
            this._gameCenterView.showLeaderboard(this._selectedGame);
        }

        private function _Str_21942(k:WindowMouseEvent):void
        {
            HabboWebTools.openWebPage(GameConfigurations.getGame(this._selectedGame).supportUrl);
        }

        private function _Str_17423(k:WindowMouseEvent):void
        {
            var _local_2:String = GameConfigurations.getNameId(this._selectedGame);
            var _local_3:String = this._gameCenterView._Str_3479.getProperty(("gamecenter.roomlink." + _local_2));
            if (_local_3)
            {
                this._gameCenterView._Str_3479.navigator.goToPrivateRoom(parseInt(_local_3));
            }
        }

        private function _Str_16577(k:IMessageEvent):void
        {
            var _local_4:IHabboLocalizationManager;
            var _local_2:_Str_5416 = (k as _Str_5416);
            var _local_3:_Str_6554 = _local_2.getParser();
            if (_local_3.gameTypeId == this._selectedGame)
            {
                _local_4 = this._gameCenterView.localization;
                this._gamesLeft = _local_3._Str_21510;
                if (this._gamesLeft >= 0)
                {
                    this._Str_4343(this._gameCenterViewWindow, "playnow_text", _local_4.registerParameter("gamecenter.play_now_desc.limited_games", "games_left", this._gamesLeft.toString()));
                    (this._gamesLeftContainer.findChildByName(_Str_12232.COUNT) as ITextWindow).text = this._gamesLeft.toString();
                    this._playNowUnlimitedButton.visible = false;
                    this._playNowLimitedButton.visible = this._gameEnabled;
                }
                else
                {
                    this._gameCenterViewWindow.findChildByName("playnow_text").caption = "";
                    this._playNowUnlimitedButton.visible = this._gameEnabled;
                    this._playNowLimitedButton.visible = false;
                }
                if (this._gameCenterView._Str_18932)
                {
                    this._Str_21892();
                }
            }
        }

        private function _Str_25204(k:IMessageEvent):void
        {
            var _local_2:GameStatusMessageEvent = (k as GameStatusMessageEvent);
            var _local_3:GameStatusMessageParser = _local_2.getParser();
            if (_local_3.gameTypeId == this._selectedGame)
            {
                if (((_local_3.isOk) && (!(this._gameCenterView._Str_12938))))
                {
                    this._playNowUnlimitedButton.enable();
                    this._playNowLimitedButton.enable();
                    this._gameOfflineText.visible = false;
                    this._gameEnabled = true;
                }
                else
                {
                    this._playNowUnlimitedButton.disable();
                    this._playNowLimitedButton.disable();
                    this._gameOfflineText.visible = true;
                    this._gameEnabled = false;
                }
            }
        }

        private function _Str_14461(k:HabboUnseenItemsUpdatedEvent):void
        {
            var _local_2:Array = this._gameCenterView._Str_3479.inventory._Str_3455._Str_11239(UnseenItemCategoryEnum.GAMES);
            this._Str_22075(_local_2);
        }

        private function _Str_22075(k:Array):void
        {
            var _local_2:int;
            var _local_3:IWindowContainer;
            var _local_4:IWindowContainer;
            var _local_5:Boolean;
            for each (_local_2 in GameConfigurations.gameIds())
            {
                _local_3 = (this._gameListContainer.getListItemByName(GameConfigurations.getNameId(_local_2)) as IWindowContainer);
                if (_local_3)
                {
                    _local_4 = (_local_3.findChildByName("unseen_item_container") as IWindowContainer);
                    _local_5 = ((k) ? (k.indexOf(_local_2) >= 0) : false);
                    if (_local_5)
                    {
                        if (!_local_4)
                        {
                            _local_4 = this._gameCenterView.windowManager.createUnseenItemCounter();
                            _local_4.findChildByName("count").caption = " ! ";
                            _local_3.addChild(_local_4);
                            _local_4.x = (_local_3.width - _local_4.width);
                            _local_4.y = 0;
                        }
                    }
                    else
                    {
                        if (_local_4)
                        {
                            _local_3.removeChild(_local_4);
                        }
                    }
                }
            }
        }
    }
}
