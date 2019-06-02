package com.sulake.habbo.catalog.clubcenter
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets._Str_4709;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.clubcenter.util.ClubStatus;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4528;
    import com.sulake.habbo.catalog.purse.IPurse;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.FriendlyTime;

    public class ClubCenterView implements IAvatarImageListener 
    {
        private var _controller:HabboClubCenter;
        private var _window:IWindowContainer;
        private var _widget:_Str_4709;
        private var _figure:String;

        public function ClubCenterView(k:HabboClubCenter, _arg_2:IHabboWindowManager, _arg_3:String)
        {
            this._controller = k;
            this._window = (_arg_2.buildFromXML(XML(this._controller.assets.getAssetByName("club_center_xml").content)) as IWindowContainer);
            if (!this.container)
            {
                return;
            }
            if (!this._controller._Str_21512())
            {
                this._Str_1397("special_breakdown_link");
                this._Str_1397("special_content");
                this._Str_1397("special_content_postit");
                this.container.invalidate();
            }
            else
            {
                this._Str_4219("special_amount_icon", false);
                this._Str_4219("special_amount_title", false);
                this._Str_4219("special_amount_content", false);
                this._Str_4219("special_breakdown_link", false);
                this._Str_4219("special_time_content", false);
            }
            this._Str_4219("btn_earn", false);
            this._controller._Str_16489();
            this._window.center();
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_RELOCATE, this._Str_19257);
            this._figure = _arg_3;
            this._widget = (IWidgetWindow(this._window.findChildByName("avatar")).widget as _Str_4709);
            var _local_4:IAvatarImage = this._controller.avatarRenderManager.createAvatarImage(_arg_3, AvatarScaleType.LARGE, null, this);
            if (_local_4)
            {
                _local_4.setDirection(AvatarSetType.FULL, 4);
                this._widget._Str_9202(_local_4._Str_818(AvatarSetType.FULL));
            }
            this.container.procedure = this._Str_3055;
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.removeEventListener(WindowEvent.WINDOW_EVENT_RELOCATE, this._Str_19257);
                this._window.dispose();
                this._window = null;
            }
            this._controller = null;
        }

        public function _Str_22518(k:_Str_4528, _arg_2:IPurse, _arg_3:int, _arg_4:BitmapData):void
        {
            var _local_8:IButtonWindow;
            var _local_9:int;
            var _local_5:String = this._controller._Str_24259();
            this._Str_3281("status_title", (("${hccenter.status." + _local_5) + "}"));
            if (((!(k)) || (!(_arg_2))))
            {
                this._Str_4219("gift_content", false);
                this._Str_4219("special_container", false);
                return;
            }
            this._Str_4219("gift_content", true);
            var _local_6:String = this.getLocalization((("hccenter.status." + _local_5) + ".info"));
            _local_6 = _local_6.replace("%timeleft%", this._Str_21064(_arg_2.minutesUntilExpiration));
            _local_6 = _local_6.replace("%joindate%", k._Str_25452);
            _local_6 = _local_6.replace("%streakduration%", this._Str_22787(k._Str_25314));
            this._Str_3281("status_info", _local_6);
            var _local_7:IBitmapWrapperWindow = (this.container.findChildByName("hc_badge") as IBitmapWrapperWindow);
            if (((_local_7) && (_arg_4)))
            {
                _local_7.bitmap = _arg_4;
            }
            if (this._controller._Str_21512())
            {
                if (k._Str_20889 < 60)
                {
                    this._Str_3281("special_time_content", this.getLocalization("hccenter.special.time.soon"));
                }
                else
                {
                    this._Str_3281("special_time_content", this._Str_21064(k._Str_20889));
                }
                this._Str_4219("special_time_content", true);
                _local_9 = (k._Str_19650 + k._Str_14016);
                if (_local_9 > 0)
                {
                    this._Str_4219("special_amount_icon", true);
                    this._Str_4219("special_amount_title", true);
                    this._Str_4219("special_amount_content", true);
                    this._Str_4219("special_breakdown_link", true);
                    this._Str_3281("special_amount_content", this.getLocalization("hccenter.special.sum").replace("%credits%", _local_9));
                }
            }
            _local_8 = (this.container.findChildByName("btn_gift") as IButtonWindow);
            if (((_local_5 == ClubStatus.ACTIVE) && (_arg_3 > 0)))
            {
                if (_local_8)
                {
                    _local_8.caption = "${hccenter.btn.gifts.redeem}";
                }
                this._Str_3281("gift_info", this.getLocalization("hccenter.unclaimedgifts").replace("%unclaimedgifts%", _arg_3));
            }
            else
            {
                if (_local_8)
                {
                    _local_8.caption = "${hccenter.btn.gifts.view}";
                }
                this._Str_3281("gift_info", this.getLocalization("hccenter.gift.info"));
            }
            _local_8 = (this.container.findChildByName("btn_buy") as IButtonWindow);
            if (_local_5 == ClubStatus.ACTIVE)
            {
                if (_local_8)
                {
                    _local_8.caption = "${hccenter.btn.extend}";
                }
            }
            else
            {
                if (_local_8)
                {
                    _local_8.caption = "${hccenter.btn.buy}";
                }
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IAvatarImage;
            if (k == this._figure)
            {
                _local_2 = this._controller.avatarRenderManager.createAvatarImage(this._figure, AvatarScaleType.LARGE, null, this);
                _local_2.setDirection(AvatarSetType.FULL, 4);
                this._widget._Str_9202(_local_2._Str_818(AvatarSetType.FULL));
            }
        }

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.DOWN)) || (!(this._controller))))
            {
                return;
            }
            k.stopImmediatePropagation();
            k.stopPropagation();
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this._controller.removeView();
                    return;
                case "special_infolink":
                    this._controller._Str_21087();
                    return;
                case "special_breakdown_link":
                    this._controller._Str_23974();
                    return;
                case "general_infolink":
                    this._controller.openHelpPage();
                    return;
                case "btn_gift":
                    this._controller._Str_22271();
                    this._controller.removeView();
                    return;
                case "btn_buy":
                    this._controller._Str_24472();
                    this._controller.removeView();
                    return;
                case "btn_earn":
                    if (this._controller._Str_19407)
                    {
                        this._controller._Str_19407.showVideo();
                    }
                    return;
                default:
                    return;
            }
        }

        private function _Str_19257(k:WindowEvent):void
        {
            this._controller._Str_11788();
        }

        private function get container():IWindowContainer
        {
            return this._window;
        }

        private function _Str_3281(k:String, _arg_2:String):void
        {
            if (!this.container)
            {
                return;
            }
            var _local_3:ITextWindow = (this.container.findChildByName(k) as ITextWindow);
            if (_local_3)
            {
                _local_3.text = _arg_2;
            }
        }

        private function _Str_4219(k:String, _arg_2:Boolean):void
        {
            if (!this.container)
            {
                return;
            }
            var _local_3:IWindow = this.container.findChildByName(k);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            }
        }

        public function _Str_23883():IWindow
        {
            return (this.container) ? this.container.findChildByName("special_content_postit") : null;
        }

        private function _Str_1397(k:*):void
        {
            if (!this.container)
            {
                return;
            }
            var _local_2:IWindow = this.container.findChildByName(k);
            if (!_local_2)
            {
                return;
            }
            var _local_3:IWindowContainer = (_local_2.parent as IWindowContainer);
            _local_3.removeChild(_local_2);
        }

        private function getLocalization(k:String):String
        {
            if (((!(this._controller)) || (!(this._controller.localization))))
            {
                return "";
            }
            return this._controller.localization.getLocalization(k, k);
        }

        public function _Str_21064(k:int):String
        {
            return FriendlyTime.shortFormat(this._controller.localization, (k * 60));
        }

        public function _Str_22787(k:int):String
        {
            return FriendlyTime.shortFormat(this._controller.localization, (k * 86400));
        }

        public function get disposed():Boolean
        {
            return this._controller == null;
        }

        public function _Str_24836(k:Boolean, _arg_2:Boolean):void
        {
            var _local_3:IWindow = this._window.findChildByName("btn_earn");
            if (_local_3)
            {
                _local_3.visible = k;
                if (_arg_2)
                {
                    _local_3.enable();
                    _local_3.alpha = 0;
                }
                else
                {
                    _local_3.disable();
                    _local_3.alpha = (0.2 * 0xFF);
                }
            }
        }
    }
}
