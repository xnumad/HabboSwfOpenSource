package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberData;
    import com.sulake.habbo.utils._Str_8330;
    import com.sulake.habbo.utils.LoadingIcon;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembersEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6896;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6293;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6584;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7472;
    import com.sulake.habbo.communication.messages.parser.users._Str_6668;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5612;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2891;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_11096;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_12026;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10517;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_12111;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_9949;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_9979;
    import com.sulake.core.window.components.IDropMenuWindow;
    import flash.events.Event;

    public class GuildMembersWindowCtrl implements IDisposable 
    {
        private static const _Str_15719:Point = new Point(5, 5);

        private var _manager:HabboGroupsManager;
        private var _window:IFrameWindow;
        private var _groupId:int;
        private var _searchTimer:Timer;
        private var _data:GuildMemberData;
        private var _userNameFilter:_Str_8330;
        private var _loadingIcon:LoadingIcon;

        public function GuildMembersWindowCtrl(k:HabboGroupsManager)
        {
            this._searchTimer = new Timer(1000, 1);
            super();
            this._manager = k;
            this._searchTimer.addEventListener(TimerEvent.TIMER, this._Str_20492);
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
                this._searchTimer.removeEventListener(TimerEvent.TIMER, this._Str_20492);
                this._searchTimer.stop();
                this._searchTimer = null;
            }
            if (this._loadingIcon)
            {
                this._loadingIcon.dispose();
                this._loadingIcon = null;
            }
        }

        private function _Str_18665(k:Boolean):void
        {
            if (this._window)
            {
                this._loadingIcon._Str_15221(IIconWindow(this._window.findChildByName("searching_icon")), k);
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function _Str_22267(k:IMessageEvent):void
        {
            this._data = GuildMembersEvent(k).data;
            this.show();
            this._Str_25368();
            this._Str_23578();
        }

        public function _Str_25762(k:IMessageEvent):void
        {
            var _local_2:_Str_6896 = _Str_6896(k);
            if (((!(this._data == null)) && (this._data.groupId == _local_2._Str_3916)))
            {
                this._data.update(_local_2.data);
                this.reload();
            }
        }

        public function _Str_23412(k:IMessageEvent):void
        {
            var _local_2:_Str_6293 = _Str_6293(k);
            var _local_3:int = _local_2.reason;
            var _local_4:String = ("group.membermgmt.fail." + _local_3);
            var _local_5:String = this._manager.localization.getLocalization(_local_4, _local_4);
            this._manager.windowManager.alert("${group.membermgmt.fail.title}", _local_5, 0, null);
            if (((((!(this._data == null)) && (this._data.groupId == _local_2._Str_3916)) && (!(this._window == null))) && (this._window.visible)))
            {
                this._Str_5312(this._data.pageIndex);
            }
        }

        public function _Str_25572(k:IMessageEvent):void
        {
            var _local_2:_Str_6584 = _Str_6584(k);
            if (((((this._window) && (this._window.visible)) && (!(this._data == null))) && (this._data.groupId == _local_2.getParser()._Str_3916)))
            {
                this._Str_5312(this._data.pageIndex);
            }
        }

        public function _Str_22705(k:IMessageEvent):void
        {
            var _local_2:_Str_6668 = _Str_7472(k).getParser();
            if (((((this._window) && (this._window.visible)) && (!(this._data == null))) && (this._data.groupId == _local_2.groupId)))
            {
                this._Str_5312(this._data.pageIndex);
            }
        }

        public function _Str_12428(k:int, _arg_2:int):void
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
                    this._userNameFilter._Str_8407();
                }
                this._groupId = k;
                this._manager.send(new _Str_5612(k, 0, "", _arg_2));
            }
        }

        public function show():void
        {
            this._Str_2755();
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
                this._Str_2966(k, _local_3, _local_2[_local_3]);
                _local_3++;
            }
            var _local_4:_Str_2402 = (IWidgetWindow(this._window.findChildByName("group_logo")).widget as _Str_2402);
            _local_4.badgeId = this._data.badgeCode;
            _local_4.groupId = this._data.groupId;
            this._manager.localization.registerParameter("group.members.pageinfo", "amount", ("" + this._data.totalEntries));
            this._manager.localization.registerParameter("group.members.pageinfo", "page", ("" + (this._data.pageIndex + 1)));
            this._manager.localization.registerParameter("group.members.pageinfo", "totalPages", ("" + this._data.totalPages));
            this._window.findChildByName("previous_page_button").visible = this._Str_24227();
            this._window.findChildByName("next_page_button").visible = this._Str_25422();
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._manager.getXmlWindow("guild_members_window"));
            this._window.findChildByTag("close").procedure = this._Str_2392;
            this._window.findChildByName("previous_page_button").procedure = this._Str_23530;
            this._window.findChildByName("next_page_button").procedure = this._Str_22381;
            this._userNameFilter = new _Str_8330(ITextFieldWindow(this._window.findChildByName("filter_members_input")), this._manager.localization.getLocalization("group.members.searchinfo"));
            this._window.center();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
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

        private function _Str_2966(k:IWindowContainer, _arg_2:int, _arg_3:_Str_2891):void
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
                _local_4.x = (((_arg_2 % 2) == 0) ? 0 : (_local_4.width + _Str_15719.x));
                _local_4.y = (Math.floor((_arg_2 / 2)) * (_local_4.height + _Str_15719.y));
            }
            if (_arg_3 != null)
            {
                this._Str_24256(_local_4, _arg_3);
                _local_4.visible = true;
            }
            else
            {
                _local_4.visible = false;
            }
        }

        public function _Str_24256(k:IWindowContainer, _arg_2:_Str_2891):void
        {
            var _local_5:Boolean;
            k.findChildByName("user_name_txt").caption = _arg_2.userName;
            k.findChildByName("icon_owner").visible = _arg_2.owner;
            this._Str_18115(_arg_2.member, _arg_2.admin, k);
            var _local_3:IWindow = k.findChildByName("admin_container");
            _local_3.visible = ((!(_local_5)) && ((_arg_2.admin) || (this._data.allowedToManage)));
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName("bg_region"));
            _local_4.id = _arg_2.userId;
            this._Str_17814(false, k);
            this._Str_16819(false, k);
            _local_5 = (_arg_2.userId == this._manager._Str_3251);
            var _local_6:IRegionWindow = IRegionWindow(k.findChildByName("remove_region"));
            _local_6._Str_2613 = this._manager.localization.getLocalization(((_arg_2.member) ? "group.members.kick" : "group.members.reject"));
            _local_6.visible = ((((!(_arg_2.owner)) && (!(_local_5))) && (this._data.allowedToManage)) && (!(_arg_2.blocked)));
            _local_6.id = _arg_2.userId;
            var _local_7:Boolean = ((((((_arg_2.member) && (!(_arg_2.owner))) && (!(_local_5))) && (this._data.allowedToManage)) && (this._manager.getBoolean("group.blocking.enabled"))) && (!(_arg_2.blocked)));
            var _local_8:IRegionWindow = IRegionWindow(k.findChildByName("block_region"));
            _local_8._Str_2613 = this._manager.localization.getLocalization("group.members.block");
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
            _Str_2483(IWidgetWindow(k.findChildByName("avatar_image")).widget).figure = _arg_2.figure;
            if (_arg_2.blocked)
            {
                this._Str_11551(k, "group.members.unblock", false);
            }
            else
            {
                if (_arg_2.owner)
                {
                    this._Str_11551(k, "group.members.owner", false);
                }
                else
                {
                    if (_arg_2.admin)
                    {
                        this._Str_11551(k, "group.members.removerights", true);
                    }
                    else
                    {
                        if (_arg_2.member)
                        {
                            this._Str_11551(k, "group.members.giverights", true);
                        }
                        else
                        {
                            this._Str_11551(k, "group.members.accept", true);
                        }
                    }
                }
            }
        }

        public function getListEntry():IWindowContainer
        {
            var k:IWindowContainer = IWindowContainer(this._manager.getXmlWindow("member_entry"));
            var _local_2:IRegionWindow = IRegionWindow(k.findChildByName("bg_region"));
            _local_2.procedure = this._Str_24347;
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName("block_region"));
            _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_21724);
            _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_19989);
            _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_25431);
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName("remove_region"));
            _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_21724);
            _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_19989);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_25288);
            var _local_5:IRegionWindow = IRegionWindow(k.findChildByName("action_link_region"));
            _local_5.addEventListener(WindowMouseEvent.OVER, this._Str_22651);
            _local_5.addEventListener(WindowMouseEvent.OUT, this._Str_25563);
            _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_23181);
            return k;
        }

        private function _Str_21724(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this._Str_17814(true, _local_2);
        }

        private function _Str_19989(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this._Str_17814(false, _local_2);
        }

        private function _Str_25288(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:_Str_2891 = this._data._Str_5126(_local_2.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            if (_local_3.member)
            {
                this._manager._Str_20430(_local_2.id, this._data.groupId);
            }
            else
            {
                this._manager.send(new _Str_11096(this._data.groupId, _local_3.userId));
            }
        }

        private function _Str_25431(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:_Str_2891 = this._data._Str_5126(_local_2.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            if (_local_3.member)
            {
                this._manager._Str_22582(_local_2.id, this._data.groupId);
            }
        }

        private function _Str_11551(k:IWindowContainer, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_4:ITextWindow = ITextWindow(k.findChildByName("action_link"));
            _local_4.text = this._manager.localization.getLocalization(_arg_2, _arg_2);
            _local_4.underline = _arg_3;
        }

        private function _Str_17814(k:Boolean, _arg_2:IWindowContainer):void
        {
            _arg_2.findChildByName("icon_close_off").visible = (!(k));
            _arg_2.findChildByName("icon_close_over").visible = k;
            _arg_2.findChildByName("icon_close_down").visible = false;
        }

        private function _Str_16819(k:Boolean, _arg_2:IWindowContainer):void
        {
            var _local_3:ITextWindow = ITextWindow(_arg_2.findChildByName("action_link"));
            _local_3.textColor = ((k) ? 4280984060 : 4285492837);
        }

        private function _Str_22651(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            var _local_3:_Str_2891 = this._data._Str_5126(k.target.id);
            if (((_local_3 == null) || (_local_3.owner)))
            {
                return;
            }
            this._Str_16819(true, _local_2);
            this._Str_18115(_local_3.member, (!(_local_3.admin)), IWindowContainer(_local_2.parent));
        }

        private function _Str_25563(k:WindowEvent):void
        {
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            this._Str_16819(false, _local_2);
            var _local_3:_Str_2891 = this._data._Str_5126(k.target.id);
            if (_local_3 != null)
            {
                this._Str_18115(_local_3.member, _local_3.admin, IWindowContainer(_local_2.parent));
            }
        }

        private function _Str_23181(k:WindowEvent):void
        {
            var _local_2:_Str_2891 = this._data._Str_5126(k.target.id);
            if (((_local_2 == null) || (_local_2.owner)))
            {
                return;
            }
            if (_local_2.blocked)
            {
                this._manager.send(new _Str_12026(this._data.groupId, _local_2.userId));
            }
            else
            {
                if (_local_2.admin)
                {
                    this._manager.send(new _Str_10517(this._data.groupId, _local_2.userId));
                }
                else
                {
                    if (_local_2.member)
                    {
                        this._manager.send(new _Str_12111(this._data.groupId, _local_2.userId));
                    }
                    else
                    {
                        this._manager.send(new _Str_9949(this._data.groupId, _local_2.userId));
                    }
                }
            }
        }

        private function _Str_18115(k:Boolean, _arg_2:Boolean, _arg_3:IWindowContainer):void
        {
            _arg_3.findChildByName("icon_admin_off").visible = ((k) && (_arg_2));
            _arg_3.findChildByName("icon_admin_over").visible = ((k) && (!(_arg_2)));
        }

        private function _Str_24347(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._manager.send(new _Str_2553(_arg_2.id));
            }
        }

        private function _Str_23009(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
            {
                this._searchTimer.reset();
                this._searchTimer.start();
                this._Str_18665(true);
            }
        }

        private function _Str_22754(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                this._Str_5312(0);
            }
        }

        private function _Str_5312(k:int):void
        {
            this._searchTimer.stop();
            this._searchTimer.reset();
            this._Str_18665(true);
            var _local_2:GuildMemberData = this._data;
            var _local_3:String = this._userNameFilter.getText();
            var _local_4:int = this._Str_19469().selection;
            this._manager.send(new _Str_5612(_local_2.groupId, k, _local_3, _local_4));
        }

        private function _Str_26373(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._manager.send(new _Str_9979(this._data.groupId));
        }

        private function _Str_19469():IDropMenuWindow
        {
            return IDropMenuWindow(this._window.findChildByName("type_drop_menu"));
        }

        private function _Str_20492(k:Event):void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._Str_5312(0);
            }
        }

        private function _Str_22381(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_5312(this._Str_13408((this._data.pageIndex + 1)));
        }

        private function _Str_23530(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_5312(this._Str_13408((this._data.pageIndex - 1)));
        }

        private function _Str_24227():Boolean
        {
            return !(this._data.pageIndex == this._Str_13408((this._data.pageIndex - 1)));
        }

        private function _Str_25422():Boolean
        {
            return !(this._data.pageIndex == this._Str_13408((this._data.pageIndex + 1)));
        }

        private function _Str_13408(k:int):int
        {
            var _local_2:int = Math.ceil((this._data.totalEntries / this._data.pageSize));
            return Math.max(0, Math.min(k, (_local_2 - 1)));
        }

        public function get data():GuildMemberData
        {
            return this._data;
        }

        private function _Str_25368():void
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
            var _local_2:IDropMenuWindow = this._Str_19469();
            _local_2.procedure = null;
            _local_2.populate(k);
            _local_2.selection = ((this._data.allowedToManage) ? this._data.searchType : Math.min(this._data.searchType, 1));
            _local_2.procedure = this._Str_22754;
        }

        private function _Str_23578():void
        {
            var k:ITextFieldWindow = this._userNameFilter.input;
            k.procedure = null;
            if (this._userNameFilter.getText() != this._data.userNameFilter)
            {
                this._userNameFilter._Str_2497(this._data.userNameFilter);
            }
            k.procedure = this._Str_23009;
            this._searchTimer.stop();
            this._Str_18665(false);
        }
    }
}
