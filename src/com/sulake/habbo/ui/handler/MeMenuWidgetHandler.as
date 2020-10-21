package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarExpressionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangePostureMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetEffectsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSelectEffectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenInventoryMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenCatalogMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStopEffectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetNavigateToRoomMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSelectOutfitMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetShowOwnRoomsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMeMenuMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetSettingsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStoreSettingsMessage;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.ui.widget.events._Str_5638;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.ui.widget.events._Str_5907;
    import com.sulake.habbo.ui.widget.events._Str_4656;
    import com.sulake.habbo.ui.widget.events._Str_3963;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.events._Str_3950;
    import com.sulake.habbo.ui.widget.events._Str_4677;

    public class MeMenuWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _inventory:IHabboInventory;
        private var _toolbar:IHabboToolbar;
        private var _catalog:IHabboCatalog;
        private var _widget:MeMenuWidget;

        public function MeMenuWidgetHandler()
        {
            Logger.log("[MeMenuWidgetHandler]");
        }

        public function set widget(k:MeMenuWidget):void
        {
            this._widget = k;
        }

        public function dispose():void
        {
            if (((this._container) && (this._container.avatarEditor)))
            {
                this._container.avatarEditor.close(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            }
            this._isDisposed = true;
            this.container = null;
            this._inventory = null;
            this._toolbar = null;
            this._catalog = null;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.ME_MENU;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            if (this._container != null)
            {
                if ((((this._inventory) && (!(this._inventory.disposed))) && (this._inventory.events)))
                {
                    this._inventory.events.removeEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this.onAvatarEffectsChanged);
                    this._inventory.events.removeEventListener(HabboInventoryHabboClubEvent.HIHCE_HABBO_CLUB_CHANGED, this.onHabboClubSubscriptionChanged);
                }
                if ((((this._toolbar) && (!(this._toolbar.disposed))) && (this._toolbar.events)))
                {
                    this._toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onHabboToolbarEvent);
                }
                if ((((this._container.habboHelp) && (!(this._container.habboHelp.disposed))) && (this._container.habboHelp.events)))
                {
                    this._container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.HHTPNUFWE_LIGHT_CLOTHES_ICON, this.onHelpTutorialEvent);
                    this._container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.HHTPNUFWE_AVATAR_TUTORIAL_START, this.onHelpTutorialEvent);
                }
                if ((((this._container.catalog) && (!(this._container.catalog.disposed))) && (this._container.catalog.events)))
                {
                    this._container.catalog.events.removeEventListener(PurseEvent.CATALOG_PURSE_CREDIT_BALANCE, this.onCreditBalance);
                }
                if ((((this._container.messenger) && (!(this._container.messenger.disposed))) && (this._container.messenger.events)))
                {
                    this._container.messenger.events.removeEventListener(MiniMailMessageEvent.MMME_NEW, this.onMiniMailNewMessage);
                    this._container.messenger.events.removeEventListener(MiniMailMessageEvent.MMME_UNREAD, this.onMiniMailUnreadCount);
                }
            }
            this._container = k;
            if (this._container == null)
            {
                return;
            }
            this._inventory = this._container.inventory;
            if (this._inventory != null)
            {
                this._inventory.events.addEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this.onAvatarEffectsChanged);
                this._inventory.events.addEventListener(HabboInventoryHabboClubEvent.HIHCE_HABBO_CLUB_CHANGED, this.onHabboClubSubscriptionChanged);
            }
            this._toolbar = this._container.toolbar;
            if (((this._toolbar) && (this._toolbar.events)))
            {
                this._toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onHabboToolbarEvent);
            }
            if (this._container.habboHelp != null)
            {
                this._container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.HHTPNUFWE_LIGHT_CLOTHES_ICON, this.onHelpTutorialEvent);
                this._container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.HHTPNUFWE_AVATAR_TUTORIAL_START, this.onHelpTutorialEvent);
            }
            this._catalog = this._container.catalog;
            if (this._container.catalog != null)
            {
                this._container.catalog.events.addEventListener(PurseEvent.CATALOG_PURSE_CREDIT_BALANCE, this.onCreditBalance);
            }
            if ((((this._container.messenger) && (!(this._container.messenger.disposed))) && (this._container.messenger.events)))
            {
                this._container.messenger.events.addEventListener(MiniMailMessageEvent.MMME_NEW, this.onMiniMailNewMessage);
                this._container.messenger.events.addEventListener(MiniMailMessageEvent.MMME_UNREAD, this.onMiniMailUnreadCount);
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        private function onHabboToolbarEvent(k:HabboToolbarEvent):void
        {
            if ((((this.disposed) || (!(this._container))) || (!(this._container.events))))
            {
                return;
            }
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                switch (k.iconId)
                {
                    case HabboToolbarIconEnum.MEMENU:
                        return;
                }
            }
        }

        public function getWidgetMessages():Array
        {
            var k:Array = [];
            k.push(RoomWidgetAvatarExpressionMessage.RWCM_MESSAGE_AVATAR_EXPRESSION);
            k.push(RoomWidgetDanceMessage.RWCM_MESSAGE_DANCE);
            k.push(RoomWidgetChangePostureMessage.RWCPM_MESSAGE_CHANGE_POSTURE);
            k.push(RoomWidgetGetEffectsMessage.RWCM_MESSAGE_GET_EFFECTS);
            k.push(RoomWidgetSelectEffectMessage.RWCM_MESSAGE_SELECT_EFFECT);
            k.push(RoomWidgetSelectEffectMessage.RWCM_MESSAGE_UNSELECT_EFFECT);
            k.push(RoomWidgetSelectEffectMessage.RWCM_MESSAGE_UNSELECT_ALL_EFFECTS);
            k.push(RoomWidgetOpenInventoryMessage.RWGOI_MESSAGE_OPEN_INVENTORY);
            k.push(RoomWidgetOpenCatalogMessage.RWGOI_MESSAGE_OPEN_CATALOG);
            k.push(RoomWidgetStopEffectMessage.RWGOI_MESSAGE_STOP_EFFECT);
            k.push(RoomWidgetNavigateToRoomMessage.RWGOI_MESSAGE_NAVIGATE_TO_ROOM);
            k.push(RoomWidgetNavigateToRoomMessage.RWGOI_MESSAGE_NAVIGATE_HOME);
            k.push(RoomWidgetAvatarEditorMessage.RWCM_OPEN_AVATAR_EDITOR);
            k.push(RoomWidgetAvatarEditorMessage.RWCM_GET_WARDROBE);
            k.push(RoomWidgetSelectOutfitMessage.SELECT_OUTFIT);
            k.push(RoomWidgetShowOwnRoomsMessage.RWSORM_SHOW_OWN_ROOMS);
            k.push(RoomWidgetRequestWidgetMessage.RWRWM_ME_MENU);
            k.push(RoomWidgetMeMenuMessage.RWMMM_MESSAGE_ME_MENU_OPENED);
            k.push(RoomWidgetGetSettingsMessage.RWGSM_GET_SETTINGS);
            k.push(RoomWidgetStoreSettingsMessage.RWSSM_STORE_SETTINGS);
            k.push(RoomWidgetStoreSettingsMessage.RWSSM_STORE_SOUND);
            k.push(RoomWidgetStoreSettingsMessage.RWSSM_PREVIEW_SOUND);
            k.push(RoomWidgetStoreSettingsMessage.RWSSM_STORE_CHAT);
            k.push(RoomWidgetAvatarEditorMessage.RWAEM_AVATAR_EDITOR_VIEW_DISPOSED);
            k.push(RoomWidgetRequestWidgetMessage.RWRWM_EFFECTS);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetOpenCatalogMessage;
            var _local_3:RoomWidgetOpenInventoryMessage;
            var _local_4:RoomWidgetMeMenuMessage;
            var _local_5:RoomWidgetStoreSettingsMessage;
            var _local_6:HabboToolbarEvent;
            var _local_7:RoomWidgetDanceMessage;
            var _local_8:RoomWidgetChangePostureMessage;
            var _local_9:Array;
            var _local_10:RoomWidgetSelectEffectMessage;
            var _local_11:RoomWidgetSelectEffectMessage;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:RoomUserData;
            var _local_15:int;
            if (!k)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetRequestWidgetMessage.RWRWM_ME_MENU:
                    if ((((!(this._container == null)) && (!(this._container.toolbar == null))) && (!(this._container.toolbar.events == null))))
                    {
                        _local_6 = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
                        _local_6.iconId = HabboToolbarIconEnum.MEMENU;
                        if (((((!(this.disposed)) && (this._container)) && (this._container.toolbar)) && (this._container.toolbar.events)))
                        {
                            this._container.toolbar.events.dispatchEvent(_local_6);
                        }
                    }
                    break;
                case RoomWidgetAvatarExpressionMessage.RWCM_MESSAGE_AVATAR_EXPRESSION:
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        this._container.roomSession.sendAvatarExpressionMessage(RoomWidgetAvatarExpressionMessage(k).animation.ordinal);
                    }
                    break;
                case RoomWidgetDanceMessage.RWCM_MESSAGE_DANCE:
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        _local_7 = (k as RoomWidgetDanceMessage);
                        if (_local_7 != null)
                        {
                            this._container.roomSession.sendDanceMessage(_local_7.style);
                        }
                    }
                    break;
                case RoomWidgetChangePostureMessage.RWCPM_MESSAGE_CHANGE_POSTURE:
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        _local_8 = (k as RoomWidgetChangePostureMessage);
                        if (_local_8 != null)
                        {
                            this._container.roomSession.sendChangePostureMessage(_local_8.posture);
                        }
                    }
                    break;
                case RoomWidgetGetEffectsMessage.RWCM_MESSAGE_GET_EFFECTS:
                    if (this._inventory != null)
                    {
                        _local_9 = this._inventory.getAvatarEffects();
                        this._container.events.dispatchEvent(new _Str_5638(_local_9));
                    }
                    break;
                case RoomWidgetSelectEffectMessage.RWCM_MESSAGE_SELECT_EFFECT:
                    if (this._inventory != null)
                    {
                        _local_10 = (k as RoomWidgetSelectEffectMessage);
                        this._inventory.setEffectSelected(_local_10.effectType);
                    }
                    break;
                case RoomWidgetSelectEffectMessage.RWCM_MESSAGE_UNSELECT_EFFECT:
                    if (this._inventory != null)
                    {
                        _local_11 = (k as RoomWidgetSelectEffectMessage);
                        this._inventory.setEffectDeselected(_local_11.effectType);
                    }
                    break;
                case RoomWidgetOpenCatalogMessage.RWGOI_MESSAGE_OPEN_CATALOG:
                    _local_2 = (k as RoomWidgetOpenCatalogMessage);
                    if (((!(this._catalog == null)) && (_local_2._Str_23670 == RoomWidgetOpenCatalogMessage.RWOCM_CLUB_MAIN)))
                    {
                        this._catalog.openClubCenter();
                    }
                    break;
                case RoomWidgetOpenInventoryMessage.RWGOI_MESSAGE_OPEN_INVENTORY:
                    _local_3 = (k as RoomWidgetOpenInventoryMessage);
                    if (this._inventory != null)
                    {
                        Logger.log(("MeMenuWidgetHandler open inventory: " + _local_3._Str_16732));
                        switch (_local_3._Str_16732)
                        {
                            case RoomWidgetOpenInventoryMessage.INVENTORY_EFFECTS:
                                this._catalog.openCatalogPage(CatalogPageName.AVATAR_EFFECTS);
                                break;
                            case RoomWidgetOpenInventoryMessage.INVENTORY_BADGES:
                                this._inventory.toggleInventoryPage(InventoryCategory.BADGES);
                                break;
                            case RoomWidgetOpenInventoryMessage.INVENTORY_FURNITURE:
                                this._inventory.toggleInventoryPage(InventoryCategory.FURNI);
                                break;
                            case RoomWidgetOpenInventoryMessage.INVENTORY_CLOTHES:
                                break;
                            default:
                                Logger.log(("MeMenuWidgetHandler: unknown inventory type: " + _local_3._Str_16732));
                        }
                    }
                    break;
                case RoomWidgetSelectEffectMessage.RWCM_MESSAGE_UNSELECT_ALL_EFFECTS:
                case RoomWidgetStopEffectMessage.RWGOI_MESSAGE_STOP_EFFECT:
                    Logger.log("STOP ALL EFFECTS");
                    if (this._inventory != null)
                    {
                        this._inventory.deselectAllEffects(true);
                    }
                    break;
                case RoomWidgetNavigateToRoomMessage.RWGOI_MESSAGE_NAVIGATE_HOME:
                    Logger.log("MeMenuWidgetHandler: GO HOME");
                    if (this._container != null)
                    {
                        this._container.navigator.goToHomeRoom();
                    }
                    break;
                case RoomWidgetShowOwnRoomsMessage.RWSORM_SHOW_OWN_ROOMS:
                    if (this._container != null)
                    {
                        this._container.navigator.showOwnRooms();
                    }
                    break;
                case RoomWidgetMeMenuMessage.RWMMM_MESSAGE_ME_MENU_OPENED:
                    _local_4 = (k as RoomWidgetMeMenuMessage);
                    if ((((!(_local_4)) || (!(this._container))) || (!(this._container.events))))
                    {
                        return null;
                    }
                    if (this._inventory != null)
                    {
                        _local_12 = false;
                        if (((!(this._container == null)) && (!(this._container.sessionDataManager == null))))
                        {
                            _local_12 = (this._container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB);
                        }
                        this._container.events.dispatchEvent(new _Str_5907(this._inventory.clubDays, this._inventory.clubPeriods, this._inventory.clubPastPeriods, _local_12, this._inventory.clubLevel));
                    }
                    if (((!(this._catalog == null)) && (!(this._catalog.getPurse() == null))))
                    {
                        this._container.events.dispatchEvent(new _Str_4656(_Str_4656.RWPUE_CREDIT_BALANCE, this._catalog.getPurse().credits));
                    }
                    if ((((this._container.roomSession) && (this._container.roomSession.userDataManager)) && (this._container.roomEngine)))
                    {
                        _local_13 = ((this._container.sessionDataManager != null) ? this._container.sessionDataManager.userId : -1);
                        _local_14 = this._container.roomSession.userDataManager.getUserData(_local_13);
                        if (!_local_14)
                        {
                            return null;
                        }
                        _local_15 = 0;
                        this._container.roomEngine.selectAvatar(_local_15, _local_14.roomObjectId);
                    }
                    break;
                case RoomWidgetAvatarEditorMessage.RWCM_OPEN_AVATAR_EDITOR:
                    Logger.log("MeMenuWidgetHandler: Open avatar editor...");
                    if (this._container)
                    {
                        this._container.avatarEditor.openEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR, null, null, true);
                        this._container.avatarEditor.loadOwnAvatarInEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
                        if (((this._container.habboHelp) && (this._container.habboHelp.events)))
                        {
                            this._container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.HHTE_DONE_AVATAR_EDITOR_OPENING));
                        }
                    }
                    break;
                case RoomWidgetGetSettingsMessage.RWGSM_GET_SETTINGS:
                    this._container.events.dispatchEvent(new _Str_3963(_Str_3963.RWSUE_SETTINGS, this._container._Str_2476.traxVolume, this._container._Str_2476.furniVolume, this._container._Str_2476.genericVolume));
                    break;
                case RoomWidgetStoreSettingsMessage.RWSSM_STORE_SOUND:
                    this._container._Str_2476.traxVolume = (k as RoomWidgetStoreSettingsMessage).traxVolume;
                    this._container._Str_2476.furniVolume = (k as RoomWidgetStoreSettingsMessage).furniVolume;
                    this._container._Str_2476.genericVolume = (k as RoomWidgetStoreSettingsMessage).genericVolume;
                    this._container.events.dispatchEvent(new _Str_3963(_Str_3963.RWSUE_SETTINGS, this._container._Str_2476.traxVolume, this._container._Str_2476.furniVolume, this._container._Str_2476.genericVolume));
                    break;
                case RoomWidgetStoreSettingsMessage.RWSSM_PREVIEW_SOUND:
                    _local_5 = (k as RoomWidgetStoreSettingsMessage);
                    this._container._Str_2476._Str_15711(_local_5.genericVolume, _local_5.furniVolume, _local_5.traxVolume);
                    this._container.events.dispatchEvent(new _Str_3963(_Str_3963.RWSUE_SETTINGS, this._container._Str_2476.traxVolume, this._container._Str_2476.furniVolume, this._container._Str_2476.genericVolume));
                    break;
                case RoomWidgetAvatarEditorMessage.RWAEM_AVATAR_EDITOR_VIEW_DISPOSED:
                    if (((this._container.habboHelp) && (this._container.habboHelp.events)))
                    {
                        this._container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.HHTE_DONE_AVATAR_EDITOR_CLOSING));
                    }
                    break;
                case RoomWidgetStoreSettingsMessage.RWSSM_STORE_CHAT:
                    if (this._container.freeFlowChat)
                    {
                        this._container.freeFlowChat.isDisabledInPreferences = RoomWidgetStoreSettingsMessage(k)._Str_12967;
                        if (!RoomWidgetStoreSettingsMessage(k)._Str_12967)
                        {
                            if (((this._container.layoutManager) && (this._container.layoutManager.getChatContainer())))
                            {
                                this._container.layoutManager.getChatContainer().setDisplayObject(this._container.freeFlowChat.displayObject);
                            }
                        }
                        else
                        {
                            this._container.freeFlowChat.clear();
                        }
                    }
                    break;
                default:
                    Logger.log(("Unhandled message in MeMenuWidgetHandler: " + k.type));
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function processEvent(k:Event):void
        {
        }

        public function update():void
        {
        }

        private function onAvatarEffectsChanged(k:Event=null):void
        {
            var _local_2:Array;
            if (this._container == null)
            {
                return;
            }
            Logger.log("[MeMenuWidgetHandler] Received Avatar Effects Have Changed Event...\t");
            if (this._inventory != null)
            {
                _local_2 = this._inventory.getAvatarEffects();
                this._container.events.dispatchEvent(new _Str_5638(_local_2));
            }
        }

        private function onHabboClubSubscriptionChanged(k:Event=null):void
        {
            var _local_2:Boolean;
            if (this._inventory != null)
            {
                _local_2 = false;
                if (((!(this._container == null)) && (!(this._container.sessionDataManager == null))))
                {
                    _local_2 = (this._container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB);
                }
                this._container.events.dispatchEvent(new _Str_5907(this._inventory.clubDays, this._inventory.clubPeriods, this._inventory.clubPastPeriods, _local_2, this._inventory.clubLevel));
            }
        }

        private function onCreditBalance(k:PurseEvent):void
        {
            if ((((k == null) || (this._container == null)) || (this._container.events == null)))
            {
                return;
            }
            this._container.events.dispatchEvent(new _Str_4656(_Str_4656.RWPUE_CREDIT_BALANCE, k.balance));
        }

        private function onHelpTutorialEvent(k:HabboHelpTutorialEvent):void
        {
            if (this._container == null)
            {
                return;
            }
            switch (k.type)
            {
                case HabboHelpTutorialEvent.HHTPNUFWE_AVATAR_TUTORIAL_START:
                    this._container.events.dispatchEvent(new _Str_3950(_Str_3950.HHTPNUFWE_AE_STARTED));
                    return;
                case HabboHelpTutorialEvent.HHTPNUFWE_LIGHT_CLOTHES_ICON:
                    this._container.events.dispatchEvent(new _Str_3950(_Str_3950.HHTPNUFWE_AE_HIGHLIGHT));
                    return;
            }
        }

        private function onMiniMailNewMessage(k:MiniMailMessageEvent):void
        {
            this._container.events.dispatchEvent(new _Str_4677(_Str_4677.RWMMUE_NEW_MINI_MAIL));
        }

        private function onMiniMailUnreadCount(k:MiniMailMessageEvent):void
        {
            this._container.events.dispatchEvent(new _Str_4677(_Str_4677.RWMMUE_UNREAD_MINI_MAIL));
        }
    }
}
