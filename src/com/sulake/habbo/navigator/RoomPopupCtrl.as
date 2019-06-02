package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class RoomPopupCtrl extends PopupCtrl 
    {
        private var _details:IWindowContainer;
        private var _room:_Str_2370;
        private var _tagRenderer:TagRenderer;
        private var _navigator:IHabboTransitionalNavigator;
        private var _guildInfoCtrl:GuildInfoCtrl;

        public function RoomPopupCtrl(k:IHabboTransitionalNavigator, _arg_2:int, _arg_3:int)
        {
            super(HabboNavigator(k), _arg_2, _arg_3, "grs_guest_room_details_long");
            this._navigator = k;
            this._tagRenderer = new TagRenderer(k, _Str_14696);
            this._guildInfoCtrl = new GuildInfoCtrl(this._navigator);
        }

        public function set room(k:_Str_2370):void
        {
            this._room = k;
        }

        override public function refreshContent(k:IWindowContainer):void
        {
            if (this._details == null)
            {
                this._details = IWindowContainer(k.findChildByName("details_container"));
            }
            this._details.visible = true;
            this._tagRenderer._Str_8651 = true;
            Util._Str_2930(this._details);
            this._guildInfoCtrl.refresh(this._details, this._room);
            this._Str_16465(this._details, this._room);
            this._Str_24501();
            this._Str_22171("roomctg", this._details, this._Str_23067(this._room._Str_2712));
            this._Str_25479(this._details, this._room);
            this._Str_23089();
            this._Str_24547(this._room);
            this._Str_24426();
            this._Str_15598(this._details, "trading_allowed", (this._room._Str_3827 == RoomTradingLevelEnum._Str_9173));
            this._Str_15598(this._details, "doormode_doorbell", (this._room._Str_2738 == 1));
            this._Str_15598(this._details, "doormode_password", (this._room._Str_2738 == 2));
            this._Str_15598(this._details, "doormode_invisible", (this._room._Str_2738 == 3));
            Util._Str_4679(this._details, ["guild_info", "roomname", "roomctg_cont", "roomowner_cont", "roomdesc", "extra_cont", "doormode_doorbell", "doormode_password", "doormode_invisible", "trading_allowed", "eventinfo_cont", "roomsettings_cont"], 0, 0);
            this._details.findChildByName("guild_info").x = 2;
            this._details.height = Util._Str_2647(this._details);
        }

        private function _Str_24501():void
        {
            var k:ITextWindow = ITextWindow(this._details.findChildByName("roomowner"));
            var _local_2:IRegionWindow = IRegionWindow(this._details.findChildByName("roomowner_cont"));
            _local_2.procedure = this._Str_10211;
            k.caption = ((this._room._Str_6938) ? this._room.ownerName : "");
            _local_2.visible = (((this._room._Str_6938) && (!(this._room.ownerName == ""))) && (!(this._room.ownerName == "-")));
            _Str_3521._Str_3927(false, _local_2);
            Util._Str_7173(_local_2, 1000, 10, 2);
        }

        private function _Str_24426():void
        {
            var _local_2:IRegionWindow;
            var _local_3:ITextWindow;
            var k:Boolean = true;
            if (k)
            {
                _local_2 = IRegionWindow(this._details.findChildByName("roomsettings_cont"));
                _local_3 = ITextWindow(this._details.findChildByName("roomsettings"));
                _local_2.procedure = this._Str_15066;
                _local_2.visible = ((k) && (this._navigator._Str_2627.userId == this._room.ownerId));
                Util._Str_7173(_local_2, 1000, 10, 2);
            }
        }

        private function _Str_23089():void
        {
            var k:IWindowContainer = IWindowContainer(this._details.findChildByName("extra_cont"));
            Util._Str_2930(k);
            this._tagRenderer._Str_19120(k, this._room.tags);
            if (this._room.score > 0)
            {
                this._Str_22171("rating", k, ("" + this._room.score));
                k.findChildByName("rating_cont").visible = true;
            }
            if (Util._Str_13639(k))
            {
                Util._Str_4679(k, ["tags", "startedat_cont", "rating_cont"], 0, 3);
                k.height = (Util._Str_2647(k) + 4);
                k.visible = true;
            }
        }

        private function _Str_24547(k:_Str_2370):void
        {
            if (((k._Str_8163 == null) || (k._Str_8163.length == 0)))
            {
                return;
            }
            var _local_2:IWindowContainer = IWindowContainer(this._details.findChildByName("eventinfo_cont"));
            Util._Str_2930(_local_2);
            var _local_3:ITextWindow = ITextWindow(_local_2.findChildByName("eventinfo_name"));
            var _local_4:ITextWindow = ITextWindow(_local_2.findChildByName("eventinfo_desc"));
            var _local_5:ITextWindow = ITextWindow(_local_2.findChildByName("eventinfo_expirationtime"));
            var _local_6:ITextWindow = ITextWindow(_local_2.findChildByName("eventinfo.caption"));
            _local_3.caption = k._Str_8163;
            _local_4.caption = k._Str_22089;
            _local_5.caption = FriendlyTime.format(this._navigator.localization, (k._Str_15104 * 60));
            _local_4.height = (_local_4.textHeight + 10);
            _local_5.y = (_local_4.y + _local_4.height);
            _local_2.height = (((_local_3.height + _local_4.height) + _local_5.height) + 20);
            var _local_7:IWindowContainer = (_local_2.findChildByName("eventinfo_child_container") as IWindowContainer);
            _local_7.x = (_local_6.textWidth + 5);
            _local_7.height = (Util._Str_2647(_local_7) + 5);
            _local_2.visible = true;
            _local_6.visible = true;
            _local_7.visible = true;
        }

        private function _Str_16465(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            var _local_3:ITextWindow = ITextWindow(k.getChildByName("roomname"));
            _local_3.visible = true;
            _local_3.text = _arg_2.roomName;
            _local_3.height = (_local_3.textHeight + 3);
        }

        private function _Str_25479(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            if (_arg_2.description == "")
            {
                return;
            }
            var _local_3:String = "roomdesc";
            var _local_4:ITextWindow = ITextWindow(k.getChildByName(_local_3));
            _local_4.text = _arg_2.description;
            _local_4.height = (_local_4.textHeight + 10);
            _local_4.y = Util._Str_2647(k);
            _local_4.visible = true;
        }

        private function _Str_22171(k:String, _arg_2:IWindowContainer, _arg_3:String):void
        {
            var _local_4:IWindowContainer = IWindowContainer(_arg_2.findChildByName((k + "_cont")));
            _local_4.visible = true;
            var _local_5:ITextWindow = ITextWindow(_local_4.getChildByName(k));
            var _local_6:ITextWindow = ITextWindow(_local_4.getChildByName((k + ".caption")));
            _local_5.text = _arg_3;
            Util._Str_5055(_local_4, [(k + ".caption"), k], _local_6.x, 0, 2);
        }

        private function _Str_15598(k:IWindowContainer, _arg_2:String, _arg_3:Boolean):void
        {
            if (!_arg_3)
            {
                return;
            }
            var _local_4:IWindowContainer = IWindowContainer(k.findChildByName(_arg_2));
            _local_4.visible = true;
            navigator.refreshButton(_local_4, _arg_2, true, null, 0);
        }

        private function _Str_26278(k:int):String
        {
            var _local_2:String = ("roomevent_type_" + k);
            var _local_3:String = navigator.getText(_local_2);
            return (_local_3 == null) ? "" : _local_3;
        }

        private function _Str_23067(k:int):String
        {
            var _local_2:_Str_2802;
            for each (_local_2 in navigator.data.allCategories)
            {
                if (_local_2._Str_4760 == k)
                {
                    return _local_2._Str_20353;
                }
            }
            return "";
        }

        private function _Str_10211(k:WindowEvent, _arg_2:IWindow):void
        {
            _Str_3521._Str_6514(k, _arg_2);
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator.trackGoogle("extendedProfile", "navigator_roomPopup");
                this._navigator.send(new _Str_2553(this._room.ownerId));
                this._Str_14696();
            }
        }

        private function _Str_15066(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._navigator.trackGoogle("roomInfo", "editRoomSettings");
                this._navigator._Str_3188._Str_21207(this._room.flatId, this._room.habboGroupId);
                this._Str_14696();
            }
        }
    }
}
