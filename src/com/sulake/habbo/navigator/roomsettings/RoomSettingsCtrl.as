package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.GetRoomSettingsMessageComposer;
    import flash.events.Event;
    import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUserData;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSaveErrorMessageParser;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.SaveableRoomSettingsData;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.SaveRoomSettingsMessageComposer;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.DeleteRoomMessageComposer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.GetFlatControllersMessageComposer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.GetBannedUsersFromRoomMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.IFlatUser;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveAllRightsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.UnbanUserFromRoomMessageComposer;
    import com.sulake.habbo.navigator.*;

    public class RoomSettingsCtrl implements IDisposable, ILinkEventTracker 
    {
        private static const _Str_5300:int = 1;
        private static const _Str_7004:int = 2;
        private static const _Str_8841:int = 3;
        private static const _Str_19025:int = 4;
        private static const _Str_13301:int = 5;
        private static const _Str_18722:int = 75;
        private static const _Str_16783:int = 50;

        private var _Str_2449:int;
        private var _Str_2366:int;
        private var _navigator:IHabboTransitionalNavigator;
        private var _roomSettingsData:RoomSettingsData;
        private var _Str_15710:int;
        private var _window:IFrameWindow;
        private var _Str_5809:int = 1;
        private var _Str_18175:Boolean;
        private var _Str_8572:UserListCtrl;
        private var _Str_8896:UserListCtrl;
        private var _Str_3508:ConfirmDialogView;
        private var _Str_5666:TextFieldManager;
        private var _Str_7105:TextFieldManager;
        private var _tag1Input:TextFieldManager;
        private var _tag2Input:TextFieldManager;
        private var _Str_4194:TextFieldManager;
        private var _Str_7349:TextFieldManager;
        private var _Str_7157:ICheckBoxWindow;
        private var _Str_7429:ICheckBoxWindow;
        private var _Str_5537:ICheckBoxWindow;
        private var _Str_6233:ICheckBoxWindow;
        private var _Str_5830:ICheckBoxWindow;
        private var _Str_14390:ITextWindow;
        private var _Str_6424:IDropMenuWindow;
        private var _Str_6508:IDropMenuWindow;
        private var _Str_2498:ITabContextWindow;
        private var _Str_15306:IDropMenuWindow;
        private var _Str_6283:IDropMenuWindow;
        private var _Str_10492:IDropMenuWindow;
        private var _Str_6390:IDropMenuWindow;
        private var _Str_24486:ITextWindow;
        private var _Str_23899:ITextWindow;
        private var _Str_14650:TextFieldManager;
        private var _Str_8266:ITextFieldWindow;
        private var _Str_7254:ToolbarHoverCtrl;
        private var _Str_16440:Boolean;
        private var _Str_17244:Boolean = false;

        public function RoomSettingsCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
            this._Str_8572 = new UserListCtrl(this._navigator, false);
            this._Str_8896 = new UserListCtrl(this._navigator, true);
            this._Str_7254 = new ToolbarHoverCtrl(this._navigator);
        }

        private static function get _Str_8651():Boolean
        {
            return true;
        }

        private static function setTag(k:TextFieldManager, _arg_2:String):void
        {
            k.setText(((_arg_2 == null) ? "" : (((_Str_8651) ? "#" : "") + _arg_2)));
        }


        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._roomSettingsData = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_8572)
            {
                this._Str_8572.dispose();
                this._Str_8572 = null;
            }
            if (this._Str_8896)
            {
                this._Str_8896.dispose();
                this._Str_8896 = null;
            }
            if (this._Str_7254)
            {
                this._Str_7254.dispose();
                this._Str_7254 = null;
            }
            if (this._Str_3508)
            {
                this._Str_3508.dispose();
                this._Str_3508 = null;
            }
            this._Str_5666 = null;
            this._Str_7105 = null;
            this._tag1Input = null;
            this._tag2Input = null;
            this._Str_4194 = null;
            this._Str_7349 = null;
            this._Str_7157 = null;
            this._Str_7429 = null;
            if (this._Str_5537)
            {
                this._Str_5537.removeEventListener(WindowMouseEvent.OVER, this._Str_20494);
                this._Str_5537 = null;
            }
            if (this._Str_6283)
            {
                this._Str_6283.removeEventListener(WindowMouseEvent.OVER, this._Str_20986);
                this._Str_6283 = null;
            }
            if (this._Str_6390)
            {
                this._Str_6390.removeEventListener(WindowMouseEvent.OVER, this._Str_19760);
                this._Str_6390 = null;
            }
            if (this._Str_8266)
            {
                this._Str_8266.removeEventListener(WindowMouseEvent.OVER, this._Str_21477);
                this._Str_8266 = null;
            }
            this._Str_6233 = null;
            this._Str_5830 = null;
            this._Str_14390 = null;
            this._Str_6424 = null;
            this._Str_6508 = null;
            this._navigator = null;
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }

        public function startRoomSettingsEdit(k:int):void
        {
            this.close();
            this._Str_2449 = k;
            this._Str_2366 = this._navigator.data.enteredGuestRoom.habboGroupId;
            this._navigator.send(new GetRoomSettingsMessageComposer(this._Str_2449));
            this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
        }

        public function startRoomSettingsEditFromNavigator(k:int, _arg_2:int):void
        {
            this.close();
            this._Str_2449 = k;
            this._Str_2366 = _arg_2;
            this._navigator.send(new GetRoomSettingsMessageComposer(this._Str_2449));
            this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
        }

        public function onRoomSettings(k:RoomSettingsData):void
        {
            if (k.roomId != this._Str_2449)
            {
                return;
            }
            this._roomSettingsData = k;
            this.refresh();
            this._Str_23374();
            this._window.visible = true;
            this._window.invalidate();
            this._window.activate();
        }

        public function _Str_8576(k:int, _arg_2:Array):void
        {
            var _local_3:FlatControllerData;
            if (this._Str_17169(k))
            {
                for each (_local_3 in _arg_2)
                {
                    this._roomSettingsData._Str_17474(_local_3.userId, _local_3);
                }
                this._Str_14177();
            }
        }

        public function _Str_9346(k:int, _arg_2:FlatControllerData):void
        {
            if (this._Str_17169(k))
            {
                this._roomSettingsData._Str_17474(_arg_2.userId, _arg_2);
                this._Str_14177();
            }
        }

        public function _Str_8484(k:int, _arg_2:int):void
        {
            if (this._Str_17169(k))
            {
                this._roomSettingsData._Str_17474(_arg_2, null);
                this._Str_14177();
            }
        }

        public function _Str_8907(k:int, _arg_2:Array):void
        {
            var _local_3:BannedUserData;
            if (this._Str_20138(k))
            {
                for each (_local_3 in _arg_2)
                {
                    this._roomSettingsData._Str_22019(_local_3.userId, _local_3);
                }
                this._Str_20879();
            }
        }

        public function onUserUnbannedFromRoom(k:int, _arg_2:int):void
        {
            if (this._Str_20138(k))
            {
                this._roomSettingsData._Str_22019(_arg_2, null);
                this._Str_20879();
            }
        }

        public function onFriendListUpdate():void
        {
            this._Str_14177();
        }

        private function _Str_17169(k:int):Boolean
        {
            return (k == this._Str_2449) && (!(this._roomSettingsData == null));
        }

        private function _Str_20138(k:int):Boolean
        {
            return (k == this._Str_2449) && (!(this._roomSettingsData == null));
        }

        private function _Str_14177():void
        {
            if ((((!(this._window == null)) && (this._window.visible)) && (this._Str_14837(_Str_8841))))
            {
                this.refresh();
            }
        }

        private function _Str_20879():void
        {
            if ((((!(this._window == null)) && (this._window.visible)) && (this._Str_14837(_Str_13301))))
            {
                this.refresh();
            }
        }

        public function _Str_8265(k:int, _arg_2:int, _arg_3:String):void
        {
            if (((!(k == this._Str_2449)) || (this._Str_15710 < 1)))
            {
                return;
            }
            this._Str_15710 = 0;
            if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_INVALID_NAME)
            {
                this._Str_5306(_Str_5300);
                this._Str_5666.displayError("${navigator.roomsettings.roomnameismandatory}");
            }
            else
            {
                if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_UNACCEPTABLE_NAME)
                {
                    this._Str_5306(_Str_5300);
                    this._Str_5666.displayError("${navigator.roomsettings.unacceptablewords}");
                }
                else
                {
                    if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_UNACCEPTABLE_DESCRIPTION)
                    {
                        this._Str_5306(_Str_5300);
                        this._Str_7105.displayError("${navigator.roomsettings.unacceptablewords}");
                    }
                    else
                    {
                        if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_INVALID_TAG)
                        {
                            this._Str_5306(_Str_5300);
                            this._Str_9153(this._tag1Input, _arg_3, "${navigator.roomsettings.unacceptablewords}");
                            this._Str_9153(this._tag2Input, _arg_3, "${navigator.roomsettings.unacceptablewords}");
                        }
                        else
                        {
                            if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_NON_USER_CHOOSABLE_TAG)
                            {
                                this._Str_5306(_Str_5300);
                                this._Str_9153(this._tag1Input, _arg_3, "${navigator.roomsettings.nonuserchoosabletag}");
                                this._Str_9153(this._tag2Input, _arg_3, "${navigator.roomsettings.nonuserchoosabletag}");
                            }
                            else
                            {
                                if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_INVALID_PASSWORD)
                                {
                                    this._Str_5306(_Str_7004);
                                    this._Str_4194.displayError("${navigator.roomsettings.passwordismandatory}");
                                }
                                else
                                {
                                    if (_arg_2 == RoomSettingsSaveErrorMessageParser.ERROR_TOO_MANY_CHARACTERS_IN_TAG)
                                    {
                                        this._Str_5306(_Str_5300);
                                        this._Str_9153(this._tag1Input, _arg_3, "${navigator.roomsettings.toomanycharacters}");
                                        this._Str_9153(this._tag2Input, _arg_3, "${navigator.roomsettings.toomanycharacters}");
                                    }
                                    else
                                    {
                                        this._Str_5306(_Str_5300);
                                        this._Str_5666.displayError(("Update failed: error " + _arg_2));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            this.refresh();
        }

        private function _Str_5306(k:int):void
        {
            this._Str_5809 = k;
            this._Str_2498.selector.setSelected(ISelectableWindow(this._window.findChildByName(("tab_" + k))));
            this._window._Str_7032 = this._Str_20309(this._Str_5809);
        }

        private function _Str_14837(k:int):Boolean
        {
            return (this._Str_16440) || (this._Str_5809 == k);
        }

        private function _Str_9153(k:TextFieldManager, _arg_2:String, _arg_3:String):void
        {
            if (_arg_2 == k.getText().toLowerCase())
            {
                k.displayError(_arg_3);
            }
        }

        public function close():void
        {
            this._Str_2449 = 0;
            this._Str_2366 = 0;
            this._roomSettingsData = null;
            this._Str_15710 = 0;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_3508 != null)
            {
                this._Str_3508.dispose();
                this._Str_3508 = null;
            }
        }

        private function clearErrors():void
        {
            this._Str_5666.clearErrors();
            this._Str_7105.clearErrors();
            this._tag1Input.clearErrors();
            this._tag2Input.clearErrors();
            this._Str_4194.clearErrors();
            this._Str_7349.clearErrors();
        }

        private function prepareWindow():void
        {
            var _local_3:TextFieldManager;
            var _local_4:Array;
            var _local_5:IWindow;
            var _local_6:Array;
            var _local_7:IWindow;
            if (this._window != null)
            {
                return;
            }
            if (this._window == null)
            {
                this._window = IFrameWindow(this._navigator.getXmlWindow("ros_room_settings"));
            }
            if (!this._Str_16440)
            {
                this._window.findChildByName("tab_1").procedure = this.onTab;
                this._window.findChildByName("tab_2").procedure = this.onTab;
                this._window.findChildByName("tab_3").procedure = this.onTab;
                this._window.findChildByName("tab_4").procedure = this.onTab;
                this._window.findChildByName("tab_5").procedure = this.onTab;
            }
            this._window.findChildByName("builders_faq_button").procedure = this._Str_22624;
            this._Str_19901();
            var k:IRadioButtonWindow = (this._window.findChildByName("doormode_password") as IRadioButtonWindow);
            k.addEventListener(WindowEvent.WINDOW_EVENT_SELECT, this._Str_24257);
            k.addEventListener(WindowEvent.WINDOW_EVENT_UNSELECT, this._Str_25104);
            this._window.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            this._Str_23113().addEventListener(WindowMouseEvent.CLICK, this._Str_25553);
            this._window.findChildByName("filter_users_input").addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_22741);
            this._Str_17244 = ((!(this._navigator.data.enteredGuestRoom)) || (!(this._navigator.data.enteredGuestRoom.flatId == this._roomSettingsData.roomId)));
            if (this._Str_17244)
            {
                this._window.findChildByName("remove_link_region").visible = false;
            }
            else
            {
                this._window.findChildByName("remove_link_region").procedure = this._Str_23147;
            }
            this._Str_5666 = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("room_name")), 60);
            this._Str_7105 = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("description")), 0xFF);
            this._tag1Input = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("tag1")), 30);
            this._tag2Input = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("tag2")), 30);
            this._Str_4194 = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("password")), 30);
            this._Str_7349 = new TextFieldManager(this._navigator, ITextFieldWindow(this._window.findChildByName("password_confirm")), 30);
            this._Str_7157 = ICheckBoxWindow(this._window.findChildByName("allow_pets_checkbox"));
            this._Str_7429 = ICheckBoxWindow(this._window.findChildByName("allow_foodconsume_checkbox"));
            this._Str_5537 = ICheckBoxWindow(this._window.findChildByName("allow_walk_through_checkbox"));
            this._Str_5537.addEventListener(WindowMouseEvent.OVER, this._Str_20494);
            this._Str_6233 = ICheckBoxWindow(this._window.findChildByName("allow_dyncats_checkbox"));
            this._Str_6233.visible = true;
            this._window.findChildByName("allow_dyncats_text").visible = true;
            this._Str_5830 = ICheckBoxWindow(this._window.findChildByName("hide_walls_checkbox"));
            this._Str_14390 = (this._window.findChildByName("hide_walls_text") as ITextWindow);
            this._Str_6424 = IDropMenuWindow(this._window.findChildByName("wall_thickness"));
            this._Str_6508 = IDropMenuWindow(this._window.findChildByName("floor_thickness"));
            this._Str_2498 = ITabContextWindow(this._window.findChildByName("tab_context"));
            this._Str_15306 = IDropMenuWindow(this._window.findChildByName("chat_mode"));
            this._Str_6283 = IDropMenuWindow(this._window.findChildByName("chat_bubbles_width"));
            this._Str_6283.addEventListener(WindowMouseEvent.OVER, this._Str_20986);
            this._Str_10492 = IDropMenuWindow(this._window.findChildByName("chat_scroll_speed"));
            this._Str_10492.addEventListener(WindowMouseEvent.OVER, this._Str_25771);
            this._Str_6390 = IDropMenuWindow(this._window.findChildByName("chat_flood_sensitivity"));
            this._Str_6390.addEventListener(WindowMouseEvent.OVER, this._Str_19760);
            this._Str_24486 = ITextWindow(this._window.findChildByName("chat_settings_text"));
            this._Str_23899 = ITextWindow(this._window.findChildByName("chat_settings_info"));
            this._Str_8266 = ITextFieldWindow(this._window.findChildByName("chat_settings_hearing_distance"));
            this._Str_8266.addEventListener(WindowMouseEvent.OVER, this._Str_21477);
            this._Str_14650 = new TextFieldManager(this._navigator, this._Str_8266, 2);
            var _local_2:Array = [this._Str_5666, this._Str_7105, this._tag1Input, this._tag2Input, this._Str_4194, this._Str_7349, this._Str_14650];
            for each (_local_3 in _local_2)
            {
                _local_3.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            }
            _local_4 = [this._window.findChildByName("categories"), this._window.findChildByName("maxvisitors"), this._window.findChildByName("tradesettings"), this._Str_7157, this._Str_7429, this._Str_5537, this._Str_6233, this._Str_5830, this._Str_6424, this._Str_6508, this._Str_6283, this._Str_15306, this._Str_10492, this._Str_6390];
            for each (_local_5 in _local_4)
            {
                _local_5.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5137);
                _local_5.addEventListener(WindowEvent.WINDOW_EVENT_UNSELECTED, this._Str_5137);
            }
            this._window.findChildByName("doormode_open").addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5137);
            this._window.findChildByName("doormode_doorbell").addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5137);
            this._window.findChildByName("doormode_password").addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5137);
            this._window.findChildByName("doormode_invisible").addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5137);
            _local_6 = [this._window.findChildByName("moderation_mute_none"), this._window.findChildByName("moderation_mute_rights"), this._window.findChildByName("moderation_kick_none"), this._window.findChildByName("moderation_kick_rights"), this._window.findChildByName("moderation_kick_all"), this._window.findChildByName("moderation_ban_none"), this._window.findChildByName("moderation_ban_rights")];
            for each (_local_7 in _local_6)
            {
                _local_7.addEventListener(WindowEvent.WINDOW_EVENT_SELECT, this._Str_5137);
            }
            this._Str_20910().visible = false;
            this._window.findChildByName("remove_icon").x = (this._window.findChildByName("remove_link").x - 15);
            this._window.findChildByName("tradesettings_label").visible = true;
            this._window.findChildByName("tradesettings").visible = true;
            this._window.findChildByName("moderation_unban_btn").addEventListener(WindowMouseEvent.CLICK, this._Str_23198);
            this._window.center();
            this._Str_5306(_Str_5300);
        }

        private function _Str_20986(k:WindowMouseEvent):void
        {
        }

        private function _Str_22806():void
        {
            var _local_2:ITabButtonWindow;
            var k:Array = [];
            this._Str_2498 = ITabContextWindow(this._window.findChildByName("tab_context"));
            while (this._Str_2498._Str_4277 > 0)
            {
                _local_2 = this._Str_2498._Str_3363(0);
                k.push(_local_2);
                this._Str_2498._Str_5897(_local_2);
            }
            for each (_local_2 in k)
            {
                if ((this._Str_17244) && ((_local_2.id == _Str_7004)))// || (_local_2.id == _Str_8841))) || ((this._Str_2366 > 0) && (_local_2.id == _Str_8841))))
                {
                }
                else
                {
                    this._Str_2498._Str_5377(_local_2);
                }
            }
            this._Str_2498.selector.setSelected(ISelectableWindow(this._window.findChildByName(("tab_" + this._Str_5809))));
        }

        private function _Str_25046():void
        {
            var _local_3:ITabButtonWindow;
            var k:int = (this._window.width / this._Str_2498._Str_4277);
            k--;
            var _local_2:int;
            while (_local_2 < this._Str_2498._Str_4277) //Changed from < to <=
            {
                _local_3 = this._Str_2498._Str_3363(_local_2);
                _local_3.width = k;
                _local_2++;
            }
        }

        private function _Str_19901():void
        {
            if (this._navigator.sessionData.isAccountSafetyLocked())
            {
                this._window.findChildByName("remove_link_region").disable();
                this._window.findChildByName("remove_link").blend = 0.5;
                this._window.findChildByName("remove_icon").blend = 0.5;
            }
            else
            {
                this._window.findChildByName("remove_link_region").enable();
                this._window.findChildByName("remove_link").blend = 1;
                this._window.findChildByName("remove_icon").blend = 1;
            }
        }

        private function _Str_20910():IWindowContainer
        {
            return IWindowContainer(this._window.findChildByName("password_container"));
        }

        private function _Str_23113():IButtonWindow
        {
            return IButtonWindow(this._window.findChildByName("remove_all_flat_ctrls"));
        }

        private function _Str_26067():IButtonWindow
        {
            return IButtonWindow(this._window.findChildByName("remove_flat_ctrl"));
        }

        public function refresh():void
        {
            this.prepareWindow();
            if (!this._Str_16440)
            {
                Util._Str_2930(IWindowContainer(this._window.findChildByName("content_container")));
                this._Str_23097(this._Str_5809).visible = true;
            }
            this._Str_22806();
            this._Str_25046();
            this._window._Str_7032 = this._Str_20309(this._Str_5809);
            this._Str_20772();
            this._Str_22485();
            this._Str_23966();
            this._Str_19901();
            this._window.invalidate();
        }

        private function _Str_23097(k:int):IWindowContainer
        {
            return IWindowContainer(this._window.findChildByName(("tab_container_" + k)));
        }

        private function _Str_15115(k:IWindow):void
        {
            if (k != null)
            {
                k.disable();
                k.blend = 0.5;
            }
        }

        private function enableWindow(k:IWindow):void
        {
            if (k != null)
            {
                k.enable();
                k.blend = 1;
            }
        }

        private function _Str_10107(k:int):int
        {
            switch (k)
            {
                case -2:
                    return 0;
                case -1:
                    return 1;
                case 1:
                    return 3;
                default:
                    return 2;
            }
        }

        private function _Str_23374():void
        {
            var _local_3:IRadioButtonWindow;
            var _local_4:IRadioButtonWindow;
            var _local_5:IRadioButtonWindow;
            var _local_6:IRadioButtonWindow;
            this._Str_18175 = true;
            var k:RoomSettingsData = this._roomSettingsData;
            this._Str_5666.setText(k.name);
            this._Str_7105.setText(k.description);
            this._Str_4194.setText("");
            this._Str_7349.setText("");
            var _local_2:ISelectorWindow = (this._window.findChildByName("doormode") as ISelectorWindow);
            if (this._navigator.data.enteredGuestRoom)
            {
                this._window.findChildByName("doormode_override_info").visible = ((this._navigator.isDoorModeOverriddenInCurrentRoom) && (!(this._navigator.sessionData.hasSecurity(SecurityLevelEnum.EMPLOYEE))));
                switch (k.doorMode)
                {
                    case RoomSettingsData.DOORMODE_CLOSED:
                        _local_3 = (this._window.findChildByName("doormode_doorbell") as IRadioButtonWindow);
                        _local_2.setSelected(_local_3);
                        break;
                    case RoomSettingsData.DOORMODE_PASSWORD:
                        _local_4 = (this._window.findChildByName("doormode_password") as IRadioButtonWindow);
                        _local_2.setSelected(_local_4);
                        break;
                    case RoomSettingsData.DOORMODE_INVISIBLE:
                        _local_5 = (this._window.findChildByName("doormode_invisible") as IRadioButtonWindow);
                        _local_2.setSelected(_local_5);
                        break;
                    case RoomSettingsData.DOORMODE_NOOBS_ONLY:
                        break;
                    default:
                        _local_6 = (this._window.findChildByName("doormode_open") as IRadioButtonWindow);
                        _local_2.setSelected(_local_6);
                }
                this._Str_16749((k.doorMode == RoomSettingsData.DOORMODE_PASSWORD));
            }
            Logger.log(("CATEGORY ID: " + k.categoryId));
            this._Str_24436(k.categoryId);
            this._Str_24623(k.tradeMode);
            this._Str_10439(k);
            setTag(this._tag1Input, k.tags[0]);
            setTag(this._tag2Input, k.tags[1]);
            if (this._Str_7157)
            {
                if (k.allowPets)
                {
                    this._Str_7157.select();
                }
                else
                {
                    this._Str_7157.unselect();
                }
            }
            if (this._Str_7429)
            {
                if (k.allowFoodConsume)
                {
                    this._Str_7429.select();
                }
                else
                {
                    this._Str_7429.unselect();
                }
            }
            if (this._Str_5537)
            {
                if (k.allowWalkThrough)
                {
                    this._Str_5537.select();
                }
                else
                {
                    this._Str_5537.unselect();
                }
            }
            if (this._Str_6233)
            {
                if (k._Str_17884)
                {
                    this._Str_6233.select();
                }
                else
                {
                    this._Str_6233.unselect();
                }
            }
            if (!this._Str_21757())
            {
                this._Str_15115(this._Str_5830);
                this._Str_15115(this._Str_6424);
                this._Str_15115(this._Str_6508);
                this._Str_15115(this._Str_14390);
            }
            else
            {
                this.enableWindow(this._Str_5830);
                this.enableWindow(this._Str_6424);
                this.enableWindow(this._Str_6508);
                this.enableWindow(this._Str_14390);
            }
            if (this._Str_5830)
            {
                if (k.hideWalls)
                {
                    this._Str_5830.select();
                }
                else
                {
                    this._Str_5830.unselect();
                }
            }
            this._Str_15306.selection = k.chatSettings.mode;
            this._Str_6283.selection = k.chatSettings.bubbleWidth;
            this._Str_10492.selection = k.chatSettings.scrollSpeed;
            this._Str_14650.setText(k.chatSettings.fullHearRange.toString());
            this._Str_6390.selection = k.chatSettings.floodSensitivity;
            if (this._Str_6424)
            {
                this._Str_6424.selection = this._Str_10107(k.wallThickness);
            }
            if (this._Str_6508)
            {
                this._Str_6508.selection = this._Str_10107(k.floorThickness);
            }
            this._Str_22581(k);
            this.clearErrors();
            this._Str_18175 = false;
        }

        private function _Str_22581(k:RoomSettingsData):void
        {
            var _local_2:IRadioButtonWindow;
            var _local_3:ISelectorWindow = (this._window.findChildByName("moderation_mute_selector") as ISelectorWindow);
            switch (k.roomModerationSettings.whoCanMute)
            {
                case RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS:
                    _local_2 = (this._window.findChildByName("moderation_mute_rights") as IRadioButtonWindow);
                    break;
                default:
                    _local_2 = (this._window.findChildByName("moderation_mute_none") as IRadioButtonWindow);
            }
            _local_3.setSelected(_local_2);
            var _local_4:ISelectorWindow = (this._window.findChildByName("moderation_kick_selector") as ISelectorWindow);
            switch (k.roomModerationSettings.whoCanKick)
            {
                case RoomModerationSettings.MODERATION_LEVEL_ALL:
                    _local_2 = (this._window.findChildByName("moderation_kick_all") as IRadioButtonWindow);
                    break;
                case RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS:
                    _local_2 = (this._window.findChildByName("moderation_kick_rights") as IRadioButtonWindow);
                    break;
                default:
                    _local_2 = (this._window.findChildByName("moderation_kick_none") as IRadioButtonWindow);
            }
            _local_4.setSelected(_local_2);
            var _local_5:ISelectorWindow = (this._window.findChildByName("moderation_ban_selector") as ISelectorWindow);
            switch (k.roomModerationSettings.whoCanBan)
            {
                case RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS:
                    _local_2 = (this._window.findChildByName("moderation_ban_rights") as IRadioButtonWindow);
                    break;
                default:
                    _local_2 = (this._window.findChildByName("moderation_ban_none") as IRadioButtonWindow);
            }
            _local_5.setSelected(_local_2);
        }

        private function _Str_21757():Boolean
        {
            return this._navigator.sessionData.clubLevel >= HabboClubLevelEnum.VIP;
        }

        private function _Str_10439(k:RoomSettingsData):void
        {
            var _local_2:Array = [];
            var _local_3:int = -1;
            var _local_4:int;
            var _local_5:int = ((this._Str_21757()) ? _Str_18722 : _Str_16783);
            var _local_6:int = 10;
            while (_local_6 <= _local_5)
            {
                _local_2.push(("" + _local_6));
                if (_local_6 == k.maximumVisitors)
                {
                    _local_3 = _local_4;
                }
                _local_4++;
                _local_6 = (_local_6 + 5);
            }
            if (k.maximumVisitors > _local_5)
            {
                _local_2.push(("" + _local_5));
                _local_3 = _local_4;
            }
            var _local_7:IDropMenuWindow = (this._window.findChildByName("maxvisitors") as IDropMenuWindow);
            _local_7.populate(_local_2);
            _local_7.selection = ((_local_3 > -1) ? _local_3 : 0);
        }

        private function _Str_24436(k:int):void
        {
            var _local_6:FlatCategory;
            var _local_2:IDropMenuWindow = (this._window.findChildByName("categories") as IDropMenuWindow);
            var _local_3:Array = [];
            var _local_4:int;
            var _local_5:int;
            for each (_local_6 in this._navigator.data.allCategories)
            {
                if ((((_local_6.visible) || (k == _local_6.nodeId)) && (!(_local_6.automatic))))
                {
                    _local_3.push(_local_6._Str_14718);
                    if (k == _local_6.nodeId)
                    {
                        _local_4 = _local_5;
                    }
                    _local_5++;
                }
            }
            _local_2.populate(_local_3);
            _local_2.selection = _local_4;
        }

        private function _Str_24623(k:int):void
        {
            var _local_2:IDropMenuWindow = (this._window.findChildByName("tradesettings") as IDropMenuWindow);
            var _local_3:Array = new Array();
            _local_3.push("${navigator.roomsettings.trade_not_allowed}");
            _local_3.push("${navigator.roomsettings.trade_not_with_Controller}");
            _local_3.push("${navigator.roomsettings.trade_allowed}");
            _local_2.populate(_local_3);
            _local_2.selection = k;
        }

        private function _Str_25335(k:int, _arg_2:int):FlatCategory
        {
            var _local_4:FlatCategory;
            var _local_3:int;
            for each (_local_4 in this._navigator.data.allCategories)
            {
                if ((((_local_4.visible) || (k == _local_4.nodeId)) && (!(_local_4.automatic))))
                {
                    if (_arg_2 == _local_3)
                    {
                        return _local_4;
                    }
                    _local_3++;
                }
            }
            return null;
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.close();
        }

        private function _Str_5137(k:WindowEvent):void
        {
            if (!this._Str_18175)
            {
                this.save();
            }
        }

        private function save():void
        {
            var _local_8:String;
            var _local_9:String;
            if ((((this._roomSettingsData == null) || (this._window == null)) || (this._window.disposed)))
            {
                return;
            }
            var k:SaveableRoomSettingsData = new SaveableRoomSettingsData();
            k.roomId = this._roomSettingsData.roomId;
            k.name = this._Str_5666.getText();
            k.description = this._Str_7105.getText();
            var _local_2:ISelectorWindow = (this._window.findChildByName("doormode") as ISelectorWindow);
            var _local_3:IWindow = _local_2.getSelected();
            if (_local_3 == null)
            {
                k.doorMode = this._roomSettingsData.doorMode;
            }
            else
            {
                switch (_local_3.name)
                {
                    case "doormode_doorbell":
                        k.doorMode = RoomSettingsFlatInfo.DOORMODE_CLOSED;
                        break;
                    case "doormode_password":
                        k.doorMode = RoomSettingsFlatInfo.DOORMODE_PASSWORD;
                        break;
                    case "doormode_invisible":
                        k.doorMode = RoomSettingsFlatInfo.DOORMODE_INVISIBLE;
                        break;
                    default:
                        k.doorMode = RoomSettingsFlatInfo.DOORMODE_OPEN;
                }
            }
            if (k.doorMode == RoomSettingsFlatInfo.DOORMODE_PASSWORD)
            {
                _local_8 = this._Str_4194.getText();
                _local_9 = this._Str_7349.getText();
                if (_local_8 != _local_9)
                {
                    this._Str_4194.clearErrors();
                    this._Str_5306(_Str_7004);
                    this._Str_7349.displayError("${navigator.roomsettings.invalidconfirm}");
                    return;
                }
                if (_local_8 != "")
                {
                    k.password = _local_8;
                }
            }
            var _local_4:IDropMenuWindow = (this._window.findChildByName("categories") as IDropMenuWindow);
            var _local_5:FlatCategory = this._Str_25335(this._roomSettingsData.categoryId, _local_4.selection);
            k.categoryId = _local_5.nodeId;
            var _local_6:IDropMenuWindow = (this._window.findChildByName("tradesettings") as IDropMenuWindow);
            k.tradeMode = _local_6.selection;
            var _local_7:IDropMenuWindow = (this._window.findChildByName("maxvisitors") as IDropMenuWindow);
            k.maximumVisitors = _local_7.items()[_local_7.selection];
            k.allowPets = this._Str_7157.Selected;
            k.allowFoodConsume = this._Str_7429.Selected;
            k.allowWalkThrough = this._Str_5537.Selected;
            k.allowNavigatorDynCats = this._Str_6233.Selected;
            k.hideWalls = this._Str_5830.Selected;
            k.wallThickness = (this._Str_6424.selection - 2);
            k.floorThickness = (this._Str_6508.selection - 2);
            k.tags = new Array();
            this._Str_21352(this._tag1Input, k.tags);
            this._Str_21352(this._tag2Input, k.tags);
            this._Str_24511(k);
            k.chatMode = this._Str_15306.selection;
            k.chatBubbleSize = this._Str_6283.selection;
            k.chatScrollUpFrequency = this._Str_10492.selection;
            k.chatFullHearRange = int(this._Str_14650.getText());
            k.chatFloodSensitivity = this._Str_6390.selection;
            this.clearErrors();
            this._Str_15710 = k.roomId;
            this._navigator.send(new SaveRoomSettingsMessageComposer(k));
        }

        private function _Str_21352(k:TextFieldManager, _arg_2:Array):void
        {
            var _local_3:String;
            if (k.getText() != "")
            {
                _local_3 = k.getText();
                if (((_Str_8651) && (_local_3.charAt(0) == "#")))
                {
                    _local_3 = _local_3.substr(1, (_local_3.length - 1));
                }
                _arg_2.push(_local_3);
            }
        }

        private function _Str_24511(k:SaveableRoomSettingsData):void
        {
            var _local_2:IWindow;
            var _local_3:ISelectorWindow = (this._window.findChildByName("moderation_mute_selector") as ISelectorWindow);
            _local_2 = _local_3.getSelected();
            switch (_local_2.name)
            {
                case "moderation_mute_rights":
                    k.whoCanMute = RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS;
                    break;
                default:
                    k.whoCanMute = RoomModerationSettings.MODERATION_LEVEL_NONE;
            }
            var _local_4:ISelectorWindow = (this._window.findChildByName("moderation_kick_selector") as ISelectorWindow);
            _local_2 = _local_4.getSelected();
            switch (_local_2.name)
            {
                case "moderation_kick_rights":
                    k.whoCanKick = RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS;
                    break;
                case "moderation_kick_all":
                    k.whoCanKick = RoomModerationSettings.MODERATION_LEVEL_ALL;
                    break;
                default:
                    k.whoCanKick = RoomModerationSettings.MODERATION_LEVEL_NONE;
            }
            var _local_5:ISelectorWindow = (this._window.findChildByName("moderation_ban_selector") as ISelectorWindow);
            _local_2 = _local_5.getSelected();
            switch (_local_2.name)
            {
                case "moderation_ban_rights":
                    k.whoCanBan = RoomModerationSettings.MODERATION_LEVEL_USER_WITH_RIGHTS;
                    return;
                default:
                    k.whoCanBan = RoomModerationSettings.MODERATION_LEVEL_NONE;
            }
        }

        private function _Str_23147(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._Str_2449 == this._navigator.homeRoomId)
            {
                this._navigator.windowManager.alert("${navigator.delete.homeroom.title}", "${navigator.delete.homeroom.body}", 0, this.onAlertClose);
                return;
            }
            if (this._Str_2366 > 0)
            {
                this._navigator.windowManager.alert("${group.deletebase.title}", "${group.deletebase.body}", 0, this.onAlertClose);
                return;
            }
            Logger.log(("[RoomSettingsCtrl.onDeleteButtonClick] " + this._Str_2449));
            if (this._roomSettingsData == null)
            {
                return;
            }
            if (this._Str_3508 != null)
            {
                this._Str_3508.dispose();
            }
            this._navigator.registerParameter("navigator.roomsettings.deleteroom.confirm.message", "room_name", this._roomSettingsData.name);
            this._Str_3508 = new ConfirmDialogView(this._navigator, this.onConfirmRoomDelete, "${navigator.roomsettings}", "${navigator.roomsettings.deleteroom.confirm.message}");
        }

        private function _Str_22624(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._navigator.windowManager != null)
            {
                (this._navigator.windowManager as Component).context.createLinkEvent("habbopages/builders-club/faq");
            }
        }

        private function onAlertClose(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function onConfirmRoomDelete():void
        {
            var k:GuestRoomSearchResultData;
            this._navigator.send(new DeleteRoomMessageComposer(this._roomSettingsData.roomId));
            this.close();
            if (this._navigator.data.guestRoomSearchResults != null)
            {
                k = this._navigator.data.guestRoomSearchResults;
                this._navigator.mainViewCtrl.startSearch(this._navigator.tabs.getSelected().id, k.searchType, k._Str_25185);
            }
        }

        private function _Str_24257(k:WindowEvent):void
        {
            this._Str_16749(true);
        }

        private function _Str_25104(k:WindowEvent):void
        {
            this._Str_16749(false);
        }

        private function _Str_16749(k:Boolean):void
        {
            this._Str_20910().visible = k;
        }

        private function _Str_23966():void
        {
            if (!this._Str_14837(_Str_7004))
            {
                return;
            }
            if (!this._navigator.data.enteredGuestRoom)
            {
                return;
            }
            var k:Boolean = (this._navigator.data.enteredGuestRoom.habboGroupId > 0);
            this._window.findChildByName("guild_access_disclaimer").visible = k;
        }

        private function _Str_20772():void
        {
            var _local_2:Array;
            if (!this._Str_14837(_Str_8841))
            {
                return;
            }
            if (!this._navigator.data.enteredGuestRoom)
            {
                return;
            }
            var k:Boolean = false;//(this._navigator.data.enteredGuestRoom.habboGroupId > 0);
            this._window.findChildByName("guild_rights_container").visible = k;
            this._window.findChildByName("normal_rights_container").visible = (!(k));
            if (k)
            {
                return;
            }
            if (this._roomSettingsData._Str_13003 == null)
            {
                this._roomSettingsData._Str_13003 = new Dictionary();
                this._navigator.send(new GetFlatControllersMessageComposer(this._roomSettingsData.roomId));
                _local_2 = new Array();
            }
            else
            {
                _local_2 = this._roomSettingsData.controllerList;
            }
            var _local_3:String = ITextWindow(this._window.findChildByName("filter_users_input")).text.toLowerCase();
            var _local_4:Array = this._Str_24611();
            this._Str_8572.refresh(IItemListWindow(this._window.findChildByName("users_with_rights_item_list")), _local_2, _local_3, this._roomSettingsData.highlightedUserId);
            this._Str_8896.refresh(IItemListWindow(this._window.findChildByName("friends_item_list")), _local_4, _local_3, this._roomSettingsData.highlightedUserId);
            this._navigator.registerParameter("navigator.flatctrls.userswithrights", "displayed", ("" + this._Str_8572.userCount));
            this._navigator.registerParameter("navigator.flatctrls.friends", "displayed", ("" + this._Str_8896.userCount));
            this._navigator.registerParameter("navigator.flatctrls.userswithrights", "total", ("" + _local_2.length));
            this._navigator.registerParameter("navigator.flatctrls.friends", "total", ("" + _local_4.length));
        }

        private function _Str_22485():void
        {
            var k:Array;
            if (this._Str_5809 != _Str_13301)
            {
                return;
            }
            if (this._roomSettingsData.bannedUsersById == null)
            {
                this._navigator.send(new GetBannedUsersFromRoomMessageComposer(this._roomSettingsData.roomId));
                k = new Array();
            }
            else
            {
                k = this._roomSettingsData.bannedUsersList;
            }
            this._Str_7254.refresh(IItemListWindow(this._window.findChildByName("moderation_banned_users")), k, "", 0);
        }

        private function _Str_24611():Array
        {
            var _local_3:IFlatUser;
            var k:Dictionary = this._roomSettingsData._Str_13003;
            var _local_2:Array = new Array();
            if (k.length == 0)
            {
                return _local_2;
            }
            for each (_local_3 in this._navigator.data.friendList.list)
            {
                if (k[_local_3.userId] == null)
                {
                    _local_2.push(_local_3);
                }
            }
            return _local_2;
        }

        private function _Str_25553(k:WindowEvent):void
        {
            Logger.log("Remove all clicked: ");
            if (this._Str_3508 != null)
            {
                this._Str_3508.dispose();
            }
            this._Str_3508 = new ConfirmDialogView(this._navigator, this._Str_25387, "${navigator.flatctrls.removeconfirm.title}", "${navigator.flatctrls.removeconfirm.info}");
        }

        private function _Str_25387():void
        {
            this._navigator.send(new RemoveAllRightsMessageComposer(this._Str_2449));
        }

        private function onTab(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_5809 = _arg_2.id;
            this.refresh();
            if (this._Str_5809 == _Str_7004)
            {
                this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "select", "room.settings.doormode.seen");
            }
        }

        private function _Str_22741(k:WindowEvent):void
        {
            this._Str_20772();
        }

        private function _Str_23198(k:WindowMouseEvent):void
        {
            if (this._Str_7254._Str_20232 < 0)
            {
                return;
            }
            var _local_2:IItemListWindow = (this._window.findChildByName("moderation_banned_users") as IItemListWindow);
            var _local_3:IWindow = IWindowContainer(_local_2.getListItemAt(this._Str_7254._Str_20232)).findChildByName("user_info_region");
            var _local_4:int = _local_3.id;
            this._navigator.send(new UnbanUserFromRoomMessageComposer(_local_4, this._Str_2449));
        }

        private function _Str_20309(k:int):String
        {
            if (k == _Str_19025)
            {
                return "chat/options";
            }
            return "";
        }

        public function get linkPattern():String
        {
            return "roomsettings/";
        }

        public function linkReceived(link:String):void
        {
        }

        private function _Str_20494(k:WindowMouseEvent):void
        {
            this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.walkthrough.seen");
        }

        private function _Str_25771(k:WindowMouseEvent):void
        {
            this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.scrollspeed.seen");
        }

        private function _Str_19760(k:WindowMouseEvent):void
        {
            this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.floodfilter.seen");
        }

        private function _Str_21477(k:WindowMouseEvent):void
        {
            this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.hearrange.seen");
        }
    }
}
