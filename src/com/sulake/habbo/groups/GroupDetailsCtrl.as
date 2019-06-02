package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_6006;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_7379;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10313;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5612;
    import com.sulake.habbo.catalog.enum.CatalogPageName;

    public class GroupDetailsCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _selectedGroup:_Str_2974;

        public function GroupDetailsCtrl(k:HabboGroupsManager, _arg_2:Boolean)
        {
            this._manager = k;
        }

        public function dispose():void
        {
            this._manager = null;
            this._selectedGroup = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        private function _Str_2755(k:IWindowContainer):void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._manager.getXmlWindow("group"));
            this._Str_3931("group_room_link_region", this._Str_17423);
            this._Str_3931("manage_guild_region", this._Str_24785);
            this._Str_3931("delete_guild_region", this._Str_25370);
            this._Str_3931("members_region", this._Str_22812);
            this._Str_3931("pending_members_region", this._Str_23598);
            this._Str_3931("show_groups_link_region", this._Str_23641);
            this._Str_3931("buy_furni_link_region", this._Str_25591);
            this._window.findChildByName("leave_button").procedure = this._Str_23388;
            this._window.findChildByName("join_button").procedure = this._Str_11995;
            this._window.findChildByName("request_membership_button").procedure = this._Str_11995;
        }

        private function _Str_24132(k:IWindowContainer):void
        {
            if (k.getChildIndex(this._window) == -1)
            {
                k.addChild(this._window);
            }
        }

        public function _Str_3702(k:IWindowContainer, _arg_2:_Str_2974):void
        {
            this._selectedGroup = _arg_2;
            this._Str_2755(k);
            this._Str_24132(k);
            var _local_3:IWindow = this._window.findChildByName("group_decorate_icon_region");
            var _local_4:IWindow = this._window.findChildByName("group_name");
            _local_4.caption = _arg_2.groupName;
            _local_3.visible = _arg_2._Str_17307;
            _local_4.x = ((_arg_2._Str_17307) ? (_local_3.x + _local_3.width) : _local_3.x);
            var _local_5:ITextWindow = ITextWindow(this._window.findChildByName("group_description"));
            _local_5.caption = _arg_2.description;
            _local_5.height = (_local_5.textHeight + 5);
            this._window.findChildByName("group_description_scrollbar").visible = (_local_5.height > this._window.findChildByName("group_description_item_list").height);
            var _local_6:Boolean = this._selectedGroup._Str_25156;
            this._window.findChildByName("show_forum_link_region").visible = _local_6;
            this._window.findChildByName("show_forum_link").visible = _local_6;
            if (_local_6)
            {
                this._Str_3931("show_forum_link_region", this._Str_24830);
            }
            this._manager.windowManager.registerLocalizationParameter("group.created", "date", ("" + _arg_2.creationDate));
            this._manager.windowManager.registerLocalizationParameter("group.created", "owner", ("" + _arg_2.ownerName));
            this._window.findChildByName("created_txt").caption = this._manager.localization.getLocalization("group.created");
            this._manager.windowManager.registerLocalizationParameter("group.membercount", "totalMembers", ("" + _arg_2.totalMembers));
            this._window.findChildByName("members_txt").caption = this._manager.localization.getLocalization("group.membercount");
            this._window.findChildByName("group_room_link_region").visible = (_arg_2.roomId > -1);
            this._manager.windowManager.registerLocalizationParameter("group.linktobase", "room_name", _arg_2.roomName);
            this._window.findChildByName("group_room_link").caption = this._manager.localization.getLocalization("group.linktobase");
            var _local_7:_Str_2402 = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as _Str_2402);
            _local_7.badgeId = this._selectedGroup.badgeCode;
            _local_7.groupId = this._selectedGroup.groupId;
            this._window.findChildByName("join_button").visible = _arg_2._Str_19430;
            this._window.findChildByName("join_button").enable();
            this._window.findChildByName("request_membership_button").visible = _arg_2._Str_21531;
            this._window.findChildByName("leave_button").visible = _arg_2._Str_24358;
            this._window.findChildByName("membership_pending_txt").visible = (_arg_2.status == _Str_2974._Str_16876);
            this._window.findChildByName("youaremember_txt").visible = ((!(this._selectedGroup._Str_6444)) && (_arg_2.status == _Str_2974._Str_8362));
            this._window.findChildByName("youaremember_icon").visible = ((!(this._selectedGroup._Str_6444)) && (_arg_2.status == _Str_2974._Str_8362));
            var _local_8:IWindow = this._window.findChildByName("pending_members_region");
            _local_8.visible = (this._selectedGroup._Str_18324 > 0);
            if (this._selectedGroup._Str_18324 > 0)
            {
                this._manager.windowManager.registerLocalizationParameter("group.pendingmembercount", "amount", ("" + _arg_2._Str_18324));
                this._window.findChildByName("pending_members_txt").caption = this._manager.localization.getLocalization("group.pendingmembercount");
            }
            var _local_9:IWindow = this._window.findChildByName("manage_guild_region");
            _local_9.visible = ((this._selectedGroup._Str_3233) && (this._selectedGroup._Str_6444));
            _local_9.y = ((_local_8.visible) ? (_local_8.y + 16) : _local_8.y);
            var _local_10:IWindow = this._window.findChildByName("delete_guild_region");
            _local_10.visible = (((this._selectedGroup._Str_6444) && (this._manager._Str_25533)) && ((this._selectedGroup._Str_3233) || (this._manager.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569))));
            _local_10.y = ((_local_9.visible) ? (_local_9.y + 16) : _local_8.y);
            this._window.findChildByName("you_are_owner_region").visible = ((this._selectedGroup._Str_6444) && (this._selectedGroup._Str_3233));
            this._window.findChildByName("you_are_admin_region").visible = (((this._selectedGroup._Str_6444) && (this._selectedGroup.isAdmin)) && (!(this._selectedGroup._Str_3233)));
            this._window.findChildByName("you_are_member_region").visible = ((this._selectedGroup._Str_6444) && ((this._selectedGroup.status == _Str_2974._Str_8362) && (!((this._selectedGroup.isAdmin) || (this._selectedGroup._Str_3233)))));
            this._Str_11257(0).visible = false;
            this._Str_11257(1).visible = false;
            this._Str_11257(2).visible = false;
            if (this._Str_11257(_arg_2.type) != null)
            {
                this._Str_11257(_arg_2.type).visible = true;
            }
        }

        private function _Str_11257(k:int):IWindow
        {
            return this._window.findChildByName(("grouptype_region_" + k));
        }

        private function _Str_26122(k:int):IWindow
        {
            return this._window.findChildByName(("grouptype_icon_" + k));
        }

        private function _Str_3931(k:String, _arg_2:Function):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            _local_3.mouseThreshold = 0;
            _local_3.procedure = _arg_2;
        }

        private function _Str_23388(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "leaveGroup");
            this._manager._Str_20430(this._manager._Str_3251, this._selectedGroup.groupId);
        }

        private function _Str_11995(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "joinGroup");
            this._window.findChildByName("join_button").disable();
            this._manager.send(new _Str_6006(this._selectedGroup.groupId));
            this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + this._selectedGroup.groupId), "join"));
        }

        private function _Str_17423(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "groupBaseRoom");
            this._manager.navigator.goToPrivateRoom(this._selectedGroup.roomId);
            this._manager.send(new EventLogMessageComposer(HabboGroupsManager.HABBOGROUPS, ("" + this._selectedGroup.groupId), "base"));
        }

        private function _Str_24830(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager._Str_13647(this._selectedGroup.groupId);
        }

        private function openExternalLink(k:String):void
        {
            if (k != "")
            {
                this._manager.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, this._Str_7790);
                HabboWebTools.navigateToURL(k, "_empty");
            }
        }

        private function _Str_7790(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_24785(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "groupManage");
            this._manager.send(new _Str_7379(this._selectedGroup.groupId));
        }

        private function _Str_25370(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.windowManager.confirm("${group.deleteconfirm.title}", "${group.deleteconfirm.desc}", 0, this._Str_23912);
        }

        private function _Str_23912(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._manager.trackGoogle("groupDetails", "groupDelete");
                this._manager.send(new _Str_10313(this._selectedGroup.groupId));
            }
        }

        private function _Str_22812(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "groupMembers");
            this._manager._Str_14291._Str_12428(this._selectedGroup.groupId, _Str_5612._Str_13464);
        }

        private function _Str_23598(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "groupPendingMembers");
            this._manager._Str_14291._Str_12428(this._selectedGroup.groupId, _Str_5612._Str_17798);
        }

        private function _Str_23641(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "hottestGroups");
            this._manager.navigator.performGuildBaseSearch();
        }

        private function _Str_25591(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.trackGoogle("groupDetails", "groupFurni");
            this._manager.openCatalog(CatalogPageName.GUILD_CUSTOM_FURNI);
        }
    }
}
