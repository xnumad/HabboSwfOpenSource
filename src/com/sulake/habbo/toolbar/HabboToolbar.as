package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.toolbar.extensions.PurseAreaExtension;
    import com.sulake.habbo.toolbar.extensions.SettingsExtension;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.toolbar.extensions.purse.indicators.SeasonalCurrencyIndicator;
    import com.sulake.habbo.toolbar.extensions.ClubDiscountPromoExtension;
    import com.sulake.habbo.toolbar.extensions.CitizenshipVipQuestsPromoExtension;
    import com.sulake.habbo.toolbar.extensions.CitizenshipVipDiscountPromoExtension;
    import com.sulake.habbo.toolbar.extensions.VideoOfferExtension;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.habbo.toolbar.offers.OfferExtension;
    import flash.utils.Timer;
    import com.sulake.habbo.phonenumber.HabboPhoneNumber;
    import com.sulake.iid.IIDHabboPhoneNumber;
    import com.sulake.habbo.nux.HabboNuxDialogs;
    import com.sulake.iid.IIDHabboNuxDialogs;
    import com.sulake.habbo.campaign.HabboCampaigns;
    import com.sulake.iid.IIDHabboCampaigns;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import flash.events.Event;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.iid.IIDCoreLocalizationManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import com.sulake.iid.IIDHabboRoomUI;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
    import com.sulake.iid.IIDHabboGroupForumController;
    import com.sulake.habbo.friendbar.groupforums.UnseenForumsCountUpdatedEvent;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.help.enum.WelcomeNotificationAlignment;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;

    public class HabboToolbar extends Component implements IHabboToolbar 
    {
        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _view:BottomBarLeft;
        private var _bottomBarBackground:BottomBackgroundBorder;
        private var _isInitialized:Boolean;
        private var _purseExtension:PurseAreaExtension;
        private var _settingsExtension:SettingsExtension;
        private var _connection:IConnection;
        private var _catalog:IHabboCatalog;
        private var _messenger:IHabboMessenger;
        private var _navigator:IHabboNavigator;
        private var _newNavigator:IHabboNewNavigator;
        private var _seasonalCurrencyExtension:SeasonalCurrencyIndicator;
        private var _clubDiscountPromoExtension:ClubDiscountPromoExtension;
        private var _citizenShipVipQuestsPromo:CitizenshipVipQuestsPromoExtension;
        private var _citizenshipVipExtendPromo:CitizenshipVipDiscountPromoExtension;
        private var _videoOfferExtension:VideoOfferExtension;
        private var _localization:ICoreLocalizationManager;
        private var _inventory:IHabboInventory;
        private var _extensionView:ExtensionView;
        private var _soundManager:IHabboSoundManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboHelp:IHabboHelp;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _questEngine:IHabboQuestEngine;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _roomUI:IRoomUI;
        private var _offerExtension:OfferExtension;
        private var _removeDimmerTimer:Timer;
        private var _clientPromoTimer:Timer;
        private var _ownRoomPromoTimer:Timer;

        public function HabboToolbar(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            k.attachComponent(new HabboPhoneNumber(k, 0, _arg_3), [new IIDHabboPhoneNumber()]);
            k.attachComponent(new HabboNuxDialogs(k, 0, _arg_3), [new IIDHabboNuxDialogs()]);
            k.attachComponent(new HabboCampaigns(k, 0, _arg_3), [new IIDHabboCampaigns()]);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }, true), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, true, [{
                "type":CatalogEvent.CATALOG_INITIALIZED,
                "callback":this._Str_7785
            }, {
                "type":CatalogEvent.CATALOG_NOT_READY,
                "callback":this._Str_7785
            }, {
                "type":CatalogEvent.CATALOG_NEW_ITEMS_SHOW,
                "callback":this._Str_7785
            }, {
                "type":CatalogEvent.CATALOG_NEW_ITEMS_HIDE,
                "callback":this._Str_7785
            }]), new ComponentDependency(new IIDCoreLocalizationManager(), function (k:ICoreLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }, false, [{
                "type":HabboUnseenItemsUpdatedEvent.HUIUE_UNSEEN_ITEMS_CHANGED,
                "callback":this._Str_19761
            }, {
                "type":HabboInventoryHabboClubEvent.HIHCE_HABBO_CLUB_CHANGED,
                "callback":this._Str_5219
            }]), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }, true, [{
                "type":PerksUpdatedEvent.PERKS_UPDATED,
                "callback":this._Str_12137
            }]), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            }, false), new ComponentDependency(new IIDHabboFreeFlowChat(), function (k:IHabboFreeFlowChat):void
            {
                _freeFlowChat = k;
            }, false), new ComponentDependency(new IIDHabboRoomUI(), function (k:IRoomUI):void
            {
                _roomUI = k;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }, false), new ComponentDependency(new IIDHabboQuestEngine(), function (k:IHabboQuestEngine):void
            {
                _questEngine = k;
            }, false, [{
                "type":UnseenAchievementsCountUpdateEvent.QE_UACUE,
                "callback":this._Str_22354
            }]), new ComponentDependency(new IIDHabboMessenger(), function (k:IHabboMessenger):void
            {
                _messenger = k;
            }, false, [{
                "type":MiniMailMessageEvent.MMME_NEW,
                "callback":this._Str_7885
            }, {
                "type":MiniMailMessageEvent.MMME_UNREAD,
                "callback":this._Str_7885
            }, {
                "type":HabboUnseenItemsUpdatedEvent.HUIUE_UNSEEN_ITEMS_CHANGED,
                "callback":this._Str_19761
            }]), new ComponentDependency(new IIDHabboGroupForumController(), null, false, [{
                "type":UnseenForumsCountUpdatedEvent.UNSEEN_FORUMS_COUNT,
                "callback":this._Str_25396
            }]), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }, false), new ComponentDependency(new IIDHabboNewNavigator(), function (k:IHabboNewNavigator):void
            {
                _newNavigator = k;
            }, false)]));
        }

        override public function dispose():void
        {
            this._isInitialized = false;
            this._connection = null;
            this._Str_19382();
            this._Str_20582();
            this._Str_21196();
            if (this._extensionView)
            {
                this._extensionView.dispose();
                this._extensionView = null;
            }
            if (this._purseExtension)
            {
                this._purseExtension.dispose();
                this._purseExtension = null;
            }
            if (this._settingsExtension)
            {
                this._settingsExtension.dispose();
                this._settingsExtension = null;
            }
            if (this._offerExtension != null)
            {
                this._offerExtension.dispose();
                this._offerExtension = null;
            }
            if (this._clubDiscountPromoExtension)
            {
                this._clubDiscountPromoExtension.dispose();
                this._clubDiscountPromoExtension = null;
            }
            if (this._citizenShipVipQuestsPromo)
            {
                this._citizenShipVipQuestsPromo.dispose();
                this._citizenShipVipQuestsPromo = null;
            }
            if (this._citizenshipVipExtendPromo)
            {
                this._citizenshipVipExtendPromo.dispose();
                this._citizenshipVipExtendPromo = null;
            }
            if (this._videoOfferExtension)
            {
                this._videoOfferExtension.dispose();
                this._videoOfferExtension = null;
            }
            if (this._messenger != null)
            {
                if (this._messenger.events)
                {
                    this._messenger.events.removeEventListener(MiniMailMessageEvent.MMME_NEW, this._Str_7885);
                    this._messenger.events.removeEventListener(MiniMailMessageEvent.MMME_UNREAD, this._Str_7885);
                }
                this._messenger = null;
            }
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
            super.dispose();
        }

        private function onConfigurationComplete(k:Event):void
        {
        }

        override protected function initComponent():void
        {
            var _local_2:int;
            var _local_3:int;
            this._connection = this._communicationManager.connection;
            this._communicationManager.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this._Str_4297));
            this._bottomBarBackground = new BottomBackgroundBorder(this);
            this._view = new BottomBarLeft(this, this._windowManager, assets, events);
            this._view.window.visible = false;
            this._Str_25782();
            this._extensionView = new ExtensionView(this._windowManager, assets, this);
            if (this._view == null)
            {
                Logger.log("Error, toolbar view was not available");
                return;
            }
            var k:String = getProperty("new.user.wing");
            if (k != "")
            {
                _local_2 = (getInteger("new.user.promo.delay", 10) * 1000);
                if (((_local_2 > 0) && (this._clientPromoTimer == null)))
                {
                    this._clientPromoTimer = new Timer(_local_2, 1);
                    this._clientPromoTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                    this._clientPromoTimer.start();
                }
                if (((((k == WingCodeEnum.SOCIAL) || (k == WingCodeEnum.QUEST)) || (k == WingCodeEnum.GROUP)) || (k == WingCodeEnum.GAME)))
                {
                    _local_3 = (getInteger("new.user.promo.room.delay", 180) * 1000);
                    if (((_local_3 > 0) && (this._ownRoomPromoTimer == null)))
                    {
                        this._ownRoomPromoTimer = new Timer(_local_3, 1);
                        this._ownRoomPromoTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onRoomTimerComplete);
                        this._ownRoomPromoTimer.start();
                    }
                }
            }
        }

        private function _Str_12137(k:PerksUpdatedEvent):void
        {
            if (((this._extensionView) && (!(this._isInitialized))))
            {
                this._Str_24103();
                this._Str_23508();
                this._Str_23365();
                this._Str_23455();
                this._Str_23061();
                this._Str_19309();
                this._Str_25525();
                this._Str_23362();
                this._isInitialized = true;
            }
        }

        private function _Str_7785(k:CatalogEvent):void
        {
            if (this._view)
            {
                this._view._Str_7785(k);
            }
        }

        private function _Str_4297(k:IMessageEvent):void
        {
            if (!this._videoOfferExtension)
            {
                this._Str_19309();
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            this._Str_19382();
            var _local_2:String = getProperty("new.user.wing");
            var _local_5:int = WelcomeNotificationAlignment.LEFT;
            var _local_6:String;
            switch (_local_2)
            {
                case WingCodeEnum.SOCIAL:
                    _local_3 = "new.user.promo.social";
                    _local_4 = HabboToolbarIconEnum.NAVIGATOR;
                    _local_6 = "NAVIGATOR";
                    break;
                case WingCodeEnum.GROUP:
                    _local_3 = "new.user.promo.group";
                    _local_4 = HabboToolbarIconEnum.EXT_GROUP;
                    _local_5 = WelcomeNotificationAlignment.RIGHT;
                    break;
                case WingCodeEnum.QUEST:
                    _local_3 = "new.user.promo.quest";
                    _local_4 = HabboToolbarIconEnum.QUESTS;
                    _local_6 = "QUESTS";
                    break;
                case WingCodeEnum.GAME:
                    _local_3 = "new.user.promo.game";
                    _local_4 = HabboToolbarIconEnum.GAMES;
                    _local_6 = "GAMES";
                    break;
                default:
                    return;
            }
            if (this.getIconLocation(_local_4) != null)
            {
                this._habboHelp._Str_8205(_local_4, _local_3, _local_5, _local_6);
            }
        }

        private function onRoomTimerComplete(k:TimerEvent):void
        {
            this._Str_21196();
            this._habboHelp._Str_8205(HabboToolbarIconEnum.NAVIGATOR, "new.user.promo.room", WelcomeNotificationAlignment.LEFT, "NAVIGATOR_ME_TAB");
        }

        private function _Str_25782():void
        {
            var k:int;
            var _local_2:int;
            if (!this._Str_9485())
            {
                return;
            }
            if (getBoolean("room.enter.effect.enabled"))
            {
                k = getInteger("room.enter.effect.delay", 4000);
                _local_2 = getInteger("room.enter.effect.duration", 2000);
                RoomEnterEffect.init(k, _local_2);
                this._Str_14171(IWindowContainer(this._view.window));
                if (this._removeDimmerTimer == null)
                {
                    this._removeDimmerTimer = new Timer((k + _local_2), 1);
                    this._removeDimmerTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                    this._removeDimmerTimer.start();
                }
            }
        }

        private function _Str_24103():void
        {
            this._purseExtension = new PurseAreaExtension(this, this._catalog);
            this._purseExtension._Str_20225()._Str_5219();
        }

        private function _Str_23362():void
        {
            this._settingsExtension = new SettingsExtension(this);
        }

        private function _Str_23508():void
        {
            var k:PurseEvent;
			if (getBoolean("seasonalcurrencyindicator.enabled"))
			{
				for (var i:int = 100; i < 110; i++)
				{
					if (getBoolean("seasoncurrencyindicator." + i + ".enabled"))
					{
						this._seasonalCurrencyExtension = new SeasonalCurrencyIndicator(this, this._windowManager, assets, this._catalog, this._localization, i);
						k = new PurseEvent(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, this._catalog.getPurse().getActivityPointsForType(i), i);
						this._seasonalCurrencyExtension._Str_21326(k);
					}
				};
			}
        }

        private function _Str_23365():void
        {
            if (getBoolean("club.membership.extend.vip.promotion.enabled"))
            {
                this._clubDiscountPromoExtension = new ClubDiscountPromoExtension(this);
            }
        }

        private function _Str_23061():void
        {
            if (getBoolean("citizenship.vip.quest.promotion.enabled"))
            {
                this._citizenShipVipQuestsPromo = new CitizenshipVipQuestsPromoExtension(this, this._windowManager, assets, events, this._localization, this._connection);
            }
        }

        private function _Str_23455():void
        {
            if (getBoolean("club.membership.extend.vip.promotion.enabled"))
            {
                this._citizenshipVipExtendPromo = new CitizenshipVipDiscountPromoExtension(this);
            }
        }

        private function _Str_19309():void
        {
            var k:Boolean = ((!(this._Str_9485())) || (!(getBoolean("new.identity.hide.ui"))));
            if ((((this._catalog.videoOffers.enabled) && (getBoolean("toolbar.extension.video.promo.enabled"))) && (k)))
            {
                this._videoOfferExtension = new VideoOfferExtension(this);
            }
        }

        private function _Str_25525():void
        {
            var k:Boolean = ((!(this._Str_9485())) || (!(getBoolean("new.identity.hide.ui"))));
            if ((((getBoolean("offers.enabled")) && (k)) && (!(getBoolean("offers.habboclub.enabled")))))
            {
                this._offerExtension = new OfferExtension(this, this._windowManager, assets, this._catalog);
            }
        }

        public function _Str_14261():void
        {
            if (((this._settingsExtension) && (this._settingsExtension.window)))
            {
                this._settingsExtension.window.visible = (!(this._settingsExtension.window.visible));
            }
            this.extensionView.refreshItemWindow();
        }

        private function _Str_5360(k:TimerEvent):void
        {
            this._Str_20582();
            if (this._view)
            {
                this._Str_15912((this._view.window as IWindowContainer));
            }
            if (this._extensionView)
            {
                this._extensionView._Str_22962();
            }
        }

        public function _Str_14171(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            if (RoomEnterEffect.isRunning())
            {
                if (k == null)
                {
                    return;
                }
                _local_2 = this._windowManager.createWindow(ToolbarDisplayExtensionIds.TOOLBAR_DIMMER, "", WindowType.WINDOW_TYPE_BORDER, _Str_3108._Str_9798, ((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(0, 0, k.width, k.height), null, 0);
                _local_2.color = 0;
                _local_2.blend = 0.3;
                k.addChild(_local_2);
                k.invalidate();
            }
        }

        public function _Str_15912(k:IWindowContainer):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IWindow = k.findChildByName("toolbar_dimmer");
            if (_local_2 != null)
            {
                k.removeChild(_local_2);
                k.invalidate();
                this._windowManager.destroy(_local_2);
            }
        }

        public function toggleWindowVisibility(k:String):void
        {
            var _local_4:HabboToolbarEvent;
            var _local_5:HabboToolbarEvent;
            var _local_2:String = HabboToolbarIconEnum[k];
            if (_local_2 == HabboToolbarIconEnum.CAMERA)
            {
                _local_4 = new HabboToolbarEvent(HabboToolbarEvent.HTE_ICON_CAMERA);
                _local_4._Str_4856 = HabboToolbarEvent.TOOLBARCAMERAICON;
                events.dispatchEvent(_local_4);
            }
			else if (_local_2 == HabboToolbarIconEnum.MODTOOL)
			{
                _local_4 = new HabboToolbarEvent(HabboToolbarEvent.ICON_MODTOOL);
                events.dispatchEvent(_local_4);
			}
            else
            {
                _local_5 = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
                _local_5._Str_3378 = _local_2;
                _local_5._Str_4856 = k;
                events.dispatchEvent(_local_5);
            }
            var _local_3:EventLogMessageComposer = new EventLogMessageComposer("Toolbar", k, "client.toolbar.clicked");
            if (this._connection)
            {
                this._connection.send(_local_3);
            }
        }

        public function getIconLocation(k:String):Rectangle
        {
            var _local_2:Rectangle;
            if (k == HabboToolbarIconEnum.EXT_GROUP)
            {
                _local_2 = this._extensionView.getIconLocation(k);
            }
            else
            {
                if (this._view)
                {
                    _local_2 = this._view.getIconLocation(k);
                }
            }
            if (((!(_local_2)) && (this._purseExtension)))
            {
                _local_2 = this._purseExtension.getIconLocation(k);
            }
            return _local_2;
        }

        public function _Str_6621(k:String):IWindow
        {
            var _local_2:IWindow;
            if (k == HabboToolbarIconEnum.EXT_GROUP)
            {
                _local_2 = this._extensionView._Str_6621(k);
            }
            else
            {
                if (this._view)
                {
                    _local_2 = this._view._Str_24110(k);
                    if ((_local_2 as IStaticBitmapWrapperWindow))
                    {
                        _local_2 = _local_2.parent;
                    }
                }
            }
            if (((!(_local_2)) && (this._purseExtension)))
            {
                _local_2 = this._purseExtension._Str_6621(k);
            }
            return _local_2;
        }

        public function _Str_4168(k:String, _arg_2:int):void
        {
            if (this._view)
            {
                this._view._Str_4168(k, _arg_2);
            }
        }

        public function updateVisibility(k:String):void
        {
            switch (k)
            {
                case HabboToolbarEnum.HTE_STATE_HOTEL_VIEW:
                case HabboToolbarEnum.HTE_STATE_GAME_CENTER_VIEW:
                    this.visible(true);
                    break;
                case HabboToolbarEnum.HTE_STATE_ROOM_VIEW:
                    this.visible(true);
                    break;
                case HabboToolbarEnum.HTE_STATE_HIDDEN:
                    this.visible(false);
                    break;
            }
            if (this._extensionView != null)
            {
                this._extensionView.landingView = (k == HabboToolbarEnum.HTE_STATE_HOTEL_VIEW);
            }
            if (this._view)
            {
                this._view.updateVisibility(k);
                this._view.window.visible = true;
            }
            if (this._habboHelp != null)
            {
                this._habboHelp._Str_16063 = (!(k == HabboToolbarEnum.HTE_STATE_ROOM_VIEW));
            }
            var _local_2:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_RESIZED);
            events.dispatchEvent(_local_2);
        }

        private function visible(k:Boolean):void
        {
            if (this._extensionView)
            {
                this._extensionView.visible = k;
            }
        }

        public function setAssetUri(k:String, _arg_2:BitmapData):void
        {
            /*var _local_3:BitmapData;
            if (_arg_2 != null)
            {
                _local_3 = _arg_2.clone();
            };*/
            if (this._view)
            {
                this._view.setAssetUri(k, _arg_2);
            }
        }

        public function getRect():Rectangle
        {
            if (this._view)
            {
                return this._view.window.rectangle;
            }
            return new Rectangle();
        }

        public function get extensionView():IExtensionView
        {
            return this._extensionView;
        }

        public function get _Str_2476():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function createTransitionToIcon(k:String, _arg_2:BitmapData, _arg_3:int, _arg_4:int):Motion
        {
            if (((this._view) && (!(this._view.disposed))))
            {
                return this._view._Str_21423(k, _arg_2, _arg_3, _arg_4);
            }
            _arg_2.dispose();
            return null;
        }

        public function _Str_24996():Boolean
        {
            return getBoolean("xmas11.enabled");
        }

        public function _Str_23298():Boolean
        {
            return getBoolean("valentines.enabled");
        }

        public function _Str_9485():Boolean
        {
            return getInteger("new.identity", 0) > 0;
        }

        public function setIconVisibility(k:String, _arg_2:Boolean):void
        {
            if (this._view)
            {
                this._view._Str_4600(k, _arg_2);
            }
        }

        private function _Str_20582():void
        {
            if (this._removeDimmerTimer)
            {
                this._removeDimmerTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                this._removeDimmerTimer.stop();
                this._removeDimmerTimer = null;
            }
        }

        private function _Str_19382():void
        {
            if (this._clientPromoTimer)
            {
                this._clientPromoTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._clientPromoTimer.stop();
                this._clientPromoTimer = null;
            }
        }

        private function _Str_21196():void
        {
            if (this._ownRoomPromoTimer)
            {
                this._ownRoomPromoTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onRoomTimerComplete);
                this._ownRoomPromoTimer.stop();
                this._ownRoomPromoTimer = null;
            }
        }

        private function _Str_7885(k:MiniMailMessageEvent):void
        {
            if (((!(this._messenger)) || (!(this._view))))
            {
                return;
            }
            if (this._view != null)
            {
                this._view._Str_16525 = this._messenger.getUnseenMiniMailMessageCount();
                this._view.memenu._Str_25841 = this._messenger.getUnseenMiniMailMessageCount();
                this._Str_4168(HabboToolbarIconEnum.MEMENU, this._view._Str_16152);
            }
        }

        private function _Str_22354(k:UnseenAchievementsCountUpdateEvent):void
        {
            if (this._view != null)
            {
                this._view._Str_17961 = k.count;
                this._view.memenu._Str_23581 = k.count;
                this._Str_4168(HabboToolbarIconEnum.MEMENU, this._view._Str_16152);
            }
        }

        private function _Str_25396(k:UnseenForumsCountUpdatedEvent):void
        {
            if (this._view != null)
            {
                this._view._Str_9691 = k._Str_9691;
                this._view.memenu._Str_9691 = k._Str_9691;
                this._Str_4168(HabboToolbarIconEnum.MEMENU, this._view._Str_16152);
            }
        }

        public function set onDuty(k:Boolean):void
        {
            if (this._view != null)
            {
                this._view.onDuty = k;
            }
        }

        private function _Str_19761(k:HabboUnseenItemsUpdatedEvent):void
        {
            this._Str_4168(HabboToolbarIconEnum.INVENTORY, k._Str_13996);
            this._Str_4168(HabboToolbarIconEnum.GAMES, k._Str_25582(UnseenItemCategoryEnum.GAMES));
        }

        public function _Str_5219(k:HabboInventoryHabboClubEvent):void
        {
            if (this._purseExtension != null)
            {
                this._purseExtension._Str_20225()._Str_5219(k);
            }
            if (this._citizenshipVipExtendPromo != null)
            {
                this._citizenshipVipExtendPromo._Str_5219(k);
            }
            if (this._videoOfferExtension != null)
            {
                this._videoOfferExtension._Str_5219(k);
            }
            if (this._clubDiscountPromoExtension != null)
            {
                this._clubDiscountPromoExtension._Str_5219(k);
            }
        }

        public function get toolBarAreaWidth():int
        {
            if (this._view)
            {
                return this._view._Str_22465();
            }
            return 0;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get connection():IConnection
        {
            return this._connection;
        }

        public function get navigator():IHabboNavigator
        {
            if (this._newNavigator != null)
            {
                return this._newNavigator._Str_2559;
            }
            return null;
        }

        public function get questEngine():IHabboQuestEngine
        {
            return this._questEngine;
        }

        public function get freeFlowChat():IHabboFreeFlowChat
        {
            return this._freeFlowChat;
        }

        public function get _Str_12052():IRoomUI
        {
            return this._roomUI;
        }

        public function get inventory():IHabboInventory
        {
            return this._inventory;
        }

        public function get localization():ICoreLocalizationManager
        {
            return this._localization;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get messenger():IHabboMessenger
        {
            return this._messenger;
        }
    }
}
