package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomInfoUpdatedEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomEventEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FavouritesEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventCancelEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerAddedEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSavedEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUsersFromRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.NavigatorSettingsEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSaveErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.ShowEnforceRoomCategoryDialogEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerRemovedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomFilterSettingsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsDataMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.MuteAllInRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatCreatedEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsDataEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomRatingEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllersEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.UserFlatCatsEvent;
    import com.sulake.habbo.communication.messages.incoming.competition.NoOwnedRoomsAlertMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.NoSuchFlatEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.UserEventCatsEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FavouriteChangedEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CategoriesWithVisitorCountEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.UserUnbannedFromRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.ConvertedRoomIdEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomForwardMessageEvent;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.parser.roomsettings.MuteAllInRoomParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetUserFlatCatsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetUserEventCatsMessageComposer;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetGuestRoomMessageComposer;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatCreatedMessageParser;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomForwardMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.ConvertedRoomIdMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.VisitUserMessageComposer;
    import com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import com.sulake.habbo.communication.messages.parser.navigator.UserEventCatsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSavedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSaveErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomInfoUpdatedMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouriteChangedMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomMessageParser;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerRemovedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.BannedUsersFromRoomParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomRatingMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.communication.messages.parser.roomsettings.ShowEnforceRoomCategoryDialogParser;

    public class IncomingMessages 
    {
        private var _navigator:HabboNavigator;

        public function IncomingMessages(k:HabboNavigator)
        {
            this._navigator = k;
            var _local_2:IHabboCommunicationManager = this._navigator.communication;
            _local_2.addHabboConnectionMessageEvent(new RoomInfoUpdatedEvent(this._Str_18125));
            _local_2.addHabboConnectionMessageEvent(new CanCreateRoomEventEvent(this._Str_17011));
            _local_2.addHabboConnectionMessageEvent(new PopularRoomTagsResultEvent(this._Str_17226));
            _local_2.addHabboConnectionMessageEvent(new GuestRoomSearchResultEvent(this.onGuestRoomSearch));
            _local_2.addHabboConnectionMessageEvent(new FlatAccessDeniedMessageEvent(this.onFlatAccessDenied));
            _local_2.addHabboConnectionMessageEvent(new FriendListFragmentMessageEvent(this.onFriendsListFragment));
            _local_2.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
            _local_2.addHabboConnectionMessageEvent(new RoomSettingsErrorEvent(this._Str_18344));
            _local_2.addHabboConnectionMessageEvent(new FlatAccessibleMessageEvent(this.onDoorOpened));
            _local_2.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
            _local_2.addHabboConnectionMessageEvent(new FavouritesEvent(this._Str_8561));
            _local_2.addHabboConnectionMessageEvent(new RoomEventCancelEvent(this.onRoomEventCancel));
            _local_2.addHabboConnectionMessageEvent(new GetGuestRoomResultEvent(this.onRoomInfo));
            _local_2.addHabboConnectionMessageEvent(new DoorbellMessageEvent(this.onDoorbell));
            _local_2.addHabboConnectionMessageEvent(new FlatControllerAddedEvent(this._Str_9346));
            _local_2.addHabboConnectionMessageEvent(new RoomSettingsSavedEvent(this.onRoomSettingsSaved));
            _local_2.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this.onSubscriptionInfo));
            _local_2.addHabboConnectionMessageEvent(new BannedUsersFromRoomEvent(this._Str_8907));
            _local_2.addHabboConnectionMessageEvent(new NavigatorSettingsEvent(this.onNavigatorSettings));
            _local_2.addHabboConnectionMessageEvent(new RoomEventEvent(this._Str_17647));
            _local_2.addHabboConnectionMessageEvent(new RoomSettingsSaveErrorEvent(this._Str_8265));
            _local_2.addHabboConnectionMessageEvent(new GenericErrorEvent(this.onError));
            _local_2.addHabboConnectionMessageEvent(new OfficialRoomsEvent(this._Str_16321));
            _local_2.addHabboConnectionMessageEvent(new ShowEnforceRoomCategoryDialogEvent(this.onEnforceRoomCategorySelection));
            _local_2.addHabboConnectionMessageEvent(new FlatControllerRemovedEvent(this._Str_8484));
            _local_2.addHabboConnectionMessageEvent(new RoomFilterSettingsMessageEvent(this._Str_9592));
            _local_2.addHabboConnectionMessageEvent(new CompetitionRoomsDataMessageEvent(this.onCompetitionData));
            _local_2.addHabboConnectionMessageEvent(new MuteAllInRoomEvent(this.onMuteAllEvent));
            _local_2.addHabboConnectionMessageEvent(new FlatCreatedEvent(this.onFlatCreated));
            _local_2.addHabboConnectionMessageEvent(new RoomSettingsDataEvent(this._Str_16485));
            _local_2.addHabboConnectionMessageEvent(new CantConnectMessageEvent(this.onCantConnect));
            _local_2.addHabboConnectionMessageEvent(new RoomRatingEvent(this.onRoomRating));
            _local_2.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
            _local_2.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
            _local_2.addHabboConnectionMessageEvent(new CanCreateRoomEvent(this._Str_25812));
            _local_2.addHabboConnectionMessageEvent(new FlatControllersEvent(this._Str_8576));
            _local_2.addHabboConnectionMessageEvent(new UserFlatCatsEvent(this._Str_16709));
            _local_2.addHabboConnectionMessageEvent(new NoOwnedRoomsAlertMessageEvent(this.onNoOwnedRoomsAlert));
            _local_2.addHabboConnectionMessageEvent(new NoSuchFlatEvent(this.onNoSuchFlat));
            _local_2.addHabboConnectionMessageEvent(new UserEventCatsEvent(this._Str_15947));
            _local_2.addHabboConnectionMessageEvent(new FavouriteChangedEvent(this._Str_16972));
            _local_2.addHabboConnectionMessageEvent(new CategoriesWithVisitorCountEvent(this._Str_18837));
            _local_2.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new UserUnbannedFromRoomEvent(this.onUserUnbannedFromRoom));
            _local_2.addHabboConnectionMessageEvent(new ConvertedRoomIdEvent(this.onConvertedRoomId));
            _local_2.addHabboConnectionMessageEvent(new RoomForwardMessageEvent(this.onRoomForward));
        }

        public function get data():NavigatorData
        {
            return this._navigator.data;
        }

        private function onMuteAllEvent(k:IMessageEvent):void
        {
            var _local_2:MuteAllInRoomEvent = (k as MuteAllInRoomEvent);
            var _local_3:MuteAllInRoomParser = _local_2.getParser();
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

        private function onNoSuchFlat(k:IMessageEvent):void
        {
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = UserObjectEvent(k).getParser();
            this.data.avatarId = _local_2.id;
            this._navigator.send(new GetUserFlatCatsMessageComposer());
            this._navigator.send(new GetUserEventCatsMessageComposer());
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
            var _local_2:CategoriesWithVisitorCountParser = CategoriesWithVisitorCountEvent(k).getParser();
            this.data._Str_7267 = _local_2.data;
            Logger.log(("Received Categories with user count: " + this.data._Str_7267.categoryToCurrentUserCountMap.length));
        }

        private function _Str_16321(k:IMessageEvent):void
        {
            var _local_2:OfficialRoomsMessageParser = OfficialRoomsEvent(k).getParser();
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
            var _local_2:PopularRoomTagsData = PopularRoomTagsResultEvent(k).getParser().data;
            this.data._Str_6697 = _local_2;
            Logger.log(("Received popular room tags: " + this.data._Str_6697.tags.length));
        }

        private function _Str_17647(k:IMessageEvent):void
        {
            var _local_2:RoomEventMessageParser = RoomEventEvent(k).getParser();
            Logger.log(((("Got room event: " + _local_2.data._Str_13361) + ", ") + _local_2.data.eventName));
            this.data.roomEventData = ((_local_2.data._Str_13361 > 0) ? _local_2.data : null);
            this._navigator.roomEventInfoCtrl.refresh();
        }

        private function onRoomEventCancel(k:IMessageEvent):void
        {
            this.data.roomEventData = null;
            this._navigator.roomEventInfoCtrl.refresh();
        }

        private function _Str_17011(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:CanCreateRoomEventMessageParser = CanCreateRoomEventEvent(k).getParser();
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
            this.closeOpenCantConnectAlerts();
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
                _local_4 = this._navigator.data.getAndResetSessionTags();
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

        private function onFlatCreated(k:IMessageEvent):void
        {
            var _local_2:FlatCreatedMessageParser = FlatCreatedEvent(k).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ((("Flat created: " + _local_2.flatId) + ", ") + _local_2._Str_18439));
            this.data.createdFlatId = _local_2.flatId;
            this._navigator.goToRoom(_local_2.flatId, true);
            this._navigator.mainViewCtrl.reloadRoomList(Tabs.SEARCHTYPE_MY_ROOMS);
            this._navigator.goToMainView();
            this._navigator.closeNavigator();
        }

        private function _Str_22297(k:IMessageEvent):void
        {
            this._navigator.mainViewCtrl.close();
        }

        private function onSubscriptionInfo(k:IMessageEvent):void
        {
            var _local_2:ScrSendUserInfoMessageParser = ScrSendUserInfoEvent(k).getParser();
            Logger.log(((((((((("Got subscription info: " + _local_2.productName) + ", ") + _local_2.daysToPeriodEnd) + ", ") + _local_2.memberPeriods) + ", ") + _local_2.periodsSubscribedAhead) + ", ") + _local_2.responseType));
            this.data.hcMember = (_local_2.daysToPeriodEnd > 0);
        }

        private function onRoomForward(k:IMessageEvent):void
        {
            var _local_2:RoomForwardMessageParser = RoomForwardMessageEvent(k).getParser();
            Logger.log(("Got room forward: " + _local_2.roomId));
            this.forwardToRoom(_local_2.roomId);
        }

        private function onConvertedRoomId(k:IMessageEvent):void
        {
            var _local_2:ConvertedRoomIdMessageParser = ConvertedRoomIdEvent(k).getParser();
            if (this._navigator._Str_25806)
            {
                this._navigator.habboHelp.reportRoom(_local_2._Str_12434, this._navigator._Str_23036, "");
            }
            else
            {
                Logger.log(((("Got converted room ID for " + _local_2._Str_17914) + ", forward to room ") + _local_2._Str_12434));
                this.forwardToRoom(_local_2._Str_12434);
            }
        }

        private function onNavigatorSettings(k:IMessageEvent):void
        {
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:int;
            var _local_9:Boolean;
            var _local_2:NavigatorSettingsMessageParser = NavigatorSettingsEvent(k).getParser();
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
                    this._navigator.send(new VisitUserMessageComposer(int(this._navigator.getProperty("friend.id"))));
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
                    this.forwardToRoom(_local_5);
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
            var _local_2:UserFlatCatsMessageParser = (k as UserFlatCatsEvent).getParser();
            this._navigator.data.categories = _local_2.nodes;
            var _local_3:RoomsTabPageDecorator = RoomsTabPageDecorator(this._navigator.tabs.getTab(Tabs.TAB_ROOMS)._Str_5252);
            _local_3.prepareRoomCategories();
        }

        private function _Str_15947(k:IMessageEvent):void
        {
            var _local_2:UserEventCatsMessageParser = (k as UserEventCatsEvent).getParser();
            this._navigator.data._Str_10701 = _local_2._Str_10701;
        }

        private function _Str_16485(event:IMessageEvent):void
        {
            var parser:RoomSettingsDataMessageParser;
            try
            {
                parser = (event as RoomSettingsDataEvent).getParser();
                this._navigator.roomSettingsCtrl.onRoomSettings(parser.data);
                Logger.log(((((("GOT ROOM SETTINGS DATA: " + parser.data.name) + ", ") + parser.data.maximumVisitors) + ", ") + parser.data._Str_13128));
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
            var _local_2:RoomSettingsErrorMessageParser = (k as RoomSettingsErrorEvent).getParser();
        }

        private function onRoomSettingsSaved(k:IMessageEvent):void
        {
            var _local_2:RoomSettingsSavedMessageParser = (k as RoomSettingsSavedEvent).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ("Room settings saved: " + _local_2.roomId));
            this._navigator.mainViewCtrl.reloadRoomList(Tabs.SEARCHTYPE_MY_ROOMS);
        }

        private function _Str_8265(k:IMessageEvent):void
        {
            var _local_2:RoomSettingsSaveErrorMessageParser = (k as RoomSettingsSaveErrorEvent).getParser();
            this._navigator.roomSettingsCtrl._Str_8265(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function _Str_18125(k:IMessageEvent):void
        {
            var _local_2:RoomInfoUpdatedMessageParser = (k as RoomInfoUpdatedEvent).getParser();
            Logger.log(("ROOM UPDATED: " + _local_2.flatId));
            this._navigator.send(new GetGuestRoomMessageComposer(_local_2.flatId, false, false));
        }

        private function _Str_8561(k:IMessageEvent):void
        {
            var _local_2:FavouritesMessageParser = (k as FavouritesEvent).getParser();
            Logger.log(((("Received favourites: " + _local_2.limit) + ", ") + _local_2._Str_13809.length));
            this._navigator.data._Str_8561(_local_2);
        }

        private function _Str_16972(k:IMessageEvent):void
        {
            var _local_2:FavouriteChangedMessageParser = (k as FavouriteChangedEvent).getParser();
            Logger.log(((("Received favourite changed: " + _local_2.flatId) + ", ") + _local_2._Str_13819));
            this._navigator.data._Str_21350(_local_2.flatId, _local_2._Str_13819);
            this._navigator.roomInfoViewCtrl.reload();
            this._navigator.mainViewCtrl.refresh();
        }

        private function _Str_25812(k:IMessageEvent):void
        {
            var _local_3:AlertView;
            var _local_2:CanCreateRoomMessageParser = (k as CanCreateRoomEvent).getParser();
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
            var _local_2:FlatControllersMessageParser = (k as FlatControllersEvent).getParser();
            Logger.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2.controllers.length));
            this._navigator.roomSettingsCtrl._Str_8576(_local_2.roomId, _local_2.controllers);
        }

        private function _Str_9346(k:IMessageEvent):void
        {
            var _local_2:FlatControllerAddedMessageParser = (k as FlatControllerAddedEvent).getParser();
            Logger.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            this._navigator.roomSettingsCtrl._Str_9346(_local_2.flatId, _local_2.data);
        }

        private function _Str_8484(k:IMessageEvent):void
        {
            var _local_2:FlatControllerRemovedMessageParser = (k as FlatControllerRemovedEvent).getParser();
            Logger.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            this._navigator.roomSettingsCtrl._Str_8484(_local_2.flatId, _local_2.userId);
        }

        private function _Str_8907(k:IMessageEvent):void
        {
            var _local_2:BannedUsersFromRoomParser = (k as BannedUsersFromRoomEvent).getParser();
            Logger.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2._Str_14901.length));
            this._navigator.roomSettingsCtrl._Str_8907(_local_2.roomId, _local_2._Str_14901);
        }

        private function onUserUnbannedFromRoom(k:IMessageEvent):void
        {
            var _local_2:UserUnbannedFromRoomParser = (k as UserUnbannedFromRoomEvent).getParser();
            Logger.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            this._navigator.roomSettingsCtrl.onUserUnbannedFromRoom(_local_2.roomId, _local_2.userId);
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
            var _local_2:DoorbellMessageEvent = (k as DoorbellMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.userName != "")
            {
                return;
            }
            this._navigator.doorbell.showWaiting();
        }

        private function onDoorOpened(k:IMessageEvent):void
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

        private function onRoomRating(k:IMessageEvent):void
        {
            var _local_2:RoomRatingMessageParser = (k as RoomRatingEvent).getParser();
            Logger.log(("Received room rating: " + _local_2.rating));
            this._navigator.data._Str_15395 = _local_2.rating;
            this._navigator.data._Str_5090 = _local_2._Str_5090;
            this._navigator.roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(k:IMessageEvent):void
        {
            var _local_2:FlatAccessDeniedMessageParser = (k as FlatAccessDeniedMessageEvent).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                this._navigator.doorbell.showNoAnswer();
            }
        }

        private function onFriendsListFragment(k:IMessageEvent):void
        {
            this._navigator.data.friendList.onFriendsListFragment(k);
        }

        private function onFriendListUpdate(k:IMessageEvent):void
        {
            this._navigator.data.friendList.onFriendListUpdate(k);
            this._navigator.roomSettingsCtrl.onFriendListUpdate();
        }

        private function onCompetitionData(k:CompetitionRoomsDataMessageEvent):void
        {
            this._navigator.data._Str_4079 = k.getParser().data;
        }

        private function forwardToRoom(k:int):void
        {
            this._navigator.send(new GetGuestRoomMessageComposer(k, false, true));
            this._navigator.trackNavigationDataPoint("Room Forward", "go.roomforward", "", k);
        }

        private function onNoOwnedRoomsAlert(k:NoOwnedRoomsAlertMessageEvent):void
        {
            this._navigator.startRoomCreation();
        }

        private function closeOpenCantConnectAlerts():void
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

        private function onCantConnect(k:IMessageEvent):void
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
            this._navigator.send(new QuitMessageComposer());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
            _local_4.iconId = HabboToolbarIconEnum.RECEPTION;
            this._navigator.toolbar.events.dispatchEvent(_local_4);
        }

        private function onEnforceRoomCategorySelection(k:IMessageEvent):void
        {
            var _local_2:ShowEnforceRoomCategoryDialogParser = (k as ShowEnforceRoomCategoryDialogEvent).getParser();
            this._navigator.enforceCategoryCtrl.show(_local_2.selectionType);
        }
    }
}
