package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_3277;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.enum._Str_12232;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarExpressionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetShowOwnRoomsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenInventoryMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenCatalogMessage;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient._Str_5079;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser;

    public class MeMenuMainView implements IMeMenuView 
    {
        public static const MINIMAIL:String = "minimail";

        private var _widget:MeMenuWidget;
        private var _window:IWindowContainer;
        private var _icons:Dictionary;
        private var _perkAllowancesMessageEvent:_Str_3277;
        private var _config:IHabboConfigurationManager;

        public function MeMenuMainView(k:IHabboConfigurationManager)
        {
            this._config = k;
        }

        public function init(k:MeMenuWidget, _arg_2:String):void
        {
            this._icons = new Dictionary();
            this._icons["rooms_icon"] = ["gohome_white", "gohome_color"];
            this._icons["dance_icon"] = ["dance_white", "dance_color"];
            this._icons["clothes_icon"] = ["clothes_white", "clothes_color"];
            this._icons["effects_icon"] = ["effects_white", "effects_color"];
            this._icons["badges_icon"] = ["badges_white", "badges_color"];
            this._icons["wave_icon"] = ["wave_white", "wave_color"];
            this._icons["hc_icon"] = ["_white", "_color"];
            this._icons["settings_icon"] = ["settings_white", "settings_color"];
            this._icons["credits_icon"] = ["credits_white", "credits_color"];
            this._icons["minimail_icon"] = ["minimail_white", "minimail_color"];
            this._icons["profile_icon"] = ["profile_white", "profile_color"];
            this._icons["achievements_icon"] = ["achievements_white", "achievements_color"];
            this._icons["talents_icon"] = ["compass_white", "compass_color"];
            this._icons["guide_icon"] = ["lighthouse_white", "lighthouse_color"];
            this._widget = k;
            this._perkAllowancesMessageEvent = new _Str_3277(this.onPerkAllowances);
            this._widget.handler.container.connection.addMessageEvent(this._perkAllowancesMessageEvent);
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            if (this._perkAllowancesMessageEvent)
            {
                this._widget.handler.container.connection.removeMessageEvent(this._perkAllowancesMessageEvent);
                this._perkAllowancesMessageEvent = null;
            }
            this._widget = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_25524(k:String, _arg_2:String, _arg_3:String=null, _arg_4:String=null):void
        {
            if (this._icons[k] == null)
            {
                return;
            }
            if (_arg_3 != null)
            {
                this._icons[k][0] = _arg_3;
            }
            if (_arg_4 != null)
            {
                this._icons[k][1] = _arg_4;
            }
            this._Str_2972(k, _arg_3);
        }

        private function createWindow(k:String):void
        {
            var _local_5:String;
            var _local_6:IWindow;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:Number;
            var _local_11:String;
            var _local_12:int;
            if (this._widget == null)
            {
                return;
            }
            var _local_2:String = "memenu_main";
            var _local_3:Boolean;
            if (this._widget.config.getBoolean("simple.memenu.enabled"))
            {
                _local_2 = (_local_2 + "_simple");
                _local_3 = true;
            }
            var _local_4:XmlAsset = (this._widget.assets.getAssetByName(_local_2) as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((_local_4.content as XML)) as IWindowContainer);
            if (this._window == null)
            {
                throw (new Error("Failed to construct me menu main window from XML!"));
            }
            this._window.name = k;
            if (((!(this._widget.config.getBoolean("talent.track.enabled"))) && (_local_3)))
            {
                this._window.findChildByName("guide").rectangle = this._window.findChildByName("talents").rectangle;
                this._window.findChildByName("talents").visible = false;
            }
            if (this._widget.config.getBoolean("guides.enabled"))
            {
                this._Str_8899(this._widget.handler.container.sessionDataManager.isPerkAllowed(PerkEnum.USE_GUIDE_TOOL));
            }
            for (_local_5 in this._icons)
            {
                _local_8 = this._icons[_local_5];
                if (!((_local_8 == null) || (_local_8.length == 0)))
                {
                    _local_9 = _local_8[0];
                    _local_10 = 1;
                    switch (_local_5)
                    {
                        case "dance_icon":
                        case "wave_icon":
                            if (this._widget._Str_4878)
                            {
                                _local_10 = 0.5;
                            }
                            break;
                        case "effects_icon":
                            if (this._widget._Str_4107)
                            {
                                _local_10 = 0.5;
                            }
                            break;
                        case "hc_icon":
                            _local_9 = (this._Str_22145() + _local_9);
                            if (!this._widget._Str_22242)
                            {
                                this._Str_3281("hc_text", this._widget.localizations.getLocalization("widget.memenu.hc.join"));
                            }
                            else
                            {
                                if (this._widget._Str_21502 == HabboClubLevelEnum._Str_2575)
                                {
                                    _local_11 = "widget.memenu.vip";
                                }
                                else
                                {
                                    _local_11 = "widget.memenu.hc";
                                }
                                if (this._widget._Str_21813 > 0)
                                {
                                    _local_11 = (_local_11 + ".long");
                                }
                                this._widget.localizations.registerParameter(_local_11, "days", String(this._widget._Str_22596));
                                this._widget.localizations.registerParameter(_local_11, "months", String(this._widget._Str_21813));
                                this._Str_3281("hc_text", this._widget.localizations.getLocalization(_local_11));
                            }
                            break;
                        case "minimail_icon":
                            if (!this._widget._Str_16873)
                            {
                                _local_10 = 0.5;
                            }
                            else
                            {
                                _local_12 = this._widget._Str_21527;
                                if (((_local_12 == -1) || (_local_12 > 0)))
                                {
                                    this._Str_20243("minimail", _local_12);
                                }
                            }
                            break;
                    }
                    this._Str_2972(_local_5, _local_9, _local_10);
                }
            }
            _local_7 = 0;
            while (_local_7 < this._window.numChildren)
            {
                _local_6 = this._window.getChildAt(_local_7);
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_6.addEventListener(WindowMouseEvent.OVER, this._Str_21994);
                _local_6.addEventListener(WindowMouseEvent.OUT, this._Str_21994);
                _local_7++;
            }
        }

        private function _Str_20243(k:String, _arg_2:int):void
        {
            var _local_3:IWindowContainer = (this._window.findChildByName(k) as IWindowContainer);
            var _local_4:IWindowContainer = (_local_3.findChildByName("unseen_counter") as IWindowContainer);
            if (_arg_2 == 0)
            {
                if (_local_4)
                {
                    _local_3.removeChild(_local_4);
                    _local_3.invalidate();
                }
                return;
            }
            if (!_local_4)
            {
                _local_4 = this._widget.windowManager.createUnseenItemCounter();
                _local_4.name = "unseen_counter";
                _local_3.addChild(_local_4);
            }
            (_local_4.findChildByName(_Str_12232.COUNT) as ITextWindow).text = ((_arg_2 > 0) ? _arg_2.toString() : " ");
            _local_4.x = ((_local_3.width - _local_4.width) - 5);
            _local_4.y = 5;
        }

        private function _Str_22145():String
        {
            switch (this._widget._Str_21502)
            {
                case HabboClubLevelEnum._Str_3159:
                case HabboClubLevelEnum._Str_2964:
                    return "club";
                case HabboClubLevelEnum._Str_2575:
                    return "vip";
            }
            return null;
        }

        private function _Str_2972(k:String, _arg_2:String, _arg_3:Number=1):void
        {
            var _local_4:IBitmapWrapperWindow = (this._window.findChildByName(k) as IBitmapWrapperWindow);
            var _local_5:BitmapDataAsset = (this._widget.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_4 == null)
            {
                Logger.log(("Could not find element: " + k));
                return;
            }
            if (((_local_5 == null) || (_local_5.content == null)))
            {
                Logger.log(("Could not find asset: " + _arg_2));
                return;
            }
            var _local_6:BitmapData = (_local_5.content as BitmapData);
            _local_4.bitmap = new BitmapData(_local_4.width, _local_4.height, true, 0);
            var _local_7:int = ((_local_4.width - _local_6.width) / 2);
            var _local_8:int = ((_local_4.height - _local_6.height) / 2);
            _local_4.bitmap.copyPixels(_local_6, _local_6.rect, new Point(_local_7, _local_8));
            _local_4.blend = _arg_3;
        }

        private function _Str_3281(k:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = (this._window.findChildByName(k) as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = _arg_2;
            }
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_4:AvatarExpressionEnum;
            var _local_5:String;
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "dance":
                    if (this._widget._Str_4878)
                    {
                        return;
                    }
                    this._widget._Str_4568(MeMenuWidget.ME_MENU_DANCE_MOVES_VIEW);
                    break;
                case "wave":
                case "blow":
                    if (this._widget._Str_4878)
                    {
                        return;
                    }
                    if (this._widget._Str_4107)
                    {
                        this._widget.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(RoomWidgetDanceMessage._Str_13814));
                        this._widget._Str_4107 = false;
                    }
                    _local_4 = AvatarExpressionEnum.WAVE;
                    if (_local_3 == "blow")
                    {
                        _local_4 = AvatarExpressionEnum.BLOW;
                    }
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetAvatarExpressionMessage(_local_4));
                    this._widget.hide();
                    break;
                case "effects":
                    if (this._widget._Str_4107)
                    {
                        return;
                    }
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_EFFECTS));
                    this._widget.hide();
                    break;
                case "rooms":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetShowOwnRoomsMessage());
                    this._widget.hide();
                    break;
                case "badges":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetOpenInventoryMessage(RoomWidgetOpenInventoryMessage.INVENTORY_BADGES));
                    this._widget.hide();
                    break;
                case "clothes":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetAvatarEditorMessage(RoomWidgetAvatarEditorMessage.RWCM_OPEN_AVATAR_EDITOR));
                    this._widget.hide();
                    break;
                case "hc":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.RWOCM_CLUB_MAIN));
                    this._widget.hide();
                    break;
                case "settings":
                    this._widget._Str_4568(MeMenuWidget.ME_MENU_SETTINGS_VIEW);
                    break;
                case "minimail":
                    if (this._widget._Str_16873)
                    {
                        HabboWebTools.openMinimail("#mail/inbox/");
                        this._widget.hide();
                    }
                    break;
                case "credits":
                    HabboWebTools.openWebPageAndMinimizeClient(this._config.getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
                    this._widget.hide();
                    break;
                case "profile":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, this._widget.userId, "me_menu"));
                    this._widget.hide();
                    break;
                case "achievements":
                    this._widget.handler.container.questEngine.showAchievements();
                    this._widget.hide();
                    break;
                case "guide":
                    this._widget.handler.container.toolbar.toggleWindowVisibility("GUIDE");
                    this._widget.hide();
                    break;
                case "talents":
                    _local_5 = this._widget.handler.container.sessionDataManager.currentTalentTrack;
                    this._widget.handler.container.habboTracking.trackTalentTrackOpen(_local_5, "memenu");
                    this._widget.handler.container.connection.send(new _Str_3075(_local_5));
                    break;
                default:
                    Logger.log(("Me Menu Main View: unknown button: " + _local_3));
            }
            HabboTracking.getInstance().trackEventLog("MeMenu", "click", _local_3);
        }

        private function _Str_26302(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_21994(k:WindowMouseEvent):void
        {
            var _local_5:Array;
            var _local_6:String;
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            var _local_4:* = (_local_3 + "_icon");
            var _local_7:String = "";
            var _local_8:int = ((k.type == WindowMouseEvent.OVER) ? 1 : 0);
            switch (_local_3)
            {
                case "dance":
                    if (this._widget._Str_4878)
                    {
                        return;
                    }
                    break;
                case "minimail":
                    if (!this._widget._Str_16873)
                    {
                        return;
                    }
                    break;
                case "wave":
                    if (this._widget._Str_4878)
                    {
                        return;
                    }
                    break;
                case "effects":
                    if (this._widget._Str_4107)
                    {
                        return;
                    }
                    break;
                case "hc":
                    _local_7 = this._Str_22145();
                    break;
            }
            _local_4 = (_local_3 + "_icon");
            _local_5 = this._icons[_local_4];
            if (_local_5 != null)
            {
                _local_6 = (_local_7 + _local_5[_local_8]);
                this._Str_2972(_local_4, _local_6);
            }
        }

        private function onPerkAllowances(k:_Str_3277):void
        {
            var _local_2:PerkAllowancesMessageParser = k.getParser();
            this._Str_8899(_local_2.isPerkAllowed(PerkEnum.USE_GUIDE_TOOL));
        }

        private function _Str_8899(k:Boolean):void
        {
            var _local_2:IWindow;
            var _local_3:IWindow;
            if (((this._window) && (this._widget)))
            {
                _local_2 = this._window.findChildByName("guide");
                _local_3 = this._window.findChildByName("achievements");
                if (_local_2)
                {
                    _local_2.visible = k;
                    this._window.height = ((k) ? _local_2.bottom : _local_3.bottom);
                    this._widget._Str_19324();
                }
            }
        }

        public function _Str_6111(k:String, _arg_2:int):void
        {
            var _local_3:int;
            switch (k)
            {
                case MINIMAIL:
                    _local_3 = this._widget._Str_21527;
                    this._Str_20243("minimail", _local_3);
                    return;
            }
        }
    }
}
