package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import flash.geom.Point;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.ui.handler.MeMenuWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsView;
    import com.sulake.habbo.ui.widget.memenu.chatsettings.MeMenuChatSettingsView;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.widget.events._Str_4677;
    import com.sulake.habbo.ui.widget.events._Str_8449;
    import com.sulake.habbo.ui.widget.events._Str_9658;
    import com.sulake.habbo.ui.widget.events._Str_5638;
    import com.sulake.habbo.ui.widget.events._Str_9531;
    import com.sulake.habbo.ui.widget.events._Str_6051;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_5907;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;
    import com.sulake.habbo.ui.widget.events._Str_3963;
    import com.sulake.habbo.ui.widget.events._Str_3950;
    import com.sulake.habbo.ui.widget.events._Str_4656;
    import com.sulake.habbo.ui.widget.events._Str_3345;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMeMenuMessage;
    import com.sulake.habbo.utils._Str_3942;
    import flash.events.Event;

    public class MeMenuWidget extends ConversionTrackingWidget 
    {
        public static const ME_MENU_TOP_VIEW:String = "me_menu_top_view";
        public static const ME_MENU_MY_CLOTHES_VIEW:String = "me_menu_my_clothes_view";
        public static const ME_MENU_DANCE_MOVES_VIEW:String = "me_menu_dance_moves_view";
        public static const ME_MENU_SETTINGS_VIEW:String = "me_menu_settings_view";
        public static const ME_MENU_SOUND_SETTINGS:String = "me_menu_sound_settings";
        public static const ME_MENU_CHAT_SETTINGS:String = "me_menu_chat_settings";
        private static const _Str_13955:Point = new Point(95, 440);

        private var _currentView:IMeMenuView;
        private var _mainWindow:IWindowContainer;
        private var _habboClubDays:int = 0;
        private var _habboClubPeriods:int = 0;
        private var _habboClubPastPeriods:int = 0;
        private var _allowHabboClubDances:Boolean = false;
        private var _habboClubLevel:int = 0;
        private var _hasEffectOn:Boolean = false;
        private var _isDancing:Boolean = false;
        private var _isActive:Boolean = false;
        private var _isMinimailEnabled:Boolean = false;
        private var _creditBalance:int = 0;
        private var _isGameMode:Boolean = false;
        private var _config:IHabboConfigurationManager;
        private var _userId:int;

        public function MeMenuWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._config = _arg_5;
            if (ExternalInterface.available)
            {
                this._isMinimailEnabled = _arg_5.getBoolean("client.minimail.embed.enabled");
            }
            (k as MeMenuWidgetHandler).widget = this;
            this._Str_4568(ME_MENU_TOP_VIEW);
            this.hide();
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this.hide();
            if (this._currentView != null)
            {
                this._currentView.dispose();
                this._currentView = null;
            }
            this._mainWindow = null;
            this._config = null;
            super.dispose();
        }

        public function get handler():MeMenuWidgetHandler
        {
            return _Str_2470 as MeMenuWidgetHandler;
        }

        override public function get mainWindow():IWindow
        {
            return this._mainWindow;
        }

        private function get mainContainer():IWindowContainer
        {
            var k:IAsset;
            if (this._mainWindow == null)
            {
                k = _assets.getAssetByName("memenu");
                if (k)
                {
                    this._mainWindow = (windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
                }
            }
            if (this._mainWindow)
            {
                return this._mainWindow.findChildByTag("MAIN_CONTENT") as IWindowContainer;
            }
            return null;
        }

        public function _Str_4568(k:String):void
        {
            var _local_2:IMeMenuView;
            switch (k)
            {
                case ME_MENU_TOP_VIEW:
                    _local_2 = new MeMenuMainView(this.config);
                    break;
                case ME_MENU_DANCE_MOVES_VIEW:
                    _local_2 = new MeMenuDanceView();
                    break;
                case ME_MENU_SETTINGS_VIEW:
                    _local_2 = new MeMenuSettingsMenuView();
                    break;
                case ME_MENU_SOUND_SETTINGS:
                    _local_2 = new MeMenuSoundSettingsView();
                    break;
                case ME_MENU_CHAT_SETTINGS:
                    _local_2 = new MeMenuChatSettingsView();
                    break;
                default:
                    Logger.log(("Me Menu Change view: unknown view: " + k));
            }
            if (_local_2 != null)
            {
                if (this._currentView)
                {
                    this._currentView.dispose();
                    this._currentView = null;
                }
                this._currentView = _local_2;
                this._currentView.init(this, k);
                this.mainContainer.removeChildAt(0);
                this.mainContainer.addChildAt(this._currentView.window, 0);
                this._mainWindow.visible = true;
                this._mainWindow.activate();
            }
            this._Str_19324();
        }

        public function _Str_19324():void
        {
            var k:int;
            var _local_2:Rectangle;
            if ((((this._currentView) && (this._currentView.window)) && (this._mainWindow)))
            {
                k = 5;
                this._currentView.window.position = new Point(k, k);
                this.mainContainer.width = (this._currentView.window.width + (k * 2));
                this.mainContainer.height = (this._currentView.window.height + (k * 2));
                if (((((this._config.getBoolean("simple.memenu.enabled")) && (this.handler)) && (this.handler.container)) && (this.handler.container.toolbar)))
                {
                    _local_2 = this.handler.container.toolbar.getRect();
                    this._mainWindow.x = (_local_2.right + k);
                    this._mainWindow.y = (_local_2.bottom - this._mainWindow.height);
                }
                else
                {
                    this._mainWindow.x = _Str_13955.x;
                    this._mainWindow.y = (_Str_13955.y - this.mainContainer.height);
                }
            }
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4677.RWMMUE_NEW_MINI_MAIL, this._Str_7885);
            k.addEventListener(_Str_4677.RWMMUE_UNREAD_MINI_MAIL, this._Str_7885);
            k.addEventListener(_Str_8449.RWUE_WAVE, this._Str_21778);
            k.addEventListener(_Str_9658.RWUE_DANCE, this._Str_19233);
            k.addEventListener(_Str_5638.RWUEUE_UPDATE_EFFECTS, this._Str_19429);
            k.addEventListener(_Str_9531.RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED, this.onToolbarClicked);
            k.addEventListener(_Str_6051.RWUE_AVATAR_EDITOR_CLOSED, this._Str_21383);
            k.addEventListener(_Str_6051.RWUE_HIDE_AVATAR_EDITOR, this._Str_20360);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this._Str_21703);
            k.addEventListener(_Str_5907.RWBIUE_HABBO_CLUB, this._Str_20017);
            k.addEventListener(RoomWidgetUpdateInfostandUserEvent.OWN_USER, this._Str_3746);
            k.addEventListener(_Str_3963.RWSUE_SETTINGS, this._Str_21972);
            k.addEventListener(_Str_3950.HHTPNUFWE_AE_STARTED, this._Str_14073);
            k.addEventListener(_Str_3950.HHTPNUFWE_AE_HIGHLIGHT, this._Str_14073);
            k.addEventListener(_Str_4656.RWPUE_CREDIT_BALANCE, this._Str_7504);
            k.addEventListener(_Str_3345.RWREUE_NORMAL_MODE, this._Str_21253);
            k.addEventListener(_Str_3345.RWREUE_GAME_MODE, this._Str_21709);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_8449.RWUE_WAVE, this._Str_21778);
            k.removeEventListener(_Str_9658.RWUE_DANCE, this._Str_19233);
            k.removeEventListener(_Str_5638.RWUEUE_UPDATE_EFFECTS, this._Str_19429);
            k.removeEventListener(_Str_9531.RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED, this.onToolbarClicked);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this._Str_21703);
            k.removeEventListener(_Str_5907.RWBIUE_HABBO_CLUB, this._Str_20017);
            k.removeEventListener(_Str_6051.RWUE_AVATAR_EDITOR_CLOSED, this._Str_20360);
            k.removeEventListener(_Str_6051.RWUE_HIDE_AVATAR_EDITOR, this._Str_21383);
            k.removeEventListener(RoomWidgetUpdateInfostandUserEvent.OWN_USER, this._Str_3746);
            k.removeEventListener(_Str_3963.RWSUE_SETTINGS, this._Str_21972);
            k.removeEventListener(_Str_3950.HHTPNUFWE_AE_HIGHLIGHT, this._Str_14073);
            k.removeEventListener(_Str_3950.HHTPNUFWE_AE_STARTED, this._Str_14073);
            k.removeEventListener(_Str_4656.RWPUE_CREDIT_BALANCE, this._Str_7504);
            k.removeEventListener(_Str_3345.RWREUE_NORMAL_MODE, this._Str_21253);
            k.removeEventListener(_Str_3345.RWREUE_NORMAL_MODE, this._Str_21709);
        }

        public function hide(k:RoomWidgetRoomObjectUpdateEvent=null):void
        {
            if (this._currentView != null)
            {
                this._mainWindow.removeChild(this._currentView.window);
                this._currentView.dispose();
                this._currentView = null;
            }
            this._mainWindow.visible = false;
            this._isActive = false;
        }

        private function _Str_3746(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this._userId = k._Str_2394;
        }

        private function _Str_21972(k:_Str_3963):void
        {
            if (!this._isActive)
            {
                return;
            }
            if (this._currentView.window.name == ME_MENU_SOUND_SETTINGS)
            {
                (this._currentView as MeMenuSoundSettingsView)._Str_7269(k);
            }
        }

        private function _Str_14073(k:_Str_3950):void
        {
            switch (k.type)
            {
                case _Str_3950.HHTPNUFWE_AE_HIGHLIGHT:
                    Logger.log(((("* MeMenuWidget: onHighlightClothesIcon " + this._isActive) + " view: ") + this._currentView.window.name));
                    if (((!(this._isActive == true)) || (!(this._currentView.window.name == ME_MENU_TOP_VIEW))))
                    {
                        return;
                    }
                    (this._currentView as MeMenuMainView)._Str_25524("clothes_icon", ME_MENU_TOP_VIEW, "clothes_highlighter_blue");
                    return;
                case _Str_3950.HHTPNUFWE_AE_STARTED:
                    this.hide();
                    return;
            }
        }

        private function onToolbarClicked(k:_Str_9531):void
        {
            var _local_2:RoomWidgetMeMenuMessage;
            if (this._isActive)
            {
                if (((!(this._mainWindow == null)) && (_Str_3942._Str_9211(this._mainWindow))))
                {
                    this._mainWindow.activate();
                    return;
                }
                this._isActive = false;
            }
            else
            {
                this._isActive = true;
            }
            if (this._isActive)
            {
                _local_2 = new RoomWidgetMeMenuMessage(RoomWidgetMeMenuMessage.RWMMM_MESSAGE_ME_MENU_OPENED);
                if (messageListener != null)
                {
                    messageListener.processWidgetMessage(_local_2);
                }
                this._Str_4568(ME_MENU_TOP_VIEW);
            }
            else
            {
                this.hide();
            }
        }

        private function _Str_19429(k:_Str_5638):void
        {
            var _local_2:IWidgetAvatarEffect;
            this._hasEffectOn = false;
            for each (_local_2 in k.effects)
            {
                if (_local_2._Str_3222)
                {
                    this._hasEffectOn = true;
                }
            }
        }

        private function _Str_21703(k:Event):void
        {
            if (((!(this._currentView == null)) && (!(this._currentView.window.name == ME_MENU_MY_CLOTHES_VIEW))))
            {
                this.hide();
            }
        }

        private function _Str_21383(k:_Str_6051):void
        {
            if (((!(this._currentView == null)) && (this._currentView.window.name == ME_MENU_MY_CLOTHES_VIEW)))
            {
                this._Str_4568(ME_MENU_TOP_VIEW);
            }
        }

        private function _Str_20360(k:_Str_6051):void
        {
            if (((!(this._currentView == null)) && (this._currentView.window.name == ME_MENU_MY_CLOTHES_VIEW)))
            {
                this._Str_4568(ME_MENU_TOP_VIEW);
            }
        }

        private function _Str_21778(k:_Str_8449):void
        {
            Logger.log("[MeMenuWidget] Wave Event received");
        }

        private function _Str_7885(k:_Str_4677):void
        {
            if (this._currentView)
            {
                this._currentView._Str_6111(MeMenuMainView.MINIMAIL, this.handler.container.messenger.getUnseenMiniMailMessageCount());
            }
        }

        private function _Str_19233(k:_Str_9658):void
        {
            Logger.log(("[MeMenuWidget] Dance Event received, style: " + k.style));
        }

        private function _Str_20017(k:_Str_5907):void
        {
            var _local_2:* = (!(k._Str_19392 == this._habboClubDays));
            this._habboClubDays = k._Str_19392;
            this._habboClubPeriods = k._Str_23037;
            this._habboClubPastPeriods = k._Str_24579;
            this._allowHabboClubDances = k._Str_23338;
            _local_2 = ((_local_2) || (!(k.clubLevel == this._habboClubLevel)));
            this._habboClubLevel = k.clubLevel;
            if (_local_2)
            {
                if (this._currentView != null)
                {
                    this._Str_4568(this._currentView.window.name);
                }
            }
        }

        private function _Str_7504(k:_Str_4656):void
        {
            if (k == null)
            {
                return;
            }
            this._creditBalance = k.balance;
            localizations.registerParameter("widget.memenu.credits", "credits", this._creditBalance.toString());
        }

        private function _Str_21253(k:_Str_3345):void
        {
            this._isGameMode = false;
        }

        private function _Str_21709(k:_Str_3345):void
        {
            this._isGameMode = true;
        }

        public function get _Str_24765():Boolean
        {
            return this._allowHabboClubDances;
        }

        public function get _Str_22242():Boolean
        {
            return this._habboClubDays > 0;
        }

        public function get _Str_22596():int
        {
            return this._habboClubDays;
        }

        public function get _Str_21813():int
        {
            return this._habboClubPeriods;
        }

        public function get _Str_21502():int
        {
            return this._habboClubLevel;
        }

        public function get _Str_16873():Boolean
        {
            return this._isMinimailEnabled;
        }

        public function get config():IHabboConfigurationManager
        {
            return this._config;
        }

        public function get _Str_4878():Boolean
        {
            return this._hasEffectOn;
        }

        public function get _Str_4107():Boolean
        {
            return this._isDancing;
        }

        public function set _Str_4107(k:Boolean):void
        {
            this._isDancing = k;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_21527():int
        {
            return this.handler.container.messenger.getUnseenMiniMailMessageCount();
        }
    }
}
