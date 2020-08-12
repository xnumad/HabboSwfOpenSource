package com.sulake.habbo.navigator.inroom
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.navigator.GuildInfoCtrl;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TagRenderer;
    import flash.events.Event;
    import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
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
    import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.MuteAllInRoomComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateHomeRoomMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer;

    public class RoomInfoViewCtrl
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _guildInfoCtrl:GuildInfoCtrl;
        private var _window:IFrameWindow;
        private var _tagRenderer:TagRenderer;
        private var _embedExpanded:Boolean = false;
        private var _visible:Boolean = false;

        public function RoomInfoViewCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
            this._guildInfoCtrl = new GuildInfoCtrl(this._navigator);
            this._tagRenderer = new TagRenderer(this._navigator);
        }

        public function dispose():void
        {
            this._navigator = null;
            this._visible = false;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._tagRenderer)
            {
                this._tagRenderer.dispose();
                this._tagRenderer = null;
            }
            if (this._guildInfoCtrl)
            {
                this._guildInfoCtrl.dispose();
                this._guildInfoCtrl = null;
            }
        }

        public function close():void
        {
            if (this._window == null)
            {
                return;
            }
            this._visible = false;
            this._window.dispose();
            this._window = null;
            this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
        }

        public function reload():void
        {
            if (this._visible)
            {
                this.refresh();
            }
        }

        public function toggle():void
        {
            if (this._visible)
            {
                this._visible = false;
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
            }
            else
            {
                this._visible = true;
                this.refresh();
                if (this._window != null)
                {
                    this._window.activate();
                }
            }
        }

        private function refresh():void
        {
            if (this._navigator.data.enteredGuestRoom == null)
            {
                return;
            }
            this._tagRenderer._Str_8651 = true;
            this.prepareWindow();
            Util._Str_2930(this._window.content);
            this.refreshRoomDetails(this._navigator.data.enteredGuestRoom);
            this.refreshEmbed();
            this._guildInfoCtrl.refresh(this._window.content, this._navigator.data.enteredGuestRoom);
            this.refreshButtons(this._navigator.data.enteredGuestRoom);
            Util.moveChildrenToColumn(this._window.content, ["room_details", "public_space_details", "guild_info", "embed_info", "buttons_cont"], 0, 3);
            this._window.findChildByName("guild_info").x = 11;
            this._window.height = (Util.getLowestPoint(this._window.content) + 45);
        }

        private function isHome(k:GuestRoomData):Boolean
        {
            return (!(k == null)) && (k.flatId == this._navigator.data.homeRoomId);
        }

        private function refreshEmbed():void
        {
            var _local_4:ITextWindow;
            var _local_5:ITextFieldWindow;
            var _local_6:IWindow;
            var k:IWindowContainer = IWindowContainer(this.find("embed_info"));
            var _local_2:Boolean = this._navigator.getBoolean("embed.showInRoomInfo");
            var _local_3:* = (!(this._navigator.data.enteredGuestRoom == null));
            if (((_local_3) && (_local_2)))
            {
                _local_4 = ITextWindow(k.findChildByName("embed_info_txt"));
                _local_5 = ITextFieldWindow(k.findChildByName("embed_src_txt"));
                _local_6 = k.findChildByName("embed_info_region");
                k.visible = true;
                if (this._embedExpanded)
                {
                    _local_5.text = this.getEmbedData();
                }
                _local_4.visible = this._embedExpanded;
                _local_5.visible = this._embedExpanded;
                _local_6.visible = false;
                k.height = (Util.getLowestPoint(k) + 5);
                _local_6.visible = true;
                _local_6.height = ((this._embedExpanded) ? _local_5.y : k.height);
            }
            else
            {
                k.visible = false;
            }
        }

        private function refreshRoomDetails(k:GuestRoomData):void
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
            if (((k.showOwner) && (k.ownerId > 0)))
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
            this._tagRenderer._Str_19120(_local_2, k.tags);
            _local_5.visible = false;
            if (k.description != "")
            {
                _local_5.height = (_local_5.textHeight + 5);
                _local_5.visible = true;
            }
            this.find("rating_region").visible = this._navigator.data._Str_5090;
            ITextWindow(this.find("rating_txt")).text = ("" + this._navigator.data._Str_15395);
            var _local_6:IWindow = this._window.findChildByName("rating_txt");
            this._window.findChildByName("rating_region").x = ((_local_6.x + _local_6.width) + 5);
            this.find("ranking_cont").visible = (k.ranking > 0);
            ITextWindow(this.find("ranking_txt")).text = ("" + k.ranking);
            this._navigator.refreshButton(_local_2, "home", this.isHome(k), null, 0);
            this._window.findChildByName("make_home_region").visible = (!(this.isHome(k)));
            this._window.findChildByName("make_favourite_region").visible = ((!(this._navigator.data._Str_12763)) && (!(this._navigator.data._Str_21092())));
            this._window.findChildByName("favourite_region").visible = ((!(this._navigator.data._Str_12763)) && (this._navigator.data._Str_21092()));
            this._window.findChildByName("floor_plan_editor_button").visible = this._navigator.data.canEditRoomSettings;
            Util.moveChildrenToColumn(_local_2, ["room_name", "owner_name_cont", "rating_cont", "ranking_cont", "padding_cont", "tags", "room_desc", "thumbnail_container"], _local_3.y, 0);
            _local_2.visible = true;
            _local_2.height = Util.getLowestPoint(_local_2);
        }

        private function refreshStaffPick(k:Boolean=false):void
        {
            var _local_2:IWindow;
            if (this._window)
            {
                _local_2 = this._window.findChildByName("staff_pick_button");
                if (!this._navigator.data.roomPicker)
                {
                    _local_2.visible = false;
                    return;
                }
                _local_2.visible = true;
                if (k)
                {
                    _local_2.caption = this._navigator.getText(((this._navigator.data._Str_8299) ? "navigator.staffpicks.pick" : "navigator.staffpicks.unpick"));
                }
                else
                {
                    _local_2.caption = this._navigator.getText(((this._navigator.data._Str_8299) ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick"));
                }
            }
        }

        public function refreshButtons(k:GuestRoomData):void
        {
            var _local_7:IWindowContainer;
            if (((this._navigator.data.enteredGuestRoom == null) || (this._window == null)))
            {
                return;
            }
            this.find("room_settings_button").visible = this._navigator.data.canEditRoomSettings;
            this.find("room_filter_button").visible = ((this._navigator.data.canEditRoomSettings) && (this._navigator.getBoolean("room.custom.filter.enabled")));
            if (!this._navigator.getBoolean("room.report.enabled"))
            {
                _local_7 = IWindowContainer(this.find("room_report_button"));
                if (_local_7)
                {
                    _local_7.visible = false;
                }
            }
            this.refreshStaffPick();
            var _local_2:IWindow = this.find("room_muteall_button");
            _local_2.visible = ((this._navigator.data.enteredGuestRoom.canMute) && (this._navigator.getBoolean("room_moderation.mute_all.enabled")));
            var _local_3:Boolean = this._navigator.data.enteredGuestRoom.allInRoomMuted;
            _local_2.caption = ((_local_3) ? "${navigator.muteall_on}" : "${navigator.muteall_off}");
            var _local_4:IRoomSession = this._navigator.roomSessionManager.getSession(this._navigator.data.enteredGuestRoom.flatId);
            this.find("floor_plan_editor_button").visible = (_local_4.roomControllerLevel >= RoomControllerLevel.GUEST);
            var _local_5:IWindowContainer = IWindowContainer(this._window.findChildByName("buttons_cont"));
            var _local_6:Array = ["room_settings_button", "room_filter_button", "floor_plan_editor_button", "staff_pick_button", "room_report_button", "room_muteall_button"];
            Util.moveChildrenToColumn(_local_5, _local_6, 0, 3);
            _local_5.visible = Util._Str_13639(IWindowContainer(_local_5));
            _local_5.height = Util.getLowestPoint(_local_5);
        }

        private function prepareWindow():void
        {
            var k:String;
            var _local_5:String;
            this._visible = true;
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._navigator.getXmlWindow("iro_room_details_framed"));
            this._window.center();
            this.addMouseClickListener(this.find("make_favourite_region"), this.onAddFavouriteClick);
            this.addMouseClickListener(this.find("favourite_region"), this.onRemoveFavouriteClick);
            this.addMouseClickListener(this.find("room_settings_button"), this.onRoomSettingsClick);
            this.addMouseClickListener(this.find("room_filter_button"), this.onRoomFilterButtonClick);
            this.addMouseClickListener(this.find("floor_plan_editor_button"), this.onFloorPlanEditorButtonClick);
            this.addMouseClickListener(this.find("room_muteall_button"), this.onMuteAllClick);
            this.addMouseClickListener(this.find("make_home_region"), this.onMakeHomeClick);
            this.addMouseClickListener(this.find("remove_rights_region"), this.onRemoveRights);
            this.addMouseClickListener(this.find("embed_src_txt"), this.onEmbedSrcClick);
            this.addMouseClickListener(this.find("staff_pick_button"), this.onStaffPick);
            this.addMouseClickListener(this.find("room_report_button"), this.onRoomReport);
            this._navigator.refreshButton(IRegionWindow(this.find("remove_rights_region")), "remove_rights", this._navigator.hasRoomRightsButIsNotOwner(this._navigator.data.enteredGuestRoom.flatId), null, 0);
            this._navigator.refreshButton(IRegionWindow(this.find("make_home_region")), "make_home", true, null, 0);
            this._navigator.refreshButton(IRegionWindow(this.find("favourite_region")), "favourite", true, null, 0);
            this._navigator.refreshButton(IRegionWindow(this.find("make_favourite_region")), "make_favourite", true, null, 0);
            this._navigator.refreshButton(IWindowContainer(this.find("embed_info")), "icon_weblink", true, null, 0);
            this.addMouseClickListener(this._window.findChildByTag("close"), this.onCloseButtonClick);
            var _local_2:IWindowContainer = IWindowContainer(this._window.findChildByName("owner_name_cont"));
            _local_2.procedure = this.onOwnerName;
            Util._Str_7173(_local_2, 1000, 10, 2, 5);
            this.setupLabelAndValue("rating_cont", "rating_caption", "rating_txt");
            this.setupLabelAndValue("ranking_cont", "ranking_caption", "ranking_txt");
            var _local_3:IWindowContainer = IWindowContainer(this.find("embed_info"));
            var _local_4:ITextWindow = ITextWindow(this.find("embed_info_txt"));
            _local_4.height = (_local_4.textHeight + 5);
            Util.moveChildrenToColumn(_local_3, ["embed_info_txt", "embed_src_txt"], _local_4.y, 2);
            _local_3.height = (Util.getLowestPoint(_local_3) + 5);
            _local_3.findChildByName("embed_info_region").procedure = this.onEmbedInfo;
            if (this._navigator.sessionData.isPerkAllowed(PerkEnum.NAVIGATOR_ROOM_THUMBNAIL_CAMERA))
            {
                this._window.findChildByName("add_thumbnail_region").visible = this._navigator.data.canEditRoomSettings;
                if (this._navigator.data.canEditRoomSettings)
                {
                    this.addMouseClickListener(this.find("add_thumbnail_region"), this.onAddRoomThumbnail);
                }
                _local_5 = "";
                if (this._navigator.data.enteredGuestRoom.officialRoomPicRef != null)
                {
                    if (this._navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                    {
                        k = this._navigator.getProperty("navigator.thumbnail.url_base");
                        _local_5 = ((k + this._navigator.data.enteredGuestRoom.flatId) + ".png");
                    }
                    else
                    {
                        _local_5 = (this._navigator.getProperty("image.library.url") + this._navigator.data.enteredGuestRoom.officialRoomPicRef);
                    }
                }
                else
                {
                    k = this._navigator.getProperty("navigator.thumbnail.url_base");
                    _local_5 = ((k + this._navigator.data.enteredGuestRoom.flatId) + ".png");
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("thumbnail_image")).assetUri = _local_5;
            }
            else
            {
                this._window.findChildByName("thumbnail_container").visible = false;
            }
        }

        private function setupLabelAndValue(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IWindowContainer = IWindowContainer(this.find(k));
            var _local_5:ITextWindow = ITextWindow(_local_4.findChildByName(_arg_2));
            _local_5.width = _local_5.textWidth;
            Util._Str_5055(_local_4, [_arg_2, _arg_3], _local_5.x, _local_5.y, 3);
        }

        private function addMouseClickListener(k:IWindow, _arg_2:Function):void
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

        public function onAddFavouriteClick(k:WindowEvent):void
        {
            var _local_2:SimpleAlertView;
            if (this._navigator.data.enteredGuestRoom == null)
            {
                return;
            }
            if (this._navigator.data._Str_23152())
            {
                _local_2 = new SimpleAlertView(this._navigator, "${navigator.favouritesfull.title}", "${navigator.favouritesfull.body}");
                _local_2.show();
            }
            else
            {
                this._navigator.trackGoogle("roomInfo", "addFavourite");
                this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
            }
        }

        public function onRemoveFavouriteClick(k:WindowEvent):void
        {
            if (this._navigator.data.enteredGuestRoom == null)
            {
                return;
            }
            this._navigator.trackGoogle("roomInfo", "removeFavourite");
            this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
        }

        private function onRoomSettingsClick(k:WindowEvent):void
        {
            var _local_2:GuestRoomData = this._navigator.data.enteredGuestRoom;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            this._navigator.trackGoogle("roomInfo", "editRoomSettings");
            this._navigator.roomSettingsCtrl.startRoomSettingsEdit(_local_2.flatId);
            this.close();
        }

        private function onRoomFilterButtonClick(k:WindowEvent):void
        {
            var _local_2:GuestRoomData = this._navigator.data.enteredGuestRoom;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            this._navigator.trackGoogle("roomInfo", "editRoomFilter");
            this._navigator.roomFilterCtrl.startRoomFilterEdit(_local_2.flatId);
            this.close();
        }

        private function onFloorPlanEditorButtonClick(k:WindowEvent):void
        {
            this._navigator.trackGoogle("roomInfo", "floorPlanEditor");
            this._navigator.windowManager.displayFloorPlanEditor();
            this.close();
        }

        private function onMuteAllClick(k:WindowEvent):void
        {
            this._navigator.send(new MuteAllInRoomComposer());
        }

        private function onMakeHomeClick(k:WindowEvent):void
        {
            var _local_2:GuestRoomData = this._navigator.data.enteredGuestRoom;
            if (_local_2 == null)
            {
                Logger.log("No entered room data?!");
                return;
            }
            Logger.log(("SETTING HOME ROOM TO: " + _local_2.flatId));
            this._navigator.trackGoogle("roomInfo", "makeHome");
            this._navigator.send(new UpdateHomeRoomMessageComposer(_local_2.flatId));
        }

        private function onCloseButtonClick(k:WindowEvent):void
        {
            this.hideInfo(null);
        }

        private function onRemoveRights(k:WindowEvent):void
        {
            this._navigator.removeRoomRights(this._navigator.enteredGuestRoomData.flatId);
            this.find("remove_rights_region").visible = false;
        }

        private function onStaffPick(k:WindowEvent):void
        {
            this.refreshStaffPick(true);
            this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId, this._navigator.data._Str_8299));
        }

        private function onRoomReport(k:WindowEvent):void
        {
            this._navigator.trackGoogle("roomInfo", "reportRoom");
            var _local_2:GuestRoomData = this._navigator.data.enteredGuestRoom;
            this._navigator.habboHelp.reportRoom(_local_2.flatId, _local_2.roomName, _local_2.description);
            this.close();
        }

        private function onEmbedSrcClick(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(this.find("embed_src_txt"));
            _local_2.setSelection(0, _local_2.text.length);
            this._navigator.trackGoogle("roomInfo", "embedSrc");
        }

        private function onAddRoomThumbnail(k:WindowEvent):void
        {
            (this._navigator.windowManager as Component).context.createLinkEvent("roomThumbnailCamera/open");
            this.close();
            var _local_2:* = ((this._navigator.getProperty("navigator.thumbnail.url_base") + this._navigator.data.enteredGuestRoom.flatId) + ".png");
            this._navigator.windowManager.resourceManager.removeAsset(_local_2);
            this._navigator.trackGoogle("roomInfo", "addThumbnail");
        }

        private function hideInfo(k:Event):void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._visible = false;
        }

        private function getEmbedData():String
        {
            var k:String;
            var _local_2:String;
            if (this._navigator.data.enteredGuestRoom != null)
            {
                k = "private";
                _local_2 = ("" + this._navigator.data.enteredGuestRoom.flatId);
            }
            var _local_3:String = this._navigator.getProperty("user.hash");
            this._navigator.registerParameter("navigator.embed.src", "roomType", k);
            this._navigator.registerParameter("navigator.embed.src", "embedCode", _local_3);
            this._navigator.registerParameter("navigator.embed.src", "roomId", _local_2);
            return this._navigator.getText("navigator.embed.src");
        }

        private function onEmbedInfo(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._embedExpanded = (!(this._embedExpanded));
            this.refresh();
        }

        private function onOwnerName(k:WindowEvent, _arg_2:IWindow):void
        {
            _Str_3521._Str_6514(k, _arg_2);
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator.trackGoogle("roomInfo", "extendedProfile");
                this._navigator.trackGoogle("extendedProfile", "navigator_roomInfo");
                this._navigator.send(new GetExtendedProfileMessageComposer(this._navigator.data.enteredGuestRoom.ownerId));
            }
        }
    }
}
