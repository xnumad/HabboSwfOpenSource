package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllersEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerAddedEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomFilterSettingsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NewNavigatorPreferencesEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSaveErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomRatingEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.UserFlatCatsEvent;
    import com.sulake.habbo.communication.messages.incoming.competition.NoOwnedRoomsAlertMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorLiftedRoomsEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorSavedSearchesEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.UserUnbannedFromRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.MuteAllInRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CategoriesWithVisitorCountEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerRemovedEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorSearchResultBlocksEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSavedEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomInfoUpdatedEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FavouriteChangedEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUsersFromRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FavouritesEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.NoSuchFlatEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.CollapsedCategoriesEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsDataEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.UserEventCatsEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorMetaDataEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsDataMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatCreatedEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventCancelEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.CanCreateRoomEventEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultContainer;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.parser.roomsettings.MuteAllInRoomParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetUserFlatCatsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetUserEventCatsMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatCreatedMessageParser;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import com.sulake.habbo.communication.messages.parser.navigator.UserEventCatsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSavedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSaveErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomInfoUpdatedMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetGuestRoomMessageComposer;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouriteChangedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerRemovedMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.BannedUsersFromRoomParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomRatingMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class NewIncomingMessages 
    {
        private var _navigator:HabboNewNavigator;
        private var _messageListeners:Array;

        public function NewIncomingMessages(k:HabboNewNavigator)
        {
            this._messageListeners = [];
            super();
            this._navigator = k;
            var _local_2:IHabboCommunicationManager = this._navigator.communication;
            this.addMessageListeners();
        }

        public function addMessageListeners():void
        {
            var k:IHabboCommunicationManager = this._navigator.communication;
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatControllersEvent(this._Str_8576)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatControllerAddedEvent(this._Str_9346)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new OfficialRoomsEvent(this._Str_16321)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomFilterSettingsMessageEvent(this._Str_9592)));
            this._messageListeners.push(k.connection.addMessageEvent(new NewNavigatorPreferencesEvent(this.onNavigatorPreferences)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomSettingsSaveErrorEvent(this._Str_8265)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomRatingEvent(this.onRoomRating)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new UserFlatCatsEvent(this._Str_16709)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new NoOwnedRoomsAlertMessageEvent(this.onNoOwnedRoomsAlert)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorLiftedRoomsEvent(this.onNavigatorLiftedRooms)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorSavedSearchesEvent(this.onSavedSearches)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatAccessibleMessageEvent(this.onDoorOpened)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new UserUnbannedFromRoomEvent(this.onUserUnbannedFromRoom)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new MuteAllInRoomEvent(this.onMuteAllEvent)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CategoriesWithVisitorCountEvent(this._Str_18837)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatAccessDeniedMessageEvent(this.onFlatAccessDenied)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new GuestRoomSearchResultEvent(this.onGuestRoomSearch)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new PopularRoomTagsResultEvent(this._Str_17226)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new DoorbellMessageEvent(this.onDoorbell)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatControllerRemovedEvent(this._Str_8484)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorSearchResultBlocksEvent(this.onNavigatorSearchResultBlocks)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomSettingsSavedEvent(this.onRoomSettingsSaved)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomInfoUpdatedEvent(this._Str_18125)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomSettingsErrorEvent(this._Str_18344)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FavouriteChangedEvent(this._Str_16972)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new BannedUsersFromRoomEvent(this._Str_8907)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FavouritesEvent(this._Str_8561)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new NoSuchFlatEvent(this.onNoSuchFlat)));
            this._messageListeners.push(k.connection.addMessageEvent(new CollapsedCategoriesEvent(this._Str_18969)));
            this._messageListeners.push(k.connection.addMessageEvent(new HabboGroupDetailsMessageEvent(this.onGroupDetails)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CantConnectMessageEvent(this.onCantConnect)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomSettingsDataEvent(this._Str_16485)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new UserEventCatsEvent(this._Str_15947)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorMetaDataEvent(this.onNavigatorMetaData)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomEventEvent(this._Str_17647)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CompetitionRoomsDataMessageEvent(this.onCompetitionData)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatCreatedEvent(this.onFlatCreated)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FriendListFragmentMessageEvent(this.onFriendsListFragment)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomEventCancelEvent(this.onRoomEventCancel)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CanCreateRoomEventEvent(this._Str_17011)));
        }

        public function removeLegacyMessageListeners():void
        {
            var _local_2:IMessageEvent;
            var k:IHabboCommunicationManager = this._navigator.communication;
            for each (_local_2 in this._messageListeners)
            {
                k.removeHabboConnectionMessageEvent(_local_2);
            }
            this._messageListeners = [];
        }

        private function onNavigatorMetaData(k:NavigatorMetaDataEvent):void
        {
            this._navigator.initialize(k.getParser());
        }

        private function onNavigatorSearchResultBlocks(k:NavigatorSearchResultBlocksEvent):void
        {
            this._navigator.onSearchResult(new SearchResultContainer(k.getParser().searchResult));
        }

        private function onNavigatorLiftedRooms(k:NavigatorLiftedRoomsEvent):void
        {
            this._navigator.onLiftedRooms(k.getParser());
        }

        private function onNavigatorPreferences(k:NewNavigatorPreferencesEvent):void
        {
            this._navigator._Str_23415(k.getParser());
        }

        private function onSavedSearches(k:NavigatorSavedSearchesEvent):void
        {
            this._navigator.onSavedSearches(k.getParser());
        }

        private function onGroupDetails(k:HabboGroupDetailsMessageEvent):void
        {
            this._navigator.onGroupDetails(k.data);
        }

        private function _Str_18969(k:CollapsedCategoriesEvent):void
        {
            this._navigator._Str_18969(k.getParser()._Str_8273);
        }

        private function get data():NavigatorData
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
                if (LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl != null)
                {
                    LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.refreshButtons(this._navigator.data.enteredGuestRoom);
                }
            }
        }

        private function onNoSuchFlat(k:IMessageEvent):void
        {
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = UserObjectEvent(k).getParser();
            this._navigator.data.avatarId = _local_2.id;
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetUserFlatCatsMessageComposer());
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetUserEventCatsMessageComposer());
        }

        private function onUserRights(k:IMessageEvent):void
        {
            var _local_2:UserRightsMessageEvent;
            if (this._navigator)
            {
                _local_2 = UserRightsMessageEvent(k);
                if (_local_2.securityLevel >= SecurityLevelEnum.MODERATOR)
                {
                    this._navigator.data.eventMod = true;
                }
                if (_local_2.securityLevel >= SecurityLevelEnum.COMMUNITY)
                {
                    this._navigator.data.roomPicker = true;
                }
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
            Logger.log(("Received GuestRoomSearch: " + ((this.data.guestRoomSearchResults.rooms) ? this.data.guestRoomSearchResults.rooms.length : " no rooms")));
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
            LegacyNavigator(this._navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function onRoomEventCancel(k:IMessageEvent):void
        {
            this.data.roomEventData = null;
            LegacyNavigator(this._navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function _Str_17011(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:CanCreateRoomEventMessageParser = CanCreateRoomEventEvent(k).getParser();
            Logger.log(("CAN CREATE EVENT: " + _local_2._Str_13420));
            if (_local_2._Str_13420)
            {
                LegacyNavigator(this._navigator.legacyNavigator).roomEventViewCtrl.show();
            }
            else
            {
                _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator.legacyNavigator), "${navigator.cannotcreateevent.title}", (("${navigator.cannotcreateevent.error." + _local_2.errorCode) + "}"));
                _local_3.show();
                Logger.log("Cannot create an event just now...");
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
            LegacyNavigator(this._navigator.legacyNavigator).goToRoom(_local_2.flatId, true);
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.reloadRoomList(Tabs.SEARCHTYPE_MY_ROOMS);
            LegacyNavigator(this._navigator.legacyNavigator).goToMainView();
            LegacyNavigator(this._navigator.legacyNavigator).closeNavigator();
        }

        private function _Str_22297(k:IMessageEvent):void
        {
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.close();
        }

        private function onRoomExit(k:IMessageEvent):void
        {
            Logger.log("Navigator: exiting room");
            this.data.onRoomExit();
            LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.close();
            LegacyNavigator(this._navigator.legacyNavigator).roomEventInfoCtrl.close();
            LegacyNavigator(this._navigator.legacyNavigator).roomEventViewCtrl.close();
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.close();
            LegacyNavigator(this._navigator.legacyNavigator).roomFilterCtrl.close();
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
            var _local_3:RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(this._navigator.legacyNavigator).tabs.getTab(Tabs.TAB_ROOMS)._Str_5252);
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
                LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.onRoomSettings(parser.data);
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
            LegacyNavigator(this._navigator.legacyNavigator).roomFilterCtrl._Str_9592(_local_2.badWords);
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
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.reloadRoomList(Tabs.SEARCHTYPE_MY_ROOMS);
        }

        private function _Str_8265(k:IMessageEvent):void
        {
            var _local_2:RoomSettingsSaveErrorMessageParser = (k as RoomSettingsSaveErrorEvent).getParser();
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8265(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function _Str_18125(k:IMessageEvent):void
        {
            var _local_2:RoomInfoUpdatedMessageParser = (k as RoomInfoUpdatedEvent).getParser();
            Logger.log(("ROOM UPDATED: " + _local_2.flatId));
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetGuestRoomMessageComposer(_local_2.flatId, false, false));
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
            this.data._Str_21350(_local_2.flatId, _local_2._Str_13819);
            LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.reload();
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.refresh();
        }

        private function _Str_8576(k:IMessageEvent):void
        {
            var _local_2:FlatControllersMessageParser = (k as FlatControllersEvent).getParser();
            Logger.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2.controllers.length));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8576(_local_2.roomId, _local_2.controllers);
        }

        private function _Str_9346(k:IMessageEvent):void
        {
            var _local_2:FlatControllerAddedMessageParser = (k as FlatControllerAddedEvent).getParser();
            Logger.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_9346(_local_2.flatId, _local_2.data);
        }

        private function _Str_8484(k:IMessageEvent):void
        {
            var _local_2:FlatControllerRemovedMessageParser = (k as FlatControllerRemovedEvent).getParser();
            Logger.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8484(_local_2.flatId, _local_2.userId);
        }

        private function _Str_8907(k:IMessageEvent):void
        {
            var _local_2:BannedUsersFromRoomParser = (k as BannedUsersFromRoomEvent).getParser();
            Logger.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2._Str_14901.length));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8907(_local_2.roomId, _local_2._Str_14901);
        }

        private function onUserUnbannedFromRoom(k:IMessageEvent):void
        {
            var _local_2:UserUnbannedFromRoomParser = (k as UserUnbannedFromRoomEvent).getParser();
            Logger.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.onUserUnbannedFromRoom(_local_2.roomId, _local_2.userId);
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
            LegacyNavigator(this._navigator.legacyNavigator).doorbell.showWaiting();
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
                LegacyNavigator(this._navigator.legacyNavigator).doorbell.hide();
            }
        }

        private function onRoomRating(k:IMessageEvent):void
        {
            var _local_2:RoomRatingMessageParser = (k as RoomRatingEvent).getParser();
            Logger.log(("Received room rating: " + _local_2.rating));
            this.data._Str_15395 = _local_2.rating;
            this.data._Str_5090 = _local_2._Str_5090;
            LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(k:IMessageEvent):void
        {
            var _local_2:FlatAccessDeniedMessageParser = (k as FlatAccessDeniedMessageEvent).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                LegacyNavigator(this._navigator.legacyNavigator).doorbell.showNoAnswer();
            }
        }

        private function onFriendsListFragment(k:IMessageEvent):void
        {
            this.data.friendList.onFriendsListFragment(k);
        }

        private function onFriendListUpdate(k:IMessageEvent):void
        {
            this.data.friendList.onFriendListUpdate(k);
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.onFriendListUpdate();
        }

        private function onCompetitionData(k:CompetitionRoomsDataMessageEvent):void
        {
            this.data._Str_4079 = k.getParser().data;
        }

        private function forwardToRoom(k:int):void
        {
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetGuestRoomMessageComposer(k, false, true));
            LegacyNavigator(this._navigator.legacyNavigator).trackNavigationDataPoint("Room Forward", "go.roomforward", "", k);
        }

        private function onNoOwnedRoomsAlert(k:NoOwnedRoomsAlertMessageEvent):void
        {
            LegacyNavigator(this._navigator.legacyNavigator).startRoomCreation();
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
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator.legacyNavigator), "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _local_3.show();
                    break;
                case CantConnectMessageParser.REASON_QUEUE_ERROR:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator.legacyNavigator), "${room.queue.error.title}", (("${room.queue.error." + _local_2.parameter) + "}"));
                    _local_3.show();
                    break;
                case CantConnectMessageParser.REASON_BANNED:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator.legacyNavigator), "${navigator.banned.title}", "${navigator.banned.text}");
                    _local_3.show();
                    break;
                default:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator.legacyNavigator), "${room.queue.error.title}", "${room.queue.error.title}");
                    _local_3.show();
            }
            LegacyNavigator(this._navigator.legacyNavigator).send(new QuitMessageComposer());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
            _local_4.iconId = HabboToolbarIconEnum.RECEPTION;
            LegacyNavigator(this._navigator.legacyNavigator).toolbar.events.dispatchEvent(_local_4);
        }
    }
}
