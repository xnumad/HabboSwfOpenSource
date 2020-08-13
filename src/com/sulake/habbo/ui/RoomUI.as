package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
	import com.sulake.habbo.ui.IRoomWidgetFactory;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.groups.IHabboGroupsManager;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.advertisement.IAdManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.friendbar.IHabboFriendBar;
    import com.sulake.habbo.friendbar.view.IHabboFriendBarView;
    import com.sulake.habbo.friendbar.IHabboLandingView;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.RoomWidgetFactory;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
    import com.sulake.habbo.room.events.RoomBackgroundColorEvent;
    import com.sulake.habbo.room.events.RoomZoomEvent;
    import com.sulake.habbo.room.events.RoomObjectHSLColorEnabledEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.room.events.RoomEngineRoomAdEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.session.events.RoomSessionPresentEvent;
    import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
    import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
    import com.sulake.habbo.session.events.RoomSessionQueueEvent;
    import com.sulake.habbo.session.events.RoomSessionPollEvent;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
    import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
    import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionDanceEvent;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboGroupsManager;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.habbo.advertisement.events.InterstitialEvent;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboModeration;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.habbo.game.events.GameChatEvent;
    import com.sulake.iid.IIDHabboFriendBar;
    import com.sulake.iid.IIDHabboFriendBarView;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
    import com.sulake.iid.IIDHabboLandingView;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.perk.PerkAllowancesEvent;
    import com.sulake.habbo.toolbar.HabboToolbarEnum;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.advertisement.InterstitialShownMessageComposer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangePostureMessage;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.events._Str_9973;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.room.utils.RoomId;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import flash.events.Event;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent;
    import flash.events.MouseEvent;
    import com.sulake.habbo.freeflowchat.style.IChatStyleLibrary;
	import com.sulake.habbo.session.events.RoomSessionVoteEvent;

    public class RoomUI extends Component implements IRoomUI, IUpdateReceiver 
    {
        private var _windowManager:IHabboWindowManager;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomWidgetFactory:IRoomWidgetFactory;
        private var _sessionDataManager:ISessionDataManager;
        private var _friendList:IHabboFriendsList;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _inventory:IHabboInventory;
        private var _toolbar:IHabboToolbar;
        private var _navigator:IHabboNavigator;
        private var _newNavigator:IHabboNewNavigator;
        private var _habboGroupsManager:IHabboGroupsManager;
        private var _avatarEditor:IHabboAvatarEditor;
        private var _catalog:IHabboCatalog;
        private var _adManager:IAdManager;
        private var _localization:IHabboLocalizationManager;
        private var _habboHelp:IHabboHelp;
        private var _messenger:IHabboMessenger;
        private var _moderation:IHabboModeration;
        private var _soundManager:IHabboSoundManager;
        private var _gameManager:IHabboGameManager;
        private var _friendBar:IHabboFriendBar;
        private var _friendBarView:IHabboFriendBarView;
        private var _landingView:IHabboLandingView;
        private var _questEngine:IHabboQuestEngine;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _communication:IHabboCommunicationManager;
        private var _desktops:Map;
        private var _userChooserState:int;
        private var _interstitialActive:Boolean;
        private var _interstitialRoomId:int;
        private var _habboTracking:IHabboTracking;
        private var _userDefinedRoomEvents:IHabboUserDefinedRoomEvents;
        private var _wasFreeFlowChatPerkAllowedAtInitialize:Boolean = false;
        private var _isInRoom:Boolean = false;
        private var _perkAllowancesMessageEvent:IMessageEvent;

        public function RoomUI(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._userChooserState = RoomDesktop.STATE_UNDEFINED;
            super(k, _arg_2, _arg_3);
            this._roomWidgetFactory = new RoomWidgetFactory(this);
            this._desktops = new Map();
            registerUpdateReceiver(this, 0);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, true, [{
                "type":RoomEngineEvent.ENGINE_INITIALIZED,
                "callback":this.roomEngineEventHandler
            }, {
                "type":RoomEngineEvent.INITIALIZED,
                "callback":this.roomEventHandler
            }, {
                "type":RoomEngineEvent.OBJECTS_INITIALIZED,
                "callback":this.roomEngineEventHandler
            }, {
                "type":RoomEngineEvent.DISPOSED,
                "callback":this.roomEventHandler
            }, {
                "type":RoomEngineEvent.NORMAL_MODE,
                "callback":this.roomEngineEventHandler
            }, {
                "type":RoomEngineEvent.GAME_MODE,
                "callback":this.roomEngineEventHandler
            }, {
                "type":RoomEngineDimmerStateEvent.REDSE_ROOM_COLOR,
                "callback":this.roomEventHandler
            }, {
                "type":RoomBackgroundColorEvent.ROOM_COLOR,
                "callback":this.roomEventHandler
            }, {
                "type":RoomZoomEvent.ROOM_ZOOM,
                "callback":this.roomEventHandler
            }, {
                "type":RoomObjectHSLColorEnabledEvent.ROOM_BACKGROUND_COLOR,
                "callback":this.roomEventHandler
            }, {
                "type":RoomEngineObjectEvent.SELECTED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.DESELECTED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.ADDED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.REMOVED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.PLACED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.REQUEST_MOVE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.REQUEST_ROTATE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.MOUSE_ENTER,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineObjectEvent.MOUSE_LEAVE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.OPEN_WIDGET,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.CLOSE_WIDGET,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_OPEN_FURNI_CONTEXT_MENU,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_CLOSE_FURNI_CONTEXT_MENU,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CREDITFURNI,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_STICKIE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PRESENT,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TROPHY,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TEASER,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ECOTRONBOX,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLACEHOLDER,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_DIMMER,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineRoomAdEvent.FURNI_CLICK,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineRoomAdEvent.FURNI_DOUBLE_CLICK,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineRoomAdEvent.TOOLTIP_SHOW,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineRoomAdEvent.TOOLTIP_HIDE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REMOVE_DIMMER,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CLOTHING_CHANGE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLAYLIST_EDITOR,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MANNEQUIN,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BACKGROUND_COLOR,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_ROOM,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIGH_SCORE_DISPLAY,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_INTERNAL_LINK,
                "callback":this.roomObjectEventHandler
            }, {
                "type":RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ROOM_LINK,
                "callback":this.roomObjectEventHandler
            }]), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, true, [{
                "type":RoomSessionEvent.CREATED,
                "callback":this.roomSessionStateEventHandler
            }, {
                "type":RoomSessionEvent.STARTED,
                "callback":this.roomSessionStateEventHandler
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this.roomSessionStateEventHandler
            }, {
                "type":RoomSessionEvent.ROOM_DATA,
                "callback":this.roomSessionStateEventHandler
            }, {
                "type":RoomSessionChatEvent.RSCE_CHAT_EVENT,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionChatEvent.RSCE_FLOOD_EVENT,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionUserBadgesEvent.RSUBE_BADGES,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionDoorbellEvent.RSDE_DOORBELL,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionDoorbellEvent.REJECTED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionDoorbellEvent.RSDE_ACCEPTED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPresentEvent.RSPE_PRESENT_OPENED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPetPackageEvent.RSOPPE_OPEN_PET_PACKAGE_REQUESTED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPetPackageEvent.RSOPPE_OPEN_PET_PACKAGE_RESULT,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_KICKED,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_HOTEL,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_FLAT,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_MAX_PETS,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_MAX_NUMBER_OF_OWN_PETS,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_NO_FREE_TILES_FOR_PET,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_PET,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_HOTEL,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_FLAT,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_BOT_LIMIT_REACHED,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionErrorMessageEvent.RSEME_BOT_NAME_NOT_ACCEPTED,
                "callback":this.roomSessionDialogEventHandler
            }, {
                "type":RoomSessionQueueEvent.RSQE_QUEUE_STATUS,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPollEvent.RSPE_POLL_CONTENT,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPollEvent.ERROR,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPollEvent.RSPE_POLL_OFFER,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionDimmerPresetsEvent.RSDPE_PRESETS,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionFriendRequestEvent.RSFRE_FRIEND_REQUEST,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionVoteEvent.VOTE_QUESTION,
                "callback":this.roomSessionEventHandler
            },  {
                "type":RoomSessionVoteEvent.VOTE_RESULT,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionUserDataUpdateEvent.RSUDUE_USER_DATA_UPDATED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionDanceEvent.RSDE_DANCE,
                "callback":this.roomSessionEventHandler
            }]), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendList = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }), new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboNewNavigator(), function (k:IHabboNewNavigator):void
            {
                _newNavigator = k;
            }), new ComponentDependency(new IIDHabboGroupsManager(), function (k:IHabboGroupsManager):void
            {
                _habboGroupsManager = k;
            }), new ComponentDependency(new IIDHabboAvatarEditor(), function (k:IHabboAvatarEditor):void
            {
                _avatarEditor = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDHabboAdManager(), function (k:IAdManager):void
            {
                _adManager = k;
            }, true, [{
                "type":InterstitialEvent.INTERSTITIAL_NOT_SHOWN,
                "callback":this.interstitialNotAvailableEventHandler
            }, {
                "type":InterstitialEvent.INTERSTITIAL_COMPLETE,
                "callback":this.interstitialCompleteEventHandler
            }, {
                "type":InterstitialEvent.INTERSTITIAL_SHOW,
                "callback":this.interstitialShowEventHandler
            }, {
                "type":AdEvent.ROOM_AD_SHOW,
                "callback":this.adEventHandler
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            }), new ComponentDependency(new IIDHabboModeration(), function (k:IHabboModeration):void
            {
                _moderation = k;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboUserDefinedRoomEvents(), function (k:IHabboUserDefinedRoomEvents):void
            {
                _userDefinedRoomEvents = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _habboTracking = k;
            }), new ComponentDependency(new IIDHabboGameManager(), function (k:IHabboGameManager):void
            {
                _gameManager = k;
            }, true, [{
                "type":GameChatEvent.GCE_GAME_CHAT,
                "callback":this.gameEventHandler
            }]), new ComponentDependency(new IIDHabboFriendBar(), function (k:IHabboFriendBar):void
            {
                _friendBar = k;
            }), new ComponentDependency(new IIDHabboFriendBarView(), function (k:IHabboFriendBarView):void
            {
                _friendBarView = k;
            }, true, [{
                "type":FriendBarResizeEvent.FBE_BAR_RESIZE_EVENT,
                "callback":this.bottomBarResizeHandler
            }]), new ComponentDependency(new IIDHabboLandingView(), function (k:IHabboLandingView):void
            {
                _landingView = k;
            }), new ComponentDependency(new IIDHabboQuestEngine(), function (k:IHabboQuestEngine):void
            {
                _questEngine = k;
            }), new ComponentDependency(new IIDHabboMessenger(), function (k:IHabboMessenger):void
            {
                _messenger = k;
            }), new ComponentDependency(new IIDHabboFreeFlowChat(), function (k:IHabboFreeFlowChat):void
            {
                _freeFlowChat = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._perkAllowancesMessageEvent = this._communication.addHabboConnectionMessageEvent(new PerkAllowancesEvent(this.onPerkAllowances));
        }

        override public function dispose():void
        {
            var k:String;
            var _local_2:RoomDesktop;
            if (disposed)
            {
                return;
            }
            if (this._roomWidgetFactory != null)
            {
                this._roomWidgetFactory.dispose();
                this._roomWidgetFactory = null;
            }
            if (this._communication != null)
            {
                this._communication.removeHabboConnectionMessageEvent(this._perkAllowancesMessageEvent);
                this._perkAllowancesMessageEvent = null;
            }
            if (this._desktops != null)
            {
                while (this._desktops.length > 0)
                {
                    k = (this._desktops.getKey(0) as String);
                    _local_2 = (this._desktops.remove(k) as RoomDesktop);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                }
                this._desktops.dispose();
                this._desktops = null;
            }
            removeUpdateReceiver(this);
            super.dispose();
        }

        private function roomSessionStateEventHandler(k:RoomSessionEvent):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionEvent.CREATED:
                    this.createDesktop(k.session);
                    if (k.session.isGameSession)
                    {
                        if (this._toolbar)
                        {
                            this._toolbar.updateVisibility(HabboToolbarEnum.HTE_STATE_HIDDEN);
                        }
                        if (this._friendBar)
                        {
                            this._friendBar.visible = false;
                        }
                        if (this._landingView)
                        {
                            this._landingView.disable();
                        }
                        if (this._gameManager)
                        {
                            this._gameManager._Str_15814();
                        }
                    }
                    return;
                case RoomSessionEvent.STARTED:
                    if (this._toolbar)
                    {
                        this.defineToolbarState(k.session);
                    }
                    if (this._landingView)
                    {
                        this._landingView.disable();
                    }
                    if (this._gameManager)
                    {
                        this._gameManager._Str_15814();
                    }
                    return;
                case RoomSessionEvent.ROOM_DATA:
                    this.defineToolbarState(k.session);
                    return;
                case RoomSessionEvent.ENDED:
                    if (k.session != null)
                    {
                        this.disposeDesktop(this.getRoomIdentifier(k.session.roomId));
                        if (k.session.isGameSession)
                        {
                            this._friendBar.visible = true;
                            if (this._gameManager)
                            {
                                this._gameManager._SafeStr_7621();
                            }
                        }
                        else
                        {
                            if (k.openLandingPage)
                            {
                                if (((getBoolean("nux.lobbies.enabled")) && (this._sessionDataManager.isRealNoob)))
                                {
                                    if (((this._navigator.enteredGuestRoomData) && (this._navigator.enteredGuestRoomData.doorMode == RoomSettingsData.DOORMODE_NOOBS_ONLY)))
                                    {
                                        this._navigator.goToHomeRoom();
                                    }
                                    else
                                    {
                                        context.createLinkEvent("navigator/goto/predefined_noob_lobby");
                                    }
                                }
                                else
                                {
                                    if (this._landingView)
                                    {
                                        this._landingView.activate();
                                    }
                                }
                            }
                        }
                    }
                    return;
            }
        }

        private function defineToolbarState(k:IRoomSession):void
        {
            if (((getBoolean("nux.lobbies.enabled")) && (this._sessionDataManager.isRealNoob)))
            {
                if (((k) && (k.isNoobRoom)))
                {
                    this._toolbar.updateVisibility(HabboToolbarEnum.HTE_STATE_NOOB_NOT_HOME);
                }
                else
                {
                    this._toolbar.updateVisibility(HabboToolbarEnum.HETE_STATE_NOOB_HOME);
                }
            }
            else
            {
                this._toolbar.updateVisibility(HabboToolbarEnum.HTE_STATE_ROOM_VIEW);
            }
        }

        private function roomSessionEventHandler(k:RoomSessionEvent):void
        {
            var _local_2:String;
            var _local_3:IRoomDesktop;
            if (this._roomEngine == null)
            {
                return;
            }
            if (k.session != null)
            {
                _local_2 = this.getRoomIdentifier(k.session.roomId);
                _local_3 = this.getDesktop(_local_2);
                if (_local_3 != null)
                {
                    _local_3.processEvent(k);
                }
            }
        }

        private function roomSessionDialogEventHandler(event:RoomSessionEvent):void
        {
            var errorMessage:String;
            var errorTitle:String = "${error.title}";
            switch (event.type)
            {
                case RoomSessionErrorMessageEvent.RSEME_MAX_PETS:
                    errorMessage = "${room.error.max_pets}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_MAX_NUMBER_OF_OWN_PETS:
                    errorMessage = "${room.error.max_own_pets}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_KICKED:
                    errorMessage = "${room.error.kicked}";
                    errorTitle = "${generic.alert.title}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_HOTEL:
                    errorMessage = "${room.error.pets.forbidden_in_hotel}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_FLAT:
                    errorMessage = "${room.error.pets.forbidden_in_flat}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_NO_FREE_TILES_FOR_PET:
                    errorMessage = "${room.error.pets.no_free_tiles}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_PET:
                    errorMessage = "${room.error.pets.selected_tile_not_free}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_HOTEL:
                    errorMessage = "${room.error.bots.forbidden_in_hotel}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_FLAT:
                    errorMessage = "${room.error.bots.forbidden_in_flat}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_BOT_LIMIT_REACHED:
                    errorMessage = "${room.error.max_bots}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT:
                    errorMessage = "${room.error.bots.selected_tile_not_free}";
                    break;
                case RoomSessionErrorMessageEvent.RSEME_BOT_NAME_NOT_ACCEPTED:
                    errorMessage = "${room.error.bots.name.not.accepted}";
                    break;
                default:
                    return;
            }
            this._windowManager.alert(errorTitle, errorMessage, 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }

        private function interstitialShowEventHandler(k:InterstitialEvent):void
        {
            var _local_2:String = this.getRoomIdentifier(this._interstitialRoomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(k);
            }
            this._interstitialActive = true;
        }

        public function triggerbottomBarResize():void
        {
            this.bottomBarResizeHandler(new FriendBarResizeEvent());
        }

        private function bottomBarResizeHandler(k:FriendBarResizeEvent):void
        {
            var _local_2:String = this.getRoomIdentifier(this._roomEngine.activeRoomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(k);
            }
        }

        private function interstitialNotAvailableEventHandler(k:InterstitialEvent):void
        {
            this._interstitialActive = false;
        }

        private function interstitialCompleteEventHandler(k:InterstitialEvent):void
        {
            var _local_4:IRoomSession;
            this._interstitialActive = false;
            if (k.status == "complete")
            {
                this._communication.connection.send(new InterstitialShownMessageComposer());
            }
            var _local_2:String = this.getRoomIdentifier(this._interstitialRoomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(k);
                _local_4 = this._roomSessionManager.getSession(this._roomEngine.activeRoomId);
                if (_local_4 != null)
                {
                    _local_4.sendChangePostureMessage(RoomWidgetChangePostureMessage._Str_1553);
                }
            }
        }

        private function adEventHandler(k:AdEvent):void
        {
            var _local_2:String = this.getRoomIdentifier(k.roomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(k);
            }
        }

        private function onPerkAllowances(k:PerkAllowancesEvent):void
        {
            var _local_2:Timer;
            var _local_3:String;
            var _local_4:RoomDesktop;
            if (((((this._freeFlowChat) && (!(this._freeFlowChat.isDisabledInPreferences))) && (this._isInRoom)) && (!(this._wasFreeFlowChatPerkAllowedAtInitialize))))
            {
                _local_2 = new Timer(250, 1);
                _local_2.addEventListener(TimerEvent.TIMER_COMPLETE, this.delayedAddToStageFreeFlowChat);
                _local_2.start();
            }
            if (this._isInRoom)
            {
                _local_3 = this.getRoomIdentifier(this._roomEngine.activeRoomId);
                _local_4 = (this.getDesktop(_local_3) as RoomDesktop);
                if (_local_4 != null)
                {
                    _local_4.processEvent(new _Str_9973(k.getParser().isPerkAllowed(PerkEnum.MOUSE_ZOOM)));
                }
            }
        }

        private function delayedAddToStageFreeFlowChat(k:TimerEvent):void
        {
            var _local_2:RoomDesktop = (this.getDesktop(this.getRoomIdentifier(this._roomEngine.activeRoomId)) as RoomDesktop);
            if (((_local_2) && (this._freeFlowChat.displayObject)))
            {
                _local_2.layoutManager.getChatContainer().setDisplayObject(this._freeFlowChat.displayObject);
                this._wasFreeFlowChatPerkAllowedAtInitialize = true;
            }
        }

        private function roomEngineEventHandler(k:RoomEngineEvent):void
        {
            var _local_2:String;
            var _local_3:RoomDesktop;
            var _local_4:IRoomSession;
            if (((k.type == RoomEngineEvent.GAME_MODE) || (k.type == RoomEngineEvent.NORMAL_MODE)))
            {
                _local_2 = this.getRoomIdentifier(k.roomId);
                _local_3 = (this.getDesktop(_local_2) as RoomDesktop);
                if (_local_3 != null)
                {
                    _local_3.roomEngineEventHandler(k);
                }
            }
            if (k.roomId == this._interstitialRoomId)
            {
                if (k.type == RoomEngineEvent.OBJECTS_INITIALIZED)
                {
                    if (this._interstitialActive == true)
                    {
                        _local_4 = this._roomSessionManager.getSession(this._interstitialRoomId);
                        if (_local_4 != null)
                        {
                            _local_4.sendAvatarExpressionMessage(AvatarExpressionEnum.IDLE.ordinal);
                        }
                    }
                    this._interstitialActive = false;
                }
                else
                {
                    if (k.type == RoomEngineEvent.DISPOSED)
                    {
                        this._interstitialActive = false;
                    }
                }
            }
        }

        private function roomEventHandler(k:RoomEngineEvent):void
        {
            var _local_4:IRoomSession;
            var _local_5:RoomBackgroundColorEvent;
            var _local_6:RoomZoomEvent;
            var _local_7:RoomObjectHSLColorEnabledEvent;
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_2:String = this.getRoomIdentifier(k.roomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 == null)
            {
                if (this._roomSessionManager == null)
                {
                    return;
                }
                _local_4 = this._roomSessionManager.getSession(k.roomId);
                if (_local_4 != null)
                {
                    _local_3 = (this.createDesktop(_local_4) as RoomDesktop);
                }
            }
            if (_local_3 == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineEvent.INITIALIZED:
                    _local_3.createRoomView(this.getActiveCanvasId(k.roomId));
                    if (((!(this._roomEngine == null)) && (!(RoomId.isRoomPreviewerId(k.roomId)))))
                    {
                        this._roomEngine.setActiveRoom(k.roomId);
                    }
                    _local_3.disposeWidget(RoomWidgetEnum.ROOM_QUEUE);
                    _local_3.createWidget(RoomWidgetEnum.CHAT_WIDGET);
                    if (((this._freeFlowChat) && (!(this._freeFlowChat.isDisabledInPreferences))))
                    {
                        this._wasFreeFlowChatPerkAllowedAtInitialize = true;
                        if (this._freeFlowChat.displayObject != null)
                        {
                            _local_3.layoutManager.getChatContainer().setDisplayObject(this._freeFlowChat.displayObject);
                        }
                    }
                    _local_3.createWidget(RoomWidgetEnum.INFOSTAND);
                    _local_3.createWidget(RoomWidgetEnum.LOCATION_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_TOOLS);
                    if (!_local_3.session.isSpectatorMode)
                    {
                        _local_3.createWidget(RoomWidgetEnum.ME_MENU);
                        _local_3.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
                        _local_3.createWidget(RoomWidgetEnum.FRIEND_REQUEST);
                        if (getBoolean("avatar.widget.enabled"))
                        {
                            _local_3.createWidget(RoomWidgetEnum.AVATAR_INFO);
                        }
                    }
                    _local_3.createWidget(RoomWidgetEnum.FURNI_PLACEHOLDER);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_CREDIT_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_STICKIE_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_PRESENT_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_TROPHY_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_ECOTRONBOX_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_PET_PACKAGE_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.DOORBELL);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_POLL);
					_local_3.createWidget(RoomWidgetEnum.ROOM_VOTE);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_DIMMER);
                    _local_3.createWidget(RoomWidgetEnum.CLOTHING_CHANGE);
                    _local_3.createWidget(RoomWidgetEnum.CONVERSION_TRACKING);
                    if (getBoolean("welcome.gift.feature.enabled"))
                    {
                        _local_3.createWidget(RoomWidgetEnum.WELCOME_GIFT);
                    }
                    if (!getBoolean("memenu.effects.widget.disabled"))
                    {
                        _local_3.createWidget(RoomWidgetEnum.EFFECTS);
                    }
                    _local_3.createWidget(RoomWidgetEnum.MANNEQUIN);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_BACKGROUND_COLOR);
                    _local_3.createWidget(RoomWidgetEnum.CUSTOM_USER_NOTIFICATION);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_CHOOSER);
                    _local_3.createWidget(RoomWidgetEnum.USER_CHOOSER);
                    if (this._userChooserState != RoomDesktop.STATE_UNDEFINED)
                    {
                        _local_3.initializeWidget(RoomWidgetEnum.USER_CHOOSER, this._userChooserState);
                    }
                    _local_3.createWidget(RoomWidgetEnum.PLAYLIST_EDITOR_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.SPAMWALL_POSTIT_WIDGET);
                    _local_3.createWidget(RoomWidgetEnum.FURNITURE_CONTEXT_MENU);
                    _local_3.createWidget(RoomWidgetEnum.CAMERA);
                    _local_3.createWidget(RoomWidgetEnum.FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING);
                    _local_3.createWidget(RoomWidgetEnum.FRIEND_FURNI_CONFIRM);
                    _local_3.createWidget(RoomWidgetEnum.FRIEND_FURNI_ENGRAVING);
                    _local_3.createWidget(RoomWidgetEnum.HIGH_SCORE_DISPLAY);
                    _local_3.createWidget(RoomWidgetEnum.INTERNAL_LINK);
                    _local_3.createWidget(RoomWidgetEnum.CUSTOM_STACK_HEIGHT);
                    _local_3.createWidget(RoomWidgetEnum.YOUTUBE);
                    _local_3.createWidget(RoomWidgetEnum.RENTABLESPACE);
                    _local_3.createWidget(RoomWidgetEnum.VIMEO);
                    _local_3.createWidget(RoomWidgetEnum.EXTERNAL_IMAGE);
                    _local_3.createWidget(RoomWidgetEnum.UI_HELP_BUBBLE);
                    _local_3.createWidget(RoomWidgetEnum.WORD_QUIZZ);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_THUMBNAIL_CAMERA);
                    _local_3.createWidget(RoomWidgetEnum.ROOM_LINK);
                    _local_3.createWidget(RoomWidgetEnum.CRAFTING);
                    this._isInRoom = true;
                    return;
                case RoomEngineEvent.DISPOSED:
                    this.disposeDesktop(_local_2);
                    this._isInRoom = false;
                    return;
                case RoomBackgroundColorEvent.ROOM_COLOR:
                    _local_5 = (k as RoomBackgroundColorEvent);
                    if (_local_5 == null)
                    {
                        return;
                    }
                    if (_local_5.bgOnly)
                    {
                        _local_3.setRoomViewColor(0x000000, 0xFF);
                    }
                    else
                    {
                        _local_3.setRoomViewColor(_local_5.color, _local_5._Str_5123);
                    }
                    return;
                case RoomZoomEvent.ROOM_ZOOM:
                    _local_6 = (k as RoomZoomEvent);
                    if (_local_6 == null)
                    {
                        return;
                    }
                    this._roomEngine.setRoomCanvasScale(this._roomEngine.activeRoomId, this.getActiveCanvasId(this._roomEngine.activeRoomId), ((_local_6.level < 1) ? 0.5 : (1 << (Math.floor(_local_6.level) - 1))), null, null, _local_6.isFlipForced);
                    return;
                case RoomEngineDimmerStateEvent.REDSE_ROOM_COLOR:
                    _local_3.processEvent(k);
                    return;
                case RoomObjectHSLColorEnabledEvent.ROOM_BACKGROUND_COLOR:
                    _local_7 = RoomObjectHSLColorEnabledEvent(k);
                    if (!_local_7.enable)
                    {
                        _local_3.setRoomBackgroundColor(0, 0, 0);
                    }
                    else
                    {
                        _local_3.setRoomBackgroundColor(_local_7.hue, _local_7.saturation, _local_7.lightness);
                    }
                    return;
            }
        }

        private function roomObjectEventHandler(k:RoomEngineObjectEvent):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_2:String = this.getRoomIdentifier(k.roomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.roomObjectEventHandler(k);
            }
        }

        private function gameEventHandler(k:Event):void
        {
            var _local_2:RoomDesktop = (this.getDesktop(this.getRoomIdentifier(0)) as RoomDesktop);
            if (_local_2)
            {
                _local_2.processEvent(k);
            }
        }

        public function createDesktop(k:IRoomSession):IRoomDesktop
        {
            if (k == null)
            {
                return null;
            }
            if (this._roomEngine == null)
            {
                return null;
            }
            var _local_2:String = this.getRoomIdentifier(k.roomId);
            var _local_3:RoomDesktop = (this.getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                return _local_3;
            }
            _local_3 = new RoomDesktop(k, assets, this._communication.connection);
            _local_3.roomEngine = this._roomEngine;
            _local_3.windowManager = this._windowManager;
            _local_3.roomWidgetFactory = this._roomWidgetFactory;
            _local_3.sessionDataManager = this._sessionDataManager;
            _local_3.roomSessionManager = this._roomSessionManager;
            _local_3.communicationManager = this._communication;
            _local_3.friendList = this._friendList;
            _local_3.avatarRenderManager = this._avatarRenderManager;
            _local_3.inventory = this._inventory;
            _local_3.messenger = this._messenger;
            _local_3.toolbar = this._toolbar;
            _local_3.navigator = this._newNavigator.legacyNavigator;
            _local_3.habboGroupsManager = this._habboGroupsManager;
            _local_3.avatarEditor = this._avatarEditor;
            _local_3.catalog = this._catalog;
            _local_3.adManager = this._adManager;
            _local_3.localization = this._localization;
            _local_3.habboHelp = this._habboHelp;
            _local_3.moderation = this._moderation;
            _local_3.config = this;
            _local_3._Str_2476 = this._soundManager;
            _local_3.habboTracking = this._habboTracking;
            _local_3.userDefinedRoomEvents = this._userDefinedRoomEvents;
            _local_3.gameManager = this._gameManager;
            _local_3.questEngine = this._questEngine;
            _local_3.freeFlowChat = this._freeFlowChat;
            var _local_4:XmlAsset = (assets.getAssetByName("room_desktop_layout_xml") as XmlAsset);
            if (_local_4 != null)
            {
                _local_3.layout = (_local_4.content as XML);
            }
            _local_3.createWidget(RoomWidgetEnum.LOADINGBAR);
            _local_3.createWidget(RoomWidgetEnum.ROOM_QUEUE);
            _local_3.init();
            _local_3.requestInterstitial();
            this._interstitialActive = false;
            this._interstitialRoomId = k.roomId;
            this._desktops.add(_local_2, _local_3);
            return _local_3;
        }

        public function get chatContainer():IDisplayObjectWrapper
        {
            var k:RoomDesktop = (this.getDesktop(this.getRoomIdentifier(this._roomEngine.activeRoomId)) as RoomDesktop);
            if (((!(k)) || (!(k.layoutManager))))
            {
                return null;
            }
            return k.layoutManager.getChatContainer();
        }

        public function disposeDesktop(k:String):void
        {
            var _local_3:int;
            var _local_2:RoomDesktop = (this._desktops.remove(k) as RoomDesktop);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getWidgetState(RoomWidgetEnum.USER_CHOOSER);
                if (_local_3 != RoomDesktop.STATE_UNDEFINED)
                {
                    this._userChooserState = _local_3;
                }
                _local_2.dispose();
                this._interstitialActive = false;
            }
        }

        public function getDesktop(k:String):IRoomDesktop
        {
            return this._desktops.getValue(k) as RoomDesktop;
        }

        public function getActiveCanvasId(k:int):int
        {
            return 1;
        }

        public function update(k:uint):void
        {
            var _local_3:RoomDesktop;
            var _local_2:int;
            while (_local_2 < this._desktops.length)
            {
                _local_3 = (this._desktops.getWithIndex(_local_2) as RoomDesktop);
                if (_local_3 != null)
                {
                    _local_3.update();
                }
                _local_2++;
            }
        }

        private function getRoomIdentifier(k:int):String
        {
            return "hard_coded_room_id";
        }

        public function set visible(k:Boolean):void
        {
            var _local_2:RoomDesktop = this._desktops.getValue(this.getRoomIdentifier(this._roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
        }

        public function hideWidget(k:String):void
        {
            var _local_2:RoomDesktop = this._desktops.getValue(this.getRoomIdentifier(this._roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                _local_2.processEvent(new HideRoomWidgetEvent(k));
            }
        }

        public function showGamePlayerName(k:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:RoomDesktop = this._desktops.getValue(this.getRoomIdentifier(this._roomEngine.activeRoomId));
            if (_local_5 != null)
            {
                _local_5.showGamePlayerName(k, _arg_2, _arg_3, _arg_4);
            }
        }

        public function mouseEventPositionHasContextMenu(k:MouseEvent):Boolean
        {
            var _local_2:RoomDesktop = this._desktops.getValue(this.getRoomIdentifier(this._roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                return _local_2.mouseEventPositionHasInputEventWindow(k, 0);
            }
            return false;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get inventory():IHabboInventory
        {
            return this._inventory;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get _Str_2476():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get habboTracking():IHabboTracking
        {
            return this._habboTracking;
        }

        public function get habboGroupsManager():IHabboGroupsManager
        {
            return this._habboGroupsManager;
        }

        public function get friendBarView():IHabboFriendBarView
        {
            return this._friendBarView;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get chatStyleLibrary():IChatStyleLibrary
        {
            if (this._freeFlowChat)
            {
                return this._freeFlowChat.chatStyleLibrary;
            }
            return null;
        }

        public function get freeFlowChat():IHabboFreeFlowChat
        {
            return this._freeFlowChat;
        }

        public function get habboHelp():IHabboHelp
        {
            return this._habboHelp;
        }
    }
}
