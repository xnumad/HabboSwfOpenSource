package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5711;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5212;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5017;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4187;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3873;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5752;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6109;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_8029;
    import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4129;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6213;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5081;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5881;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5633;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5051;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6030;
    import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5134;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_8939;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5683;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomFilterSettingsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5767;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5038;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3992;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5993;
    import com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6001;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4035;
    import com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5771;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5728;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_5891;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_7883;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5766;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5795;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5006;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5655;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_7272;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomForwardMessageEvent;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6564;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_8102;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_7413;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6885;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4587;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6918;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6280;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetGuestRoomMessageComposer;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5936;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomForwardMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5654;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_7002;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_4348;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6478;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6276;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4697;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6295;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6506;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6683;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6561;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomMessageParser;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6355;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6824;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6887;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6752;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6587;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6990;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5700;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.session._Str_3719;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_7422;

    public class IncomingMessages 
    {
        private var _navigator:HabboNavigator;

        public function IncomingMessages(k:HabboNavigator)
        {
            this._navigator = k;
            var _local_2:IHabboCommunicationManager = this._navigator.communication;
            _local_2.addHabboConnectionMessageEvent(new _Str_5711(this._Str_18125));
            _local_2.addHabboConnectionMessageEvent(new _Str_5212(this._Str_17011));
            _local_2.addHabboConnectionMessageEvent(new _Str_5017(this._Str_17226));
            _local_2.addHabboConnectionMessageEvent(new GuestRoomSearchResultEvent(this.onGuestRoomSearch));
            _local_2.addHabboConnectionMessageEvent(new _Str_4187(this._Str_12114));
            _local_2.addHabboConnectionMessageEvent(new _Str_3873(this._Str_5276));
            _local_2.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
            _local_2.addHabboConnectionMessageEvent(new _Str_5752(this._Str_18344));
            _local_2.addHabboConnectionMessageEvent(new FlatAccessibleMessageEvent(this._Str_16100));
            _local_2.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
            _local_2.addHabboConnectionMessageEvent(new _Str_6109(this._Str_8561));
            _local_2.addHabboConnectionMessageEvent(new _Str_8029(this._Str_15955));
            _local_2.addHabboConnectionMessageEvent(new GetGuestRoomResultEvent(this.onRoomInfo));
            _local_2.addHabboConnectionMessageEvent(new _Str_4129(this.onDoorbell));
            _local_2.addHabboConnectionMessageEvent(new _Str_6213(this._Str_9346));
            _local_2.addHabboConnectionMessageEvent(new _Str_5081(this._Str_12021));
            _local_2.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this._Str_11640));
            _local_2.addHabboConnectionMessageEvent(new _Str_5881(this._Str_8907));
            _local_2.addHabboConnectionMessageEvent(new _Str_5633(this.onNavigatorSettings));
            _local_2.addHabboConnectionMessageEvent(new _Str_5051(this._Str_17647));
            _local_2.addHabboConnectionMessageEvent(new _Str_6030(this._Str_8265));
            _local_2.addHabboConnectionMessageEvent(new GenericErrorEvent(this.onError));
            _local_2.addHabboConnectionMessageEvent(new _Str_5134(this._Str_16321));
            _local_2.addHabboConnectionMessageEvent(new _Str_8939(this._Str_23463));
            _local_2.addHabboConnectionMessageEvent(new _Str_5683(this._Str_8484));
            _local_2.addHabboConnectionMessageEvent(new RoomFilterSettingsMessageEvent(this._Str_9592));
            _local_2.addHabboConnectionMessageEvent(new _Str_5767(this._Str_26467));
            _local_2.addHabboConnectionMessageEvent(new _Str_5038(this._Str_17199));
            _local_2.addHabboConnectionMessageEvent(new _Str_3992(this._Str_7358));
            _local_2.addHabboConnectionMessageEvent(new _Str_5993(this._Str_16485));
            _local_2.addHabboConnectionMessageEvent(new CantConnectMessageEvent(this._Str_18891));
            _local_2.addHabboConnectionMessageEvent(new _Str_6001(this._Str_17265));
            _local_2.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
            _local_2.addHabboConnectionMessageEvent(new _Str_4035(this._Str_4132));
            _local_2.addHabboConnectionMessageEvent(new CanCreateRoomMessageEvent(this._Str_25812));
            _local_2.addHabboConnectionMessageEvent(new _Str_5771(this._Str_8576));
            _local_2.addHabboConnectionMessageEvent(new _Str_5728(this._Str_16709));
            _local_2.addHabboConnectionMessageEvent(new _Str_5891(this._Str_18130));
            _local_2.addHabboConnectionMessageEvent(new _Str_7883(this._Str_17243));
            _local_2.addHabboConnectionMessageEvent(new _Str_5766(this._Str_15947));
            _local_2.addHabboConnectionMessageEvent(new _Str_5795(this._Str_16972));
            _local_2.addHabboConnectionMessageEvent(new _Str_5006(this._Str_18837));
            _local_2.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new _Str_5655(this._Str_8351));
            _local_2.addHabboConnectionMessageEvent(new _Str_7272(this.onConvertedRoomId));
            _local_2.addHabboConnectionMessageEvent(new RoomForwardMessageEvent(this._Str_22797));
        }

        public function get data():NavigatorData
        {
            return this._navigator.data;
        }

        private function _Str_17199(k:IMessageEvent):void
        {
            var _local_2:_Str_5038 = (k as _Str_5038);
            var _local_3:_Str_6564 = _local_2.getParser();
            var _local_4:GuestRoomData = this._navigator.data.enteredGuestRoom;
            if (_local_4 != null)
            {
                _local_4.allInRoomMuted = _local_3._Str_20186;
                if (this._navigator.roomInfoViewCtrl != null)
                {
                    this._navigator.roomInfoViewCtrl.refreshButtons(this._navigator.data.enteredGuestRoom);
                }
            }
        }

        private function _Str_17243(k:IMessageEvent):void
        {
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = UserObjectEvent(k).getParser();
            this.data.avatarId = _local_2.id;
            this._navigator.send(new _Str_8102());
            this._navigator.send(new _Str_7413());
        }

        private function onUserRights(k:IMessageEvent):void
        {
            var _local_2:UserRightsMessageEvent = UserRightsMessageEvent(k);
            if (_local_2.securityLevel >= SecurityLevelEnum.MODERATOR)
            {
                this._navigator.data.eventMod = true;
            }
            if (_local_2.securityLevel >= SecurityLevelEnum.COMMUNITY)
            {
                this._navigator.data.roomPicker = true;
            }
        }

        private function _Str_18837(k:IMessageEvent):void
        {
            var _local_2:_Str_6885 = _Str_5006(k).getParser();
            this.data._Str_7267 = _local_2.data;
            Logger.log(("Received Categories with user count: " + this.data._Str_7267.categoryToCurrentUserCountMap.length));
        }

        private function _Str_16321(k:IMessageEvent):void
        {
            var _local_2:OfficialRoomsMessageParser = _Str_5134(k).getParser();
            this.data._Str_5645 = _local_2.data;
            this.data._Str_5653 = _local_2._Str_5653;
            this.data.promotedRooms = _local_2.promotedRooms;
            Logger.log(("Received Official rooms: " + this.data._Str_5645.entries.length));
        }

        private function onGuestRoomSearch(k:IMessageEvent):void
        {
            var _local_2:GuestRoomSearchResultData = GuestRoomSearchResultEvent(k).getParser().data;
            this.data.guestRoomSearchResults = _local_2;
            Logger.log(("Received GuestRoomSearch: " + this.data.guestRoomSearchResults.rooms.length));
        }

        private function _Str_17226(k:IMessageEvent):void
        {
            var _local_2:_Str_4587 = _Str_5017(k).getParser().data;
            this.data._Str_6697 = _local_2;
            Logger.log(("Received popular room tags: " + this.data._Str_6697.tags.length));
        }

        private function _Str_17647(k:IMessageEvent):void
        {
            var _local_2:_Str_6918 = _Str_5051(k).getParser();
            Logger.log(((("Got room event: " + _local_2.data._Str_13361) + ", ") + _local_2.data.eventName));
            this.data.roomEventData = ((_local_2.data._Str_13361 > 0) ? _local_2.data : null);
            this._navigator.roomEventInfoCtrl.refresh();
        }

        private function _Str_15955(k:IMessageEvent):void
        {
            this.data.roomEventData = null;
            this._navigator.roomEventInfoCtrl.refresh();
        }

        private function _Str_17011(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:_Str_6280 = _Str_5212(k).getParser();
            Logger.log(("CAN CREATE EVENT: " + _local_2._Str_13420));
            if (_local_2._Str_13420)
            {
                this._navigator.roomEventViewCtrl.show();
            }
            else
            {
                _local_3 = new SimpleAlertView(this._navigator, "${navigator.cannotcreateevent.title}", (("${navigator.cannotcreateevent.error." + _local_2.errorCode) + "}"));
                _local_3.show();
                Logger.log("Cannot create an event just now...");
            }
        }

        private function onRoomEnter(k:IMessageEvent):void
        {
            var _local_2:RoomEntryInfoMessageParser = RoomEntryInfoMessageEvent(k).getParser();
            Logger.log("Navigator: entering room");
            this.data.onRoomEnter(_local_2);
            this._Str_20233();
            this._navigator.roomInfoViewCtrl.close();
            this._navigator.send(new GetGuestRoomMessageComposer(_local_2.guestRoomId, true, false));
            Logger.log("Sent get guest room...");
            this._navigator.roomEventInfoCtrl.refresh();
            this._navigator.roomEventViewCtrl.close();
            this._navigator.roomSettingsCtrl.close();
            this._navigator.roomFilterCtrl.close();
            HabboWebTools.closeNews();
        }

        private function onRoomInfo(k:IMessageEvent):void
        {
            var _local_3:Boolean;
            var _local_4:RoomSessionTags;
            var _local_2:GetGuestRoomResultMessageParser = GetGuestRoomResultEvent(k).getParser();
            Logger.log(((("Got room info: " + _local_2._Str_15487) + ", ") + _local_2._Str_18882));
            if (_local_2._Str_15487)
            {
                this.data.enteredRoom = _local_2.data;
                this.data._Str_8299 = _local_2._Str_21489;
                _local_3 = (this.data.createdFlatId == _local_2.data.flatId);
                if (((!(_local_3)) && (_local_2.data.displayRoomEntryAd)))
                {
                    this._Str_19492();
                }
                this.data.createdFlatId = 0;
                if (((!(this.data.enteredGuestRoom == null)) && (this.data.enteredGuestRoom.habboGroupId > 0)))
                {
                    this._navigator.roomEventInfoCtrl.expanded = false;
                    this._navigator.roomEventInfoCtrl.refresh();
                }
                _local_4 = this._navigator.data._Str_23466();
                if (_local_4 != null)
                {
                    this._navigator.send(_local_4._Str_23991());
                }
            }
            else
            {
                if (_local_2._Str_18882)
                {
                    if (((_local_2.data.doorMode == RoomSettingsData.DOORMODE_CLOSED) && ((!(this._navigator.sessionData.userName == _local_2.data.ownerName)) && (_local_2._Str_22141 == false))))
                    {
                        this._navigator.doorbell.show(_local_2.data);
                    }
                    else
                    {
                        if (((_local_2.data.doorMode == RoomSettingsData.DOORMODE_PASSWORD) && ((!(this._navigator.sessionData.userName == _local_2.data.ownerName)) && (_local_2._Str_22141 == false))))
                        {
                            this._navigator.passwordInput.show(_local_2.data);
                        }
                        else
                        {
                            if (((((_local_2.data.doorMode == RoomSettingsData.DOORMODE_NOOBS_ONLY) && (!(this._navigator.sessionData.isAmbassador))) && (!(this._navigator.sessionData.isRealNoob))) && (!(this._navigator.sessionData.isAnyRoomController))))
                            {
                                return;
                            }
                            this._navigator.goToRoom(_local_2.data.flatId, false);
                        }
                    }
                }
                else
                {
                    this.data.enteredRoom = _local_2.data;
                    this.data._Str_8299 = _local_2._Str_21489;
                    this._navigator.roomInfoViewCtrl.reload();
                }
            }
        }

        private function _Str_19492():void
        {
            if (this._navigator.getProperty("roomenterad.habblet.enabled") == "true")
            {
                HabboWebTools.openRoomEnterAd();
            }
        }

        private function _Str_7358(k:IMessageEvent):void
        {
            var _local_2:_Str_5936 = _Str_3992(k).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ((("Flat created: " + _local_2.flatId) + ", ") + _local_2._Str_18439));
            this.data.createdFlatId = _local_2.flatId;
            this._navigator.goToRoom(_local_2.flatId, true);
            this._navigator.mainViewCtrl._Str_8316(Tabs.SEARCHTYPE_MY_ROOMS);
            this._navigator.goToMainView();
            this._navigator.closeNavigator();
        }

        private function _Str_22297(k:IMessageEvent):void
        {
            this._navigator.mainViewCtrl.close();
        }

        private function _Str_11640(k:IMessageEvent):void
        {
            var _local_2:ScrSendUserInfoMessageParser = ScrSendUserInfoEvent(k).getParser();
            Logger.log(((((((((("Got subscription info: " + _local_2.productName) + ", ") + _local_2.daysToPeriodEnd) + ", ") + _local_2.memberPeriods) + ", ") + _local_2.periodsSubscribedAhead) + ", ") + _local_2.responseType));
            this.data.hcMember = (_local_2.daysToPeriodEnd > 0);
        }

        private function _Str_22797(k:IMessageEvent):void
        {
            var _local_2:RoomForwardMessageParser = RoomForwardMessageEvent(k).getParser();
            Logger.log(("Got room forward: " + _local_2.roomId));
            this._Str_14669(_local_2.roomId);
        }

        private function onConvertedRoomId(k:IMessageEvent):void
        {
            var _local_2:_Str_5654 = _Str_7272(k).getParser();
            if (this._navigator._Str_25806)
            {
                this._navigator.habboHelp.reportRoom(_local_2._Str_12434, this._navigator._Str_23036, "");
            }
            else
            {
                Logger.log(((("Got converted room ID for " + _local_2._Str_17914) + ", forward to room ") + _local_2._Str_12434));
                this._Str_14669(_local_2._Str_12434);
            }
        }

        private function onNavigatorSettings(k:IMessageEvent):void
        {
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:int;
            var _local_9:Boolean;
            var _local_2:_Str_7002 = _Str_5633(k).getParser();
            Logger.log(("Got navigator settings: " + _local_2.homeRoomId));
            var _local_3:* = (!(this._navigator.data._Str_17024));
            this._navigator.data.homeRoomId = _local_2.homeRoomId;
            this._navigator.data._Str_17024 = true;
            this._navigator.mainViewCtrl.refresh();
            var _local_4:int = -1;
            var _local_5:int = -1;
            if (((_local_3) && (!(HabboComponentFlags.isRoomViewerMode(this._navigator.flags)))))
            {
                _local_6 = false;
                _local_7 = false;
                if (this._navigator.propertyExists("friend.id"))
                {
                    _local_4 = 0;
                    this._navigator.send(new _Str_4348(int(this._navigator.getProperty("friend.id"))));
                }
                if (((this._navigator.propertyExists("forward.type")) && (this._navigator.propertyExists("forward.id"))))
                {
                    _local_4 = int(this._navigator.getProperty("forward.type"));
                    _local_5 = int(this._navigator.getProperty("forward.id"));
                }
                _local_7 = (_local_2._Str_17213 <= 0);
                if (_local_4 == 2)
                {
                    Logger.log(("Guest room forward on enter: " + _local_5));
                    this._Str_14669(_local_5);
                }
                else
                {
                    if (_local_4 == -1)
                    {
                        if (!_local_7)
                        {
                            _local_8 = _local_2._Str_17213;
                            if (_local_8 != this._navigator.data.homeRoomId)
                            {
                                this._navigator.goToRoom(_local_8, true);
                            }
                            else
                            {
                                _local_9 = this._navigator.goToHomeRoom();
                                if (!_local_9)
                                {
                                    _local_6 = true;
                                }
                            }
                        }
                    }
                }
                if (((_local_6) && (!(this._navigator.mainViewCtrl.isOpen()))))
                {
                    this._navigator.mainViewCtrl._Str_18392();
                }
            }
            else
            {
                this._navigator.roomInfoViewCtrl.reload();
            }
        }

        private function onRoomExit(k:IMessageEvent):void
        {
            Logger.log("Navigator: exiting room");
            this.data.onRoomExit();
            this._navigator.roomInfoViewCtrl.close();
            this._navigator.roomEventInfoCtrl.close();
            this._navigator.roomEventViewCtrl.close();
            this._navigator.roomSettingsCtrl.close();
            this._navigator.roomFilterCtrl.close();
            var _local_2:Boolean = this._navigator.getBoolean("news.auto_popup.enabled");
            if (_local_2)
            {
                HabboWebTools.openNews();
            }
        }

        private function _Str_16709(k:IMessageEvent):void
        {
            var _local_2:_Str_6478 = (k as _Str_5728).getParser();
            this._navigator.data.categories = _local_2.nodes;
            var _local_3:RoomsTabPageDecorator = RoomsTabPageDecorator(this._navigator.tabs.getTab(Tabs.TAB_ROOMS)._Str_5252);
            _local_3._Str_19000();
        }

        private function _Str_15947(k:IMessageEvent):void
        {
            var _local_2:_Str_6276 = (k as _Str_5766).getParser();
            this._navigator.data._Str_10701 = _local_2._Str_10701;
        }

        private function _Str_16485(event:IMessageEvent):void
        {
            var parser:_Str_4697;
            try
            {
                parser = (event as _Str_5993).getParser();
                this._navigator.roomSettingsCtrl.onRoomSettings(parser.data);
                Logger.log(((((("GOT ROOM SETTINGS DATA: " + parser.data.name) + ", ") + parser.data._Str_5552) + ", ") + parser.data._Str_13128));
            }
            catch(e:Error)
            {
                Logger.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
            }
        }

        private function _Str_9592(k:IMessageEvent):void
        {
            var _local_2:RoomFilterSettingsMessageParser = (k as RoomFilterSettingsMessageEvent).getParser();
            this._navigator.roomFilterCtrl._Str_9592(_local_2.badWords);
            Logger.log(("GOT ROOM FILTER SETTINGS: " + _local_2.badWords));
        }

        private function _Str_18344(k:IMessageEvent):void
        {
            var _local_2:_Str_6295 = (k as _Str_5752).getParser();
        }

        private function _Str_12021(k:IMessageEvent):void
        {
            var _local_2:_Str_6506 = (k as _Str_5081).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ("Room settings saved: " + _local_2.roomId));
            this._navigator.mainViewCtrl._Str_8316(Tabs.SEARCHTYPE_MY_ROOMS);
        }

        private function _Str_8265(k:IMessageEvent):void
        {
            var _local_2:_Str_4043 = (k as _Str_6030).getParser();
            this._navigator.roomSettingsCtrl._Str_8265(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function _Str_18125(k:IMessageEvent):void
        {
            var _local_2:_Str_6683 = (k as _Str_5711).getParser();
            Logger.log(("ROOM UPDATED: " + _local_2.flatId));
            this._navigator.send(new GetGuestRoomMessageComposer(_local_2.flatId, false, false));
        }

        private function _Str_8561(k:IMessageEvent):void
        {
            var _local_2:_Str_6043 = (k as _Str_6109).getParser();
            Logger.log(((("Received favourites: " + _local_2.limit) + ", ") + _local_2._Str_13809.length));
            this._navigator.data._Str_8561(_local_2);
        }

        private function _Str_16972(k:IMessageEvent):void
        {
            var _local_2:_Str_6561 = (k as _Str_5795).getParser();
            Logger.log(((("Received favourite changed: " + _local_2.flatId) + ", ") + _local_2._Str_13819));
            this._navigator.data._Str_21350(_local_2.flatId, _local_2._Str_13819);
            this._navigator.roomInfoViewCtrl.reload();
            this._navigator.mainViewCtrl.refresh();
        }

        private function _Str_25812(k:IMessageEvent):void
        {
            var _local_3:AlertView;
            var _local_2:CanCreateRoomMessageParser = (k as CanCreateRoomMessageEvent).getParser();
            Logger.log(((("Can create room: " + _local_2.resultCode) + ", ") + _local_2._Str_20396));
            if (_local_2.resultCode == 0)
            {
                this._navigator.roomCreateViewCtrl.show();
            }
            else
            {
                this._navigator.registerParameter("navigator.createroom.limitreached", "limit", ("" + _local_2._Str_20396));
                if (this._navigator.sessionData.clubLevel >= HabboClubLevelEnum.VIP)
                {
                    _local_3 = new SimpleAlertView(this._navigator, "${navigator.createroom.error}", "${navigator.createroom.limitreached}");
                }
                else
                {
                    _local_3 = new ClubPromoAlertView(this._navigator, "${navigator.createroom.error}", "${navigator.createroom.limitreached}", "${navigator.createroom.vippromo}");
                }
                _local_3.show();
            }
        }

        private function _Str_8576(k:IMessageEvent):void
        {
            var _local_2:_Str_6355 = (k as _Str_5771).getParser();
            Logger.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2._Str_8349.length));
            this._navigator.roomSettingsCtrl._Str_8576(_local_2.roomId, _local_2._Str_8349);
        }

        private function _Str_9346(k:IMessageEvent):void
        {
            var _local_2:_Str_6824 = (k as _Str_6213).getParser();
            Logger.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            this._navigator.roomSettingsCtrl._Str_9346(_local_2.flatId, _local_2.data);
        }

        private function _Str_8484(k:IMessageEvent):void
        {
            var _local_2:_Str_6887 = (k as _Str_5683).getParser();
            Logger.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            this._navigator.roomSettingsCtrl._Str_8484(_local_2.flatId, _local_2.userId);
        }

        private function _Str_8907(k:IMessageEvent):void
        {
            var _local_2:_Str_6752 = (k as _Str_5881).getParser();
            Logger.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2._Str_14901.length));
            this._navigator.roomSettingsCtrl._Str_8907(_local_2.roomId, _local_2._Str_14901);
        }

        private function _Str_8351(k:IMessageEvent):void
        {
            var _local_2:_Str_6587 = (k as _Str_5655).getParser();
            Logger.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            this._navigator.roomSettingsCtrl._Str_8351(_local_2.roomId, _local_2.userId);
        }

        private function onError(event:IMessageEvent):void
        {
            var error:GenericErrorEvent = (event as GenericErrorEvent);
            if (error == null)
            {
                return;
            }
            switch (error.getParser().errorCode)
            {
                case -100002:
                    this._navigator.passwordInput._Str_15400();
                    return;
                case 4009:
                    this._navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.need.to.be.vip}", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 4010:
                    this._navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.invalid_room_name}", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 4011:
                    this._navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.cannot_perm_ban}", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 4013:
                    this._navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.room_in_maintenance}", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
            }
        }

        private function onDoorbell(k:IMessageEvent):void
        {
            var _local_2:_Str_4129 = (k as _Str_4129);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.userName != "")
            {
                return;
            }
            this._navigator.doorbell._Str_19346();
        }

        private function _Str_16100(k:IMessageEvent):void
        {
            var _local_2:FlatAccessibleMessageEvent = (k as FlatAccessibleMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:FlatAccessibleMessageParser = _local_2.getParser();
            if (((!(_local_3 == null)) && ((_local_3.userName == null) || (_local_3.userName.length == 0))))
            {
                this._navigator.doorbell.hide();
            }
        }

        private function _Str_17265(k:IMessageEvent):void
        {
            var _local_2:_Str_6990 = (k as _Str_6001).getParser();
            Logger.log(("Received room rating: " + _local_2.rating));
            this._navigator.data._Str_15395 = _local_2.rating;
            this._navigator.data._Str_5090 = _local_2._Str_5090;
            this._navigator.roomInfoViewCtrl.reload();
        }

        private function _Str_12114(k:IMessageEvent):void
        {
            var _local_2:_Str_5700 = (k as _Str_4187).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                this._navigator.doorbell._Str_20293();
            }
        }

        private function _Str_5276(k:IMessageEvent):void
        {
            this._navigator.data.friendList._Str_5276(k);
        }

        private function _Str_4132(k:IMessageEvent):void
        {
            this._navigator.data.friendList._Str_4132(k);
            this._navigator.roomSettingsCtrl._Str_4132();
        }

        private function _Str_26467(k:_Str_5767):void
        {
            this._navigator.data._Str_4079 = k.getParser().data;
        }

        private function _Str_14669(k:int):void
        {
            this._navigator.send(new GetGuestRoomMessageComposer(k, false, true));
            this._navigator.trackNavigationDataPoint("Room Forward", "go.roomforward", "", k);
        }

        private function _Str_18130(k:_Str_5891):void
        {
            this._navigator.startRoomCreation();
        }

        private function _Str_20233():void
        {
            var k:Array;
            var _local_2:IWindowContext;
            var _local_3:int;
            var _local_4:int;
            var _local_5:IWindow;
            var _local_6:IWindow;
            var _local_7:AlertView;
            if (this._navigator != null)
            {
                k = new Array();
                _local_2 = this._navigator.windowManager.getWindowContext(2);
                _local_3 = _local_2.getDesktopWindow().numChildren;
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _local_5 = _local_2.getDesktopWindow().getChildAt(_local_4);
                    if (_local_5.tags.indexOf("SimpleAlertView") > -1)
                    {
                        k.push(_local_5);
                    }
                    _local_4++;
                }
                if (k.length > 0)
                {
                    for each (_local_6 in k)
                    {
                        _local_7 = AlertView._Str_22232(_local_6);
                        if (_local_7 != null)
                        {
                            _local_7.dispose();
                        }
                    }
                }
            }
        }

        private function _Str_18891(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:CantConnectMessageParser = (k as CantConnectMessageEvent).getParser();
            Logger.log(("FAILED TO CONNECT: REASON: " + _local_2.reason));
            switch (_local_2.reason)
            {
                case CantConnectMessageParser.REASON_FULL:
                    _local_3 = new SimpleAlertView(this._navigator, "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _local_3.show();
                    break;
                case CantConnectMessageParser.REASON_QUEUE_ERROR:
                    _local_3 = new SimpleAlertView(this._navigator, "${room.queue.error.title}", (("${room.queue.error." + _local_2.parameter) + "}"));
                    _local_3.show();
                    break;
                case CantConnectMessageParser.REASON_BANNED:
                    _local_3 = new SimpleAlertView(this._navigator, "${navigator.banned.title}", "${navigator.banned.text}");
                    _local_3.show();
                    break;
                default:
                    _local_3 = new SimpleAlertView(this._navigator, "${room.queue.error.title}", "${room.queue.error.title}");
                    _local_3.show();
            }
            this._navigator.send(new _Str_3719());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
            _local_4.iconId = HabboToolbarIconEnum.RECEPTION;
            this._navigator.toolbar.events.dispatchEvent(_local_4);
        }

        private function _Str_23463(k:IMessageEvent):void
        {
            var _local_2:_Str_7422 = (k as _Str_8939).getParser();
            this._navigator.enforceCategoryCtrl.show(_local_2._Str_24716);
        }
    }
}
