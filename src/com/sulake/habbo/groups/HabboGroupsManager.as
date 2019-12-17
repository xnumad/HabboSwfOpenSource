package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditorData;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7832;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2929;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7294;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7472;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6293;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5269;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3921;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3992;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6633;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5979;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8194;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8141;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6584;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7456;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembersEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5093;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7878;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6896;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7417;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3492;
    import com.sulake.habbo.communication.messages.incoming.users.UserBadgesEvent;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;
    import com.sulake.habbo.communication.messages.parser.users._Str_8198;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5600;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5372;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.groups.events.HabboGroupsEditorData;
    import com.sulake.habbo.communication.messages.parser.users._Str_8165;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5936;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2891;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberData;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_9992;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.parser.users._Str_4007;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_4537;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_11712;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_8228;
    import __AS3__.vec.*;

    public class HabboGroupsManager extends Component implements IHabboGroupsManager, ILinkEventTracker 
    {
        public static const HABBOGROUPS:String = "HabboGroups";

        private var _communication:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _localization:IHabboLocalizationManager;
        private var _navigator:IHabboNavigator;
        private var _newNavigator:IHabboNewNavigator;
        private var _friendlist:IHabboFriendsList;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _habboTracking:IHabboTracking;
        private var _sessionDataManager:ISessionDataManager;
        private var _detailsWindowCtrl:DetailsWindowCtrl;
        private var _guildMembersWindowCtrl:GuildMembersWindowCtrl;
        private var _guildManagementWindowCtrl:GuildManagementWindowCtrl;
        private var _extendedProfileWindowCtrl:ExtendedProfileWindowCtrl;
        private var _hcRequiredWindowCtrl:HcRequiredWindowCtrl;
        private var _groupCreatedWindowCtrl:GroupCreatedWindowCtrl;
        private var _groupRoomInfoCtrl:GroupRoomInfoCtrl;
        private var _guildEditorData:GuildEditorData;
        private var _avatarId:int;
        private var _roomId:int;
        private var _hasVip:Boolean;
        private var _kickData:GuildKickData;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function HabboGroupsManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._detailsWindowCtrl = new DetailsWindowCtrl(this);
            this._guildMembersWindowCtrl = new GuildMembersWindowCtrl(this);
            this._guildManagementWindowCtrl = new GuildManagementWindowCtrl(this);
            this._extendedProfileWindowCtrl = new ExtendedProfileWindowCtrl(this);
            this._hcRequiredWindowCtrl = new HcRequiredWindowCtrl(this);
            this._groupCreatedWindowCtrl = new GroupCreatedWindowCtrl(this);
            this._groupRoomInfoCtrl = new GroupRoomInfoCtrl(this);
            Logger.log(("HabboGroupsManager initialized: " + _arg_3));
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboNewNavigator(), function (k:IHabboNewNavigator):void
            {
                _newNavigator = k;
            }), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendlist = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _habboTracking = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new ExtendedProfileMessageEvent(this._Str_24027));
            this.addMessageEvent(new _Str_7832(this._Str_25256));
            this.addMessageEvent(new _Str_2929(this._Str_4428));
            this.addMessageEvent(new _Str_7294(this._Str_25665));
            this.addMessageEvent(new _Str_7472(this._guildMembersWindowCtrl._Str_22705));
            this.addMessageEvent(new _Str_6293(this._guildMembersWindowCtrl._Str_23412));
            this.addMessageEvent(new _Str_5269(this._Str_18561));
            this.addMessageEvent(new _Str_3921(this._Str_3702));
            this.addMessageEvent(new _Str_3992(this._Str_7358));
            this.addMessageEvent(new _Str_2752(this.onCreditBalance));
            this.addMessageEvent(new _Str_6633(this._Str_24985));
            this.addMessageEvent(new _Str_5979(this._Str_25619));
            this.addMessageEvent(new _Str_8194(this._Str_16681));
            this.addMessageEvent(new _Str_8141(this._Str_25430));
            this.addMessageEvent(new _Str_3352(this._Str_23870));
            this.addMessageEvent(new _Str_6584(this._guildMembersWindowCtrl._Str_25572));
            this.addMessageEvent(new _Str_7456(this._Str_26461));
            this.addMessageEvent(new GuildMembersEvent(this._guildMembersWindowCtrl._Str_22267));
            this.addMessageEvent(new _Str_5093(this._Str_18693));
            this.addMessageEvent(new UserObjectEvent(this._Str_3241));
            this.addMessageEvent(new _Str_7878(this._Str_18072));
            this.addMessageEvent(new _Str_6896(this._guildMembersWindowCtrl._Str_25762));
            this.addMessageEvent(new _Str_7417(this._Str_23512));
            this.addMessageEvent(new _Str_3492(this._Str_11640));
            this.addMessageEvent(new UserBadgesEvent(this._Str_24382));
            context.addLinkEventTracker(this);
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communication.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            if (((!(this._messageEvents == null)) && (!(this._communication == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communication.removeHabboConnectionMessageEvent(k);
                }
                this._messageEvents = null;
            }
            if (this._detailsWindowCtrl)
            {
                this._detailsWindowCtrl.dispose();
                this._detailsWindowCtrl = null;
            }
            if (this._guildMembersWindowCtrl)
            {
                this._guildMembersWindowCtrl.dispose();
                this._guildMembersWindowCtrl = null;
            }
            if (this._guildManagementWindowCtrl)
            {
                this._guildManagementWindowCtrl.dispose();
                this._guildManagementWindowCtrl = null;
            }
            if (this._extendedProfileWindowCtrl)
            {
                this._extendedProfileWindowCtrl.dispose();
                this._extendedProfileWindowCtrl = null;
            }
            if (this._hcRequiredWindowCtrl)
            {
                this._hcRequiredWindowCtrl.dispose();
                this._hcRequiredWindowCtrl = null;
            }
            if (this._groupCreatedWindowCtrl)
            {
                this._groupCreatedWindowCtrl.dispose();
                this._groupCreatedWindowCtrl = null;
            }
            if (this._groupRoomInfoCtrl)
            {
                this._groupRoomInfoCtrl.dispose();
                this._groupRoomInfoCtrl = null;
            }
            super.dispose();
        }

        public function get eventUrlPrefix():String
        {
            return "group/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length != 2)
            {
                return;
            }
            var _local_3:int = _local_2[1];
            this._Str_12717(_local_3);
        }

        public function _Str_12867(k:Boolean, _arg_2:int):void
        {
            this._Str_12717(_arg_2);
            this.send(new EventLogMessageComposer(HABBOGROUPS, ("" + _arg_2), "badge clicked"));
        }

        public function _Str_12717(k:int):void
        {
            this.send(new _Str_2863(k, true));
        }

        public function send(k:IMessageComposer):void
        {
            this._communication.connection.send(k);
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_3:IAsset;
            var _local_4:XmlAsset;
            var _local_2:IWindow;
            try
            {
                _local_3 = assets.getAssetByName(k);
                _local_4 = XmlAsset(_local_3);
                _local_2 = this._windowManager.buildFromXML(XML(_local_4.content));
            }
            catch(e:Error)
            {
            }
            return _local_2;
        }

        public function _Str_3122(k:String):BitmapData
        {
            var _local_2:String = k;
            var _local_3:IAsset = assets.getAssetByName(_local_2);
            var _local_4:BitmapDataAsset = BitmapDataAsset(_local_3);
            var _local_5:BitmapData = BitmapData(_local_4.content);
            var _local_6:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0);
            _local_6.draw(_local_5);
            return _local_6;
        }

        public function _Str_13647(k:int):void
        {
            context.createLinkEvent(("groupforum/" + k));
        }

        private function _Str_26461(k:IMessageEvent):void
        {
            var _local_2:int = _Str_7456(k).groupId;
            this._detailsWindowCtrl._Str_26461(_local_2);
            this._groupRoomInfoCtrl._Str_26461(_local_2);
        }

        private function _Str_3702(k:IMessageEvent):void
        {
            var _local_2:_Str_2974 = _Str_3921(k).data;
            this._detailsWindowCtrl._Str_3702(_local_2);
            this._extendedProfileWindowCtrl._Str_3702(_local_2);
            this._groupRoomInfoCtrl._Str_3702(_local_2);
        }

        private function _Str_24027(k:IMessageEvent):void
        {
            var _local_2:ExtendedProfileData = ExtendedProfileMessageEvent(k).data;
            if (_local_2.openProfileWindow)
            {
                this._extendedProfileWindowCtrl._Str_12511 = true;
                this._extendedProfileWindowCtrl._Str_12870 = true;
                this._extendedProfileWindowCtrl._Str_18339(_local_2);
            }
        }

        private function _Str_23512(k:IMessageEvent):void
        {
            var _local_2:int = _Str_7417(k).userId;
            this._extendedProfileWindowCtrl._Str_24312(_local_2);
        }

        private function _Str_18693(k:IMessageEvent):void
        {
            var _local_2:int = _Str_5093(k).groupId;
            if (((this._detailsWindowCtrl._Str_18808(_local_2)) || (this._groupRoomInfoCtrl._Str_18808(_local_2))))
            {
                this.send(new _Str_2863(_local_2, false));
            }
        }

        private function _Str_25665(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:int = _Str_7294(k).reason;
            if (_local_2 == _Str_8198._Str_7099)
            {
                this._hcRequiredWindowCtrl.show(false);
            }
            else
            {
                _local_3 = ("group.joinfail." + _local_2);
                _local_4 = this._localization.getLocalization(_local_3, _local_3);
                this._windowManager.alert("${group.joinfail.title}", _local_4, 0, this._Str_3168);
            }
        }

        private function _Str_16681(k:IMessageEvent):void
        {
            var _local_2:_Str_5600 = _Str_8194(k).data;
            this._guildManagementWindowCtrl._Str_16681(_local_2);
            this._Str_19848();
        }

        private function _Str_18072(k:IMessageEvent):void
        {
            var _local_2:_Str_5372 = _Str_7878(k).data;
            this._guildManagementWindowCtrl._Str_18072(_local_2);
            this._Str_19848();
        }

        private function _Str_23870(k:IMessageEvent):void
        {
            this._detailsWindowCtrl.close();
            this._groupRoomInfoCtrl.close();
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            this._detailsWindowCtrl.close();
            this._groupRoomInfoCtrl.close();
            var _local_2:_Str_4522 = _Str_2752(k).getParser();
            this._roomId = _local_2._Str_6550;
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_25430(k:IMessageEvent):void
        {
            this._guildEditorData = _Str_8141(k).data;
            events.dispatchEvent(new HabboGroupsEditorData());
        }

        private function _Str_25256(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:int = _Str_7832(k).reason;
            if (_local_2 == _Str_8165._Str_7099)
            {
                this._hcRequiredWindowCtrl.show(true);
            }
            else
            {
                _local_3 = ("group.edit.fail." + _local_2);
                _local_4 = this._localization.getLocalization(_local_3, _local_3);
                this._windowManager.alert("${group.edit.fail.title}", _local_4, 0, this._Str_3168);
            }
        }

        private function _Str_3241(k:IMessageEvent):void
        {
            var _local_2:_Str_4139 = UserObjectEvent(k).getParser();
            this._avatarId = _local_2.id;
        }

        private function _Str_7358(k:IMessageEvent):void
        {
            var _local_2:_Str_5936 = _Str_3992(k).getParser();
            this._guildManagementWindowCtrl._Str_7358(_local_2.flatId, _local_2._Str_18439);
        }

        private function _Str_24985(k:IMessageEvent):void
        {
            var _local_2:_Str_6633 = _Str_6633(k);
            this._groupCreatedWindowCtrl.show(_local_2.groupId);
            this._guildManagementWindowCtrl.close();
            this._groupRoomInfoCtrl._Str_21514 = _local_2.groupId;
            if (this._roomId != _local_2.baseRoomId)
            {
                this._navigator.goToPrivateRoom(_local_2.baseRoomId);
            }
        }

        private function _Str_25619(k:IMessageEvent):void
        {
            var _local_2:int = _Str_5979(k).userId();
            var _local_3:int = _Str_5979(k)._Str_10882();
            var _local_4:_Str_2891;
            var _local_5:GuildMemberData = this._guildMembersWindowCtrl.data;
            var _local_6:String = ((this._kickData._Str_21067) ? "group.block" : "group.kick");
            if (_local_3 > 0)
            {
                if (_local_2 == this._avatarId)
                {
                    this.localization.registerParameter("group.leaveconfirm.desc", "amount", _local_3.toString());
                    this._windowManager.confirm("${group.leaveconfirm.title}", "${group.leaveconfirm.desc}", 0, this._Str_12803);
                }
                else
                {
                    _local_4 = _local_5._Str_5126(_local_2);
                    this.localization.registerParameter((_local_6 + "confirm.desc"), "amount", _local_3.toString());
                    this.localization.registerParameter((_local_6 + "confirm.desc"), "user", _local_4.userName);
                    this._windowManager.confirm((("${" + _local_6) + "confirm.title}"), (("${" + _local_6) + "confirm.desc}"), 0, this._Str_12803);
                }
            }
            else
            {
                if (_local_2 == this._avatarId)
                {
                    this._windowManager.confirm("${group.leaveconfirm.title}", "${group.leaveconfirm_nofurni.desc}", 0, this._Str_12803);
                }
                else
                {
                    if (_local_5)
                    {
                        _local_4 = _local_5._Str_5126(_local_2);
                        this.localization.registerParameter((_local_6 + "confirm_nofurni.desc"), "user", _local_4.userName);
                        this._windowManager.confirm((("${" + _local_6) + "confirm.title}"), (("${" + _local_6) + "confirm_nofurni.desc}"), 0, this._Str_12803);
                    }
                }
            }
        }

        private function _Str_12803(k:_Str_2910, _arg_2:WindowEvent):void
        {
            if ((((k == null) || (k.disposed)) || (this._kickData == null)))
            {
                this._kickData = null;
                return;
            }
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this.send(new _Str_9992(this._kickData._Str_23057, this._kickData._Str_25813, this._kickData._Str_21067));
            }
            this._kickData = null;
        }

        private function _Str_11640(k:IMessageEvent):void
        {
            var _local_2:_Str_4007 = _Str_3492(k).getParser();
            this._hasVip = ((_local_2.isVIP) && (_local_2.minutesUntilExpiration > 0));
            this._guildManagementWindowCtrl._Str_23040();
        }

        private function _Str_4428(k:IMessageEvent):void
        {
            var _local_2:_Str_4537 = _Str_2929(k).getParser();
            if (_local_2._Str_15487)
            {
                this._groupRoomInfoCtrl._Str_4428(_local_2.data);
            }
        }

        private function _Str_18561(k:IMessageEvent):void
        {
            var _local_2:_Str_5269 = _Str_5269(k);
            this._extendedProfileWindowCtrl._Str_18561(_local_2.userId, _local_2._Str_14823);
        }

        private function _Str_24382(k:UserBadgesEvent):void
        {
            this._extendedProfileWindowCtrl.onUserBadges(k.userId, k.badges);
        }

        private function _Str_19848():void
        {
            if (this._guildEditorData == null)
            {
                this.send(new _Str_11712());
            }
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get _Str_26014():GuildManagementWindowCtrl
        {
            return this._guildManagementWindowCtrl;
        }

        public function get _Str_26300():GroupRoomInfoCtrl
        {
            return this._groupRoomInfoCtrl;
        }

        public function get _Str_13386():Boolean
        {
            return getBoolean("groupRoomInfo.enabled");
        }

        public function get _Str_25533():Boolean
        {
            return getBoolean("group.deletion.enabled");
        }

        public function get _Str_26174():Boolean
        {
            return (this._Str_13386) && (getBoolean("groupRoomInfo.badge.enabled"));
        }

        public function get _Str_23231():Boolean
        {
            return (this._Str_13386) && (getBoolean("groupRoomInfo.attach.enabled"));
        }

        public function get _Str_7745():Boolean
        {
            return getBoolean("activity.point.display.enabled");
        }

        public function get _Str_3058():GuildEditorData
        {
            return this._guildEditorData;
        }

        public function get _Str_3251():int
        {
            return this._avatarId;
        }

        public function get navigator():IHabboNavigator
        {
            return this._newNavigator._Str_2559;
        }

        public function get friendlist():IHabboFriendsList
        {
            return this._friendlist;
        }

        public function get _Str_14291():GuildMembersWindowCtrl
        {
            return this._guildMembersWindowCtrl;
        }

        public function get habboTracking():IHabboTracking
        {
            return this._habboTracking;
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (this._habboTracking != null)
            {
                this._habboTracking.trackGoogle(k, _arg_2, _arg_3);
            }
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function _Str_14387(k:int):void
        {
            this._extendedProfileWindowCtrl._Str_14387(k);
        }

        public function _Str_21987(k:int):void
        {
            this.send(new _Str_2553(k));
        }

        public function openCatalog(k:String):void
        {
            this._catalog.openCatalogPage(k);
        }

        public function _Str_21441(k:String):void
        {
            this._catalog.openClubCenter();
        }

        public function get _Str_7303():Boolean
        {
            return this._hasVip;
        }

        public function _Str_20430(k:int, _arg_2:int):void
        {
            this._kickData = new GuildKickData(k, _arg_2);
            this.send(new _Str_8228(_arg_2, k));
        }

        public function _Str_22582(k:int, _arg_2:int):void
        {
            this._kickData = new GuildKickData(k, _arg_2, true);
            this.send(new _Str_8228(_arg_2, k));
        }

        public function get _Str_25772():IHabboNewNavigator
        {
            return this._newNavigator;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }
    }
}
