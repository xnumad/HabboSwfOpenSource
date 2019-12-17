package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5771;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6213;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4035;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5134;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_5834;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_8763;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_6030;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6001;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5728;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_5891;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_8469;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_8305;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_4265;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5655;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5038;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5006;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4187;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4910;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5017;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4129;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5683;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_9455;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5081;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5711;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5752;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5795;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5881;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6109;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_7883;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_9445;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3921;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_5763;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5993;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5766;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_8406;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5051;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5767;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3992;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3873;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_8029;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5212;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4173;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6564;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_8102;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7413;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6885;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6320;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4081;
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
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_6830;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6295;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6506;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6683;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6043;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6561;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6355;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6824;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6887;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6752;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6587;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5762;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6990;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5700;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_4184;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;
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
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5834(this._Str_9592)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_8763(this._Str_23882)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6030(this._Str_8265)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6001(this._Str_17265)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5728(this._Str_16709)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5891(this._Str_18130)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_8469(this._Str_23664)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_8305(this._Str_11632)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4265(this._Str_16100)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5655(this._Str_8351)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5038(this._Str_17199)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5006(this._Str_18837)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4187(this._Str_12114)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4910(this._Str_16568)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5017(this._Str_17226)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_4129(this.onDoorbell)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5683(this._Str_8484)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_9455(this._Str_25622)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5081(this._Str_12021)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5711(this._Str_18125)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5752(this._Str_18344)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_3352(this._Str_2960)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5795(this._Str_16972)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5881(this._Str_8907)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_6109(this._Str_8561)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_7883(this._Str_17243)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_9445(this._Str_18969)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_3921(this._Str_3702)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5763(this._Str_18891)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5993(this._Str_16485)));
            this._messageListeners.push(k.addHabboConnectionMessageEvent(new _Str_5766(this._Str_15947)));
            this._messageListeners.push(k.connection.addMessageEvent(new _Str_8406(this._Str_25034)));
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

        private function _Str_25034(k:_Str_8406):void
        {
            this._navigator.initialize(k.getParser());
        }

        private function _Str_25622(k:_Str_9455):void
        {
            this._navigator._Str_20936(new _Str_4173(k.getParser()._Str_22419));
        }

        private function _Str_23664(k:_Str_8469):void
        {
            this._navigator._Str_23125(k.getParser());
        }

        private function _Str_23882(k:_Str_8763):void
        {
            this._navigator._Str_23415(k.getParser());
        }

        private function _Str_11632(k:_Str_8305):void
        {
            this._navigator._Str_11632(k.getParser());
        }

        private function _Str_3702(k:_Str_3921):void
        {
            this._navigator._Str_3702(k.data);
        }

        private function _Str_18969(k:_Str_9445):void
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
            var _local_4:_Str_2370 = this._navigator.data._Str_2678;
            if (_local_4 != null)
            {
                _local_4._Str_12127 = _local_3._Str_20186;
                if (LegacyNavigator(this._navigator._Str_2559)._Str_4012 != null)
                {
                    LegacyNavigator(this._navigator._Str_2559)._Str_4012._Str_4295(this._navigator.data._Str_2678);
                }
            }
        }

        private function _Str_17243(k:IMessageEvent):void
        {
        }

        private function _Str_3241(k:IMessageEvent):void
        {
            var _local_2:_Str_4139 = UserObjectEvent(k).getParser();
            this._navigator.data._Str_3251 = _local_2.id;
            LegacyNavigator(this._navigator._Str_2559).send(new _Str_8102());
            LegacyNavigator(this._navigator._Str_2559).send(new _Str_7413());
        }

        private function _Str_4297(k:IMessageEvent):void
        {
            var _local_2:UserRightsMessageEvent;
            if (this._navigator)
            {
                _local_2 = UserRightsMessageEvent(k);
                if (_local_2.securityLevel >= SecurityLevelEnum._Str_3569)
                {
                    this._navigator.data._Str_15161 = true;
                }
                if (_local_2.securityLevel >= SecurityLevelEnum._Str_8629)
                {
                    this._navigator.data._Str_14374 = true;
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
            var _local_2:_Str_6320 = _Str_5134(k).getParser();
            this.data._Str_5645 = _local_2.data;
            this.data._Str_5653 = _local_2._Str_5653;
            this.data._Str_5482 = _local_2._Str_5482;
            Logger.log(("Received Official rooms: " + this.data._Str_5645.entries.length));
        }

        private function _Str_16568(k:IMessageEvent):void
        {
            var _local_2:_Str_4081 = _Str_4910(k).getParser().data;
            this.data._Str_4518 = _local_2;
            Logger.log(("Received GuestRoomSearch: " + ((this.data._Str_4518.rooms) ? this.data._Str_4518.rooms.length : " no rooms")));
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
            this.data._Str_4112 = ((_local_2.data._Str_13361 > 0) ? _local_2.data : null);
            LegacyNavigator(this._navigator._Str_2559)._Str_5048.refresh();
        }

        private function _Str_15955(k:IMessageEvent):void
        {
            this.data._Str_4112 = null;
            LegacyNavigator(this._navigator._Str_2559)._Str_5048.refresh();
        }

        private function _Str_17011(k:IMessageEvent):void
        {
            var _local_3:SimpleAlertView;
            var _local_2:_Str_6280 = _Str_5212(k).getParser();
            Logger.log(("CAN CREATE EVENT: " + _local_2._Str_13420));
            if (_local_2._Str_13420)
            {
                LegacyNavigator(this._navigator._Str_2559)._Str_6939.show();
            }
            else
            {
                _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator._Str_2559), "${navigator.cannotcreateevent.title}", (("${navigator.cannotcreateevent.error." + _local_2.errorCode) + "}"));
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
            this.data._Str_11597 = _local_2.flatId;
            LegacyNavigator(this._navigator._Str_2559).goToRoom(_local_2.flatId, true);
            LegacyNavigator(this._navigator._Str_2559)._Str_2813._Str_8316(Tabs._Str_4869);
            LegacyNavigator(this._navigator._Str_2559)._Str_10330();
            LegacyNavigator(this._navigator._Str_2559).closeNavigator();
        }

        private function _Str_22297(k:IMessageEvent):void
        {
            LegacyNavigator(this._navigator._Str_2559)._Str_2813.close();
        }

        private function _Str_2960(k:IMessageEvent):void
        {
            Logger.log("Navigator: exiting room");
            this.data._Str_2960();
            LegacyNavigator(this._navigator._Str_2559)._Str_4012.close();
            LegacyNavigator(this._navigator._Str_2559)._Str_5048.close();
            LegacyNavigator(this._navigator._Str_2559)._Str_6939.close();
            LegacyNavigator(this._navigator._Str_2559)._Str_3188.close();
            LegacyNavigator(this._navigator._Str_2559)._Str_6472.close();
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
            var _local_3:RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(this._navigator._Str_2559).tabs._Str_9436(Tabs._Str_3866)._Str_5252);
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
                LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_15066(parser.data);
                Logger.log(((((("GOT ROOM SETTINGS DATA: " + parser.data.name) + ", ") + parser.data._Str_5552) + ", ") + parser.data._Str_13128));
            }
            catch(e:Error)
            {
                Logger.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
            }
        }

        private function _Str_9592(k:IMessageEvent):void
        {
            var _local_2:_Str_6830 = (k as _Str_5834).getParser();
            LegacyNavigator(this._navigator._Str_2559)._Str_6472._Str_9592(_local_2._Str_13264);
            Logger.log(("GOT ROOM FILTER SETTINGS: " + _local_2._Str_13264));
        }

        private function _Str_18344(k:IMessageEvent):void
        {
            var _local_2:_Str_6295 = (k as _Str_5752).getParser();
        }

        private function _Str_12021(k:IMessageEvent):void
        {
            var _local_2:_Str_6506 = (k as _Str_5081).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ("Room settings saved: " + _local_2.roomId));
            LegacyNavigator(this._navigator._Str_2559)._Str_2813._Str_8316(Tabs._Str_4869);
        }

        private function _Str_8265(k:IMessageEvent):void
        {
            var _local_2:_Str_4043 = (k as _Str_6030).getParser();
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_8265(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function _Str_18125(k:IMessageEvent):void
        {
            var _local_2:_Str_6683 = (k as _Str_5711).getParser();
            Logger.log(("ROOM UPDATED: " + _local_2.flatId));
            LegacyNavigator(this._navigator._Str_2559).send(new _Str_3570(_local_2.flatId, false, false));
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
            LegacyNavigator(this._navigator._Str_2559)._Str_4012.reload();
            LegacyNavigator(this._navigator._Str_2559)._Str_2813.refresh();
        }

        private function _Str_8576(k:IMessageEvent):void
        {
            var _local_2:_Str_6355 = (k as _Str_5771).getParser();
            Logger.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2._Str_8349.length));
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_8576(_local_2.roomId, _local_2._Str_8349);
        }

        private function _Str_9346(k:IMessageEvent):void
        {
            var _local_2:_Str_6824 = (k as _Str_6213).getParser();
            Logger.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_9346(_local_2.flatId, _local_2.data);
        }

        private function _Str_8484(k:IMessageEvent):void
        {
            var _local_2:_Str_6887 = (k as _Str_5683).getParser();
            Logger.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_8484(_local_2.flatId, _local_2.userId);
        }

        private function _Str_8907(k:IMessageEvent):void
        {
            var _local_2:_Str_6752 = (k as _Str_5881).getParser();
            Logger.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2._Str_14901.length));
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_8907(_local_2.roomId, _local_2._Str_14901);
        }

        private function _Str_8351(k:IMessageEvent):void
        {
            var _local_2:_Str_6587 = (k as _Str_5655).getParser();
            Logger.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_8351(_local_2.roomId, _local_2.userId);
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
            LegacyNavigator(this._navigator._Str_2559).doorbell._Str_19346();
        }

        private function _Str_16100(k:IMessageEvent):void
        {
            var _local_2:_Str_4265 = (k as _Str_4265);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_5762 = _local_2.getParser();
            if (((!(_local_3 == null)) && ((_local_3.userName == null) || (_local_3.userName.length == 0))))
            {
                LegacyNavigator(this._navigator._Str_2559).doorbell.hide();
            }
        }

        private function _Str_17265(k:IMessageEvent):void
        {
            var _local_2:_Str_6990 = (k as _Str_6001).getParser();
            Logger.log(("Received room rating: " + _local_2.rating));
            this.data._Str_15395 = _local_2.rating;
            this.data._Str_5090 = _local_2._Str_5090;
            LegacyNavigator(this._navigator._Str_2559)._Str_4012.reload();
        }

        private function _Str_12114(k:IMessageEvent):void
        {
            var _local_2:_Str_5700 = (k as _Str_4187).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                LegacyNavigator(this._navigator._Str_2559).doorbell._Str_20293();
            }
        }

        private function _Str_5276(k:IMessageEvent):void
        {
            this.data.friendList._Str_5276(k);
        }

        private function _Str_4132(k:IMessageEvent):void
        {
            this.data.friendList._Str_4132(k);
            LegacyNavigator(this._navigator._Str_2559)._Str_3188._Str_4132();
        }

        private function _Str_26467(k:_Str_5767):void
        {
            this.data._Str_4079 = k.getParser().data;
        }

        private function _Str_14669(k:int):void
        {
            LegacyNavigator(this._navigator._Str_2559).send(new _Str_3570(k, false, true));
            LegacyNavigator(this._navigator._Str_2559)._Str_4051("Room Forward", "go.roomforward", "", k);
        }

        private function _Str_18130(k:_Str_5891):void
        {
            LegacyNavigator(this._navigator._Str_2559).startRoomCreation();
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
            var _local_2:_Str_4184 = (k as _Str_5763).getParser();
            Logger.log(("FAILED TO CONNECT: REASON: " + _local_2.reason));
            switch (_local_2.reason)
            {
                case _Str_4184._Str_14993:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator._Str_2559), "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _local_3.show();
                    break;
                case _Str_4184._Str_12569:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator._Str_2559), "${room.queue.error.title}", (("${room.queue.error." + _local_2.parameter) + "}"));
                    _local_3.show();
                    break;
                case _Str_4184._Str_12985:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator._Str_2559), "${navigator.banned.title}", "${navigator.banned.text}");
                    _local_3.show();
                    break;
                default:
                    _local_3 = new SimpleAlertView(LegacyNavigator(this._navigator._Str_2559), "${room.queue.error.title}", "${room.queue.error.title}");
                    _local_3.show();
            }
            LegacyNavigator(this._navigator._Str_2559).send(new _Str_3719());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
            _local_4._Str_3378 = HabboToolbarIconEnum.RECEPTION;
            LegacyNavigator(this._navigator._Str_2559).toolbar.events.dispatchEvent(_local_4);
        }
    }
}
