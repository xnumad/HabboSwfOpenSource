package com.sulake.habbo.ui.widget.avatarinfo
{
	import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChangeMottoConfiguration;
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.utils.Timer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.events._Str_3858;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillConfigurationViewBase;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent;
    import com.sulake.habbo.ui.widget.events._Str_5375;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_5393;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_7783;
    import com.sulake.habbo.ui.widget.events._Str_3345;
    import com.sulake.habbo.ui.widget.events._Str_3735;
    import com.sulake.habbo.ui.widget.events._Str_4828;
    import com.sulake.habbo.ui.widget.events._Str_4818;
    import com.sulake.habbo.ui.widget.events._Str_4736;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetInventoryUpdatedMessage;
    import com.sulake.habbo.ui.widget.events._Str_4624;
    import com.sulake.habbo.ui.widget.events._Str_3962;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.events._Str_3174;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.pets.BreedPetsMessageComposer;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillsEnum;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChatterMarkovConfiguration;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChangeNameConfiguration;
    import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillConfigurationView;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.outgoing.inventory.pets.CancelPetBreedingComposer;
    import com.sulake.habbo.communication.messages.outgoing.inventory.pets.ConfirmPetBreedingComposer;
    import com.sulake.habbo.friendlist.IHabboFriendsList;

    public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver, IContextMenuParentWidget
    {
        private static const EFFECT_TYPE_RIDE:int = 77;
        private static const EFFECT_TYPE_DEEP_WATER:int = 29;
        private static const EFFECT_TYPE_SHALLOW_WATER:int = 30;
        private static const EFFECT_TYPE_DEEP_WATER_DARK:int = 185;
        private static const AVATAR_HIGHLIGHT_DURATION_MSEC:int = 5000;
        private static const AVATAR:String = "avatar";
        private static const MINIMIZED_MENU_KEY:String = "use_minimized_own_avatar_menu";

        private var _component:Component;
        private var _configuration:IHabboConfigurationManager;
        private var _view:AvatarContextInfoButtonView;
        private var _decoModeView:DecorateModeView;
        private var _isInitialized:Boolean = false;
        private var _isGameMode:Boolean = false;
        private var _isRoomEnteredOwnAvatarHighlight:Boolean = false;
        private var _avatarHighlightTimer:Timer;
        private var _userInfoData:AvatarInfoData;
        private var _rentableBotInfoData:RentableBotInfoData;
        private var _petInfoData:PetInfoData;
        private var _lastRollOverId:int = -1;
        private var _recycleViews:Boolean = false;
        private var _cachedNameView:AvatarContextInfoButtonView;
        private var _cachedOwnAvatarMenu:OwnAvatarMenuView;
        private var _cachedAvatarMenuView:AvatarMenuView;
        private var _cachedRentableBotMenuView:RentableBotMenuView;
        private var _cachedOwnPetMenuView:OwnPetMenuView;
        private var _cachedPetMenuView:PetMenuView;
        private var _cachedNewUserHelpView:NewUserHelpView;
        private var _avatarNameBubbles:Map;
        private var _useProductBubbles:Map;
        private var _breedPetBubbles:Map;
        private var _useProductConfirmationView:UseProductConfirmationView;
        private var _breedMonsterPlantsConfirmationView:BreedMonsterPlantsConfirmationView;
        private var _confirmPetBreedingView:ConfirmPetBreedingView;
        private var _breedPetsResultView:BreedPetsResultView;
        private var _breedingConfirmationAlert:IAlertDialog;
        private var _breedingConfirmationAlertRequestRoomObjectId:int = -1;
        private var _breedingConfirmationAlertTargetRoomObjectId:int = -1;
        private var _isDancing:Boolean = false;
        private var _handlePetInfo:Boolean = true;
        private var _catalog:IHabboCatalog;
        private var _botSkillConfigurationViews:Map;
        private var _botSkillsWithCommandsMap:Map;
        private var _nestBreedingSuccessView:NestBreedingSuccessView;

        public function AvatarInfoWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboConfigurationManager, _arg_5:IHabboLocalizationManager, _arg_6:Component, _arg_7:IHabboCatalog)
        {
            this._botSkillConfigurationViews = new Map();
            this._botSkillsWithCommandsMap = new Map();
            super(k, _arg_2, _arg_3, _arg_5);
            this._component = _arg_6;
            this._catalog = _arg_7;
            this._configuration = _arg_4;
            this._userInfoData = new AvatarInfoData();
            this._petInfoData = new PetInfoData();
            this._rentableBotInfoData = null;
            this._avatarNameBubbles = new Map();
            this._useProductBubbles = new Map();
            this._breedPetBubbles = new Map();
            this.handler.roomEngine.events.addEventListener(RoomEngineObjectEvent.ADDED, this.onRoomObjectAdded);
            this.handler.roomEngine.events.addEventListener(RoomEngineObjectEvent.REMOVED, this._Str_4159);
            this.handler.container.inventory.events.addEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this._Str_10320);
            this.handler.widget = this;
        }

        public function get component():Component
        {
            return this._component;
        }

        public function get handler():AvatarInfoWidgetHandler
        {
            return _handler as AvatarInfoWidgetHandler;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._configuration;
        }

        public function get localization():IHabboLocalizationManager
        {
            return _localizations;
        }

        public function set _Str_25663(k:Boolean):void
        {
            this._handlePetInfo = k;
        }

        private function onRoomObjectAdded(k:RoomEngineObjectEvent):void
        {
            var _local_2:RoomUserData;
            if (k.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
            {
                _local_2 = this.handler.roomSession.userDataManager.getUserDataByIndex(k.objectId);
                if (_local_2)
                {
                    if (this.handler.friendList.getFriendNames().indexOf(_local_2.name) > -1)
                    {
                        this._Str_21156(_local_2, k.objectId);
                    }
                }
            }
        }

        private function _Str_4159(k:RoomEngineObjectEvent):void
        {
            var _local_2:int;
            var _local_3:UserNameView;
            var _local_4:Array;
            var _local_5:BreedPetView;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:UseProductView;
            if (k.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
            {
                for each (_local_3 in this._avatarNameBubbles)
                {
                    if (_local_3.objectId == k.objectId)
                    {
                        this.removeView(_local_3, false);
                    }
                }
                _local_4 = [];
                for each (_local_5 in this._breedPetBubbles)
                {
                    _local_2 = _local_5._Str_3710;
                    if (_local_2 == _local_6)
                    {
                        _local_4.push(_local_5);
                    }
                }
                for each (_local_5 in _local_4)
                {
                    this.removeView(_local_5, false);
                }
                if (this._breedMonsterPlantsConfirmationView != null)
                {
                    if (((k.objectId == this._breedMonsterPlantsConfirmationView._Str_3710) || (k.objectId == this._breedMonsterPlantsConfirmationView._Str_5563)))
                    {
                        this._Str_8286();
                    }
                }
                if (this._confirmPetBreedingView != null)
                {
                    if (((k.objectId == this._confirmPetBreedingView._Str_3710) || (k.objectId == this._confirmPetBreedingView._Str_5563)))
                    {
                        this._Str_10453();
                    }
                }
                if (this._useProductConfirmationView != null)
                {
                    if (((k.objectId == this._useProductConfirmationView._Str_20466) || (k.objectId == this._useProductConfirmationView._Str_5563)))
                    {
                        this.removeUseProductConfirmationView();
                    }
                }
            }
            if (k.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
            {
                _local_6 = k.objectId;
                if (this._useProductConfirmationView != null)
                {
                    if (this._useProductConfirmationView._Str_20466 == _local_6)
                    {
                        this.removeUseProductConfirmationView();
                    }
                }
                if (this._breedPetsResultView != null)
                {
                    this._breedPetsResultView._Str_17192(_local_6);
                }
                _local_7 = [];
                for each (_local_8 in this._useProductBubbles)
                {
                    _local_2 = _local_8._Str_3710;
                    if (_local_2 == _local_6)
                    {
                        _local_7.push(_local_8);
                    }
                }
                for each (_local_8 in _local_7)
                {
                    this.removeView(_local_8, false);
                }
            }
        }

        public function _Str_23386(k:Array):void
        {
            var _local_2:_Str_3858;
            var _local_3:RoomUserData;
            this.removeUseProductViews();
            this.removeUseProductConfirmationView();
            this._Str_8286();
            for each (_local_2 in k)
            {
                _local_3 = this.handler.roomSession.userDataManager.getUserDataByIndex(_local_2.id);
                this.showUseProductMenu(_local_3, _local_2);
            }
        }

        public function _Str_24967(k:Array):void
        {
            var _local_2:_Str_3858;
            var _local_3:RoomUserData;
            this._Str_11447();
            this.removeUseProductConfirmationView();
            this._Str_8286();
            for each (_local_2 in k)
            {
                _local_3 = this.handler.roomSession.userDataManager.getUserDataByIndex(_local_2.id);
                this.showBreedPetMenu(_local_3, _local_2);
            }
        }

        private function _Str_10320(k:HabboInventoryEffectsEvent):void
        {
            if ((this._view is OwnAvatarMenuView))
            {
                (this._view as OwnAvatarMenuView)._Str_2771();
            }
        }

        private function _Str_25716():void
        {
            messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OWN_CHARACTER_INFO, 0, 0));
        }

        override public function dispose():void
        {
            var k:UserNameView;
            var _local_2:UseProductView;
            var _local_3:BreedPetView;
            var _local_4:int;
            if (disposed)
            {
                return;
            }
            this.removeAvatarHighlightTimer();
            for each (k in this._avatarNameBubbles)
            {
                k.dispose();
            }
            this._avatarNameBubbles = null;
            for each (_local_2 in this._useProductBubbles)
            {
                _local_2.dispose();
            }
            this._useProductBubbles = null;
            for each (_local_3 in this._breedPetBubbles)
            {
                _local_3.dispose();
            }
            this._breedPetBubbles = null;
            if (this._component)
            {
                this._component.removeUpdateReceiver(this);
                this._component = null;
            }
            if (this._cachedNameView)
            {
                this._cachedNameView.dispose();
                this._cachedNameView = null;
            }
            if (this._cachedAvatarMenuView)
            {
                this._cachedAvatarMenuView.dispose();
                this._cachedAvatarMenuView = null;
            }
            if (this._cachedOwnAvatarMenu)
            {
                this._cachedOwnAvatarMenu.dispose();
                this._cachedOwnAvatarMenu = null;
            }
            if (this._cachedRentableBotMenuView)
            {
                this._cachedRentableBotMenuView.dispose();
                this._cachedRentableBotMenuView = null;
            }
            if (this._cachedPetMenuView)
            {
                this._cachedPetMenuView.dispose();
                this._cachedPetMenuView = null;
            }
            if (this._view)
            {
                if (!this._view.disposed)
                {
                    this._view.dispose();
                    this._view = null;
                }
            }
            if (this._decoModeView)
            {
                this._decoModeView.dispose();
                this._decoModeView = null;
            }
            if (this._useProductConfirmationView)
            {
                this._useProductConfirmationView.dispose();
                this._useProductConfirmationView = null;
            }
            this._Str_8286();
            this._Str_10453();
            if (this._breedPetsResultView)
            {
                this._breedPetsResultView.dispose();
                this._breedPetsResultView = null;
            }
            if (this._breedingConfirmationAlert)
            {
                this._breedingConfirmationAlert.dispose();
                this._breedingConfirmationAlert = null;
            }
            if (this._botSkillConfigurationViews)
            {
                for each (_local_4 in this._botSkillConfigurationViews.getKeys())
                {
                    BotSkillConfigurationViewBase(this._botSkillConfigurationViews.getValue(_local_4)).dispose();
                }
                this._botSkillConfigurationViews.dispose();
                this._botSkillConfigurationViews = null;
            }
            if (((this._botSkillsWithCommandsMap) && (this._botSkillsWithCommandsMap.length > 0)))
            {
                this._botSkillsWithCommandsMap.dispose();
                this._botSkillsWithCommandsMap = null;
            }
            this.handler.roomEngine.events.removeEventListener(RoomEngineObjectEvent.ADDED, this.onRoomObjectAdded);
            this.handler.roomEngine.events.removeEventListener(RoomEngineObjectEvent.REMOVED, this._Str_4159);
            this.handler.container.inventory.events.removeEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this._Str_10320);
            this._view = null;
            this._configuration = null;
            super.dispose();
        }

        public function close():void
        {
            this.removeView(this._view, false);
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (!k)
            {
                return;
            }
            k.addEventListener(RoomWidgetRentableBotForceOpenContextMenuEvent.OPEN, this.updateEventHandler);
            k.addEventListener(_Str_5375.RWRBSLUE_SKILL_LIST, this.updateEventHandler);
            k.addEventListener(RoomWidgetRentableBotInfoUpdateEvent.RENTABLE_BOT, this.updateEventHandler);
            k.addEventListener(_Str_5393.RWAIE_AVATAR_INFO, this.updateEventHandler);
            k.addEventListener(RoomWidgetUserInfoUpdateEvent.OWN_USER, this.updateEventHandler);
            k.addEventListener(RoomWidgetUserInfoUpdateEvent.PEER, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this.updateEventHandler);
            k.addEventListener(RoomWidgetFurniInfostandUpdateEvent.FURNI, this.updateEventHandler);
            k.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT, this.updateEventHandler);
            k.addEventListener(RoomWidgetPetInfostandUpdateEvent.PET_INFO, this.updateEventHandler);
            k.addEventListener(_Str_7783.RWUDUE_USER_DATA_UPDATED, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this.updateEventHandler);
            k.addEventListener(_Str_3345.RWREUE_NORMAL_MODE, this.updateEventHandler);
            k.addEventListener(_Str_3345.RWREUE_GAME_MODE, this.updateEventHandler);
            k.addEventListener(_Str_3735.RWONE_TYPE, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OVER, this.updateEventHandler);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OUT, this.updateEventHandler);
            k.addEventListener(_Str_4828.RWPIUE_PET_STATUS_UPDATE, this.updateEventHandler);
            k.addEventListener(_Str_4818.RWPLUE_PET_LEVEL_UPDATE, this.updateEventHandler);
            k.addEventListener(_Str_4736.RWPBRE_PET_BREEDING_RESULT, this.updateEventHandler);
            k.addEventListener(RoomWidgetPetBreedingEvent.PET_BREEDING, this.updateEventHandler);
            k.addEventListener(RoomWidgetInventoryUpdatedMessage.RWIUM_INVENTORY_UPDATED, this.updateEventHandler);
            k.addEventListener(_Str_4624.RWPPBE_CONFIRM_PET_BREEDING_, this.updateEventHandler);
            k.addEventListener(_Str_3962.RWPPBE_CONFIRM_PET_BREEDING_RESULT, this.updateEventHandler);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetRentableBotForceOpenContextMenuEvent.OPEN, this.updateEventHandler);
            k.removeEventListener(_Str_5375.RWRBSLUE_SKILL_LIST, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRentableBotInfoUpdateEvent.RENTABLE_BOT, this.updateEventHandler);
            k.removeEventListener(_Str_5393.RWAIE_AVATAR_INFO, this.updateEventHandler);
            k.removeEventListener(RoomWidgetUserInfoUpdateEvent.OWN_USER, this.updateEventHandler);
            k.removeEventListener(RoomWidgetUserInfoUpdateEvent.PEER, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this.updateEventHandler);
            k.removeEventListener(RoomWidgetFurniInfostandUpdateEvent.FURNI, this.updateEventHandler);
            k.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT, this.updateEventHandler);
            k.removeEventListener(RoomWidgetPetInfostandUpdateEvent.PET_INFO, this.updateEventHandler);
            k.removeEventListener(_Str_7783.RWUDUE_USER_DATA_UPDATED, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this.updateEventHandler);
            k.removeEventListener(_Str_3345.RWREUE_NORMAL_MODE, this.updateEventHandler);
            k.removeEventListener(_Str_3345.RWREUE_GAME_MODE, this.updateEventHandler);
            k.removeEventListener(_Str_3735.RWONE_TYPE, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OUT, this.updateEventHandler);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OUT, this.updateEventHandler);
            k.removeEventListener(_Str_4828.RWPIUE_PET_STATUS_UPDATE, this.updateEventHandler);
            k.removeEventListener(_Str_4818.RWPLUE_PET_LEVEL_UPDATE, this.updateEventHandler);
            k.removeEventListener(_Str_4736.RWPBRE_PET_BREEDING_RESULT, this.updateEventHandler);
            k.removeEventListener(RoomWidgetPetBreedingEvent.PET_BREEDING, this.updateEventHandler);
            k.removeEventListener(RoomWidgetInventoryUpdatedMessage.RWIUM_INVENTORY_UPDATED, this.updateEventHandler);
            k.removeEventListener(_Str_4624.RWPPBE_CONFIRM_PET_BREEDING_, this.updateEventHandler);
            k.removeEventListener(_Str_3962.RWPPBE_CONFIRM_PET_BREEDING_RESULT, this.updateEventHandler);
        }

        private function updateEventHandler(k:RoomWidgetUpdateEvent):void
        {
            var _local_2:_Str_5393;
            var _local_3:_Str_4828;
            var _local_4:_Str_4818;
            var _local_5:_Str_4736;
            var _local_6:BreedPetsResultData;
            var _local_7:BreedPetsResultData;
            var _local_8:RoomWidgetPetBreedingEvent;
            var _local_9:int;
            var _local_10:int;
            var _local_11:_Str_4624;
            var _local_12:_Str_3962;
            var _local_13:RoomWidgetUserInfoUpdateEvent;
            var _local_14:AvatarInfoData;
            var _local_15:RoomWidgetRentableBotInfoUpdateEvent;
            var _local_16:IRoomSession;
            var _local_17:RoomUserData;
            var _local_18:_Str_5375;
            var _local_19:RoomWidgetRentableBotForceOpenContextMenuEvent;
            var _local_20:RoomWidgetUserInfoUpdateEvent;
            var _local_21:RoomWidgetRoomObjectUpdateEvent;
            var _local_22:RoomUserData;
            var _local_23:RoomUserData;
            var _local_24:int;
            var _local_25:RoomUserData;
            var _local_26:RoomWidgetPetInfostandUpdateEvent;
            var _local_27:UserNameView;
            switch (k.type)
            {
                case _Str_5393.RWAIE_AVATAR_INFO:
                    _local_2 = (k as _Str_5393);
                    this._isRoomEnteredOwnAvatarHighlight = (((!(this._isInitialized)) && (!(this.handler.container.roomSession == null))) && (_local_2.roomIndex == this.handler.container.roomSession.ownUserRoomId));
                    if (_local_2.allowNameChange)
                    {
                        this.useMinimizedOwnAvatarMenu = true;
                        this._Str_19679();
                    }
                    else
                    {
                        this.updateUserView(_local_2.userId, _local_2.userName, _local_2.userType, _local_2.roomIndex, _local_2.allowNameChange, null);
                    }
                    this._isInitialized = true;
                    break;
                case _Str_3735.RWONE_TYPE:
                    if (_Str_3735(k).category == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
                    {
                        this.updateUserView(_Str_3735(k).userId, _Str_3735(k).userName, _Str_3735(k).userType, _Str_3735(k).roomIndex, false, null);
                    }
                    break;
                case RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED:
                    if (RoomWidgetRoomObjectUpdateEvent(k).category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
                    {
                        if (this._breedPetsResultView != null)
                        {
                            this._breedPetsResultView._Str_23033(RoomWidgetRoomObjectUpdateEvent(k).id);
                        }
                    }
                    break;
                case RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED:
                    if (RoomWidgetRoomObjectUpdateEvent(k).category == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
                    {
                        this._handlePetInfo = true;
                    }
                    this._Str_11447();
                    break;
                case RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED:
                    if (((this._view) && (!(this._view is NewUserHelpView))))
                    {
                        this.removeView(this._view, false);
                    }
                    this.removeUseProductViews();
                    this._Str_11447();
                    break;
                case RoomWidgetFurniInfostandUpdateEvent.FURNI:
                    if (this._view)
                    {
                        this.removeView(this._view, false);
                    }
                    this.removeUseProductViews();
                    this._Str_11447();
                    break;
                case RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OVER:
                    if (this._isRoomEnteredOwnAvatarHighlight)
                    {
                        return;
                    }
                    if (!(((((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)) || (this._view is OwnPetMenuView)) || (this._view is NewUserHelpView)) || (this._view is RentableBotMenuView)))
                    {
                        this._lastRollOverId = RoomWidgetRoomObjectUpdateEvent(k).id;
                        messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_NAME, RoomWidgetRoomObjectUpdateEvent(k).id, RoomWidgetRoomObjectUpdateEvent(k).category));
                    }
                    break;
                case RoomWidgetRoomObjectUpdateEvent.OBJECT_ROLL_OUT:
                    if (this._isRoomEnteredOwnAvatarHighlight)
                    {
                        return;
                    }
                    if (!(((((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)) || (this._view is OwnPetMenuView)) || (this._view is NewUserHelpView)) || (this._view is RentableBotMenuView)))
                    {
                        if (RoomWidgetRoomObjectUpdateEvent(k).id == this._lastRollOverId)
                        {
                            if (((this._view) && (!(this._view.allowNameChange))))
                            {
                                this.removeView(this._view, false);
                                this._lastRollOverId = -1;
                            }
                        }
                    }
                    break;
                case _Str_4828.RWPIUE_PET_STATUS_UPDATE:
                    _local_3 = (k as _Str_4828);
                    if (((this._view) && (this._view is OwnPetMenuView)))
                    {
                        if (((!(_local_3 == null)) && (!(this._petInfoData == null))))
                        {
                            _local_22 = this.handler.roomSession.userDataManager.getUserDataByIndex(_local_3.petId);
                            if (((!(_local_22 == null)) && (_local_22.id == this._petInfoData.id)))
                            {
                                this.removeView(this._view, true);
                            }
                        }
                    }
                    if (_local_3 != null)
                    {
                        this._Str_18983(_local_3.petId);
                    }
                    break;
                case _Str_4818.RWPLUE_PET_LEVEL_UPDATE:
                    _local_4 = (k as _Str_4818);
                    if (((this._view) && (this._view is OwnPetMenuView)))
                    {
                        if (((!(_local_4 == null)) && (!(this._petInfoData == null))))
                        {
                            _local_23 = this.handler.roomSession.userDataManager.getUserDataByIndex(_local_4.petId);
                            if (((!(_local_23 == null)) && (_local_23.id == this._petInfoData.id)))
                            {
                                this.removeView(this._view, true);
                            }
                        }
                    }
                    if (_local_4 != null)
                    {
                        this._Str_18983(_local_4.petId);
                    }
                    break;
                case _Str_4736.RWPBRE_PET_BREEDING_RESULT:
                    _local_5 = (k as _Str_4736);
                    _local_6 = new BreedPetsResultData();
                    _local_6.stuffId = _local_5._Str_3713.stuffId;
                    _local_6.classId = _local_5._Str_3713.classId;
                    _local_6.productCode = _local_5._Str_3713.productCode;
                    _local_6.userId = _local_5._Str_3713.userId;
                    _local_6.userName = _local_5._Str_3713.userName;
                    _local_6.rarityLevel = _local_5._Str_3713.rarityLevel;
                    _local_6._Str_4788 = _local_5._Str_3713._Str_4788;
                    _local_7 = new BreedPetsResultData();
                    _local_7.stuffId = _local_5.resultData2.stuffId;
                    _local_7.classId = _local_5.resultData2.classId;
                    _local_7.productCode = _local_5.resultData2.productCode;
                    _local_7.userId = _local_5.resultData2.userId;
                    _local_7.userName = _local_5.resultData2.userName;
                    _local_7.rarityLevel = _local_5.resultData2.rarityLevel;
                    _local_7._Str_4788 = _local_5.resultData2._Str_4788;
                    this._Str_23663(_local_6, _local_7);
                    break;
                case RoomWidgetPetBreedingEvent.PET_BREEDING:
                    _local_8 = (k as RoomWidgetPetBreedingEvent);
                    _local_9 = this._Str_12418(_local_8.ownPetId);
                    _local_10 = this._Str_12418(_local_8.otherPetId);
                    switch (_local_8.state)
                    {
                        case RoomWidgetPetBreedingEvent.TYPE_START:
                            this._Str_16495(_local_9, _local_10, false);
                            break;
                        case RoomWidgetPetBreedingEvent.TYPE_CANCEL:
                            this.cancelBreedingPets(_local_9, _local_10);
                            break;
                        case RoomWidgetPetBreedingEvent.TYPE_ACCEPT:
                            this.acceptBreedingPets(_local_9, _local_10);
                            break;
                        case RoomWidgetPetBreedingEvent.TYPE_REQUEST:
                            this._Str_16495(_local_9, _local_10, true);
                            break;
                    }
                    break;
                case RoomWidgetInventoryUpdatedMessage.RWIUM_INVENTORY_UPDATED:
                    if (this._breedPetsResultView != null)
                    {
                        this._breedPetsResultView._Str_16499();
                    }
                    break;
                case _Str_4624.RWPPBE_CONFIRM_PET_BREEDING_:
                    _local_11 = (k as _Str_4624);
                    this._Str_22316(_local_11.pet1, _local_11.pet2, _local_11.nestId, _local_11.rarityCategories, _local_11.resultPetTypeId);
                    break;
                case _Str_3962.RWPPBE_CONFIRM_PET_BREEDING_RESULT:
                    _local_12 = (k as _Str_3962);
                    switch (_local_12.result)
                    {
                        case _Str_3962._Str_5196:
                            this._Str_10453();
                            break;
                        case _Str_3962.INVALID_NAME:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.name.invalid.head}", "${breedpets.confirmation.alert.name.invalid.desc}");
                            if (this._confirmPetBreedingView)
                            {
                                this._confirmPetBreedingView.enable();
                            }
                            break;
                        case _Str_3962._Str_16705:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.nonest.head}", "${breedpets.confirmation.alert.nonest.desc}");
                            this._Str_10453();
                            break;
                        case _Str_3962._Str_18855:
                            windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.petsmissing.head}", "${breedpets.confirmation.alert.petsmissing.desc}");
                            this._Str_10453();
                            break;
                    }
                    break;
                case RoomWidgetUserInfoUpdateEvent.OWN_USER:
                case RoomWidgetUserInfoUpdateEvent.PEER:
                    _local_13 = (k as RoomWidgetUserInfoUpdateEvent);
                    this._userInfoData.populate(_local_13);
                    _local_14 = ((_local_13.isSpectatorMode) ? null : this._userInfoData);
                    this.updateUserView(_local_13.id, _local_13.name, _local_13.userType, _local_13.userRoomId, this._userInfoData.allowNameChange, _local_14);
                    break;
                case RoomWidgetRentableBotInfoUpdateEvent.RENTABLE_BOT:
                    _local_15 = (k as RoomWidgetRentableBotInfoUpdateEvent);
                    if (!this._rentableBotInfoData)
                    {
                        this._rentableBotInfoData = new RentableBotInfoData();
                    }
                    this._rentableBotInfoData.populate(_local_15);
                    _local_16 = this.handler.container.roomSessionManager.getSession(_local_24);
                    if (!_local_16)
                    {
                        return;
                    }
                    _local_17 = _local_16.userDataManager._Str_17237(_local_15.id);
                    if (!_local_17)
                    {
                        return;
                    }
                    this._botSkillsWithCommandsMap[_local_15.id.toString()] = _local_17.botSkillData;
                    if (((this._rentableBotInfoData) && (_local_17.botSkillData)))
                    {
                        this._rentableBotInfoData._Str_19891(_local_17.botSkillData);
                    }
                    this.updateRentableBotView(_local_15.id, _local_15.name, _local_15.userRoomId, this._rentableBotInfoData);
                    break;
                case _Str_5375.RWRBSLUE_SKILL_LIST:
                    _local_18 = (k as _Str_5375);
                    this._botSkillsWithCommandsMap[_local_18.botId.toString()] = _local_18._Str_10833;
                    if (this._rentableBotInfoData)
                    {
                        this._rentableBotInfoData._Str_19891(_local_18._Str_10833);
                        this.updateRentableBotView(this._rentableBotInfoData.id, this._rentableBotInfoData.name, this._rentableBotInfoData.roomIndex, this._rentableBotInfoData, true);
                    }
                    break;
                case RoomWidgetRentableBotForceOpenContextMenuEvent.OPEN:
                    _local_19 = (k as RoomWidgetRentableBotForceOpenContextMenuEvent);
                    if (this._rentableBotInfoData)
                    {
                        this.updateRentableBotView(this._rentableBotInfoData.id, this._rentableBotInfoData.name, this._rentableBotInfoData.roomIndex, this._rentableBotInfoData, false, true);
                    }
                    else
                    {
                        _local_24 = this.handler.container.roomEngine.activeRoomId;
                        _local_25 = this.handler.container.roomSessionManager.getSession(_local_24).userDataManager.getUserDataByType(_local_19.botId, 4);
                        messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO, _local_25.roomObjectId, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER));
                        this.handler.container.roomEngine.selectAvatar(_local_24, _local_25.roomObjectId);
                    }
                    break;
                case RoomWidgetUserInfoUpdateEvent.BOT:
                    _local_20 = (k as RoomWidgetUserInfoUpdateEvent);
                    this.updateUserView(_local_20.id, _local_20.name, _local_20.userType, _local_20.userRoomId, false, null);
                    break;
                case RoomWidgetPetInfostandUpdateEvent.PET_INFO:
                    if (this._handlePetInfo)
                    {
                        _local_26 = (k as RoomWidgetPetInfostandUpdateEvent);
                        this._petInfoData.populate(_local_26);
                        this.updatePetView(_local_26.id, _local_26.name, _local_26.roomIndex, this._petInfoData);
                    }
                    break;
                case _Str_7783.RWUDUE_USER_DATA_UPDATED:
                    if (!this._isInitialized)
                    {
                        this._Str_25716();
                    }
                    break;
                case RoomWidgetRoomObjectUpdateEvent.USER_REMOVED:
                    _local_21 = (k as RoomWidgetRoomObjectUpdateEvent);
                    if (((this._view) && (this._view.roomIndex == _local_21.id)))
                    {
                        this.removeView(this._view, false);
                    }
                    for each (_local_27 in this._avatarNameBubbles)
                    {
                        if (_local_27.objectId == _local_21.id)
                        {
                            this.removeView(_local_27, false);
                            break;
                        }
                    }
                    this._Str_18983(_local_21.id);
                    break;
                case _Str_3345.RWREUE_NORMAL_MODE:
                    this._isGameMode = false;
                    break;
                case _Str_3345.RWREUE_GAME_MODE:
                    this._isGameMode = true;
                    break;
            }
            this.checkUpdateNeed();
        }

        private function _Str_12418(k:int):int
        {
            var _local_5:IRoomObject;
            var _local_6:RoomUserData;
            var _local_2:int = this.handler.container.roomSession.roomId;
            var _local_3:int = this.handler.container.roomEngine.getRoomObjectCount(_local_2, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = this.handler.container.roomEngine.getRoomObjectWithIndex(_local_2, _local_4, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                _local_6 = this.handler.container.roomSession.userDataManager.getUserDataByIndex(_local_5.getId());
                if (((_local_6 == null) || (!(_local_6.type == RoomObjectTypeEnum.PET))))
                {
                }
                else
                {
                    if (_local_6.id == k)
                    {
                        return _local_5.getId();
                    }
                }
                _local_4++;
            }
            return -1;
        }

        private function _Str_18983(k:int):void
        {
            var _local_3:BreedPetView;
            var _local_4:BreedPetView;
            var _local_2:Array = new Array();
            for each (_local_3 in this._breedPetBubbles)
            {
                if (((_local_3.objectId == k) || (_local_3._Str_3710 == k)))
                {
                    if (_local_2.indexOf(_local_3) == -1)
                    {
                        _local_2.push(_local_3);
                    }
                }
            }
            for each (_local_4 in _local_2)
            {
                this.removeView(_local_4, false);
            }
        }

        public function _Str_19679():void
        {
            var _local_3:RoomWidgetRoomObjectMessage;
            if ((((!(this.handler)) || (!(this.handler.container))) || (!(this.handler.roomSession))))
            {
                return;
            }
            var k:int = this.handler.container.sessionDataManager.userId;
            var _local_2:RoomUserData = this.handler.roomSession.userDataManager.getUserData(k);
            if (!_local_2)
            {
                return;
            }
            _local_3 = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_SELECT_OBJECT, _local_2.roomObjectId, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
            this.handler.container.processWidgetMessage(_local_3);
        }

        public function get _Str_22586():String
        {
            var _local_2:IRoomObjectModel;
            var k:IRoomObject = this._Str_13836();
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    return _local_2.getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                }
            }
            return AvatarAction.POSTURE_STAND;
        }

        public function get canStandUp():Boolean
        {
            var _local_2:IRoomObjectModel;
            var k:IRoomObject = this._Str_13836();
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    return _local_2.getNumber(RoomObjectVariableEnum.FIGURE_CAN_STAND_UP) > 0;
                }
            }
            return false;
        }

        public function get isSwimming():Boolean
        {
            var _local_2:IRoomObjectModel;
            var _local_3:Number;
            var k:IRoomObject = this._Str_13836();
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT);
                    return ((_local_3 == EFFECT_TYPE_DEEP_WATER) || (_local_3 == EFFECT_TYPE_SHALLOW_WATER)) || (_local_3 == EFFECT_TYPE_DEEP_WATER_DARK);
                }
            }
            return false;
        }

        private function updateRentableBotView(k:int, _arg_2:String, _arg_3:int, _arg_4:RentableBotInfoData, _arg_5:Boolean=false, _arg_6:Boolean=false):void
        {
            if (!_arg_4)
            {
                return;
            }
            var _local_7:Boolean = this._configuration.getBoolean("menu.bot.enabled");
            var _local_8:Boolean = ((_arg_5) && (!(this._view)));
            if (_arg_6)
            {
                _local_8 = false;
            }
            if ((((_local_7) && (this._view)) && (!(((((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)) || (this._view is PetMenuView)) || (this._view is OwnPetMenuView)) || (this._view is RentableBotMenuView)))))
            {
                this.removeView(this._view, false);
            }
            this.removeUseProductViews();
            if ((((((((_arg_6) || (((!(this._view == null)) && (this._view.userId == k)) && (!(_arg_5)))) || (this._view == null)) || (!(this._view.userId == k))) || (!(this._view.userName == _arg_2))) || (!(this._view.roomIndex == _arg_3))) || (!(this._view.userType == RoomObjectTypeEnum.RENTABLE_BOT))))
            {
                if (this._view)
                {
                    this.removeView(this._view, false);
                }
                if (!this._isGameMode)
                {
                    if (!this._cachedRentableBotMenuView)
                    {
                        this._cachedRentableBotMenuView = new RentableBotMenuView(this);
                    }
                    if (!_local_8)
                    {
                        this._view = this._cachedRentableBotMenuView;
                        RentableBotMenuView.setup((this._view as RentableBotMenuView), k, _arg_2, _arg_3, RoomObjectTypeEnum.RENTABLE_BOT, _arg_4);
                    }
                }
            }
            else
            {
                if ((this._view is RentableBotMenuView))
                {
                    if (this._view.userName == _arg_2)
                    {
                        this.removeView(this._view, false);
                    }
                }
            }
        }

        private function updatePetView(k:int, _arg_2:String, _arg_3:int, _arg_4:PetInfoData):void
        {
            if (!_arg_4)
            {
                return;
            }
            if (((this._view) && (!(((((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)) || (this._view is PetMenuView)) || (this._view is OwnPetMenuView)) || (this._view is RentableBotMenuView)))))
            {
                this.removeView(this._view, false);
            }
            this.removeUseProductViews();
            if ((((((this._view == null) || (!(this._view.userId == k))) || (!(this._view.userName == _arg_2))) || (!(this._view.roomIndex == _arg_3))) || (!(this._view.userType == RoomObjectTypeEnum.PET))))
            {
                if (this._view)
                {
                    this.removeView(this._view, false);
                }
                if (!this._isGameMode)
                {
                    if (_arg_4._Str_5175)
                    {
                        if (!this._cachedOwnPetMenuView)
                        {
                            this._cachedOwnPetMenuView = new OwnPetMenuView(this, this._catalog);
                        }
                        this._view = this._cachedOwnPetMenuView;
                        OwnPetMenuView.setup((this._view as OwnPetMenuView), k, _arg_2, _arg_3, RoomObjectTypeEnum.PET, _arg_4);
                    }
                    else
                    {
                        if (!this._cachedPetMenuView)
                        {
                            this._cachedPetMenuView = new PetMenuView(this);
                        }
                        this._view = this._cachedPetMenuView;
                        PetMenuView.setup((this._view as PetMenuView), k, _arg_2, _arg_3, RoomObjectTypeEnum.PET, _arg_4);
                    }
                }
            }
            else
            {
                if (((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)))
                {
                    if (this._view.userName == _arg_2)
                    {
                        this.removeView(this._view, false);
                    }
                }
            }
        }

        private function updateUserView(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:AvatarInfoData):void
        {
            var _local_8:UserNameView;
            var _local_7:* = (!(_arg_6 == null));
            if ((((_local_7) && (this._view)) && (!(((((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)) || (this._view is PetMenuView)) || (this._view is OwnPetMenuView)) || (this._view is RentableBotMenuView)))))
            {
                this.removeView(this._view, false);
            }
            this.removeUseProductViews();
            if (((((((this._view == null) || (!(this._view.userId == k))) || (!(this._view.userName == _arg_2))) || (!(this._view.roomIndex == _arg_4))) || (!(this._view.userType == RoomObjectTypeEnum.HABBO))) || (_arg_5)))
            {
                if (this._view)
                {
                    this.removeView(this._view, false);
                }
                if (!this._isGameMode)
                {
                    if (_local_7)
                    {
                        if (_arg_6.isOwnUser)
                        {
                            if (this.isUserDecorating)
                            {
                                return;
                            }
                            if (RoomEnterEffect.isRunning())
                            {
                                if (!this._cachedNewUserHelpView)
                                {
                                    this._cachedNewUserHelpView = new NewUserHelpView(this);
                                }
                                this._view = this._cachedNewUserHelpView;
                                NewUserHelpView.setup((this._view as NewUserHelpView), k, _arg_2, _arg_4, RoomObjectTypeEnum.HABBO);
                            }
                            else
                            {
                                if (!this._cachedOwnAvatarMenu)
                                {
                                    this._cachedOwnAvatarMenu = new OwnAvatarMenuView(this);
                                }
                                this._view = this._cachedOwnAvatarMenu;
                                OwnAvatarMenuView.setup((this._view as OwnAvatarMenuView), k, _arg_2, _arg_4, RoomObjectTypeEnum.HABBO, _arg_6);
                            }
                        }
                        else
                        {
                            if (!this._cachedAvatarMenuView)
                            {
                                this._cachedAvatarMenuView = new AvatarMenuView(this);
                            }
                            this._view = this._cachedAvatarMenuView;
                            AvatarMenuView.setup((this._view as AvatarMenuView), k, _arg_2, _arg_4, _arg_3, _arg_6);
                            for each (_local_8 in this._avatarNameBubbles)
                            {
                                if (_local_8.userId == k)
                                {
                                    this.removeView(_local_8, false);
                                    break;
                                }
                            }
                        }
                    }
                    else
                    {
                        if (!this.handler.roomEngine.getIsSelectedObjectInValidPosition)
                        {
                            if (!this._cachedNameView)
                            {
                                this._cachedNameView = new AvatarContextInfoButtonView(this);
                            }
                            this._view = this._cachedNameView;
                            if (this.handler.container.sessionDataManager.userId == k)
                            {
                                AvatarContextInfoButtonView.setup(this._view, k, _arg_2, _arg_4, _arg_3, _arg_5);
                                if (this._isRoomEnteredOwnAvatarHighlight)
                                {
                                    this._catalog.windowManager.registerHintWindow(AVATAR, this._view.window);
                                    this._catalog.windowManager.showHint(AVATAR);
                                    if (!this.handler.container.sessionDataManager.isNoob)
                                    {
                                        this.setAvatarHightlightTimer();
                                    }
                                }
                            }
                            else
                            {
                                AvatarContextInfoButtonView.setup(this._view, k, _arg_2, _arg_4, _arg_3, _arg_5, true);
                            }
                        }
                    }
                }
            }
            else
            {
                if (((this._view is AvatarMenuView) || (this._view is OwnAvatarMenuView)))
                {
                    if (this._view.userName == _arg_2)
                    {
                        this.removeView(this._view, false);
                    }
                }
            }
        }

        public function removeView(k:ContextInfoView, _arg_2:Boolean):void
        {
            this._isRoomEnteredOwnAvatarHighlight = false;
            this.removeAvatarHighlightTimer();
            if (k)
            {
                if (this._recycleViews)
                {
                    k.hide(_arg_2);
                }
                else
                {
                    k.dispose();
                    this._cachedNameView = null;
                    this._cachedAvatarMenuView = null;
                    this._cachedOwnAvatarMenu = null;
                    this._cachedOwnPetMenuView = null;
                    this._cachedRentableBotMenuView = null;
                    this._cachedPetMenuView = null;
                    this._cachedNewUserHelpView = null;
                }
                if (k == this._view)
                {
                    this._view = null;
                }
                if ((k is UserNameView))
                {
                    this._avatarNameBubbles.remove((k as UserNameView).userName);
                    k.dispose();
                    this.checkUpdateNeed();
                }
                if ((k is UseProductView))
                {
                    this._useProductBubbles.remove((k as UseProductView).userId);
                    k.dispose();
                    this.checkUpdateNeed();
                }
                if ((k is BreedPetView))
                {
                    this._breedPetBubbles.remove((k as BreedPetView).userId);
                    k.dispose();
                    this.checkUpdateNeed();
                }
            }
        }

        public function removeUseProductViews():void
        {
            var k:UseProductView;
            for each (k in this._useProductBubbles)
            {
                k.dispose();
            }
            this._useProductBubbles.reset();
            this.checkUpdateNeed();
        }

        public function _Str_11447():void
        {
            var k:BreedPetView;
            for each (k in this._breedPetBubbles)
            {
                k.dispose();
            }
            this._breedPetBubbles.reset();
            this.checkUpdateNeed();
        }

        public function _Str_21156(k:RoomUserData, _arg_2:int):void
        {
            var _local_3:UserNameView;
            if (this._avatarNameBubbles[k.name] == null)
            {
                _local_3 = new UserNameView(this);
                UserNameView.setup(_local_3, k.id, k.name, -1, RoomObjectTypeEnum.HABBO, _arg_2);
                this._avatarNameBubbles[k.name] = _local_3;
                this.checkUpdateNeed();
            }
        }

        public function showGamePlayerName(k:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:UserNameView;
            if (this._avatarNameBubbles[_arg_2] == null)
            {
                _local_5 = new UserNameView(this, true);
                UserNameView.setup(_local_5, k, _arg_2, k, RoomObjectTypeEnum.HABBO, k, _arg_3, _arg_4);
                this._avatarNameBubbles[_arg_2] = _local_5;
                this.checkUpdateNeed();
            }
        }

        private function showUseProductMenu(k:RoomUserData, _arg_2:_Str_3858):void
        {
            var _local_3:UseProductView;
            if (this._useProductBubbles[k.id.toString()] == null)
            {
                _local_3 = new UseProductView(this);
                UseProductView.setup(_local_3, k.id, k.name, -1, RoomObjectTypeEnum.PET, _arg_2);
                this._useProductBubbles[k.id.toString()] = _local_3;
                this.checkUpdateNeed();
            }
        }

        private function showBreedPetMenu(k:RoomUserData, _arg_2:_Str_3858):void
        {
            var _local_3:BreedPetView;
            if (this._breedPetBubbles[k.id.toString()] == null)
            {
                _local_3 = new BreedPetView(this);
                BreedPetView.setup(_local_3, k.id, k.name, -1, RoomObjectTypeEnum.PET, _arg_2, k.canBreed);
                this._breedPetBubbles[k.id.toString()] = _local_3;
                this.checkUpdateNeed();
            }
        }

        private function setAvatarHightlightTimer():void
        {
            this._avatarHighlightTimer = new Timer(AVATAR_HIGHLIGHT_DURATION_MSEC);
            this._avatarHighlightTimer.addEventListener(TimerEvent.TIMER, this.onAvatarHighlightTimerEvent);
            this._avatarHighlightTimer.start();
        }

        private function removeAvatarHighlightTimer():void
        {
            this._isRoomEnteredOwnAvatarHighlight = false;
            this._catalog.windowManager.unregisterHintWindow(AVATAR);
            if (!this._avatarHighlightTimer)
            {
                return;
            }
            this._avatarHighlightTimer.stop();
            this._avatarHighlightTimer = null;
        }

        private function onAvatarHighlightTimerEvent(k:TimerEvent):void
        {
            this.removeAvatarHighlightTimer();
        }

        public function checkUpdateNeed():void
        {
            if (!this._component)
            {
                return;
            }
            if ((((((this._view) || (this._avatarNameBubbles.length > 0)) || (this._useProductBubbles.length > 0)) || (this._breedPetBubbles.length > 0)) || ((this._decoModeView) && (this._decoModeView.isVisible))))
            {
                this._component.registerUpdateReceiver(this, 10);
            }
            else
            {
                this._component.removeUpdateReceiver(this);
            }
        }

        public function update(k:uint):void
        {
            var _local_2:_Str_3174;
            var _local_3:UserNameView;
            var _local_4:UseProductView;
            var _local_5:BreedPetView;
            if (this._view)
            {
                _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, this._view.userId, this._view.userType)) as _Str_3174);
                if (!_local_2)
                {
                    return;
                }
                this._view.update(_local_2.rectangle, _local_2._Str_9337, k);
            }
            if (((this._decoModeView) && (this._decoModeView.isVisible())))
            {
                _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, this._decoModeView.userId, this._decoModeView.userType)) as _Str_3174);
                if (!_local_2)
                {
                    return;
                }
                this._decoModeView.update(_local_2.rectangle, _local_2._Str_9337, k);
            }
            for each (_local_3 in this._avatarNameBubbles)
            {
                if (_local_3._Str_23492)
                {
                    _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION, _local_3.userId, _local_3.userType)) as _Str_3174);
                }
                else
                {
                    _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, _local_3.userId, _local_3.userType)) as _Str_3174);
                }
                if (_local_2)
                {
                    _local_3.update(_local_2.rectangle, _local_2._Str_9337, k);
                }
            }
            for each (_local_4 in this._useProductBubbles)
            {
                _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, _local_4.userId, _local_4.userType)) as _Str_3174);
                if (_local_2)
                {
                    _local_4.update(_local_2.rectangle, _local_2._Str_9337, k);
                }
            }
            for each (_local_5 in this._breedPetBubbles)
            {
                _local_2 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, _local_5.userId, _local_5.userType)) as _Str_3174);
                if (_local_2)
                {
                    _local_5.update(_local_2.rectangle, _local_2._Str_9337, k);
                }
            }
        }

        public function _Str_25121():void
        {
            this.handler.container.avatarEditor.openEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR, null, null, true);
            this.handler.container.avatarEditor.loadOwnAvatarInEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
        }

        public function get _Str_6454():Boolean
        {
            return this.handler.container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB;
        }

        public function get hasVip():Boolean
        {
            return this.handler.container.sessionDataManager.clubLevel >= HabboClubLevelEnum.VIP;
        }

        public function get _Str_4878():Boolean
        {
            var _local_2:IWidgetAvatarEffect;
            var k:Array = this.handler.container.inventory.getActivatedAvatarEffects();
            for each (_local_2 in k)
            {
                if (_local_2._Str_3222)
                {
                    return true;
                }
            }
            return false;
        }

        public function set _Str_4107(k:Boolean):void
        {
            this._isDancing = k;
        }

        public function get _Str_4107():Boolean
        {
            return this._isDancing;
        }

        public function get _Str_3859():Boolean
        {
            if (this._petInfoData != null)
            {
                return this._petInfoData.saddle;
            }
            return false;
        }

        public function get isRiding():Boolean
        {
            if (this._petInfoData != null)
            {
                return this._petInfoData.rider;
            }
            return false;
        }

        public function get _Str_25831():Boolean
        {
            var _local_2:IRoomObjectModel;
            var _local_3:Number;
            var k:IRoomObject = this._Str_13836();
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT);
                    if (_local_3 == EFFECT_TYPE_RIDE)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public function _Str_23877():void
        {
            this.handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent(RoomWidgetPetCommandsUpdateEvent.OPEN_PET_TRAINING));
        }

        public function _Str_25401():void
        {
            this.handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent(RoomWidgetPetCommandsUpdateEvent.CLOSE_PET_TRAINING));
        }

        public function get useMinimizedOwnAvatarMenu():Boolean
        {
            return this.handler.container.config.getBoolean(MINIMIZED_MENU_KEY);
        }

        public function set useMinimizedOwnAvatarMenu(k:Boolean):void
        {
            this.handler.container.config.setProperty(MINIMIZED_MENU_KEY, ((k) ? "1" : "0"));
        }

        public function sendSignRequest(k:int):void
        {
            this.handler.container.roomSession.sendSignMessage(k);
        }

        public function showUseProductConfirmation(k:int, _arg_2:int, _arg_3:int):void
        {
            if (!this._useProductConfirmationView)
            {
                this._useProductConfirmationView = new UseProductConfirmationView(this);
            }
            this._useProductConfirmationView.open(k, _arg_2, _arg_3);
        }

        private function removeUseProductConfirmationView():void
        {
            if (this._useProductConfirmationView)
            {
                this._useProductConfirmationView.dispose();
                this._useProductConfirmationView = null;
            }
        }

        public function showBreedingPetsWaitingConfirmationAlert(k:int, _arg_2:int):void
        {
            this.removeBreedingPetsWaitingConfirmationAlert();
            this._breedingConfirmationAlert = windowManager.confirm("${breedpets.confirmation.notification.title}", "${breedpets.confirmation.notification.text}", 0, this.onWaitingConfirmationAlert);
            this._breedingConfirmationAlertRequestRoomObjectId = k;
            this._breedingConfirmationAlertTargetRoomObjectId = _arg_2;
        }

        public function onWaitingConfirmationAlert(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
            }
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_CANCEL)
            {
                if (((!(this._breedingConfirmationAlertTargetRoomObjectId == -1)) && (!(this._breedingConfirmationAlertTargetRoomObjectId == -1))))
                {
                    this._Str_19339(this._breedingConfirmationAlertRequestRoomObjectId, this._breedingConfirmationAlertTargetRoomObjectId);
                }
            }
            this.removeBreedingPetsWaitingConfirmationAlert();
        }

        private function removeBreedingPetsWaitingConfirmationAlert():void
        {
            if (this._breedingConfirmationAlert != null)
            {
                this._breedingConfirmationAlert.dispose();
                this._breedingConfirmationAlert = null;
                this._breedingConfirmationAlertRequestRoomObjectId = -1;
                this._breedingConfirmationAlertTargetRoomObjectId = -1;
            }
        }

        public function acceptBreedingPets(k:int, _arg_2:int):void
        {
            if (this._breedMonsterPlantsConfirmationView != null)
            {
                if (((this._breedMonsterPlantsConfirmationView._Str_3710 == k) && (this._breedMonsterPlantsConfirmationView._Str_5563 == _arg_2)))
                {
                    this._Str_8286();
                }
            }
            if (this._breedingConfirmationAlert != null)
            {
                this._breedingConfirmationAlert.dispose();
            }
        }

        public function cancelBreedingPets(k:int, _arg_2:int):void
        {
            if (this._breedMonsterPlantsConfirmationView != null)
            {
                if (((this._breedMonsterPlantsConfirmationView._Str_3710 == k) && (this._breedMonsterPlantsConfirmationView._Str_5563 == _arg_2)))
                {
                    this._Str_8286();
                }
            }
            this.removeBreedingPetsWaitingConfirmationAlert();
            windowManager.alert("${breedpets.cancel.notification.title}", "${breedpets.cancel.notification.text}", 0, this._Str_25650);
        }

        public function _Str_25650(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) || (_arg_2.type == WindowEvent.WINDOW_EVENT_CANCEL)))
            {
                k.dispose();
            }
        }

        public function _Str_16495(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (!this._breedMonsterPlantsConfirmationView)
            {
                this._breedMonsterPlantsConfirmationView = new BreedMonsterPlantsConfirmationView(this);
            }
            this._breedMonsterPlantsConfirmationView.open(k, _arg_2, _arg_3);
        }

        public function _Str_22316(k:ConfirmPetBreedingPetData, _arg_2:ConfirmPetBreedingPetData, _arg_3:int, _arg_4:Array, _arg_5:int):void
        {
            if (!this._confirmPetBreedingView)
            {
                this._confirmPetBreedingView = new ConfirmPetBreedingView(this);
            }
            var _local_6:int = this._Str_12418(k.webId);
            var _local_7:int = this._Str_12418(_arg_2.webId);
            this._confirmPetBreedingView.open(_local_6, _local_7, _arg_3, _arg_4, _arg_5, k.level, _arg_2.level);
        }

        private function _Str_8286():void
        {
            if (this._breedMonsterPlantsConfirmationView)
            {
                this._breedMonsterPlantsConfirmationView.dispose();
                this._breedMonsterPlantsConfirmationView = null;
            }
        }

        private function _Str_10453():void
        {
            if (this._confirmPetBreedingView)
            {
                this._confirmPetBreedingView.dispose();
                this._confirmPetBreedingView = null;
            }
        }

        public function _Str_23663(k:BreedPetsResultData, _arg_2:BreedPetsResultData):void
        {
            if (!this._breedPetsResultView)
            {
                this._breedPetsResultView = new BreedPetsResultView(this);
            }
            this._breedPetsResultView.open(k, _arg_2);
        }

        public function _Str_24769(k:BreedPetsResultView):void
        {
            if (k != null)
            {
                if (k == this._breedPetsResultView)
                {
                    this._breedPetsResultView.dispose();
                    this._breedPetsResultView = null;
                }
                else
                {
                    k.dispose();
                }
            }
        }

        private function _Str_13836():IRoomObject
        {
            var _local_6:IRoomObject;
            var _local_7:RoomUserData;
            var k:int = this.handler.container.sessionDataManager.userId;
            var _local_2:int = this.handler.roomEngine.activeRoomId;
            var _local_3:int = RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
            var _local_4:int = this.handler.roomEngine.getRoomObjectCount(_local_2, _local_3);
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_6 = this.handler.roomEngine.getRoomObjectWithIndex(_local_2, _local_5, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                if (_local_6 != null)
                {
                    _local_7 = this.handler.roomSession.userDataManager.getUserDataByIndex(_local_6.getId());
                    if (_local_7 != null)
                    {
                        if (_local_7.id == k)
                        {
                            return _local_6;
                        }
                    }
                }
                _local_5++;
            }
            return null;
        }

        internal function get isUserDecorating():Boolean
        {
            return this.handler.roomSession.isUserDecorating;
        }

        internal function set isUserDecorating(k:Boolean):void
        {
            var _local_2:int;
            var _local_3:_Str_3174;
            var _local_4:String;
            var _local_5:int;
            this.handler.roomSession.isUserDecorating = k;
            if (k)
            {
                _local_2 = this.handler.container.sessionDataManager.userId;
                if (!this._decoModeView)
                {
                    _local_4 = this.handler.container.sessionDataManager.userName;
                    _local_5 = this.handler.container.roomSession.ownUserRoomId;
                    this._decoModeView = new DecorateModeView(this, _local_2, _local_4, _local_5);
                }
                this._decoModeView.show();
                _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, _local_2, RoomObjectTypeEnum.HABBO)) as _Str_3174);
                if (_local_3)
                {
                    this._decoModeView.update(_local_3.rectangle, _local_3._Str_9337, 0);
                }
            }
            else
            {
                if (this._decoModeView)
                {
                    this._decoModeView.hide(false);
                }
            }
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function _Str_20290():Boolean
        {
            if (this._petInfoData != null)
            {
                return this._petInfoData._Str_4355 == PetTypeEnum.MONSTERPLANT;
            }
            return false;
        }

        public function _Str_19339(k:int, _arg_2:int):void
        {
            var _local_3:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(k);
            var _local_4:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                this.handler.container.connection.send(new BreedPetsMessageComposer(BreedPetsMessageComposer._Str_8664, _local_3.id, _local_4.id));
            }
        }

        public function _Str_24933(k:int, _arg_2:int):void
        {
            var _local_3:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(k);
            var _local_4:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                this.handler.container.connection.send(new BreedPetsMessageComposer(BreedPetsMessageComposer._Str_9186, _local_3.id, _local_4.id));
            }
        }

        public function _Str_22619(k:int, _arg_2:int):void
        {
            var _local_3:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(k);
            var _local_4:RoomUserData = this.handler.container.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            if (((_local_3) && (_local_4)))
            {
                this.handler.container.connection.send(new BreedPetsMessageComposer(BreedPetsMessageComposer._Str_17533, _local_3.id, _local_4.id));
            }
        }

        public function _Str_21992(k:int, _arg_2:int, _arg_3:Point=null):void
        {
            if (!this._botSkillConfigurationViews.hasKey(_arg_2))
            {
                switch (_arg_2)
                {
                    case BotSkillsEnum.SETUP_CHAT:
                        this._botSkillConfigurationViews.add(BotSkillsEnum.SETUP_CHAT, new BotChatterMarkovConfiguration(this));
                        break;
                    case BotSkillsEnum.CHANGE_BOT_NAME:
                        this._botSkillConfigurationViews.add(BotSkillsEnum.CHANGE_BOT_NAME, new BotChangeNameConfiguration(this));
                        break;
					case BotSkillsEnum.CHANGE_BOT_MOTTO:
                        this._botSkillConfigurationViews.add(BotSkillsEnum.CHANGE_BOT_MOTTO, new BotChangeMottoConfiguration(this));
                    default:
                        return;
                }
            }
            var _local_4:BotSkillConfigurationView = this._botSkillConfigurationViews.getValue(_arg_2);
            _local_4.open(k, _arg_3);
        }

        public function _Str_24617(k:int):void
        {
            this.handler.container.connection.send(new CancelPetBreedingComposer(k));
        }

        public function _Str_23246(k:int, _arg_2:String, _arg_3:int, _arg_4:int):void
        {
            this.handler.container.connection.send(new ConfirmPetBreedingComposer(k, _arg_2, _arg_3, _arg_4));
        }

        public function _Str_24481(k:int, _arg_2:int):void
        {
            if (this._nestBreedingSuccessView == null)
            {
                this._nestBreedingSuccessView = new NestBreedingSuccessView(this);
            }
            var _local_3:int = this._Str_12418(k);
            this._nestBreedingSuccessView.open(_local_3, _arg_2);
        }

        public function get friendList():IHabboFriendsList
        {
            return this.handler.friendList;
        }
    }
}
