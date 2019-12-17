package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.friendlist.RelationshipStatusEnum;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3266;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_8049;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_6996;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.enum._Str_4387;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4838;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10887;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_11883;
    import com.sulake.habbo.window.utils._Str_2418;

    public class ExtendedProfileWindowCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _groupsList:IItemListWindow;
        private var _groupsListEntryTemplate:IWindowContainer;
        private var _selectedGroupId:int;
        private var _groupDetailsCtrl:GroupDetailsCtrl;
        private var _noGroupsContainer:IWindowContainer;
        private var _data:ExtendedProfileData;
        private var _updateExpected:Boolean;
        private var _badgeUpdateExpected:Boolean = false;
        private var _relationshipStatusMap:Map;
        private var _relationshipUpdateExpected:Boolean = false;

        public function ExtendedProfileWindowCtrl(k:HabboGroupsManager)
        {
            this._relationshipStatusMap = new Map();
            super();
            this._manager = k;
            this._groupDetailsCtrl = new GroupDetailsCtrl(k, false);
        }

        public function dispose():void
        {
            this._manager = null;
            this._groupsList = null;
            this._data = null;
            if (this._relationshipStatusMap)
            {
                this._relationshipStatusMap.dispose();
                this._relationshipStatusMap = null;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._groupDetailsCtrl)
            {
                this._groupDetailsCtrl.dispose();
                this._groupDetailsCtrl = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        private function _Str_2755():void
        {
            var k:int;
            if (this._window != null)
            {
                return;
            }
            if (this._groupsListEntryTemplate == null)
            {
                this._groupsListEntryTemplate = IWindowContainer(this._manager.getXmlWindow("group_entry"));
            }
            if (this._noGroupsContainer == null)
            {
                this._noGroupsContainer = IWindowContainer(this._manager.getXmlWindow("no_groups"));
                this._noGroupsContainer.findChildByName("view_groups_button").procedure = this._Str_24557;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("new_extended_profile"));
            this._window.findChildByTag("close").procedure = this._Str_2392;
            this._window.findChildByName("addasfriend_button").procedure = this._Str_23485;
            this._window.findChildByName("rooms_button").procedure = this._Str_23821;
            this._groupsList = IItemListWindow(this._window.findChildByName("groups_list"));
            this._window.center();
            this._window.findChildByName("change_looks").procedure = this._Str_22609;
            this._window.findChildByName("change_badges").procedure = this._Str_24847;
            this._window.findChildByName("user_activity_points").visible = this._manager._Str_7745;
            for each (k in RelationshipStatusEnum._Str_15184)
            {
                this._window.findChildByName((RelationshipStatusEnum._Str_7401(k) + "_friend_name_link_region")).procedure = this._Str_24644;
            }
        }

        public function _Str_24312(k:int):void
        {
            if (((((!(this._data == null)) && (this._data.userId == k)) && (!(this._window == null))) && (this._window.visible)))
            {
                this._manager.send(new _Str_2553(k));
                this._updateExpected = true;
            }
        }

        public function _Str_18339(k:ExtendedProfileData):void
        {
            this._data = k;
            var _local_2:_Str_3266 = this._Str_23684();
            if (_local_2 == null)
            {
                if (this._data.guilds.length > 0)
                {
                    this._selectedGroupId = this._data.guilds[0].groupId;
                    _local_2 = this._data.guilds[0];
                }
                else
                {
                    this._selectedGroupId = 0;
                }
            }
            if (this._selectedGroupId > 0)
            {
                this._manager.send(new _Str_2863(this._selectedGroupId, false));
            }
            this.refresh();
            this._window.visible = true;
            if (!this._updateExpected)
            {
                this._window.activate();
            }
            this._updateExpected = false;
        }

        private function _Str_23684():_Str_3266
        {
            var k:_Str_3266;
            for each (k in this._data.guilds)
            {
                if (k.groupId == this._selectedGroupId)
                {
                    return k;
                }
            }
            return null;
        }

        private function refresh():void
        {
            this._manager.send(new _Str_8049(this._data.userId));
            this._manager.send(new _Str_6996(this._data.userId));
            this._Str_2755();
            this._Str_11540();
            this._Str_25048();
        }

        private function _Str_25048():void
        {
            var _local_2:_Str_3266;
            var _local_3:IWindowContainer;
            var _local_4:_Str_2402;
            var _local_5:IWindowContainer;
            var k:* = (this._data.userId == this._manager._Str_3251);
            this._groupsList.visible = (this._data.guilds.length > 0);
            this._groupsList.destroyListItems();
            for each (_local_2 in this._data.guilds)
            {
                _local_3 = IWindowContainer(this._groupsListEntryTemplate.clone());
                _local_3.id = _local_2.groupId;
                _local_3.findChildByName("bg_region").procedure = this._Str_18701;
                _local_3.findChildByName("bg_region").id = _local_2.groupId;
                _local_3.findChildByName("clear_favourite").procedure = this._Str_24744;
                _local_3.findChildByName("clear_favourite").visible = ((_local_2.favourite) && (k));
                _local_3.findChildByName("clear_favourite").id = _local_2.groupId;
                _local_3.findChildByName("make_favourite").procedure = this._Str_24216;
                _local_3.findChildByName("make_favourite").visible = ((!(_local_2.favourite)) && (k));
                _local_3.findChildByName("make_favourite").id = _local_2.groupId;
                _local_4 = _Str_2402(IWidgetWindow(_local_3.findChildByName("group_pic_bitmap")).widget);
                _local_4.type = _Str_4387.GROUP;
                _local_4.badgeId = _local_2.badgeCode;
                _local_4.groupId = _local_2.groupId;
                this._groupsList.addListItem(_local_3);
            }
            this._Str_20592();
            this._manager.localization.registerParameter("extendedprofile.groups.count", "count", this._data.guilds.length.toString());
            if (this._data.guilds.length < 1)
            {
                _local_5 = IWindowContainer(this._window.findChildByName("group_cont"));
                _local_5.removeChildAt(0);
                _local_5.addChild(this._noGroupsContainer);
                this._noGroupsContainer.findChildByName("no_groups_caption").caption = this._manager.localization.getLocalization(((k) ? "extendedprofile.nogroups.me" : "extendedprofile.nogroups.user"));
                this._noGroupsContainer.findChildByName("view_groups_button").visible = true;
            }
        }

        private function _Str_20592():void
        {
            var _local_2:IWindowContainer;
            var k:int;
            while (k < this._groupsList.numListItems)
            {
                _local_2 = IWindowContainer(this._groupsList.getListItemAt(k));
                _local_2.findChildByName("bg_selected_bitmap").visible = (this._selectedGroupId == _local_2.id);
                _local_2.findChildByName("bg_unselected_bitmap").visible = (!(this._selectedGroupId == _local_2.id));
                k++;
            }
        }

        private function _Str_11540():void
        {
            var k:* = (this._data.userId == this._manager._Str_3251);
            this._window.findChildByName("motto_txt").caption = this._data.motto;
            this._window.findChildByName("status_txt").visible = ((this._data.isFriend) || (k));
            this._window.findChildByName("friend_request_sent_txt").visible = this._data.isRequestFriend;
            this._window.findChildByName("offline_icon").visible = (!(this._data.online));
            this._window.findChildByName("online_icon").visible = this._data.online;
            this._window.findChildByName("status").invalidate();
            this._manager.localization.registerParameter("extendedprofile.username", "username", this._data.userName);
            this._manager.localization.registerParameter("extendedprofile.created", "created", this._data.creationDate);
            this._manager.localization.registerParameter("extendedprofile.activitypoints", "activitypoints", this._data.activityPoints.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " "));
            this._manager.localization.registerParameter("extendedprofile.last.login", "lastlogin", FriendlyTime.format(this._manager.localization, this._data.lastAccessSinceInSeconds, ".ago"));
            this._window.findChildByName("user_last_login").visible = (this._data.lastAccessSinceInSeconds > -1);
            this._Str_16592();
            var _local_2:* = (this._data.friendCount > -1);
            var _local_3:Boolean = (((this._data.isFriend) && (_local_2)) || (k));
            this._window.findChildByName("addasfriend_button").visible = (((((!(this._data.isFriend)) && (!(this._data.isRequestFriend))) && (!(k))) && (this._manager.friendlist.canBeAskedForAFriend(this._data.userId))) && (_local_2));
            this._window.findChildByName("ok_icon").visible = _local_3;
            this._window.findChildByName("status_txt").visible = _local_3;
            this._window.findChildByName("top_right").visible = _local_2;
            this._window.findChildByName("status_txt").caption = this._manager.localization.getLocalization(((this._data.isFriend) ? "extendedprofile.friend" : "extendedprofile.me"));
            this._window.findChildByName("change_own_attributes").visible = k;
        }

        private function _Str_22916():void
        {
            var _local_2:int;
            var k:Boolean = this._manager.getBoolean("relationship.status.enabled");
            if (((k) && (this._window)))
            {
                this._window.findChildByName("rel_status_label_txt").visible = true;
                for each (_local_2 in RelationshipStatusEnum._Str_15184)
                {
                    this._Str_24258(_local_2);
                }
            }
            this._manager.localization.registerParameter("extendedprofile.friends.count", "count", this._data.friendCount.toString());
        }

        private function _Str_24258(k:int):void
        {
            var _local_2:_Str_4838 = this._relationshipStatusMap.getValue(k);
            var _local_3:String = RelationshipStatusEnum._Str_7401(k);
            var _local_4:IWindow = this._window.findChildByName((_local_3 + "_txt"));
            var _local_5:IWindow = this._window.findChildByName((_local_3 + "_friend_name_link_text"));
            var _local_6:IWidgetWindow = IWidgetWindow(this._window.findChildByName((_local_3 + "_head")));
            if (((_local_2) && (_local_2.friendCount > 0)))
            {
                _local_5.caption = _local_2._Str_20359;
                _local_6.visible = true;
                _Str_2483(_local_6.widget).figure = _local_2._Str_22960;
                if (_local_2.friendCount > 1)
                {
                    _local_4.visible = true;
                    _local_4.invalidate();
                    _local_4.caption = this._manager.localization.getLocalizationWithParams(("extendedprofile.relstatus.others." + _local_3), "", "count", ("" + (_local_2.friendCount - 1)));
                }
                else
                {
                    _local_4.visible = false;
                }
            }
            else
            {
                _local_6.visible = false;
                _local_5.caption = "${extendedprofile.add.friends}";
                _local_4.caption = "${extendedprofile.no.friends.in.this.category}";
                _local_4.visible = true;
            }
        }

        public function _Str_3702(k:_Str_2974):void
        {
            var _local_2:IWindowContainer;
            if (this._selectedGroupId == k.groupId)
            {
                _local_2 = IWindowContainer(this._window.findChildByName("group_cont"));
                _local_2.removeChildAt(0);
                _local_2.invalidate();
                this._groupDetailsCtrl._Str_3702(_local_2, k);
            }
        }

        public function _Str_18561(k:int, _arg_2:Map):void
        {
            if (((this._data) && (this._Str_12870)))
            {
                this._relationshipStatusMap = _arg_2.clone();
                this._Str_22916();
                this._Str_12870 = false;
            }
        }

        public function onUserBadges(k:int, _arg_2:Array):void
        {
            var _local_3:int;
            var _local_4:_Str_2402;
            if ((((this._data) && (this._Str_12511)) && (!(this._window == null))))
            {
                _local_3 = 0;
                while (_local_3 < 5)
                {
                    _local_4 = _Str_2402(IWidgetWindow(this._window.findChildByName(("badge_" + _local_3))).widget);
                    _local_4.type = _Str_4387.NORMAL;
                    _local_4.badgeId = ((_local_3 < _arg_2.length) ? _arg_2[_local_3] : "");
                    _local_3++;
                }
                this._Str_12511 = false;
            }
        }

        private function _Str_3931(k:String, _arg_2:Function):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            _local_3.mouseThreshold = 0;
            _local_3.procedure = _arg_2;
        }

        private function _Str_23485(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.friendlist._Str_14642(this._data.userId, this._data.userName);
            this._data.isRequestFriend = true;
            this.refresh();
        }

        private function _Str_23821(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager._Str_25772._Str_3310("hotel_view", ("owner:" + this._data.userName));
        }

        private function _Str_24644(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            var _local_4:_Str_4838;
            var _local_5:int;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if ((((!(k.target == null)) && (!(_arg_2.name == null))) && (!(this._relationshipStatusMap == null))))
            {
                _local_3 = _arg_2.name.substr(0, _arg_2.name.indexOf("_"));
                _local_4 = this._relationshipStatusMap.getValue(RelationshipStatusEnum._Str_25054(_local_3));
                if (_local_4 != null)
                {
                    _local_5 = _local_4._Str_21077;
                    if (_local_5)
                    {
                        this._manager._Str_21987(_local_5);
                    }
                }
                else
                {
                    this._manager.windowManager.alert("${extendedprofile.add.friends.alert.title}", "${extendedprofile.add.friends.alert.body}", 0, this._Str_24203);
                }
            }
        }

        private function _Str_24557(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.navigator.performGuildBaseSearch();
        }

        private function _Str_18701(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._selectedGroupId = _arg_2.id;
            this._manager.send(new _Str_2863(this._selectedGroupId, false));
            this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + _arg_2.id), "select"));
            this._Str_20592();
        }

        private function _Str_24216(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.send(new _Str_10887(_arg_2.id));
            this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + _arg_2.parent.id), "make favourite"));
            this._selectedGroupId = _arg_2.id;
        }

        private function _Str_24744(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.send(new _Str_11883(_arg_2.id));
            this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + _arg_2.parent.id), "clear favourite"));
            this._selectedGroupId = _arg_2.id;
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.close();
        }

        private function _Str_22609(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.context.createLinkEvent("avatareditor/open");
        }

        private function _Str_24847(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.context.createLinkEvent("inventory/open/badges");
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }

        private function _Str_16592(k:Boolean=false):void
        {
            var _local_2:IWidgetWindow = IWidgetWindow(this._window.findChildByName("avatar_image"));
            var _local_3:_Str_2483 = _Str_2483(_local_2.widget);
            _local_3.figure = this._data.figure;
        }

        public function _Str_14387(k:int):void
        {
            if (((((!(this._window == null)) && (this._window.visible)) && (!(this._data == null))) && (!(this._data.userId == k))))
            {
                this._manager.send(new _Str_2553(k));
            }
        }

        public function get _Str_12511():Boolean
        {
            return this._badgeUpdateExpected;
        }

        public function set _Str_12511(k:Boolean):void
        {
            this._badgeUpdateExpected = k;
        }

        public function set _Str_12870(k:Boolean):void
        {
            this._relationshipUpdateExpected = k;
        }

        public function get _Str_12870():Boolean
        {
            return this._relationshipUpdateExpected;
        }

        private function _Str_24203(k:_Str_2418, _arg_2:WindowEvent):void
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._manager.context.createLinkEvent("friendbar/findfriends");
                this.close();
            }
            k.dispose();
        }
    }
}
