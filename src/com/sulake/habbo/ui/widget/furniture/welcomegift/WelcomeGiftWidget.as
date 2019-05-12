package com.sulake.habbo.ui.widget.furniture.welcomegift
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangeEmailMessage;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.ui.widget.events._Str_5438;
    import com.sulake.habbo.ui.widget.events._Str_6843;
    import flash.events.IEventDispatcher;

    public class WelcomeGiftWidget extends ConversionTrackingWidget 
    {
        private const _Str_10705:String = "welcome_gift_email_unverified";
        private const _Str_13122:String = "welcome_gift_email_verified";
        private const _Str_16369:String = "welcome_gift_email_change";
        private const _Str_23012:int = 4;

        private var _Str_580:Boolean = false;
        private var _Str_2271:IWindowContainer;
        private var _Str_4540:String;
        private var _Str_14637:String;
        private var _Str_4340:Boolean;
        private var _Str_5694:Boolean;
        private var _Str_2502:int;

        public function WelcomeGiftWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function get disposed():Boolean
        {
            return this._Str_580;
        }

        override public function dispose():void
        {
            if (this._Str_580)
            {
                return;
            }
            if (this._Str_2271)
            {
                this._Str_2271.dispose();
            }
            super.dispose();
            this._Str_580 = true;
        }

        private function _Str_23801():void
        {
            if (this._Str_2271)
            {
                this._Str_2271.dispose();
            }
            this._Str_2271 = (this._Str_13142("welcome_gift_widget") as IWindowContainer);
            this._Str_2271.center();
            this._Str_3209("image_bg", "yellow_highlight");
            this._Str_3209("gift_image", "giftbox_full");
            if (this._Str_4340)
            {
                this._Str_6469(this._Str_13122);
            }
            else
            {
                this._Str_6469(this._Str_10705);
            }
        }

        private function _Str_13142(k:String):IWindow
        {
            var _local_2:XmlAsset = (assets.getAssetByName(k) as XmlAsset);
            if (!_local_2)
            {
                return null;
            }
            return windowManager.buildFromXML((_local_2.content as XML));
        }

        private function _Str_4782():void
        {
            if (this._Str_2271)
            {
                this._Str_2271.dispose();
                this._Str_2271 = null;
            }
        }

        private function _Str_6469(k:String):void
        {
            var _local_6:ITextFieldWindow;
            if (this._Str_2271 == null)
            {
                return;
            }
            var _local_2:IWindowContainer = (this._Str_2271.findChildByName("state_content") as IWindowContainer);
            while (_local_2.numChildren > 0)
            {
                _local_2.removeChildAt(0);
            }
            var _local_3:IWindow = this._Str_13142(k);
            if (!_local_3)
            {
                Logger.log(("invalid welcome gift widget state: " + k));
                return;
            }
            _local_2.addChild(_local_3);
            _local_2.height = _local_3.height;
            switch (k)
            {
                case this._Str_10705:
                    this._Str_8459(this._Str_2271.findChildByName("edit"), this._Str_23358);
                    this._Str_3209("email_icon", "email_icon");
                    this._Str_4180("title", "${welcome.gift.title.email.unverified}");
                    this._Str_4180("text", "${welcome.gift.text.email.unverified}");
                    this._Str_2271.findChildByName("edit_text").visible = this._Str_5694;
                    this._Str_2271.findChildByName("edit").setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, this._Str_5694);
                    break;
                case this._Str_13122:
                    this._Str_3209("email_icon", "ok_icon");
                    this._Str_4180("title", "${welcome.gift.title.email.verified}");
                    this._Str_4180("text", "${welcome.gift.text.email.verified}");
                    break;
                case this._Str_16369:
                    this._Str_8459(this._Str_2271.findChildByName("cancel_email_change"), this._Str_23425);
                    this._Str_8459(this._Str_2271.findChildByName("save_email"), this._Str_23235);
                    this._Str_3209("email_icon", "email_icon");
                    this._Str_19208("save_email", this._Str_5694);
                    _local_6 = (this._Str_2271.findChildByName("email_input") as ITextFieldWindow);
                    _local_6.caption = this._Str_4540;
                    _local_6.focus();
                    _local_6.setSelection(0, int.MAX_VALUE);
                    break;
            }
            var _local_4:IWindow = this._Str_2271.findChildByName("email");
            if (_local_4)
            {
                _local_4.caption = this._Str_4540;
            }
            var _local_5:IWindow = this._Str_2271.findChildByName("open");
            if (_local_5)
            {
                if (this._Str_4340)
                {
                    _local_5.enable();
                }
                else
                {
                    _local_5.disable();
                }
            }
            this._Str_8459(this._Str_2271.findChildByName("close"), this.close);
            this._Str_8459(this._Str_2271.findChildByTag("close"), this.close);
            this._Str_8459(this._Str_2271.findChildByName("open"), this._Str_23940);
        }

        private function _Str_4180(k:String, _arg_2:String):void
        {
            if (!this._Str_2271)
            {
                return;
            }
            var _local_3:IWindow = this._Str_2271.findChildByName(k);
            if (_local_3)
            {
                _local_3.caption = _arg_2;
            }
        }

        private function _Str_3209(k:String, _arg_2:String):void
        {
            var _local_3:IBitmapWrapperWindow = (this._Str_2271.findChildByName(k) as IBitmapWrapperWindow);
            var _local_4:BitmapDataAsset = (_assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (((!(_local_3)) || (!(_local_4))))
            {
                return;
            }
            var _local_5:BitmapData = (_local_4.content as BitmapData);
            if (_local_3.bitmap)
            {
                _local_3.bitmap.dispose();
            }
            _local_3.bitmap = _local_5.clone();
        }

        private function _Str_8459(k:IWindow, _arg_2:Function):void
        {
            if (k)
            {
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        private function close(k:WindowMouseEvent):void
        {
            this._Str_4782();
        }

        private function _Str_23358(k:WindowMouseEvent):void
        {
            this._Str_6469(this._Str_16369);
        }

        private function _Str_23940(k:WindowMouseEvent):void
        {
            messageListener.processWidgetMessage(new RoomWidgetFurniActionMessage(RoomWidgetFurniActionMessage.RWFAM_OPEN_WELCOME_GIFT, this._Str_2502, 0));
            this._Str_4782();
        }

        private function _Str_23425(k:WindowMouseEvent):void
        {
            this._Str_6469(((this._Str_4340) ? this._Str_13122 : this._Str_10705));
        }

        private function _Str_23235(k:WindowMouseEvent):void
        {
            if (!this._Str_5694)
            {
                return;
            }
            var _local_2:ITextFieldWindow = (this._Str_2271.findChildByName("email_input") as ITextFieldWindow);
            this._Str_2271.findChildByName("cancel_email_change").setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, false);
            this._Str_19208("save_email", false);
            _local_2.editable = false;
            _local_2.selectable = false;
            this._Str_14637 = _local_2.text;
            messageListener.processWidgetMessage(new RoomWidgetChangeEmailMessage(this._Str_14637));
        }

        private function _Str_19208(k:String, _arg_2:Boolean):void
        {
            if (!this._Str_2271)
            {
                return;
            }
            var _local_3:IButtonWindow = (this._Str_2271.findChildByName(k) as IButtonWindow);
            if (_local_3)
            {
                if (_arg_2)
                {
                    _local_3.enable();
                }
                else
                {
                    _local_3.disable();
                }
            }
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (!k)
            {
                return;
            }
            k.addEventListener(_Str_5438.RWWGUE_WELCOME_GIFT_WIDGET_STATUS, this._Str_2557);
            k.addEventListener(_Str_6843.RWCERE_CHANGE_EMAIL_RESULT, this._Str_21802);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_5438.RWWGUE_WELCOME_GIFT_WIDGET_STATUS, this._Str_2557);
            k.removeEventListener(_Str_6843.RWCERE_CHANGE_EMAIL_RESULT, this._Str_21802);
        }

        private function _Str_2557(k:_Str_5438):void
        {
            switch (k.type)
            {
                case _Str_5438.RWWGUE_WELCOME_GIFT_WIDGET_STATUS:
                    this._Str_4540 = k.email;
                    this._Str_4340 = k._Str_5738;
                    this._Str_5694 = k._Str_17916;
                    if (k._Str_10512)
                    {
                        this._Str_2502 = k.furniId;
                        this._Str_23801();
                    }
                    else
                    {
                        this._Str_2491();
                    }
                    return;
            }
        }

        private function _Str_2491():void
        {
            if (!this._Str_2271)
            {
                return;
            }
            if (this._Str_4340)
            {
                this._Str_6469(this._Str_13122);
            }
            else
            {
                this._Str_6469(this._Str_10705);
            }
        }

        private function _Str_21802(k:_Str_6843):void
        {
            if (k.result == 0)
            {
                this._Str_4540 = this._Str_14637;
                this._Str_6469(this._Str_10705);
            }
            else
            {
                if (k.result == this._Str_23012)
                {
                    this._Str_5694 = false;
                }
                this._Str_24136(k.result);
            }
        }

        private function _Str_24136(k:int):void
        {
            if (!this._Str_2271)
            {
                return;
            }
            this._Str_6469(this._Str_16369);
            var _local_2:IWindow = this._Str_2271.findChildByName("email_input_container");
            if (_local_2)
            {
                _local_2.color = 0xFFFF8888;
            }
            this._Str_4180("email_input", this._Str_14637);
            this._Str_4180("email_change_instructions", ((("$" + "{welcome.gift.email.error.") + k) + "}"));
        }
    }
}
