package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.groups.badge.BadgeEditorCtrl;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5716;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2866;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2792;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5600;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5372;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5612;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_9952;
    import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
    import com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildBadgeMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_11165;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10635;
    import com.sulake.habbo.communication.messages.outgoing.users.CreateGuildMessageComposer;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;

    public class GuildManagementWindowCtrl implements IDisposable 
    {
        private static const _Str_7036:int = 1;
        private static const _Str_8727:int = 2;
        private static const _Str_7447:int = 3;
        private static const _Str_7672:int = 4;
        private static const _Str_12047:int = 5;
        private static const _Str_18111:int = 43;
        private static const _Str_17494:int = 69;
        private static const _Str_17986:int = -20;
        private static const _Str_16773:int = 36;
        private static const _Str_17531:int = 5;
        private static const _Str_18421:int = 9;
        private static const _Str_17183:int = 6;
        private static const _Str_16376:int = 10;
        private static const _Str_16824:int = 0xFF;
        private static const _Str_16065:int = 30;

        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _badgeEditorCtrl:BadgeEditorCtrl;
        private var _primaryColorCtrl:ColorGridCtrl;
        private var _secondaryColorCtrl:ColorGridCtrl;
        private var _settingsCtrl:GuildSettingsCtrl;
        private var _alertVisible:Boolean = false;
        private var _alertedBaseRoomId:int = 0;
        private var _data:_Str_5716;
        private var _step:int = 1;

        public function GuildManagementWindowCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
            this._badgeEditorCtrl = new BadgeEditorCtrl(this._manager);
            this._primaryColorCtrl = new ColorGridCtrl(this._manager, this._Str_25587);
            this._secondaryColorCtrl = new ColorGridCtrl(this._manager, this._Str_22873);
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
            this._window.findChildByTag("close").procedure = this._Str_23918;
            this._window.center();
            this._window.findChildByName("create_room_link_region").procedure = this._Str_25002;
            this._window.findChildByName("cancel_link_region").procedure = this._Str_24554;
            this._window.findChildByName("next_step_button").procedure = this._Str_23101;
            this._window.findChildByName("previous_step_link_region").procedure = this._Str_23571;
            this._window.findChildByName("buy_button").procedure = this._Str_12134;
            this._window.findChildByName("vip_required_region").procedure = this._Str_24944;
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_DEACTIVATED, this._Str_24784);
            this._window.findChildByName("edit_tab_1").procedure = this._Str_5308;
            this._window.findChildByName("edit_tab_2").procedure = this._Str_5308;
            this._window.findChildByName("edit_tab_3").procedure = this._Str_5308;
            this._window.findChildByName("edit_tab_5").procedure = this._Str_5308;
            this._window.findChildByName("reset_badge").procedure = this._Str_24654;
            this._window.findChildByName("reset_colors").procedure = this._Str_25014;
            this._window.findChildByName("step_1_members_region").procedure = this._Str_12428;
            this._settingsCtrl.prepare(this._window);
        }

        public function _Str_7358(k:int, _arg_2:String):void
        {
            if (((((!(this._window == null)) && (this._window.visible)) && (!(this._data == null))) && (!(this._data._Str_2811))))
            {
                this._data._Str_6848.splice(0, 0, new _Str_2866(k, _arg_2, false));
                this._Str_20779();
                this._Str_20262().selection = 0;
            }
        }

        public function _Str_23040():void
        {
            if ((((((!(this._window == null)) && (this._window.visible)) && (!(this._data == null))) && (!(this._data._Str_2811))) && (this._step == _Str_7672)))
            {
                this.refresh();
            }
        }

        public function refresh():void
        {
            var _local_3:IWindow;
            this.prepare();
            var k:Boolean = ((!(this._data._Str_2811)) || (this._data._Str_3233));
            this._window.findChildByName("edit_tab_1").visible = k;
            this._window.findChildByName("edit_tab_2").visible = k;
            this._window.findChildByName("edit_tab_3").visible = k;
            this._window.findChildByName("edit_tab_5").visible = k;
            var _local_2:int = 1;
            while (_local_2 <= _Str_12047)
            {
                this._Str_15138(_local_2).visible = (this._step == _local_2);
                _local_3 = this._window.findChildByName(("header_pic_bitmap_step_" + _local_2));
                _local_3.y = ((this._data._Str_2811) ? 0 : _Str_16773);
                _local_3.visible = (this._step == _local_2);
                _local_2++;
            }
            this._window.findChildByName("header_caption_txt").caption = this._Str_24672();
            this._window.findChildByName("header_desc_txt").caption = this._Str_25664();
            this._window.findChildByName("header_pic_bitmap");
            this._window.findChildByName("header_caption_txt").y = (_Str_18111 + this._Str_19668());
            this._window.findChildByName("header_desc_txt").y = (_Str_17494 + this._Str_19668());
            this._window.findChildByName("edit_guild_tab_context").visible = this._data._Str_2811;
            this._window.findChildByName("footer_cont").visible = (!(this._data._Str_2811));
            this._window.findChildByName("reset_badge").visible = false;
            this._window.findChildByName("reset_colors").visible = false;
            if (this._step == _Str_8727)
            {
                if (!this._data._Str_2811)
                {
                    this._manager.trackGoogle("groupPurchase", "step2_badge");
                }
                if (!this._badgeEditorCtrl._Str_6443)
                {
                    this._badgeEditorCtrl.createWindow(this._Str_15138(_Str_8727), this._data._Str_6089);
                    this._badgeEditorCtrl._Str_15567(this._data._Str_6089);
                }
                this._window.findChildByName("reset_badge").visible = this._data._Str_2811;
            }
            if (this._step == _Str_7447)
            {
                if (!this._data._Str_2811)
                {
                    this._manager.trackGoogle("groupPurchase", "step3_colors");
                }
                if (!this._primaryColorCtrl.isInitialized)
                {
                    this._primaryColorCtrl._Str_16890(this._Str_15138(_Str_7447), "guild_primary_color_selector", this._manager._Str_3058._Str_17665);
                    if (this._data._Str_2811)
                    {
                        this._primaryColorCtrl._Str_6434(this._data._Str_7342);
                    }
                    else
                    {
                        this._primaryColorCtrl._Str_6434(this._manager._Str_3058.findMatchingPrimaryColorId(this._badgeEditorCtrl._Str_23897));
                    }
                }
                if (!this._secondaryColorCtrl.isInitialized)
                {
                    this._secondaryColorCtrl._Str_16890(this._Str_15138(_Str_7447), "guild_secondary_color_selector", this._manager._Str_3058._Str_16298);
                    if (this._data._Str_2811)
                    {
                        this._secondaryColorCtrl._Str_6434(this._data._Str_7590);
                    }
                    else
                    {
                        this._secondaryColorCtrl._Str_6434(this._manager._Str_3058.findMatchingSecondaryColorId(this._badgeEditorCtrl._Str_24812));
                    }
                }
                this._window.findChildByName("reset_colors").visible = this._data._Str_2811;
            }
            if (this._step == _Str_12047)
            {
                if (!this._settingsCtrl.isInitialized)
                {
                    this._settingsCtrl.refresh(this._data);
                }
            }
            if (this._step == _Str_7672)
            {
                if (!this._data._Str_2811)
                {
                    this._manager.trackGoogle("groupPurchase", "step4_confirm");
                }
                this._Str_24929();
            }
            if (this._step == _Str_7036)
            {
                if (!this._data._Str_2811)
                {
                    this._manager.trackGoogle("groupPurchase", "step1_identity");
                }
                else
                {
                    this._manager.windowManager.registerLocalizationParameter("group.membercount", "totalMembers", ("" + this._data._Str_16539));
                    this._window.findChildByName("step_1_members_txt").caption = this._manager.localization.getLocalization("group.membercount");
                }
                this._window.findChildByName("base_label").visible = (!(this._data._Str_2811));
                this._window.findChildByName("base_dropmenu").visible = (!(this._data._Str_2811));
                this._window.findChildByName("base_warning").visible = (!(this._data._Str_2811));
                this._window.findChildByName("create_room_link_region").visible = (!(this._data._Str_2811));
                this._window.findChildByName("step_1_members_region").visible = this.data._Str_2811;
            }
            this._Str_24568();
        }

        private function _Str_24929():void
        {
            var k:BitmapData;
            var _local_2:IBitmapWrapperWindow;
            var _local_3:_Str_2792;
            var _local_4:IWindow;
            var _local_5:_Str_2792;
            var _local_6:IWindow;
            if (((this._manager._Str_3058 == null) || (this._window == null)))
            {
                return;
            }
            if (this._badgeEditorCtrl._Str_6443)
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
            if (this._manager._Str_7303)
            {
                this._window.findChildByName("buy_button").enable();
                this._window.findChildByName("buy_border").color = 0xFFC300;
            }
            else
            {
                this._window.findChildByName("buy_border").color = 0xAAAAAA;
                this._window.findChildByName("buy_button").disable();
            }
            this._window.findChildByName("vip_required_border").visible = (!(this._manager._Str_7303));
            this._window.findChildByName("confirmation_caption").caption = ITextWindow(this._window.findChildByName("name_txt")).text;
        }

        private function _Str_19668():int
        {
            return (this._data._Str_2811) ? _Str_17986 : 0;
        }

        private function _Str_24568():void
        {
            this._window.findChildByName("steps_header_cont").visible = (!(this._data._Str_2811));
            if (this._data._Str_2811)
            {
                return;
            }
            this._window.findChildByName("next_step_button").visible = this._Str_21955();
            this._window.findChildByName("previous_step_link_region").visible = this._Str_21710();
            this._window.findChildByName("cancel_link_region").visible = (!(this._Str_21710()));
            this._window.findChildByName("buy_border").visible = (!(this._Str_21955()));
            var k:int = 1;
            while (k <= _Str_7672)
            {
                this._Str_21080(k, false).visible = (!(k == this._step));
                this._Str_21080(k, true).visible = (k == this._step);
                this._window.findChildByName(("step_title_" + k)).y = ((k == this._step) ? _Str_17531 : _Str_18421);
                k++;
            }
            this._window.findChildByName("gcreate_icon_credit").y = ((this._step == _Str_7672) ? _Str_17183 : _Str_16376);
        }

        private function _Str_21080(k:int, _arg_2:Boolean):IWindow
        {
            return this._window.findChildByName(((("gcreate_" + k) + "_") + ((_arg_2) ? "1" : "0")));
        }

        private function _Str_15138(k:int):IWindowContainer
        {
            return IWindowContainer(this._window.findChildByName(("step_cont_" + k)));
        }

        private function _Str_24672():String
        {
            var k:String = (((this._data._Str_2811) ? "group.edit.tabcaption." : "group.create.stepcaption.") + this._step);
            return this._manager.localization.getLocalization(k, k);
        }

        private function _Str_25664():String
        {
            var k:String = (((this._data._Str_2811) ? "group.edit.tabdesc." : "group.create.stepdesc.") + this._step);
            return this._manager.localization.getLocalization(k, k);
        }

        public function _Str_16681(k:_Str_5600):void
        {
            this._data = k;
            this._step = _Str_7036;
            this._alertedBaseRoomId = 0;
            this.refresh();
            this._Str_9242();
            this._Str_20884();
            this._manager.localization.registerParameter("group.create.confirm.buyinfo", "amount", ("" + k._Str_23650));
            this._window.visible = true;
            this._window.activate();
        }

        public function _Str_18072(k:_Str_5372):void
        {
            this._data = k;
            this._step = _Str_7036;
            this._alertedBaseRoomId = 0;
            this.refresh();
            this._Str_9242();
            this._Str_20884();
            var _local_2:ITabContextWindow = ITabContextWindow(this._window.findChildByName("edit_guild_tab_context"));
            var _local_3:ISelectableWindow = ISelectableWindow(this._window.findChildByName(("edit_tab_" + this._step)));
            _local_2.selector.setSelected(_local_3);
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_20884():void
        {
            ITextWindow(this._window.findChildByName("name_txt")).text = this._data.groupName;
            ITextWindow(this._window.findChildByName("desc_txt")).text = this._data._Str_17501;
            this._Str_20779();
            this._badgeEditorCtrl._Str_15567(this._data._Str_6089);
            this._primaryColorCtrl._Str_6434(this._data._Str_7342);
            this._secondaryColorCtrl._Str_6434(this._data._Str_7590);
            this._settingsCtrl.refresh(this._data);
        }

        private function _Str_5308(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowEvent.WINDOW_EVENT_SELECT)) || (_arg_2.id == this._step)))
            {
                return;
            }
            if (!this._Str_13503())
            {
                k.preventDefault();
                return;
            }
            this._Str_18142();
            this._step = _arg_2.id;
            this.refresh();
        }

        private function _Str_25014(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._primaryColorCtrl.isInitialized)
                {
                    this._primaryColorCtrl._Str_6434(this._data._Str_7342);
                }
                if (this._secondaryColorCtrl.isInitialized)
                {
                    this._secondaryColorCtrl._Str_6434(this._data._Str_7590);
                }
            }
        }

        private function _Str_24654(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (this._badgeEditorCtrl._Str_6443)))
            {
                this._badgeEditorCtrl._Str_15567(this._data._Str_6089);
            }
        }

        private function _Str_12428(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((k.type == WindowMouseEvent.CLICK) && (this._data._Str_2811)) && (!(this._manager._Str_14291 == null))))
            {
                this._manager.trackGoogle("groupManagement", "groupMembers");
                this._manager._Str_14291._Str_12428(this._data.groupId, _Str_5612._Str_13464);
            }
        }

        private function _Str_24554(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.close();
        }

        private function _Str_25002(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.navigator.startRoomCreation();
        }

        private function _Str_23101(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._Str_13503())
            {
                return;
            }
            this._step = this._Str_15418((this._step + 1));
            this.refresh();
        }

        private function _Str_23571(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._Str_13503())
            {
                return;
            }
            this._step = this._Str_15418((this._step - 1));
            this.refresh();
        }

        private function _Str_12134(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._data._Str_2811)
            {
                this._manager.trackGoogle("groupPurchase", "buyGroup");
            }
            this._Str_23933();
        }

        private function _Str_24944(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._data._Str_2811)
            {
                this._manager.trackGoogle("groupPurchase", "buyVip");
            }
            this._manager._Str_21441("GuildManagementWindowCtrl");
        }

        private function _Str_5104(k:String, _arg_2:String):void
        {
            if (!this._alertVisible)
            {
                this._alertVisible = true;
                this._manager.windowManager.alert(k, _arg_2, 0, this._Str_3168);
            }
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
            this._alertVisible = false;
        }

        private function _Str_13503():Boolean
        {
            var k:String;
            var _local_2:String;
            var _local_3:Array;
            var _local_4:_Str_2866;
            switch (this._step)
            {
                case _Str_7036:
                    k = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
                    if (!this._data._Str_2811)
                    {
                        _local_4 = this._Str_19886();
                        if (((((k == null) || (k.length == 0)) || (_local_4 == null)) || (_local_4.roomId == 0)))
                        {
                            this._Str_5104("${group.edit.error.title}", "${group.edit.error.no.name.or.room.selected}");
                            return false;
                        }
                        if (((_local_4._Str_22776) && (!(this._alertedBaseRoomId == _local_4.roomId))))
                        {
                            this._alertedBaseRoomId = _local_4.roomId;
                            this._Str_5104("${group.edit.error.warning}", "${group.edit.error.controllers}");
                            return false;
                        }
                    }
                    if (k.length >= _Str_16065)
                    {
                        this._Str_5104("${group.edit.error.title}", "${group.edit.error.name.length}");
                        return false;
                    }
                    _local_2 = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
                    if (((!(_local_2 == null)) && (_local_2.length >= _Str_16824)))
                    {
                        this._Str_5104("${group.edit.error.title}", "${group.edit.error.desc.length}");
                        return false;
                    }
                    return true;
                case _Str_8727:
                    _local_3 = ((this._badgeEditorCtrl._Str_6443) ? this._badgeEditorCtrl._Str_15937() : this._data._Str_6089);
                    this._badgeEditorCtrl._Str_23176();
                    return true;
                case _Str_7447:
                    if (((this._primaryColorCtrl._Str_10058() == null) || (this._secondaryColorCtrl._Str_10058() == null)))
                    {
                        this._Str_5104("${group.edit.error.title}", "${group.edit.error.no.color.selected}");
                        return false;
                    }
                    return true;
                default:
                    return true;
            }
        }

        private function _Str_18142():void
        {
            var k:String;
            var _local_2:String;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            switch (this._step)
            {
                case _Str_7036:
                    k = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
                    _local_2 = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
                    this._manager.send(new _Str_9952(this._data.groupId, k, _local_2));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case _Str_8727:
                    _local_3 = ((this._badgeEditorCtrl._Str_6443) ? this._badgeEditorCtrl._Str_15937() : this._data._Str_6089);
                    this._manager.send(new UpdateGuildBadgeMessageComposer(this._data.groupId, _local_3));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case _Str_7447:
                    _local_4 = ((this._primaryColorCtrl.isInitialized) ? this._primaryColorCtrl._Str_15044() : this._data._Str_7342);
                    _local_5 = ((this._secondaryColorCtrl.isInitialized) ? this._secondaryColorCtrl._Str_15044() : this._data._Str_7590);
                    this._manager.send(new _Str_11165(this._data.groupId, _local_4, _local_5));
                    this._manager.events.dispatchEvent(new GuildSettingsChangedInManageEvent(GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED, this._data.groupId));
                    return;
                case _Str_12047:
                    this._manager.send(new _Str_10635(this._data.groupId, this._settingsCtrl._Str_4830, this._settingsCtrl._Str_7959));
                    this._settingsCtrl._Str_15948();
                    return;
            }
        }

        private function _Str_23933():void
        {
            var k:String = ITextFieldWindow(this._window.findChildByName("name_txt")).text;
            var _local_2:String = ITextFieldWindow(this._window.findChildByName("desc_txt")).text;
            var _local_3:_Str_2866 = this._Str_19886();
            var _local_4:Array = ((this._badgeEditorCtrl._Str_6443) ? this._badgeEditorCtrl._Str_15937() : this._data._Str_6089);
            var _local_5:int = ((this._primaryColorCtrl.isInitialized) ? this._primaryColorCtrl._Str_15044() : this._data._Str_7342);
            var _local_6:int = ((this._secondaryColorCtrl.isInitialized) ? this._secondaryColorCtrl._Str_15044() : this._data._Str_7590);
            this._alertedBaseRoomId = 0;
            this._manager.send(new CreateGuildMessageComposer(k, _local_2, _local_3.roomId, _local_5, _local_6, _local_4));
        }

        private function _Str_21710():Boolean
        {
            return !(this._step == this._Str_15418((this._step - 1)));
        }

        private function _Str_21955():Boolean
        {
            return !(this._step == this._Str_15418((this._step + 1)));
        }

        private function _Str_15418(k:int):int
        {
            return Math.max(1, Math.min(k, _Str_7672));
        }

        private function _Str_20262():IDropMenuWindow
        {
            return IDropMenuWindow(this._window.findChildByName("base_dropmenu"));
        }

        private function _Str_20779():void
        {
            var _local_5:_Str_2866;
            var k:IDropMenuWindow = this._Str_20262();
            var _local_2:Array = new Array();
            var _local_3:int;
            _local_2.push(this._manager.localization.getLocalization("group.edit.base.select.room", "group.edit.base.select.room"));
            var _local_4:int;
            while (_local_4 < this._data._Str_6848.length)
            {
                _local_5 = this._data._Str_6848[_local_4];
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

        private function _Str_19886():_Str_2866
        {
            var k:IDropMenuWindow = IDropMenuWindow(this._window.findChildByName("base_dropmenu"));
            var _local_2:int = (k.selection - 1);
            if ((((_local_2 >= 0) && (_local_2 < this._data._Str_6848.length)) && (!(this._data._Str_6848[_local_2] == null))))
            {
                return _Str_2866(this._data._Str_6848[_local_2]);
            }
            return null;
        }

        private function _Str_23918(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._data._Str_2811)
            {
                if (!this._Str_13503())
                {
                    return;
                }
                this._Str_18142();
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

        public function _Str_25587(k:ColorGridCtrl):void
        {
            var _local_3:_Str_2792;
            var _local_2:IWindow = this._window.findChildByName("guild_color_primary_color_top");
            if (((((!(_local_2 == null)) && (!(this._manager._Str_3058 == null))) && (k._Str_4246 >= 0)) && (k._Str_4246 <= this._manager._Str_3058._Str_17665.length)))
            {
                _local_3 = this._manager._Str_3058._Str_17665[k._Str_4246];
                _local_2.color = _local_3.color;
            }
        }

        public function _Str_22873(k:ColorGridCtrl):void
        {
            var _local_3:_Str_2792;
            var _local_2:IWindow = this._window.findChildByName("guild_color_secondary_color_top");
            if ((((!(this._manager._Str_3058 == null)) && (k._Str_4246 >= 0)) && (k._Str_4246 <= this._manager._Str_3058._Str_16298.length)))
            {
                _local_3 = this._manager._Str_3058._Str_16298[k._Str_4246];
                _local_2.color = _local_3.color;
            }
        }

        public function get data():_Str_5716
        {
            return this._data;
        }

        private function _Str_9242():void
        {
            var k:IWindow = this._window.findChildByName("step_1_badge");
            var _local_2:_Str_2402 = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as _Str_2402);
            if (((_local_2 == null) || (k == null)))
            {
                return;
            }
            if (!this._data._Str_2811)
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

        private function _Str_24784(k:WindowEvent):void
        {
            if (((((!(this._data == null)) && (this._data._Str_2811)) && (!(this._window == null))) && (this._window.visible)))
            {
                this._Str_18142();
            }
        }
    }
}
