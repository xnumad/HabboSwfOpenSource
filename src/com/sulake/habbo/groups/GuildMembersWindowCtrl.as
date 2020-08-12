package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberData;
    import com.sulake.habbo.utils.InfoText;
    import com.sulake.habbo.utils.LoadingIcon;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembersEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembershipUpdatedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberMgmtFailedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembershipRejectedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GroupMembershipRequestedMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GroupMembershipRequestedMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.users.GetGuildMembersMessageComposer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.users.MemberData;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.window.widgets.IAvatarImageWidget;
    import com.sulake.habbo.communication.messages.outgoing.users.RejectMembershipRequestMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.UnblockGroupMemberMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.RemoveAdminRightsFromMemberMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.AddAdminRightsToMemberMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.ApproveMembershipRequestMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.ApproveAllMembershipRequestsMessageComposer;
    import com.sulake.core.window.components.IDropMenuWindow;
    import flash.events.Event;

    public class GuildMembersWindowCtrl implements IDisposable 
    {
        private static const MEMBER_SPACING:Point = new Point(5, 5);

        private var _manager:HabboGroupsManager;
        private var _window:IFrameWindow;
        private var _groupId:int;
        private var _searchTimer:Timer;
        private var _data:GuildMemberData;
        private var _userNameFilter:InfoText;
        private var _loadingIcon:LoadingIcon;

        public function GuildMembersWindowCtrl(k:HabboGroupsManager)
        {
            this._searchTimer = new Timer(1000, 1);
            super();
            this._manager = k;
            this._searchTimer.addEventListener(TimerEvent.TIMER, this.onSearchTimer);
            this._loadingIcon = new LoadingIcon();
        }

        public function dispose():void
        {
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._userNameFilter != null)
            {
                this._userNameFilter.dispose();
                this._userNameFilter = null;
            }
            if (this._searchTimer)
            {
                this._searchTimer.removeEventListener(TimerEvent.TIMER, this.onSearchTimer);
                this._searchTimer.stop();
                this._searchTimer = null;
            }
            if (this._loadingIcon)
            {
                this._loadingIcon.dispose();
                this._loadingIcon = null;
            }
        }

        private function setSearchingIcon(k:Boolean):void
        {
            if (this._window)
            {
                this._loadingIcon.setVisible(IIconWindow(this._window.findChildByName("searching_icon")), k);
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function onGuildMembers(k:IMessageEvent):void
        {
            this._data = GuildMembersEvent(k).data;
            this.show();
            this.populateSearchTypes();
            this.populateUserNameFilter();
        }

        public function onGuildMembershipUpdated(k:IMessageEvent):void
        {
            var _local_2:GuildMembershipUpdatedMessageEvent = GuildMembershipUpdatedMessageEvent(k);
            if (((!(this._data == null)) && (this._data.groupId == _local_2.guildId)))
            {
                this._data.update(_local_2.data);
                this.reload();
            }
        }

        public function onGuildMemberMgmtFailed(k:IMessageEvent):void
        {
            var _local_2:GuildMemberMgmtFailedMessageEvent = GuildMemberMgmtFailedMessageEvent(k);
            var _local_3:int = _local_2.reason;
            var _local_4:String = ("group.membermgmt.fail." + _local_3);
            var _local_5:String = this._manager.localization.getLocalization(_local_4, _local_4);
            this._manager.windowManager.alert("${group.membermgmt.fail.title}", _local_5, 0, null);
            if (((((!(this._data == null)) && (this._data.groupId == _local_2.guildId)) && (!(this._window == null))) && (this._window.visible)))
            {
                this.doSearch(this._data.pageIndex);
            }
        }

        public function onGuildMembershipRejected(k:IMessageEvent):void
        {
            var _local_2:GuildMembershipRejectedMessageEvent = GuildMembershipRejectedMessageEvent(k);
            if (((((this._window) && (this._window.visible)) && (!(this._data == null))) && (this._data.groupId == _local_2.getParser().guildId)))
            {
                this.doSearch(this._data.pageIndex);
            }
        }

        public function onMembershipRequested(k:IMessageEvent):void
        {
            var _local_2:GroupMembershipRequestedMessageParser = GroupMembershipRequestedMessageEvent(k).getParser();
            if (((((this._window) && (this._window.visible)) && (!(this._data == null))) && (this._data.groupId == _local_2.groupId)))
            {
                this.doSearch(this._data.pageIndex);
            }
        }

        public function onMembersClick(k:int, _arg_2:int):void
        {
            if (!this._manager.getBoolean("groupMembers.enabled"))
            {
                return;
            }
            if ((((!(this._window == null)) && (this._window.visible)) && (this._groupId == k)))
            {
                this.close();
            }
            else
            {
                if (this._userNameFilter)
                {
                    this._userNameFilter.goBackToInitialState();
                }
                this._groupId = k;
                this._manager.send(new GetGuildMembersMessageComposer(k, 0, "", _arg_2));
            }
        }

        public function show():void
        {
            this.prepareWindow();
            this.refresh();
            this._window.visible = true;
            this._window.activate();
        }

        public function reload():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this.refresh();
            }
        }

        private function refresh():void
        {
            this._manager.localization.registerParameter("group.members.title", "groupName", this._data.groupName);
            var k:IWindowContainer = IWindowContainer(this._window.findChildByName("members_cont"));
            var _local_2:Array = this._data.entries;
            var _local_3:int;
            while (_local_3 < this._data.pageSize)
            {
                this.refreshEntry(k, _local_3, _local_2[_local_3]);
                _local_3++;
            }
            var _local_4:IBadgeImageWidget = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as IBadgeImageWidget);
            _local_4.badgeId = this._data.badgeCode;
            _local_4.groupId = this._data.groupId;
            this._manager.localization.registerParameter("group.members.pageinfo", "amount", ("" + this._data.totalEntries));
            this._manager.localization.registerParameter("group.members.pageinfo", "page", ("" + (this._data.pageIndex + 1)));
            this._manager.localization.registerParameter("group.members.pageinfo", "totalPages", ("" + this._data.totalPages));
            this._window.findChildByName("previous_page_button").visible = this.hasPreviousPage();
            this._window.findChildByName("next_page_button").visible = this.hasNextPage();
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("guild_members_window"));
            this._window.findChildByTag("close").procedure = this.onClose;
            this._window.findChildByName("previous_page_button").procedure = this.onPreviousPage;
            this._window.findChildByName("next_page_button").procedure = this.onNextPage;
            this._userNameFilter = new InfoText(ITextFieldWindow(this._window.findChildByName("filter_members_input")), this._manager.localization.getLocalization("group.members.searchinfo"));
            this._window.center();
        }

        private function onClose(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.close();
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._groupId = 0;
                this._window.visible = false;
            }
        }

        private function refreshEntry(k:IWindowContainer, _arg_2:int, _arg_3:MemberData):void
        {
            var _local_4:IWindowContainer = IWindowContainer(k.getChildAt(_arg_2));
            if (_local_4 == null)
            {
                if (_arg_3 == null)
                {
                    return;
                }
                _local_4 = this.getListEntry();
                _local_4.tags[0] = ("" + _arg_2);
                k.addChild(_local_4);
                _local_4.x = (((_arg_2 % 2) == 0) ? 0 : (_local_4.width + MEMBER_SPACING.x));
                _local_4.y = (Math.floor((_arg_2 / 2)) * (_local_4.height + MEMBER_SPACING.y));
            }
            if (_arg_3 != null)
            {
                this.refreshUserEntry(_local_4, _arg_3);
                _local_4.visible = true;
            }
            else
            {
                _local_4.visible = false;
            }
        }

        public function refreshUserEntry(k:IWindowContainer, _arg_2:MemberData):void
        {
            var _local_5:Boolean;
            k.findChildByName("user_name_txt").caption = _arg_2.userName;
            k.findChildByName("icon_owner").visible = _arg_2.owner;
            this.setAdminState(_arg_2.member, _arg_2.admin, k);
            var _local_3:IWindow = k.findChildByName("admin_container");
            _local_3.visible = ((!(_local_5)) && ((_arg_2.admin) || (this._data.allowedToManage)));
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName("bg_region"));
            _local_4.id = _arg_2.userId;
            this.setRemoveState(false, k);
            this.setActionLinkState(false, k);
            _local_5 = (_arg_2.userId == this._manager.avatarId);
            var _local_6:IRegionWindow = IRegionWindow(k.findChildByName("remove_region"));
            _local_6.toolTipCaption = this._manager.localization.getLocalization(((_arg_2.member) ? "group.members.kick" : "group.members.reject"));
            _local_6.visible = ((((!(_arg_2.owner)) && (!(_local_5))) && (this._data.allowedToManage)) && (!(_arg_2.blocked)));
            _local_6.id = _arg_2.userId;
            var _local_7:Boolean = ((((((_arg_2.member) && (!(_arg_2.owner))) && (!(_local_5))) && (this._data.allowedToManage)) && (this._manager.getBoolean("group.blocking.enabled"))) && (!(_arg_2.blocked)));
            var _local_8:IRegionWindow = IRegionWindow(k.findChildByName("block_region"));
            _local_8.toolTipCaption = this._manager.localization.getLocalization("group.members.block");
            _local_8.visible = _local_7;
            _local_8.id = _arg_2.userId;
            var _local_9:Boolean = ((!(_local_5)) && (this._data.allowedToManage));
            var _local_10:IRegionWindow = IRegionWindow(k.findChildByName("action_link_region"));
            _local_10.visible = _local_9;
            _local_10.id = _arg_2.userId;
            var _local_11:ITextWindow = ITextWindow(k.findChildByName("member_since_txt"));
            _local_11.visible = ((!(_local_9)) && (!(_arg_2._Str_20842 == "")));
            this._manager.localization.registerParameter("group.members.since", "date", _arg_2._Str_20842);
            _local_11.caption = this._manager.localization.getLocalization("group.members.since");
            IAvatarImageWidget(IWidgetWindow(k.findChildByName("avatar_image")).widget).figure = _arg_2.figure;
            if (_arg_2.blocked)
            {
                this.setActionLink(k, "group.members.unblock", false);
            }
            else
            {
                if (_arg_2.owner)
                {
                    this.setActionLink(k, "group.members.owner", false);
                }
                else
                {
                    if (_arg_2.admin)
                    {
                        this.setActionLink(k, "group.members.removerights", true);
                    }
                    else
                    {
                        if (_arg_2.member)
                        {
                            this.setActionLink(k, "group.members.giverights", true);
                        }
                        else
                        {
                            this.setActionLink(k, "group.members.accept", true);
                        }
                    }
                }
            }
        }

        public function getListEntry():IWindowContainer
        {
            var k:IWindowContainer = IWindowContainer(this._manager.getXmlWindow("member_entry"));
            var _local_2:IRegionWindow = IRegionWindow(k.findChildByName("bg_region"));
            _local_2.procedure = this.onBg;
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName("block_region"));
            _local_3.addEventListener(WindowMouseEvent.OVER, this.onRemoveMouseOver);
            _local_3.addEventListener(WindowMouseEvent.OUT, this.onRemoveMouseOut);
            _local_3.addEventListener(WindowMouseEvent.CLICK, this.onBlockMouseClick);
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName("remove_region"));
            _local_4.addEventListener(WindowMouseEvent.OVER, this.onRemoveMouseOver);
            _local_4.addEventListener(WindowMouseEvent.OUT, this.onRemoveMouseOut);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this.onRemoveMouseClick);
            var _local_5:IRegionWindow = IRegionWindow(k.findChildByName("action_link_region"));
            _local_5.addEventListener(WindowMouseEvent.OVER, this.onActionLinkMouseOver);
            _local_5.addEventListener(WindowMouseEvent.OUT, this.onActionLinkMouseOut);
            _local_5.addEventListener(WindowMouseEvent.CLICK, this.onActionLinkClick);
            return k;
        }

        private function onRemoveMouseOver(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this.setRemoveState(true, _local_2);
        }

        private function onRemoveMouseOut(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this.setRemoveState(false, _local_2);
        }

        private function onRemoveMouseClick(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:MemberData = this._data.getUser(_local_2.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            if (_local_3.member)
            {
                this._manager.handleUserKick(_local_2.id, this._data.groupId);
            }
            else
            {
                this._manager.send(new RejectMembershipRequestMessageComposer(this._data.groupId, _local_3.userId));
            }
        }

        private function onBlockMouseClick(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:MemberData = this._data.getUser(_local_2.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            if (_local_3.member)
            {
                this._manager.handleUserBlock(_local_2.id, this._data.groupId);
            }
        }

        private function setActionLink(k:IWindowContainer, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_4:ITextWindow = ITextWindow(k.findChildByName("action_link"));
            _local_4.text = this._manager.localization.getLocalization(_arg_2, _arg_2);
            _local_4.underline = _arg_3;
        }

        private function setRemoveState(k:Boolean, _arg_2:IWindowContainer):void
        {
            _arg_2.findChildByName("icon_close_off").visible = (!(k));
            _arg_2.findChildByName("icon_close_over").visible = k;
            _arg_2.findChildByName("icon_close_down").visible = false;
        }

        private function setActionLinkState(k:Boolean, _arg_2:IWindowContainer):void
        {
            var _local_3:ITextWindow = ITextWindow(_arg_2.findChildByName("action_link"));
            _local_3.textColor = ((k) ? 4280984060 : 4285492837);
        }

        private function onActionLinkMouseOver(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            var _local_3:MemberData = this._data.getUser(k.target.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            this.setActionLinkState(true, _local_2);
            this.setAdminState(_local_3.member, (!(_local_3.admin)), IWindowContainer(_local_2.parent));
        }

        private function onActionLinkMouseOut(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this.setActionLinkState(false, _local_2);
            var _local_3:MemberData = this._data.getUser(k.target.id);
            if (_local_3 != null)
            {
                this.setAdminState(_local_3.member, _local_3.admin, IWindowContainer(_local_2.parent));
            }
        }

        private function onActionLinkClick(k:WindowEvent):void
        {
            var _local_2:MemberData = this._data.getUser(k.target.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            }
            if (_local_2.blocked)
            {
                this._manager.send(new UnblockGroupMemberMessageComposer(this._data.groupId, _local_2.userId));
            }
            else
            {
                if (_local_2.admin)
                {
                    this._manager.send(new RemoveAdminRightsFromMemberMessageComposer(this._data.groupId, _local_2.userId));
                }
                else
                {
                    if (_local_2.member)
                    {
                        this._manager.send(new AddAdminRightsToMemberMessageComposer(this._data.groupId, _local_2.userId));
                    }
                    else
                    {
                        this._manager.send(new ApproveMembershipRequestMessageComposer(this._data.groupId, _local_2.userId));
                    }
                }
            }
        }

        private function setAdminState(k:Boolean, _arg_2:Boolean, _arg_3:IWindowContainer):void
        {
            _arg_3.findChildByName("icon_admin_off").visible = ((k) && (_arg_2));
            _arg_3.findChildByName("icon_admin_over").visible = ((k) && (!(_arg_2)));
        }

        private function onBg(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager.send(new GetExtendedProfileMessageComposer(_arg_2.id));
            }
        }

        private function onFilterMembers(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
            {
                this._searchTimer.reset();
                this._searchTimer.start();
                this.setSearchingIcon(true);
            }
        }

        private function onTypeDropmenu(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                this.doSearch(0);
            }
        }

        private function doSearch(k:int):void
        {
            this._searchTimer.stop();
            this._searchTimer.reset();
            this.setSearchingIcon(true);
            var _local_2:GuildMemberData = this._data;
            var _local_3:String = this._userNameFilter.getText();
            var _local_4:int = this.getTypeDropMenu().selection;
            this._manager.send(new GetGuildMembersMessageComposer(_local_2.groupId, k, _local_3, _local_4));
        }

        private function onAcceptAll(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.send(new ApproveAllMembershipRequestsMessageComposer(this._data.groupId));
        }

        private function getTypeDropMenu():IDropMenuWindow
        {
            return IDropMenuWindow(this._window.findChildByName("type_drop_menu"));
        }

        private function onSearchTimer(k:Event):void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this.doSearch(0);
            }
        }

        private function onNextPage(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.doSearch(this.limitPageIndex((this._data.pageIndex + 1)));
        }

        private function onPreviousPage(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.doSearch(this.limitPageIndex((this._data.pageIndex - 1)));
        }

        private function hasPreviousPage():Boolean
        {
            return !(this._data.pageIndex == this.limitPageIndex((this._data.pageIndex - 1)));
        }

        private function hasNextPage():Boolean
        {
            return !(this._data.pageIndex == this.limitPageIndex((this._data.pageIndex + 1)));
        }

        private function limitPageIndex(k:int):int
        {
            var _local_2:int = Math.ceil((this._data.totalEntries / this._data.pageSize));
            return Math.max(0, Math.min(k, (_local_2 - 1)));
        }

        public function get data():GuildMemberData
        {
            return this._data;
        }

        private function populateSearchTypes():void
        {
            var k:Array = new Array();
            k.push("${group.members.search.all}");
            k.push("${group.members.search.admins}");
            if (this._data.allowedToManage)
            {
                k.push("${group.members.search.pending}");
                if (this._manager.getBoolean("group.blocking.enabled"))
                {
                    k.push("${group.members.search.blocked}");
                }
            }
            var _local_2:IDropMenuWindow = this.getTypeDropMenu();
            _local_2.procedure = null;
            _local_2.populate(k);
            _local_2.selection = ((this._data.allowedToManage) ? this._data.searchType : Math.min(this._data.searchType, 1));
            _local_2.procedure = this.onTypeDropmenu;
        }

        private function populateUserNameFilter():void
        {
            var k:ITextFieldWindow = this._userNameFilter.input;
            k.procedure = null;
            if (this._userNameFilter.getText() != this._data.userNameFilter)
            {
                this._userNameFilter.setText(this._data.userNameFilter);
            }
            k.procedure = this.onFilterMembers;
            this._searchTimer.stop();
            this.setSearchingIcon(false);
        }
    }
}
