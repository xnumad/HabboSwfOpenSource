package com.sulake.habbo.navigator.inroom
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.navigator.GuildInfoCtrl;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TagRenderer;
    import flash.events.Event;
    import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.SimpleAlertView;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_4893;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_5262;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_11661;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7911;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11662;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;

    public class RoomEventViewCtrl 
    {
        private var _Str_2272:IHabboTransitionalNavigator;
        private var _Str_6891:GuildInfoCtrl;
        private var _window:IFrameWindow;
        private var _Str_3306:TagRenderer;
        private var _Str_9199:Boolean = false;
        private var _Str_2500:Boolean = false;

        public function RoomEventViewCtrl(k:IHabboTransitionalNavigator)
        {
            this._Str_2272 = k;
            this._Str_6891 = new GuildInfoCtrl(this._Str_2272);
            this._Str_3306 = new TagRenderer(this._Str_2272);
        }

        public function dispose():void
        {
            this._Str_2272 = null;
            this._Str_2500 = false;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_3306)
            {
                this._Str_3306.dispose();
                this._Str_3306 = null;
            }
            if (this._Str_6891)
            {
                this._Str_6891.dispose();
                this._Str_6891 = null;
            }
        }

        public function close():void
        {
            if (this._window == null)
            {
                return;
            }
            this._Str_2500 = false;
            this._window.dispose();
            this._window = null;
            this._Str_2272.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
        }

        public function reload():void
        {
            if (this._Str_2500)
            {
                this.refresh();
            }
        }

        public function toggle():void
        {
            if (this._Str_2500)
            {
                this._Str_2500 = false;
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
            }
            else
            {
                this._Str_2500 = true;
                this.refresh();
                if (this._window != null)
                {
                    this._window.activate();
                }
            }
        }

        private function refresh():void
        {
            if (this._Str_2272.data._Str_2678 == null)
            {
                return;
            }
            this._Str_3306._Str_8651 = true;
            this._Str_2755();
            Util._Str_2930(this._window.content);
            this._Str_22543(this._Str_2272.data._Str_2678);
            this._Str_22403();
            this._Str_6891.refresh(this._window.content, this._Str_2272.data._Str_2678);
            this._Str_4295(this._Str_2272.data._Str_2678);
            Util._Str_4679(this._window.content, ["room_details", "public_space_details", "guild_info", "embed_info", "buttons_cont"], 0, 3);
            this._window.findChildByName("guild_info").x = 11;
            this._window.height = (Util._Str_2647(this._window.content) + 45);
        }

        private function _Str_10475(k:_Str_2370):Boolean
        {
            return (!(k == null)) && (k.flatId == this._Str_2272.data.homeRoomId);
        }

        private function _Str_22403():void
        {
            var _local_4:ITextWindow;
            var _local_5:ITextFieldWindow;
            var _local_6:IWindow;
            var k:IWindowContainer = IWindowContainer(this.find("embed_info"));
            var _local_2:Boolean = this._Str_2272.getBoolean("embed.showInRoomInfo");
            var _local_3:* = (!(this._Str_2272.data._Str_2678 == null));
            if (((_local_3) && (_local_2)))
            {
                _local_4 = ITextWindow(k.findChildByName("embed_info_txt"));
                _local_5 = ITextFieldWindow(k.findChildByName("embed_src_txt"));
                _local_6 = k.findChildByName("embed_info_region");
                k.visible = true;
                if (this._Str_9199)
                {
                    _local_5.text = this._Str_8567();
                }
                _local_4.visible = this._Str_9199;
                _local_5.visible = this._Str_9199;
                _local_6.visible = false;
                k.height = (Util._Str_2647(k) + 5);
                _local_6.visible = true;
                _local_6.height = ((this._Str_9199) ? _local_5.y : k.height);
            }
            else
            {
                k.visible = false;
            }
        }

        private function _Str_22543(k:_Str_2370):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IWindowContainer = IWindowContainer(this.find("room_details"));
            var _local_3:ITextWindow = ITextWindow(this.find("room_name"));
            _local_3.text = k.roomName;
            _local_3.height = (_local_3.textHeight + 5);
            var _local_4:ITextWindow = ITextWindow(this.find("owner_name"));
            if (((k._Str_6938) && (k.ownerId > 0)))
            {
                this.find("owner_name_cont").visible = true;
                _local_4.visible = true;
                _local_4.text = k.ownerName;
                _Str_3521._Str_3927(false, _local_2);
            }
            else
            {
                this.find("owner_name_cont").visible = false;
            }
            var _local_5:ITextWindow = ITextWindow(this.find("room_desc"));
            _local_5.text = k.description;
            this._Str_3306._Str_19120(_local_2, k.tags);
            _local_5.visible = false;
            if (k.description != "")
            {
                _local_5.height = (_local_5.textHeight + 5);
                _local_5.visible = true;
            }
            this.find("rating_region").visible = this._Str_2272.data._Str_5090;
            ITextWindow(this.find("rating_txt")).text = ("" + this._Str_2272.data._Str_15395);
            var _local_6:IWindow = this._window.findChildByName("rating_txt");
            this._window.findChildByName("rating_region").x = ((_local_6.x + _local_6.width) + 5);
            this.find("ranking_cont").visible = (k.ranking > 0);
            ITextWindow(this.find("ranking_txt")).text = ("" + k.ranking);
            this._Str_2272.refreshButton(_local_2, "home", this._Str_10475(k), null, 0);
            this._window.findChildByName("make_home_region").visible = (!(this._Str_10475(k)));
            this._window.findChildByName("make_favourite_region").visible = ((!(this._Str_2272.data._Str_12763)) && (!(this._Str_2272.data._Str_21092())));
            this._window.findChildByName("favourite_region").visible = ((!(this._Str_2272.data._Str_12763)) && (this._Str_2272.data._Str_21092()));
            this._window.findChildByName("floor_plan_editor_button").visible = this._Str_2272.data._Str_11824;
            Util._Str_4679(_local_2, ["room_name", "owner_name_cont", "rating_cont", "ranking_cont", "padding_cont", "tags", "room_desc", "thumbnail_container"], _local_3.y, 0);
            _local_2.visible = true;
            _local_2.height = Util._Str_2647(_local_2);
        }

        private function _Str_19944(k:Boolean=false):void
        {
            var _local_2:IWindow;
            if (this._window)
            {
                _local_2 = this._window.findChildByName("staff_pick_button");
                if (!this._Str_2272.data._Str_14374)
                {
                    _local_2.visible = false;
                    return;
                }
                _local_2.visible = true;
                if (k)
                {
                    _local_2.caption = this._Str_2272.getText(((this._Str_2272.data._Str_8299) ? "navigator.staffpicks.pick" : "navigator.staffpicks.unpick"));
                }
                else
                {
                    _local_2.caption = this._Str_2272.getText(((this._Str_2272.data._Str_8299) ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick"));
                }
            }
        }

        public function _Str_4295(k:_Str_2370):void
        {
            var _local_7:IWindowContainer;
            if (((this._Str_2272.data._Str_2678 == null) || (this._window == null)))
            {
                return;
            }
            this.find("room_settings_button").visible = this._Str_2272.data._Str_11824;
            this.find("room_filter_button").visible = ((this._Str_2272.data._Str_11824) && (this._Str_2272.getBoolean("room.custom.filter.enabled")));
            if (!this._Str_2272.getBoolean("room.report.enabled"))
            {
                _local_7 = IWindowContainer(this.find("room_report_button"));
                if (_local_7)
                {
                    _local_7.visible = false;
                }
            }
            this._Str_19944();
            var _local_2:IWindow = this.find("room_muteall_button");
            _local_2.visible = ((this._Str_2272.data._Str_2678._Str_16504) && (this._Str_2272.getBoolean("room_moderation.mute_all.enabled")));
            var _local_3:Boolean = this._Str_2272.data._Str_2678._Str_12127;
            _local_2.caption = ((_local_3) ? "${navigator.muteall_on}" : "${navigator.muteall_off}");
            var _local_4:IRoomSession = this._Str_2272.roomSessionManager.getSession(this._Str_2272.data._Str_2678.flatId);
            this.find("floor_plan_editor_button").visible = (_local_4.roomControllerLevel >= RoomControllerLevel.GUEST);
            var _local_5:IWindowContainer = IWindowContainer(this._window.findChildByName("buttons_cont"));
            var _local_6:Array = ["room_settings_button", "room_filter_button", "floor_plan_editor_button", "staff_pick_button", "room_report_button", "room_muteall_button"];
            Util._Str_4679(_local_5, _local_6, 0, 3);
            _local_5.visible = Util._Str_13639(IWindowContainer(_local_5));
            _local_5.height = Util._Str_2647(_local_5);
        }

        private function _Str_2755():void
        {
            var k:String;
            var _local_5:String;
            this._Str_2500 = true;
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._Str_2272.getXmlWindow("iro_room_details_framed"));
            this._window.center();
            this._Str_2786(this.find("make_favourite_region"), this._Str_16071);
            this._Str_2786(this.find("favourite_region"), this._Str_16307);
            this._Str_2786(this.find("room_settings_button"), this._Str_25312);
            this._Str_2786(this.find("room_filter_button"), this._Str_22339);
            this._Str_2786(this.find("floor_plan_editor_button"), this._Str_23389);
            this._Str_2786(this.find("room_muteall_button"), this._Str_25149);
            this._Str_2786(this.find("make_home_region"), this._Str_25302);
            this._Str_2786(this.find("remove_rights_region"), this._Str_25186);
            this._Str_2786(this.find("embed_src_txt"), this._Str_23461);
            this._Str_2786(this.find("staff_pick_button"), this._Str_22695);
            this._Str_2786(this.find("room_report_button"), this._Str_24254);
            this._Str_2272.refreshButton(IRegionWindow(this.find("remove_rights_region")), "remove_rights", this._Str_2272.hasRoomRightsButIsNotOwner(this._Str_2272.data._Str_2678.flatId), null, 0);
            this._Str_2272.refreshButton(IRegionWindow(this.find("make_home_region")), "make_home", true, null, 0);
            this._Str_2272.refreshButton(IRegionWindow(this.find("favourite_region")), "favourite", true, null, 0);
            this._Str_2272.refreshButton(IRegionWindow(this.find("make_favourite_region")), "make_favourite", true, null, 0);
            this._Str_2272.refreshButton(IWindowContainer(this.find("embed_info")), "icon_weblink", true, null, 0);
            this._Str_2786(this._window.findChildByTag("close"), this._Str_18537);
            var _local_2:IWindowContainer = IWindowContainer(this._window.findChildByName("owner_name_cont"));
            _local_2.procedure = this._Str_10211;
            Util._Str_7173(_local_2, 1000, 10, 2, 5);
            this._Str_19728("rating_cont", "rating_caption", "rating_txt");
            this._Str_19728("ranking_cont", "ranking_caption", "ranking_txt");
            var _local_3:IWindowContainer = IWindowContainer(this.find("embed_info"));
            var _local_4:ITextWindow = ITextWindow(this.find("embed_info_txt"));
            _local_4.height = (_local_4.textHeight + 5);
            Util._Str_4679(_local_3, ["embed_info_txt", "embed_src_txt"], _local_4.y, 2);
            _local_3.height = (Util._Str_2647(_local_3) + 5);
            _local_3.findChildByName("embed_info_region").procedure = this._Str_25487;
            if (this._Str_2272._Str_2627.isPerkAllowed(PerkEnum.NAVIGATOR_ROOM_THUMBNAIL_CAMERA))
            {
                this._window.findChildByName("add_thumbnail_region").visible = this._Str_2272.data._Str_11824;
                if (this._Str_2272.data._Str_11824)
                {
                    this._Str_2786(this.find("add_thumbnail_region"), this._Str_22351);
                }
                _local_5 = "";
                if (this._Str_2272.data._Str_2678.officialRoomPicRef != null)
                {
                    if (this._Str_2272.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                    {
                        k = this._Str_2272.getProperty("navigator.thumbnail.url_base");
                        _local_5 = ((k + this._Str_2272.data._Str_2678.flatId) + ".png");
                    }
                    else
                    {
                        _local_5 = (this._Str_2272.getProperty("image.library.url") + this._Str_2272.data._Str_2678.officialRoomPicRef);
                    }
                }
                else
                {
                    k = this._Str_2272.getProperty("navigator.thumbnail.url_base");
                    _local_5 = ((k + this._Str_2272.data._Str_2678.flatId) + ".png");
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("thumbnail_image")).assetUri = _local_5;
            }
            else
            {
                this._window.findChildByName("thumbnail_container").visible = false;
            }
        }

        private function _Str_19728(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IWindowContainer = IWindowContainer(this.find(k));
            var _local_5:ITextWindow = ITextWindow(_local_4.findChildByName(_arg_2));
            _local_5.width = _local_5.textWidth;
            Util._Str_5055(_local_4, [_arg_2, _arg_3], _local_5.x, _local_5.y, 3);
        }

        private function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        private function find(k:String):IWindow
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 == null)
            {
                throw (new Error((("Window element with name: " + k) + " cannot be found!")));
            }
            return _local_2;
        }

        public function _Str_16071(k:WindowEvent):void
        {
            var _local_2:SimpleAlertView;
            if (this._Str_2272.data._Str_2678 == null)
            {
                return;
            }
            if (this._Str_2272.data._Str_23152())
            {
                _local_2 = new SimpleAlertView(this._Str_2272, "${navigator.favouritesfull.title}", "${navigator.favouritesfull.body}");
                _local_2.show();
            }
            else
            {
                this._Str_2272.trackGoogle("roomInfo", "addFavourite");
                this._Str_2272.send(new _Str_4893(this._Str_2272.data._Str_2678.flatId));
            }
        }

        public function _Str_16307(k:WindowEvent):void
        {
            if (this._Str_2272.data._Str_2678 == null)
            {
                return;
            }
            this._Str_2272.trackGoogle("roomInfo", "removeFavourite");
            this._Str_2272.send(new _Str_5262(this._Str_2272.data._Str_2678.flatId));
        }

        private function _Str_25312(k:WindowEvent):void
        {
            var _local_2:_Str_2370 = this._Str_2272.data._Str_2678;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            this._Str_2272.trackGoogle("roomInfo", "editRoomSettings");
            this._Str_2272._Str_3188._Str_25624(_local_2.flatId);
            this.close();
        }

        private function _Str_22339(k:WindowEvent):void
        {
            var _local_2:_Str_2370 = this._Str_2272.data._Str_2678;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            this._Str_2272.trackGoogle("roomInfo", "editRoomFilter");
            this._Str_2272._Str_6472._Str_23256(_local_2.flatId);
            this.close();
        }

        private function _Str_23389(k:WindowEvent):void
        {
            this._Str_2272.trackGoogle("roomInfo", "floorPlanEditor");
            this._Str_2272.windowManager.displayFloorPlanEditor();
            this.close();
        }

        private function _Str_25149(k:WindowEvent):void
        {
            this._Str_2272.send(new _Str_11661());
        }

        private function _Str_25302(k:WindowEvent):void
        {
            var _local_2:_Str_2370 = this._Str_2272.data._Str_2678;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            Logger.log(("SETTING HOME ROOM TO: " + _local_2.flatId));
            this._Str_2272.trackGoogle("roomInfo", "makeHome");
            this._Str_2272.send(new _Str_7911(_local_2.flatId));
        }

        private function _Str_18537(k:WindowEvent):void
        {
            this._Str_24298(null);
        }

        private function _Str_25186(k:WindowEvent):void
        {
            this._Str_2272.removeRoomRights(this._Str_2272.enteredGuestRoomData.flatId);
            this.find("remove_rights_region").visible = false;
        }

        private function _Str_22695(k:WindowEvent):void
        {
            this._Str_19944(true);
            this._Str_2272.send(new _Str_11662(this._Str_2272.data._Str_2678.flatId, this._Str_2272.data._Str_8299));
        }

        private function _Str_24254(k:WindowEvent):void
        {
            this._Str_2272.trackGoogle("roomInfo", "reportRoom");
            var _local_2:_Str_2370 = this._Str_2272.data._Str_2678;
            this._Str_2272._Str_2602.reportRoom(_local_2.flatId, _local_2.roomName, _local_2.description);
            this.close();
        }

        private function _Str_23461(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(this.find("embed_src_txt"));
            _local_2.setSelection(0, _local_2.text.length);
            this._Str_2272.trackGoogle("roomInfo", "embedSrc");
        }

        private function _Str_22351(k:WindowEvent):void
        {
            (this._Str_2272.windowManager as Component).context.createLinkEvent("roomThumbnailCamera/open");
            this.close();
            var _local_2:* = ((this._Str_2272.getProperty("navigator.thumbnail.url_base") + this._Str_2272.data._Str_2678.flatId) + ".png");
            this._Str_2272.windowManager.resourceManager.removeAsset(_local_2);
            this._Str_2272.trackGoogle("roomInfo", "addThumbnail");
        }

        private function _Str_24298(k:Event):void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._Str_2500 = false;
        }

        private function _Str_8567():String
        {
            var k:String;
            var _local_2:String;
            if (this._Str_2272.data._Str_2678 != null)
            {
                k = "private";
                _local_2 = ("" + this._Str_2272.data._Str_2678.flatId);
            }
            var _local_3:String = this._Str_2272.getProperty("user.hash");
            this._Str_2272.registerParameter("navigator.embed.src", "roomType", k);
            this._Str_2272.registerParameter("navigator.embed.src", "embedCode", _local_3);
            this._Str_2272.registerParameter("navigator.embed.src", "roomId", _local_2);
            return this._Str_2272.getText("navigator.embed.src");
        }

        private function _Str_25487(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_9199 = (!(this._Str_9199));
            this.refresh();
        }

        private function _Str_10211(k:WindowEvent, _arg_2:IWindow):void
        {
            _Str_3521._Str_6514(k, _arg_2);
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_2272.trackGoogle("roomInfo", "extendedProfile");
                this._Str_2272.trackGoogle("extendedProfile", "navigator_roomInfo");
                this._Str_2272.send(new _Str_2553(this._Str_2272.data._Str_2678.ownerId));
            }
        }
    }
}
