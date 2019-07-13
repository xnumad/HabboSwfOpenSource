package com.sulake.habbo.toolbar.extensions._Str_402
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.habbo.phonenumber.PhoneNumberStatusEnum;
    import com.sulake.habbo.phonenumber.ClientPhoneVerificationStatusEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_10960;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_11774;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_7498;

    public class _Str_8732 
    {
        private var _window:IWindowContainer;
        private var _habboToolbar:HabboToolbar;

        public function _Str_8732(k:HabboToolbar)
        {
            this._habboToolbar = k;
            this.createWindow();
        }

        public function dispose():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.dispose();
            this._window = null;
        }

        private function createWindow():void
        {
            var k:XmlAsset = (this._habboToolbar.assets.getAssetByName("me_menu_other_settings_xml") as XmlAsset);
            this._window = (this._habboToolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            var _local_2:int;
            var _local_3:IWindow;
            while (_local_2 < this._window.numChildren)
            {
                _local_3 = this._window.getChildAt(_local_2);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_2++;
            }
            ICheckBoxWindow(this._window.findChildByName("prefer_old_chat_checkbox"))._Str_2365 = this._habboToolbar.freeFlowChat.isDisabledInPreferences;
            ICheckBoxWindow(this._window.findChildByName("ignore_room_invites_checkbox"))._Str_2365 = this._habboToolbar.messenger._Str_16882();
            this._window.findChildByName("disable_room_camera_follow_checkbox").visible = (this._window.findChildByName("disable_room_camera_follow_label").visible = this._habboToolbar.getBoolean("room.camera.follow_user"));
            if (this._habboToolbar.getBoolean("room.camera.follow_user"))
            {
                ICheckBoxWindow(this._window.findChildByName("disable_room_camera_follow_checkbox"))._Str_2365 = this._habboToolbar.sessionDataManager._Str_18110;
            }
            var _local_4:Boolean = this._habboToolbar.getBoolean("sms.identity.verification.enabled");
            var _local_5:* = (this._habboToolbar.getInteger("phone.verification.status", PhoneNumberStatusEnum._Str_4917) == PhoneNumberStatusEnum._Str_9489);
            var _local_6:* = (this._habboToolbar.getInteger("phone.collection.status", ClientPhoneVerificationStatusEnum._Str_4917) == ClientPhoneVerificationStatusEnum._Str_9095);
            var _local_7:Boolean = this._habboToolbar.getBoolean("sms.identity.verification.button.enabled");
            var _local_8:* = (this._habboToolbar.getInteger("phone.collection.status", ClientPhoneVerificationStatusEnum._Str_4917) == ClientPhoneVerificationStatusEnum._Str_4917);
            var _local_9:Boolean = (((_local_4) && (!(_local_5))) && ((_local_6) || ((_local_7) && (_local_8))));
            this._window.findChildByName("btn_reset_phone_number_collection").visible = _local_9;
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_4:Boolean;
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "back_btn":
                    this.dispose();
                    return;
                case "prefer_old_chat_checkbox":
                    this._habboToolbar.freeFlowChat.isDisabledInPreferences = ICheckBoxWindow(this._window.findChildByName("prefer_old_chat_checkbox"))._Str_2365;
                    if (!this._habboToolbar.freeFlowChat.isDisabledInPreferences)
                    {
                        if (((!(this._habboToolbar._Str_12052._Str_10612 == null)) && (!(this._habboToolbar.freeFlowChat.displayObject == null))))
                        {
                            this._habboToolbar._Str_12052._Str_10612.setDisplayObject(this._habboToolbar.freeFlowChat.displayObject);
                        }
                    }
                    else
                    {
                        this._habboToolbar.freeFlowChat.clear();
                    }
                    return;
                case "ignore_room_invites_checkbox":
                    this._habboToolbar.messenger._Str_19823(ICheckBoxWindow(this._window.findChildByName("ignore_room_invites_checkbox"))._Str_2365);
                    this._habboToolbar.connection.send(new _Str_10960(this._habboToolbar.messenger._Str_16882()));
                    return;
                case "disable_room_camera_follow_checkbox":
                    _local_4 = ICheckBoxWindow(this._window.findChildByName("disable_room_camera_follow_checkbox"))._Str_2365;
                    this._habboToolbar.connection.send(new _Str_11774(_local_4));
                    this._habboToolbar.sessionDataManager.setGodMode(_local_4);
                    return;
                case "btn_reset_phone_number_collection":
                    this._window.findChildByName("btn_reset_phone_number_collection").visible = false;
                    this._habboToolbar.connection.send(new _Str_7498());
                    return;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }
    }
}







