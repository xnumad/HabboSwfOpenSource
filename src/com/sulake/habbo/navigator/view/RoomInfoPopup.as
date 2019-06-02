package com.sulake.habbo.navigator.view
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_4893;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_5262;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7911;
    import __AS3__.vec.*;

    public class RoomInfoPopup 
    {
        private var _window:IWindowContainer;
        private var _navigator:HabboNewNavigator;
        private var _displayedTags:Vector.<String>;
        private var _guestRoomData:_Str_2370 = null;
        private var _lastWindowPosition:Point;
        private var _roomHomeAltered:Boolean = false;
        private var _roomHomeAlteredValue:Boolean;
        private var _roomFavoriteAltered:Boolean = false;
        private var _roomFavoriteAlteredValue:Boolean;

        public function RoomInfoPopup(k:HabboNewNavigator)
        {
            this._displayedTags = new Vector.<String>(0);
            this._lastWindowPosition = new Point(-1, -1);
            super();
            this._navigator = k;
        }

        public function show(k:Boolean):void
        {
            if (k)
            {
                if (!this._window)
                {
                    this.createWindow();
                }
                this.populate();
                this._window.visible = true;
                this._roomHomeAltered = false;
                this._roomFavoriteAltered = false;
            }
            else
            {
                if (this._window)
                {
                    this._window.visible = false;
                }
            }
        }

        public function get visible():Boolean
        {
            if (!this._window)
            {
                return false;
            }
            return this._window.visible;
        }

        public function _Str_23392(k:Boolean, _arg_2:int, _arg_3:int):void
        {
            var _local_5:Point;
            var _local_4:* = (!(this.visible));
            this.show(k);
            if (k)
            {
                _local_5 = new Point(_arg_2, (_arg_3 - (this._window.height / 2)));
                if (this._lastWindowPosition != _local_5)
                {
                    if ((((_local_4) && (k)) && (this._guestRoomData)))
                    {
                        this._navigator.trackEventLog("browse.openroominfo", "Results", this._guestRoomData.roomName, this._guestRoomData.flatId);
                    }
                }
                this.position = _local_5;
                this._window.activate();
            }
        }

        public function _Str_5479(k:_Str_2370):void
        {
            this._guestRoomData = k;
        }

        public function getGlobalRectangle(k:Rectangle):void
        {
            this._window.getGlobalRectangle(k);
        }

        private function set position(k:Point):void
        {
            this._window.position = k;
            this._lastWindowPosition = k;
        }

        private function get _Str_11907():Boolean
        {
            if (this._roomHomeAltered)
            {
                return this._roomHomeAlteredValue;
            }
            return this._navigator._Str_2559._Str_8458(this._guestRoomData.flatId);
        }

        private function set _Str_11907(k:Boolean):void
        {
            this._roomHomeAltered = true;
            this._roomHomeAlteredValue = k;
        }

        private function get _Str_9158():Boolean
        {
            if (this._roomFavoriteAltered)
            {
                return this._roomFavoriteAlteredValue;
            }
            return this._navigator._Str_2559._Str_12281(this._guestRoomData.flatId);
        }

        private function set _Str_9158(k:Boolean):void
        {
            this._roomFavoriteAltered = true;
            this._roomFavoriteAlteredValue = k;
        }

        private function populate():void
        {
            var _local_8:_Str_2974;
            var _local_9:String;
            var _local_10:String;
            if (this._guestRoomData == null)
            {
                return;
            }
            var k:IItemListWindow = IItemListWindow(this._window.findChildByName("main_content"));
            var _local_2:IItemListWindow = IItemListWindow(this._window.findChildByName("header_content"));
            var _local_3:IItemListWindow = IItemListWindow(this._window.findChildByName("bottom_itemlist"));
            this._window.findChildByName("room_owner_region").visible = this._guestRoomData._Str_6938;
            this._window.findChildByName("room_group_region").visible = (!(this._guestRoomData._Str_7146 == ""));
            this._window.findChildByName("room_name").caption = this._guestRoomData.roomName;
            this._window.findChildByName("room_desc").caption = this._guestRoomData.description;
            this._window.findChildByName("owner_name").caption = this._guestRoomData.ownerName;
            this._window.findChildByName("room_owner_region").id = this._guestRoomData.ownerId;
            this._window.findChildByName("room_owner_region").procedure = this._Str_24359;
            this._window.findChildByName("favorite_region").procedure = this._Str_24499;
            this._window.findChildByName("home_region").procedure = this._Str_24346;
            this._window.findChildByName("settings_region").procedure = this._Str_23718;
            this._window.findChildByName("settings_container").visible = (this._guestRoomData.ownerName == this._navigator._Str_2627.userName);
            if (((this._navigator.context.configuration.getBoolean("room.report.enabled")) && (!(this._guestRoomData.ownerName == this._navigator._Str_2627.userName))))
            {
                this._window.findChildByName("report_region").id = this._guestRoomData.ownerId;
                this._window.findChildByName("report_region").procedure = this._Str_24003;
                this._window.findChildByName("report_region").visible = true;
                this._window.findChildByName("report_container").visible = true;
            }
            else
            {
                this._window.findChildByName("report_region").visible = false;
                this._window.findChildByName("report_container").visible = false;
            }
            IItemListWindow(this._window.findChildByName("midBottom_itemlist")).arrangeListItems();
            IStaticBitmapWrapperWindow(this._window.findChildByName("favorite_icon")).assetUri = ("newnavigator_icon_fav_" + ((this._Str_9158) ? "yes" : "no"));
            IStaticBitmapWrapperWindow(this._window.findChildByName("home_icon")).assetUri = ("newnavigator_icon_home_" + ((this._Str_11907) ? "yes" : "no"));
            var _local_4:* = (!(this._guestRoomData._Str_7146 == ""));
            this._window.findChildByName("room_group_badge").visible = _local_4;
            this._window.findChildByName("room_owner_region").visible = this._guestRoomData._Str_6938;
            this._window.findChildByName("room_group_region").visible = _local_4;
            this._window.findChildByName("room_group_owner_container").visible = ((_local_4) || (this._guestRoomData._Str_6938));
            if (_local_4)
            {
                _Str_2402(IWidgetWindow(this._window.findChildByName("room_group_badge")).widget).badgeId = this._guestRoomData._Str_7146;
                this._window.findChildByName("group_name").caption = this._guestRoomData.groupName;
                this._window.findChildByName("group_name").id = this._guestRoomData.habboGroupId;
                this._window.findChildByName("room_group_region").id = this._guestRoomData.habboGroupId;
                this._window.findChildByName("room_group_region").procedure = this._Str_25360;
                _local_8 = this._navigator._Str_20693(this._guestRoomData.habboGroupId);
                if (_local_8)
                {
                    if (_local_8._Str_3233)
                    {
                        IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_owner";
                    }
                    else
                    {
                        if (_local_8.isAdmin)
                        {
                            IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_admin";
                        }
                        else
                        {
                            IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_admin")).assetUri = null;
                        }
                    }
                    IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_size")).assetUri = (("${image.library.url}guilds/grouptype_icon_" + _local_8.type) + ".png");
                    IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_furnish")).assetUri = ((_local_8._Str_17307) ? "${image.library.url}guilds/group_decorate_icon.png" : null);
                }
            }
            else
            {
                IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_admin")).assetUri = null;
                IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_size")).assetUri = null;
                IStaticBitmapWrapperWindow(this._window.findChildByName("group_mode_furnish")).assetUri = null;
            }
            var _local_5:* = (this._guestRoomData._Str_15104 > 0);
            if (_local_5)
            {
                _local_9 = ((this._navigator.localization.getLocalizationWithParams("navigator.eventsettings.name") + ": ") + this._guestRoomData._Str_8163);
                _local_10 = (((this._navigator.localization.getLocalizationWithParams("navigator.eventsettings.desc") + ": ") + this._guestRoomData._Str_22089) + "\n");
                _local_10 = (_local_10 + (this._navigator.localization.getLocalizationWithParams("roomad.event.expiration_time") + FriendlyTime.format(this._navigator.localization, (this._guestRoomData._Str_15104 * 60))));
                this._window.findChildByName("event_name").caption = _local_9;
                this._window.findChildByName("event_desc").caption = _local_10;
            }
            _local_3.getListItemByName("event_info").visible = _local_5;
            _local_2.arrangeListItems();
            this._displayedTags = new Vector.<String>(0);
            var _local_6:IItemListWindow = IItemListWindow(this._window.findChildByName("tag_list"));
            _local_6.destroyListItems();
            var _local_7:int;
            while (_local_7 < this._guestRoomData.tags.length)
            {
                this._displayedTags.push(this._guestRoomData.tags[_local_7]);
                _local_6.addListItem(this._Str_25580(this._guestRoomData.tags[_local_7], _local_7));
                _local_7++;
            }
            this._Str_25406();
            this._Str_16458("properties", "${navigator.roompopup.property.trading}", RoomTradingLevelEnum._Str_22614(this._guestRoomData._Str_3827));
            if (this._navigator.context.configuration.getBoolean("room.ranking.enabled"))
            {
                this._Str_16458("properties", "${navigator.roompopup.property.ranking}", this._guestRoomData.ranking.toString());
            }
            this._Str_16458("properties", "${navigator.roompopup.property.max_users}", this._guestRoomData._Str_9029.toString());
            IStaticBitmapWrapperWindow(this._window.findChildByName("room_thumbnail")).assetUri = "newnavigator_default_room";
            if (this._navigator._Str_2627.isPerkAllowed(PerkEnum.NAVIGATOR_ROOM_THUMBNAIL_CAMERA))
            {
                if (this._guestRoomData.officialRoomPicRef != null)
                {
                    if (this._navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                    {
                        IStaticBitmapWrapperWindow(this._window.findChildByName("room_thumbnail")).assetUri = ((this._navigator.getProperty("navigator.thumbnail.url_base") + this._guestRoomData.flatId) + ".png");
                    }
                    else
                    {
                        IStaticBitmapWrapperWindow(this._window.findChildByName("room_thumbnail")).assetUri = (this._navigator.getProperty("image.library.url") + this._guestRoomData.officialRoomPicRef);
                    }
                }
                else
                {
                    IStaticBitmapWrapperWindow(this._window.findChildByName("room_thumbnail")).assetUri = ((this._navigator.getProperty("navigator.thumbnail.url_base") + this._guestRoomData.flatId) + ".png");
                }
            }
            _local_3.arrangeListItems();
            k.arrangeListItems();
        }

        private function _Str_25406():void
        {
            IItemListWindow(this._window.findChildByName("properties")).destroyListItems();
        }

        private function _Str_16458(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IItemListWindow = IItemListWindow(this._window.findChildByName(k));
            var _local_5:IWindowContainer = IWindowContainer(this._navigator.windowManager.buildFromXML(XML(this._navigator.assets.getAssetByName("property_xml").content)));
            _local_5.findChildByName("property_name").caption = _arg_2;
            _local_5.findChildByName("property_value").caption = _arg_3;
            _local_4.addListItem(_local_5);
        }

        private function _Str_25580(k:String, _arg_2:int):IWindow
        {
            var _local_3:IWindowContainer = IWindowContainer(this._navigator.windowManager.buildFromXML(XML(this._navigator.assets.getAssetByName("tag_xml").content)));
            var _local_4:IRegionWindow = IRegionWindow(_local_3.findChildByName("tag_region"));
            _local_4.id = _arg_2;
            _local_4.procedure = this._Str_22669;
            _local_4.findChildByName("tag_text").caption = ("#" + k);
            return _local_4;
        }

        private function createWindow():void
        {
            this._window = IWindowContainer(this._navigator.windowManager.buildFromXML(XML(this._navigator.assets.getAssetByName("room_info_popup_bubble_xml").content)));
        }

        private function _Str_24359(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator._Str_12024(_arg_2.id);
                this.destroy();
            }
        }

        private function _Str_25360(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator._Str_18961(_arg_2.id);
                this.destroy();
            }
        }

        private function _Str_24003(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator._Str_2602.reportRoom(this._guestRoomData.flatId, this._guestRoomData.roomName, this._guestRoomData.description);
                this.destroy();
            }
        }

        private function _Str_22669(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator.performTagSearch(this._displayedTags[_arg_2.id]);
                this.destroy();
            }
        }

        private function _Str_23718(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:RoomSettingsCtrl;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = LegacyNavigator(this._navigator._Str_2559)._Str_3188;
                _local_3._Str_21207(this._guestRoomData.flatId, this._guestRoomData.habboGroupId);
                this.destroy();
            }
        }

        private function _Str_24499(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (!this._Str_9158)
                {
                    this._navigator.communication.connection.send(new _Str_4893(this._guestRoomData.flatId));
                    this._Str_9158 = true;
                }
                else
                {
                    this._navigator.communication.connection.send(new _Str_5262(this._guestRoomData.flatId));
                    this._Str_9158 = false;
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("favorite_icon")).assetUri = ("newnavigator_icon_fav_" + ((this._Str_9158) ? "yes" : "no"));
            }
        }

        private function _Str_24346(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (!this._Str_11907)
                {
                    this._navigator.communication.connection.send(new _Str_7911(this._guestRoomData.flatId));
                    this._Str_11907 = true;
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("home_icon")).assetUri = ("newnavigator_icon_home_" + ((this._Str_11907) ? "yes" : "no"));
            }
        }

        private function destroy():void
        {
            if (this._window)
            {
                this._window.destroy();
            }
            this._window = null;
        }
    }
}












