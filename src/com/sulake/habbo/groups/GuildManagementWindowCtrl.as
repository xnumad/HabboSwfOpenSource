package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.groups.badge.BadgeEditorCtrl;
    import com.sulake.habbo.communication.messages.incoming.users.IGuildData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.users.RoomEntryData;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.users.GuildColorData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.users.GuildCreationData;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users.GetGuildMembersMessageComposer;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildIdentityMessageComposer;
    import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
    import com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildBadgeMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildColorsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildSettingsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.CreateGuildMessageComposer;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;

    public class GuildManagementWindowCtrl implements IDisposable 
    {
        private static const VIEW_IDENTITY:int = 1;
        private static const VIEW_BADGE:int = 2;
        private static const VIEW_COLORS:int = 3;
        private static const VIEW_CONFIRM:int = 4;
        private static const VIEW_SETTINGS:int = 5;
        private static const HEADER_CAPTION_Y_CREATE:int = 43;
        private static const HEADER_INFO_Y_CREATE:int = 69;
        private static const EDIT_HEADER_TEXTS_OFFSET:int = -20;
        private static const CREATE_HEADER_BITMAP_OFFSET:int = 36;
        private static const STEP_TITLE_Y_OFFSET_ACTIVE:int = 5;
        private static const STEP_TITLE_Y_OFFSET_INACTIVE:int = 9;
        private static const STEP_TITLE_CREDIT_Y_OFFSET_ACTIVE:int = 6;
        private static const STEP_TITLE_CREDIT_Y_OFFSET_INACTIVE:int = 10;
        private static const MAX_DESCRIPTION_LENGTH:int = 0xFF;
        private static const MAX_NAME_LENGTH:int = 30;

        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _badgeEditorCtrl:BadgeEditorCtrl;
        private var _primaryColorCtrl:ColorGridCtrl;
        private var _secondaryColorCtrl:ColorGridCtrl;
        private var _settingsCtrl:GuildSettingsCtrl;
        private var _alertVisible:Boolean = false;
        private var _alertedBaseRoomId:int = 0;
        private var _data:IGuildData;
        private var _step:int = 1;

        public function GuildManagementWindowCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
            this._badgeEditorCtrl = new BadgeEditorCtrl(this._manager);
            this._primaryColorCtrl = new ColorGridCtrl(this._manager, this.onPrimaryColorSelected);
            this._secondaryColorCtrl = new ColorGridCtrl(this._manager, this.onSecondaryColorSelected);
            this._settingsCtrl = new GuildSettingsCtrl();
        }

        public function dispose():void
        {
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._badgeEditorCtrl)
            {
                this._badgeEditorCtrl.dispose();
                this._badgeEditorCtrl = null;
            }
            if (this._primaryColorCtrl)
            {
                this._primaryColorCtrl.dispose();
                this._primaryColorCtrl = null;
            }
            if (this._secondaryColorCtrl)
            {
                this._secondaryColorCtrl.dispose();
                this._secondaryColorCtrl = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        private function prepare():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("group_management_window"));
            this._window.findChildByTag("close").procedure = this.onCloseWindow;
            this._window.center();
            this._window.findChildByName("create_room_link_region").procedure = this.onCreateRoomLink;
            this._window.findChildByName("cancel_link_region").procedure = this.onCancelLink;
            this._window.findChildByName("next_step_button").procedure = this.onNextStep;
            this._window.findChildByName("previous_step_link_region").procedure = this.onPreviousStep;
            this._window.findChildByName("buy_button").procedure = this.onBuy;
            this._window.findChildByName("vip_required_region").procedure = this.onGetVip;
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_DEACTIVATED, this.onWindowUnActivated);
            this._window.findChildByName("edit_tab_1").procedure = this.onTab;
            this._window.findChildByName("edit_tab_2").procedure = this.onTab;
            this._window.findChildByName("edit_tab_3").procedure = this.onTab;
            this._window.findChildByName("edit_tab_5").procedure = this.onTab;
            this._window.findChildByName("reset_badge").procedure = this.onBadgeReset;
            this._window.findChildByName("reset_colors").procedure = this.onColorReset;
            this._window.findChildByName("step_1_members_region").procedure = this.onMembersClick;
            this._settingsCtrl.prepare(this._window);
        }

        public function onFlatCreated(k:int, _arg_2:String):void
        {
            if (((((!(this._window == null)) && (this._window.visible)) && (!(this._data == null))) && (!(this._data.exists))))
            {
                this._data.ownedRooms.splice(0, 0, new RoomEntryData(k, _arg_2, false));
                this.prepareRoomSelection();
                this.getBaseDropMenu().selection = 0;
            }
        }

        public function onSubscriptionChange():void
        {
            if ((((((!(this._window == null)) && (this._window.visible)) && (!(this._data == null))) && (!(this._data.exists))) && (this._step == VIEW_CONFIRM)))
            {
                this.refresh();
            }
        }

        public function refresh():void
        {
            var _local_3:IWindow;
            this.prepare();
            var k:Boolean = ((!(this._data.exists)) || (this._data.isOwner));
            this._window.findChildByName("edit_tab_1").visible = k;
            this._window.findChildByName("edit_tab_2").visible = k;
            this._window.findChildByName("edit_tab_3").visible = k;
            this._window.findChildByName("edit_tab_5").visible = k;
            var _local_2:int = 1;
            while (_local_2 <= VIEW_SETTINGS)
            {
                this.getStepContainer(_local_2).visible = (this._step == _local_2);
                _local_3 = this._window.findChildByName(("header_pic_bitmap_step_" + _local_2));
                _local_3.y = ((this._data.exists) ? 0 : CREATE_HEADER_BITMAP_OFFSET);
                _local_3.visible = (this._step == _local_2);
                _local_2++;
            }
            this._window.findChildByName("header_caption_txt").caption = this.getStepCaption();
            this._window.findChildByName("header_desc_txt").caption = this.getStepDesc();
            this._window.findChildByName("header_pic_bitmap");
            this._window.findChildByName("header_caption_txt").y = (HEADER_CAPTION_Y_CREATE + this.getHeaderTextOffset());
            this._window.findChildByName("header_desc_txt").y = (HEADER_INFO_Y_CREATE + this.getHeaderTextOffset());
            this._window.findChildByName("edit_guild_tab_context").visible = this._data.exists;
            this._window.findChildByName("footer_cont").visible = (!(this._data.exists));
            this._window.findChildByName("reset_badge").visible = false;
            this._window.findChildByName("reset_colors").visible = false;
            if (this._step == VIEW_BADGE)
            {
                if (!this._data.exists)
                {
                    this._manager.trackGoogle("groupPurchase", "step2_badge");
                }
                if (!this._badgeEditorCtrl.isIntialized)
                {
                    this._badgeEditorCtrl.createWindow(this.getStepContainer(VIEW_BADGE), this._data.badgeSettings);
                    this._badgeEditorCtrl._Str_15567(this._data.badgeSettings);
                }
                this._window.findChildByName("reset_badge").visible = this._data.exists;
            }
            if (this._step == VIEW_COLORS)
            {
                if (!this._data.exists)
                {
                    this._manager.trackGoogle("groupPurchase", "step3_colors");
                }
                if (!this._primaryColorCtrl.isInitialized)
                {
                    this._primaryColorCtrl._Str_16890(this.getStepContainer(VIEW_COLORS), "guild_primary_color_selector", this._manager.guildEditorData._Str_17665);
                    if (this._data.exists)
                    {
                        this._primaryColorCtrl._Str_6434(this._data.primaryColorId);
                    }
                    else
                    {
                        this._primaryColorCtrl._Str_6434(this._manager.guildEditorData.findMatchingPrimaryColorId(this._badgeEditorCtrl._Str_23897));
                    }
                }
                if (!this._secondaryColorCtrl.isInitialized)
                {
                    this._secondaryColorCtrl._Str_16890(this.getStepContainer(VIEW_COLORS), "guild_secondary_color_selector", this._manager.guildEditorData._Str_16298);
                    if (this._data.exists)
                    {
                        this._secondaryColorCtrl._Str_6434(this._data.secondaryColorId);
                    }
                    else
                    {
                        this._secondaryColorCtrl._Str_6434(this._manager.guildEditorData.findMatchingSecondaryColorId(this._badgeEditorCtrl._Str_24812));
                    }
                }
                this._window.findChildByName("reset_colors").visible = this._data.exists;
            }
            if (this._step == VIEW_SETTINGS)
            {
                if (!this._settingsCtrl.isInitialized)
                {
                    this._settingsCtrl.refresh(this._data);
                }
            }
            if (this._step == VIEW_CONFIRM)
            {
                if (!this._data.exists)
                {
                    this._manager.trackGoogle("groupPurchase", "step4_confirm");
                }
                this.updateConfirmPreview();
            }
            if (this._step == VIEW_IDENTITY)
            {
                if (!this._data.exists)
                {
                    this._manager.trackGoogle("groupPurchase", "step1_identity");
                }
                else
                {
                    this._manager.windowManager.registerLocalizationParameter("group.membercount", "totalMembers", ("" + this._data.membershipCount));
                    this._window.findChildByName("step_1_members_txt").caption = this._manager.localization.getLocalization("group.membercount");
                }
                this._window.findChildByName("base_label").visible = (!(this._data.exists));
                this._window.findChildByName("base_dropmenu").visible = (!(this._data.exists));
                this._window.findChildByName("base_warning").visible = (!(this._data.exists));
                this._window.findChildByName("create_room_link_region").visible = (!(this._data.exists));
                this._window.findChildByName("step_1_members_region").visible = this.data.exists;
            }
            this.refreshCreateHeader();
        }

        private function updateConfirmPreview():void
        {
            var k:BitmapData;
            var _local_2:IBitmapWrapperWindow;
            var _local_3:GuildColorData;
            var _local_4:IWindow;
            var _local_5:GuildColorData;
            var _local_6:IWindow;
            if (((this._manager.guildEditorData == null) || (this._window == null)))
            {
                return;
            }
            if (this._badgeEditorCtrl.isIntialized)
            {
                k = this._badgeEditorCtrl._Str_23597();
                _local_2 = (this._window.findChildByName("badge_preview_image") as IBitmapWrapperWindow);
                if (((!(k == null)) && (!(_local_2 == null))))
                {
                    _local_2.bitmap = k;
                }
            }
            if (this._primaryColorCtrl.isInitialized)
            {
                _local_3 = this._primaryColorCtrl._Str_10058();
                _local_4 = this._window.findChildByName("badge_preview_primary_color_top");
                if (((!(_local_3 == null)) && (!(_local_4 == null))))
                {
                    _local_4.color = _local_3.color;
                }
            }
            if (this._secondaryColorCtrl.isInitialized)
            {
                _local_5 = this._secondaryColorCtrl._Str_10058();
                _local_6 = this._window.findChildByName("badge_preview_secondary_color_top");
                if (((!(_local_5 == null)) && (!(_local_6 == null))))
                {
                    _local_6.color = _local_5.color;
                }
            }
            if (this._manager.hasVip)
            {
                this._window.findChildByName("buy_button").enable();
                this._window.findChildByName("buy_border").color = 0xFFC300;
            }
            else
            {
                this._window.findChildByName("buy_border").color = 0xAAAAAA;
                this._window.findChildByName("buy_button").disable();
            }
            this._window.findChildByName("vip_required_border").visible = (!(this._manager.hasVip));
            this._window.findChildByName("confirmation_caption").caption = ITextWindow(this._window.findChildByName("name_txt")).text;
        }

        private function getHeaderTextOffset():int
        {
            return (this._data.exists) ? EDIT_HEADER_TEXTS_OFFSET : 0;
        }

        private function refreshCreateHeader():void
        {
            this._window.findChildByName("steps_header_cont").visible = (!(this._data.exists));
            if (this._data.exists)
            {
                return;
            }
            this._window.findChildByName("next_step_button").visible = this.hasNextStep();
            this._window.findChildByName("previous_step_link_region").visible = this.hasPreviousStep();
            this._window.findChildByName("cancel_link_region").visible = (!(this.hasPreviousStep()));
            this._window.findChildByName("buy_border").visible = (!(this.hasNextStep()));
            var k:int = 1;
            while (k <= VIEW_CONFIRM)
            {
                this.getStepHeader(k, false).visible = (!(k == this._step));
                this.getStepHeader(k, true).visible = (k == this._step);
                this._window.findChildByName(("step_title_" + k)).y = ((k == this._step) ? STEP_TITLE_Y_OFFSET_ACTIVE : STEP_TITLE_Y_OFFSET_INACTIVE);
                k++;
            }
            this._window.findChildByName("gcreate_icon_credit").y = ((this._step == VIEW_CONFIRM) ? STEP_TITLE_CREDIT_Y_OFFSET_ACTIVE : STEP_TITLE_CREDIT_Y_OFFSET_INACTIVE);
        }

        private function getStepHeader(k:int, _arg_2:Boolean):IWindow
        {
            return this._window.findChildByName(((("gcreate_" + k) + "_") + ((_arg_2) ? "1" : "0")));
        }

        private function getStepContainer(k:int):IWindowContainer
        {
            return IWindowContainer(this._window.findChildByName(("step_cont_" + k)));
        }

        private function getStepCaption():String
        {
            var k:String = (((this._data.exists) ? "group.edit.tabcaption." : "group.create.stepcaption.") + this._step);
            return this._manager.localization.getLocalization(k, k);
        }

        private function getStepDesc():String
        {
            var k:String = (((this._data.exists) ? "group.edit.tabdesc." : "group.create.stepdesc.") + this._step);
            return this._manager.localization.getLocalization(k, k);
        }

        public function onGuildCreationInfo(k:GuildCreationData):void
        {
            this._data = k;
            this._step = VIEW_IDENTITY;
            this._alertedBaseRoomId = 0;
            this.refresh();
            this.refreshBadgeImage();
            this.setupInputs();
            this._manager.localization.registerParameter("group.create.confirm.buyinfo", "amount", ("" + k.costInCredits));
            this._window.visible = true;
            this._window.activate();
        }

        public function onGuildEditInfo(k:GuildEditData):void
        {
            this._data = k;
            this._step = VIEW_IDENTITY;
            this._alertedBaseRoomId = 0;
            this.refresh();
            this.refreshBadgeImage();
            this.setupInputs();
            var _local_2:ITabContextWindow = ITabContextWindow(this._window.findChildByName("edit_guild_tab_context"));
            var _local_3:ISelectableWindow = ISelectableWindow(this._window.findChildByName(("edit_tab_" + this._step)));
            _local_2.selector.setSelected(_local_3);
            this._window.visible = true;
            this._window.activate();
        }

        private function setupInputs():void
        {
            ITextWindow(this._window.findChildByName("name_txt")).text = this._data.groupName;
            ITextWindow(this._window.findChildByName("desc_txt")).text = this._data.groupDesc;
            this.prepareRoomSelection();
            this._badgeEditorCtrl._Str_15567(this._data.badgeSettings);
            this._primaryColorCtrl._Str_6434(this._data.primaryColorId);
            this._secondaryColorCtrl._Str_6434(this._data.secondaryColorId);
            this._settingsCtrl.refresh(this._data);
        }

        private function onTab(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowEvent.WINDOW_EVENT_SELECT)) || (_arg_2.id == this._step)))
            {
                return;
            }
            if (!this.validateView())
            {
                k.preventDefault();
                return;
            }
            this.saveView();
            this._step = _arg_2.id;
            this.refresh();
        }

        private function onColorReset(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._primaryColorCtrl.isInitialized)
                {
                    this._primaryColorCtrl._Str_6434(this._data.primaryColorId);
                }
                if (this._secondaryColorCtrl.isInitialized)
                {
                    this._secondaryColorCtrl._Str_6434(this._data.secondaryColorId);
                }
            }
        }

        private function onBadgeReset(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (this._badgeEditorCtrl.isIntialized)))
            {
                this._badgeEditorCtrl._Str_15567(this._data.badgeSettings);
            }
        }

        private function onMembersClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((k.type == WindowMouseEvent.CLICK) && (this._data.exists)) && (!(this._manager.guildMembersWindowCtrl == null))))
            {
                this._manager.trackGoogle("groupManagement", "groupMembers");
                this._manager.guildMembersWindowCtrl.onMembersClick(this._data.groupId, GetGuildMembersMessageComposer._Str_13464);
            }
        }

        private function onCancelLink(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.close();
        }

        private function onCreateRoomLink(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.navigator.startRoomCreation();
        }

        private function onNextStep(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this.validateView())
            {
                return;
            }
            this._step = this.limitStep((this._step + 1));
            this.refresh();
        }

        private function onPreviousStep(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this.validateView())
            {
                return;
            }
            this._step = this.limitStep((this._step - 1));
            this.refresh();
        }

        private function onBuy(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._data.exists)
            {
                this._manager.trackGoogle("groupPurchase", "buyGroup");
            }
            this.sendCreateGuildMessage();
        }

        private function onGetVip(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._data.exists)
            {
                this._manager.trackGoogle("groupPurchase", "buyVip");
            }
            this._manager.openVipPurchase("GuildManagementWindowCtrl");
        }

        private function showAlert(k:String, _arg_2:String):void
        {
            if (!this._alertVisible)
            {
                this._alertVisible = true;
                this._manager.windowManager.alert(k, _arg_2, 0, this.onAlertClose);
            }
        }

        private function onAlertClose(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            this._alertVisible = false;
        }

        private function validateView():Boolean
        {
            var k:String;
            var _local_2:String;
            var _local_3:Array;
            var _local_4:RoomEntryData;
            switch (this._step)
            {
                case VIEW_IDENTITY:
                    k = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
                    if (!this._data.exists)
                    {
                        _local_4 = this.resolveBaseRoom();
                        if (((((k == null) || (k.length == 0)) || (_local_4 == null)) || (_local_4.roomId == 0)))
                        {
                            this.showAlert("${group.edit.error.title}", "${group.edit.error.no.name.or.room.selected}");
                            return false;
                        }
                        if (((_local_4._Str_22776) && (!(this._alertedBaseRoomId == _local_4.roomId))))
                        {
                            this._alertedBaseRoomId = _local_4.roomId;
                            this.showAlert("${group.edit.error.warning}", "${group.edit.error.controllers}");
                            return false;
                        }
                    }
                    if (k.length >= MAX_NAME_LENGTH)
                    {
                        this.showAlert("${group.edit.error.title}", "${group.edit.error.name.length}");
                        return false;
                    }
                    _local_2 = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
                    if (((!(_local_2 == null)) && (_local_2.length >= MAX_DESCRIPTION_LENGTH)))
                    {
                        this.showAlert("${group.edit.error.title}", "${group.edit.error.desc.length}");
                        return false;
                    }
                    return true;
                case VIEW_BADGE:
                    _local_3 = ((this._badgeEditorCtrl.isIntialized) ? this._badgeEditorCtrl.getBadgeSettings() : this._data.badgeSettings);
                    this._badgeEditorCtrl._Str_23176();
                    return true;
                case VIEW_COLORS:
                    if (((this._primaryColorCtrl._Str_10058() == null) || (this._secondaryColorCtrl._Str_10058() == null)))
                    {
                        this.showAlert("${group.edit.error.title}", "${group.edit.error.no.color.selected}");
                        return false;
                    }
                    return true;
                default:
                    return true;
            }
        }

        private function saveView():void
        {
            var k:String;
            var _local_2:String;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            switch (this._step)
            {
                case VIEW_IDENTITY:
                    k = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
                    _local_2 = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
                    this._manager.send(new UpdateGuildIdentityMessageComposer(this._data.groupId, k, _local_2));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case VIEW_BADGE:
                    _local_3 = ((this._badgeEditorCtrl.isIntialized) ? this._badgeEditorCtrl.getBadgeSettings() : this._data.badgeSettings);
                    this._manager.send(new UpdateGuildBadgeMessageComposer(this._data.groupId, _local_3));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case VIEW_COLORS:
                    _local_4 = ((this._primaryColorCtrl.isInitialized) ? this._primaryColorCtrl._Str_15044() : this._data.primaryColorId);
                    _local_5 = ((this._secondaryColorCtrl.isInitialized) ? this._secondaryColorCtrl._Str_15044() : this._data.secondaryColorId);
                    this._manager.send(new UpdateGuildColorsMessageComposer(this._data.groupId, _local_4, _local_5));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case VIEW_SETTINGS:
                    this._manager.send(new UpdateGuildSettingsMessageComposer(this._data.groupId, this._settingsCtrl.guildType, this._settingsCtrl._Str_7959));
                    this._settingsCtrl._Str_15948();
                    return;
            }
        }

        private function sendCreateGuildMessage():void
        {
            var k:String = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
            var _local_2:String = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
            var _local_3:RoomEntryData = this.resolveBaseRoom();
            var _local_4:Array = ((this._badgeEditorCtrl.isIntialized) ? this._badgeEditorCtrl.getBadgeSettings() : this._data.badgeSettings);
            var _local_5:int = ((this._primaryColorCtrl.isInitialized) ? this._primaryColorCtrl._Str_15044() : this._data.primaryColorId);
            var _local_6:int = ((this._secondaryColorCtrl.isInitialized) ? this._secondaryColorCtrl._Str_15044() : this._data.secondaryColorId);
            this._alertedBaseRoomId = 0;
            this._manager.send(new CreateGuildMessageComposer(k, _local_2, _local_3.roomId, _local_5, _local_6, _local_4));
        }

        private function hasPreviousStep():Boolean
        {
            return !(this._step == this.limitStep((this._step - 1)));
        }

        private function hasNextStep():Boolean
        {
            return !(this._step == this.limitStep((this._step + 1)));
        }

        private function limitStep(k:int):int
        {
            return Math.max(1, Math.min(k, VIEW_CONFIRM));
        }

        private function getBaseDropMenu():IDropMenuWindow
        {
            return IDropMenuWindow(this._window.findChildByName("base_dropmenu"));
        }

        private function prepareRoomSelection():void
        {
            var _local_5:RoomEntryData;
            var k:IDropMenuWindow = this.getBaseDropMenu();
            var _local_2:Array = new Array();
            var _local_3:int;
            _local_2.push(this._manager.localization.getLocalization("group.edit.base.select.room", "group.edit.base.select.room"));
            var _local_4:int;
            while (_local_4 < this._data.ownedRooms.length)
            {
                _local_5 = this._data.ownedRooms[_local_4];
                _local_2.push(_local_5.roomName);
                if (_local_5.roomId == this._data.baseRoomId)
                {
                    _local_3 = (_local_4 + 1);
                }
                _local_4++;
            }
            k.populate(_local_2);
            if (_local_2.length > 0)
            {
                k.selection = _local_3;
            }
        }

        private function resolveBaseRoom():RoomEntryData
        {
            var k:IDropMenuWindow = IDropMenuWindow(this._window.findChildByName("base_dropmenu"));
            var _local_2:int = (k.selection - 1);
            if ((((_local_2 >= 0) && (_local_2 < this._data.ownedRooms.length)) && (!(this._data.ownedRooms[_local_2] == null))))
            {
                return RoomEntryData(this._data.ownedRooms[_local_2]);
            }
            return null;
        }

        private function onCloseWindow(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._data.exists)
            {
                if (!this.validateView())
                {
                    return;
                }
                this.saveView();
            }
            this.close();
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }

        public function onPrimaryColorSelected(k:ColorGridCtrl):void
        {
            var _local_3:GuildColorData;
            var _local_2:IWindow = this._window.findChildByName("guild_color_primary_color_top");
            if (((((!(_local_2 == null)) && (!(this._manager.guildEditorData == null))) && (k._Str_4246 >= 0)) && (k._Str_4246 <= this._manager.guildEditorData._Str_17665.length)))
            {
                _local_3 = this._manager.guildEditorData._Str_17665[k._Str_4246];
                _local_2.color = _local_3.color;
            }
        }

        public function onSecondaryColorSelected(k:ColorGridCtrl):void
        {
            var _local_3:GuildColorData;
            var _local_2:IWindow = this._window.findChildByName("guild_color_secondary_color_top");
            if ((((!(this._manager.guildEditorData == null)) && (k._Str_4246 >= 0)) && (k._Str_4246 <= this._manager.guildEditorData._Str_16298.length)))
            {
                _local_3 = this._manager.guildEditorData._Str_16298[k._Str_4246];
                _local_2.color = _local_3.color;
            }
        }

        public function get data():IGuildData
        {
            return this._data;
        }

        private function refreshBadgeImage():void
        {
            var k:IWindow = this._window.findChildByName("step_1_badge");
            var _local_2:IBadgeImageWidget = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as IBadgeImageWidget);
            if (((_local_2 == null) || (k == null)))
            {
                return;
            }
            if (!this._data.exists)
            {
                k.visible = false;
                k.invalidate();
            }
            else
            {
                _local_2.badgeId = this._data.badgeCode;
                _local_2.groupId = this._data.groupId;
                k.visible = true;
                k.invalidate();
            }
        }

        private function onWindowUnActivated(k:WindowEvent):void
        {
            if (((((!(this._data == null)) && (this._data.exists)) && (!(this._window == null))) && (this._window.visible)))
            {
                this.saveView();
            }
        }
    }
}
