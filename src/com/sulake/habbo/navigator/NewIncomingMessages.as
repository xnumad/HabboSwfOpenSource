package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5771;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6213;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4035;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5134;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomFilterSettingsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_8763;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6030;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6001;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5728;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_5891;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorLiftedRoomsEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorSavedSearchesEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5655;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5038;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5006;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4187;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5017;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4129;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5683;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorSearchResultBlocksEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5081;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5711;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5752;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5795;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5881;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6109;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_7883;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.CollapsedCategoriesEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5993;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5766;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.NavigatorMetaDataEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5051;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5767;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3992;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3873;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_8029;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5212;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultContainer;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6564;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_8102;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_7413;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6885;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4587;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6918;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6280;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5936;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6478;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6276;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4697;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6295;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6506;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6683;
    import com.sulake.habbo.communication.messages.outgoing.navigator.GetGuestRoomMessageComposer;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6561;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6355;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6824;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6887;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6752;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6587;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6990;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5700;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.session._Str_3719;
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
            this._Str_21575();
        }

        public function _Str_21575():void
        {
            var k:IHabboCommunicationManager = this._navigator.communication;
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5771(this._Str_8576)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6213(this._Str_9346)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4035(this._Str_4132)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5134(this._Str_16321)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new RoomFilterSettingsMessageEvent(this._Str_9592)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_8763(this._Str_23882)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6030(this._Str_8265)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6001(this.onRoomRating)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5728(this._Str_16709)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5891(this._Str_18130)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorLiftedRoomsEvent(this._Str_23664)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorSavedSearchesEvent(this._Str_11632)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new FlatAccessibleMessageEvent(this.onDoorOpened)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5655(this.onUserUnbannedFromRoom)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5038(this._Str_17199)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5006(this._Str_18837)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4187(this.onFlatAccessDenied)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new GuestRoomSearchResultEvent(this.onGuestRoomSearch)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5017(this._Str_17226)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4129(this.onDoorbell)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5683(this._Str_8484)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorSearchResultBlocksEvent(this.onNavigatorSearchResultBlocks)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5081(this._Str_12021)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5711(this._Str_18125)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5752(this._Str_18344)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5795(this._Str_16972)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5881(this._Str_8907)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6109(this._Str_8561)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_7883(this._Str_17243)));
            this._messageListeners.push(k.connection.addMessageEvent(new CollapsedCategoriesEvent(this._Str_18969)));
            this._messageListeners.push(k.connection.addMessageEvent(new HabboGroupDetailsMessageEvent(this.onGroupDetails)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new CantConnectMessageEvent(this._Str_18891)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5993(this._Str_16485)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5766(this._Str_15947)));
            this._messageListeners.push(k.connection.addMessageEvent(new NavigatorMetaDataEvent(this._Str_25034)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5051(this._Str_17647)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5767(this._Str_26467)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_3992(this._Str_7358)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_3873(this._Str_5276)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_8029(this._Str_15955)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5212(this._Str_17011)));
        }

        public function _Str_23421():void
        {
            var _local_2:IMessageEvent;
            var k:IHabboCommunicationManager = this._navigator.communication;
            for each (_local_2 in this._messageListeners)
            {
                k.removeHabboConnectionMessageEvent(_local_2);
            }
            this._messageListeners = [];
        }

        private function _Str_25034(k:NavigatorMetaDataEvent):void
        {
            this._navigator.initialize(k.getParser());
        }

        private function onNavigatorSearchResultBlocks(k:NavigatorSearchResultBlocksEvent):void
        {
            this._navigator.onSearchResult(new SearchResultContainer(k.getParser().searchResult));
        }

        private function _Str_23664(k:NavigatorLiftedRoomsEvent):void
        {
            this._navigator._Str_23125(k.getParser());
        }

        private function _Str_23882(k:_Str_8763):void
        {
            this._navigator._Str_23415(k.getParser());
        }

        private function _Str_11632(k:NavigatorSavedSearchesEvent):void
        {
            this._navigator._Str_11632(k.getParser());
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

        private function _Str_17199(k:IMessageEvent):void
        {
            var _local_2:_Str_5038 = (k as _Str_5038);
            var _local_3:_Str_6564 = _local_2.getParser();
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

        private function _Str_17243(k:IMessageEvent):void
        {
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = UserObjectEvent(k).getParser();
            this._navigator.data.avatarId = _local_2.id;
            LegacyNavigator(this._navigator.legacyNavigator).send(new _Str_8102());
            LegacyNavigator(this._navigator.legacyNavigator).send(new _Str_7413());
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
            Logger.log(("Received GuestRoomSearch: " + ((this.data.guestRoomSearchResults.rooms) ? this.data.guestRoomSearchResults.rooms.length : " no rooms")));
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
            LegacyNavigator(this._navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function _Str_15955(k:IMessageEvent):void
        {
            this.data.roomEventData = null;
            LegacyNavigator(this._navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function _Str_17011(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:_Str_6280 = _Str_5212(k).getParser();
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

        private function _Str_7358(k:IMessageEvent):void
        {
            var _local_2:_Str_5936 = _Str_3992(k).getParser();
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
            var _local_2:_Str_6478 = (k as _Str_5728).getParser();
            this._navigator.data.categories = _local_2.nodes;
            var _local_3:RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(this._navigator.legacyNavigator).tabs.getTab(Tabs.TAB_ROOMS)._Str_5252);
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
                LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.onRoomSettings(parser.data);
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
            LegacyNavigator(this._navigator.legacyNavigator).roomFilterCtrl._Str_9592(_local_2.badWords);
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
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.reloadRoomList(Tabs.SEARCHTYPE_MY_ROOMS);
        }

        private function _Str_8265(k:IMessageEvent):void
        {
            var _local_2:_Str_4043 = (k as _Str_6030).getParser();
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8265(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function _Str_18125(k:IMessageEvent):void
        {
            var _local_2:_Str_6683 = (k as _Str_5711).getParser();
            Logger.log(("ROOM UPDATED: " + _local_2.flatId));
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetGuestRoomMessageComposer(_local_2.flatId, false, false));
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
            this.data._Str_21350(_local_2.flatId, _local_2._Str_13819);
            LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.reload();
            LegacyNavigator(this._navigator.legacyNavigator).mainViewCtrl.refresh();
        }

        private function _Str_8576(k:IMessageEvent):void
        {
            var _local_2:_Str_6355 = (k as _Str_5771).getParser();
            Logger.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2._Str_8349.length));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8576(_local_2.roomId, _local_2._Str_8349);
        }

        private function _Str_9346(k:IMessageEvent):void
        {
            var _local_2:_Str_6824 = (k as _Str_6213).getParser();
            Logger.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_9346(_local_2.flatId, _local_2.data);
        }

        private function _Str_8484(k:IMessageEvent):void
        {
            var _local_2:_Str_6887 = (k as _Str_5683).getParser();
            Logger.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8484(_local_2.flatId, _local_2.userId);
        }

        private function _Str_8907(k:IMessageEvent):void
        {
            var _local_2:_Str_6752 = (k as _Str_5881).getParser();
            Logger.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2._Str_14901.length));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_8907(_local_2.roomId, _local_2._Str_14901);
        }

        private function onUserUnbannedFromRoom(k:IMessageEvent):void
        {
            var _local_2:_Str_6587 = (k as _Str_5655).getParser();
            Logger.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl.onUserUnbannedFromRoom(_local_2.roomId, _local_2.userId);
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
            LegacyNavigator(this._navigator.legacyNavigator).doorbell._Str_19346();
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
            var _local_2:_Str_6990 = (k as _Str_6001).getParser();
            Logger.log(("Received room rating: " + _local_2.rating));
            this.data._Str_15395 = _local_2.rating;
            this.data._Str_5090 = _local_2._Str_5090;
            LegacyNavigator(this._navigator.legacyNavigator).roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(k:IMessageEvent):void
        {
            var _local_2:_Str_5700 = (k as _Str_4187).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                LegacyNavigator(this._navigator.legacyNavigator).doorbell._Str_20293();
            }
        }

        private function _Str_5276(k:IMessageEvent):void
        {
            this.data.friendList._Str_5276(k);
        }

        private function _Str_4132(k:IMessageEvent):void
        {
            this.data.friendList._Str_4132(k);
            LegacyNavigator(this._navigator.legacyNavigator).roomSettingsCtrl._Str_4132();
        }

        private function _Str_26467(k:_Str_5767):void
        {
            this.data._Str_4079 = k.getParser().data;
        }

        private function _Str_14669(k:int):void
        {
            LegacyNavigator(this._navigator.legacyNavigator).send(new GetGuestRoomMessageComposer(k, false, true));
            LegacyNavigator(this._navigator.legacyNavigator).trackNavigationDataPoint("Room Forward", "go.roomforward", "", k);
        }

        private function _Str_18130(k:_Str_5891):void
        {
            LegacyNavigator(this._navigator.legacyNavigator).startRoomCreation();
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
            LegacyNavigator(this._navigator.legacyNavigator).send(new _Str_3719());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
            _local_4.iconId = HabboToolbarIconEnum.RECEPTION;
            LegacyNavigator(this._navigator.legacyNavigator).toolbar.events.dispatchEvent(_local_4);
        }
    }
}
