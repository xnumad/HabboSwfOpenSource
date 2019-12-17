package com.sulake.habbo.notifications
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
	import com.sulake.habbo.communication.messages.incoming.notifications.SimpleAlertMessage;
	import com.sulake.habbo.communication.messages.incoming.notifications.SimpleAlertMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4953;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_8665;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_3660;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_8414;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_8312;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_4508;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9354;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelClosesAndWillOpenAtEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.PetBoughtNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_5714;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_7321;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_4691;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9048;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_9312;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9995;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6160;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_7309;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_9157;
    import com.sulake.habbo.communication.messages.incoming.availability._Str_6521;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9583;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_8670;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelWillCloseInMinutesEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetScratchFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelClosedAndOpensEvent;
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_6680;
    import com.sulake.habbo.notifications.NotificationPopup;
    import flash.utils.getTimer;
    import com.sulake.habbo.notifications.feed.FeedSettings;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_5519;
    import flash.display.BitmapData;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7351;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7427;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7904;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8126;
    import com.sulake.habbo.communication.messages.parser.availability.HotelWillCloseInMinutesMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability._Str_7315;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosesAndWillOpenAtMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosedAndOpensMessageParser;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7160;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_2848;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetBoughtNotificationMessageParser;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_6671;
    import com.sulake.habbo.window.enum.FrankIllustration;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7117;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetScratchFailedMessageParser;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7739;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.habbo.communication.messages.parser.users._Str_5768;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8077;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import __AS3__.vec.*;

    public class IncomingMessages 
    {
        private var _notifications:HabboNotifications;
        private var _communication:IHabboCommunicationManager;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function IncomingMessages(k:HabboNotifications, _arg_2:IHabboCommunicationManager)
        {
            this._notifications = k;
            this._communication = _arg_2;
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new _Str_4953(this.onRespectNotification));
            this.addMessageEvent(new _Str_8665(this._Str_24393));
            this.addMessageEvent(new _Str_3660(this._Str_11598));
            this.addMessageEvent(new _Str_8414(this._Str_24449));
            this.addMessageEvent(new _Str_8312(this._Str_25676));
            this.addMessageEvent(new _Str_4508(this._Str_17254));
            this.addMessageEvent(new _Str_9354(this._Str_22529));
            this.addMessageEvent(new HotelClosesAndWillOpenAtEvent(this._Str_10317));
            this.addMessageEvent(new PetBoughtNotificationEvent(this._Str_25804));
            this.addMessageEvent(new _Str_5714(this.onCreditBalance));
            this.addMessageEvent(new _Str_7321(this._Str_24670));
            this.addMessageEvent(new _Str_4691(this._Str_17153));
            this.addMessageEvent(new _Str_9048(this._Str_24729));
            this.addMessageEvent(new _Str_9312(this._Str_24490));
            this.addMessageEvent(new _Str_9995(this._Str_24460));
            this.addMessageEvent(new _Str_6160(this._Str_18012));
            this.addMessageEvent(new _Str_7309(this._Str_25384));
            this.addMessageEvent(new UserObjectEvent(this._Str_3241));
            this.addMessageEvent(new _Str_9157(this._Str_25493));
            this.addMessageEvent(new _Str_6521(this._parser2));
            this.addMessageEvent(new _Str_9583(this._Str_25354));
            this.addMessageEvent(new _Str_8670(this._Str_24546));
            this.addMessageEvent(new HotelWillCloseInMinutesEvent(this._Str_24833));
            this.addMessageEvent(new PetScratchFailedEvent(this._Str_18116));
            this.addMessageEvent(new _Str_2752(this.onCreditBalance));
            this.addMessageEvent(new HotelClosedAndOpensEvent(this._Str_23488));
			this.addMessageEvent(new SimpleAlertMessageParser(this.alertMessageHandler));
            this._notifications.activate();
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communication.addHabboConnectionMessageEvent(k));
        }

        public function dispose():void
        {
            var k:IMessageEvent;
            if (((!(this._messageEvents == null)) && (!(this._communication == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communication.removeHabboConnectionMessageEvent(k);
                }
            }
            this._messageEvents = null;
            this._notifications = null;
            this._communication = null;
        }

        private function _Str_18948():Boolean
        {
            return this._notifications.getBoolean("notification.feed.enabled");
        }

        private function _Str_16186():Boolean
        {
            return this._notifications.getBoolean("notification.items.enabled");
        }

        internal function _Str_24670(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_5:GenericNotificationItemData;
            var _local_2:_Str_7321 = (k as _Str_7321);
            var _local_3:_Str_6680 = (_local_2.getParser() as _Str_6680);
            if (((_local_3.messages) && (_local_3.messages.length > 0)))
            {
                if (this._Str_16186())
                {
                    new NotificationPopup(_local_3.messages, this._notifications.assetLibrary, this._notifications.windowManager);
                }
                if (this._Str_18948())
                {
                    for each (_local_4 in _local_3.messages)
                    {
                        _local_5 = new GenericNotificationItemData();
                        _local_5.title = _local_4;
                        _local_5.timeStamp = getTimer();
                        this._notifications._Str_16215._Str_18026(FeedSettings._Str_9534, _local_5);
                    }
                }
            }
        }

        private function _Str_11598(k:IMessageEvent):void
        {
            var _local_2:_Str_3660 = (k as _Str_3660);
            var _local_3:_Str_5519 = _local_2.getParser();
            var _local_4:String = this._notifications.localization.getLocalization("achievements.levelup.desc", "");
            var _local_5:String = this._notifications.localization.getBadgeName(_local_3.data.badgeCode);
            var _local_6:BitmapData = this._notifications.sessionDataManager.requestBadgeImage(_local_3.data.badgeCode);
            this._notifications._Str_3069._Str_2822(((_local_4 + " ") + _local_5), NotificationType.ACHIEVEMENT, _local_6, null, _local_3.data.badgeCode, ("questengine/achievements/" + _local_3.data.category));
        }

        internal function onRespectNotification(k:IMessageEvent):void
        {
            var _local_3:ILocalization;
            var _local_4:ILocalization;
            var _local_2:_Str_4953 = (k as _Str_4953);
            if (this._notifications.sessionDataManager.userId == _local_2.userId)
            {
                this._notifications.localization.registerParameter("notifications.text.respect.2", "count", String(_local_2._Str_10295));
                _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.respect.1");
                _local_4 = this._notifications.localization.getLocalizationRaw("notifications.text.respect.2");
                if (_local_3)
                {
                    this._notifications._Str_3069._Str_2822(_local_3.value, NotificationType.RESPECT, null);
                }
                if (_local_4)
                {
                    this._notifications._Str_3069._Str_2822(_local_4.value, NotificationType.RESPECT, null);
                }
            }
        }

        private function _Str_24490(k:_Str_9312):void
        {
            var _local_3:ILocalization;
            var _local_2:_Str_7351 = k.getParser();
            var _local_4:String = NotificationType.ROOMMESSAGESPOSTED;
            this._notifications.localization.registerParameter("notifications.text.room.messages.posted", "room_name", _local_2.roomName);
            this._notifications.localization.registerParameter("notifications.text.room.messages.posted", "messages_count", _local_2._Str_25507.toString());
            _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.room.messages.posted");
            var _local_5:BitmapDataAsset = (this._notifications.assets.getAssetByName("if_icon_temp_png") as BitmapDataAsset);
            var _local_6:BitmapData = (_local_5.content as BitmapData);
            if (_local_3)
            {
                this._notifications._Str_3069._Str_2822(_local_3.value, _local_4, _local_6.clone());
            }
        }

        private function _Str_17153(k:IMessageEvent):void
        {
            var _local_2:RecyclerFinishedMessageParser = (k as _Str_4691).getParser();
            if (((_local_2 == null) || (!(_local_2.recyclerFinishedStatus == _Str_4691._Str_15052))))
            {
                return;
            }
            var _local_3:ILocalization = this._notifications.localization.getLocalizationRaw("notifications.text.recycle.ok");
            if (_local_3)
            {
                this._notifications._Str_3069._Str_2822(_local_3.value, NotificationType.RECYCLEROK, null);
            }
            Logger.log("[HabboNotifications] recycle ok");
        }

        private function _Str_25384(k:IMessageEvent):void
        {
            var _local_2:_Str_7309 = (k as _Str_7309);
            if (_local_2 != null)
            {
                this._notifications.disabled = (!(_local_2.enabled));
            }
        }

        private function _Str_25354(k:IMessageEvent):void
        {
            var _local_3:GenericNotificationItemData;
            var _local_2:_Str_7427 = (k as _Str_9583).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            if (this._Str_16186())
            {
                this._notifications._Str_3069._Str_4262._Str_22425(_local_2.message, _local_2.url);
            }
            if (this._Str_18948())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3._Str_15192 = _local_2.url;
                _local_3._Str_5167 = _local_2.url;
                _local_3.timeStamp = getTimer();
                this._notifications._Str_16215._Str_18026(FeedSettings._Str_9534, _local_3);
            }
        }

        private function _Str_25676(k:IMessageEvent):void
        {
            var _local_3:GenericNotificationItemData;
            var _local_2:_Str_7904 = (k as _Str_8312).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            if (this._Str_16186())
            {
                this._notifications._Str_3069._Str_4262._Str_22997(_local_2.message, _local_2.url);
            }
            if (this._Str_18948())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3._Str_15192 = _local_2.url;
                _local_3._Str_5167 = _local_2.url;
                _local_3.timeStamp = getTimer();
                this._notifications._Str_16215._Str_18026(FeedSettings._Str_9534, _local_3);
            }
        }

        private function _Str_22529(k:IMessageEvent):void
        {
            var _local_2:_Str_8126 = (k as _Str_9354).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            this._notifications._Str_3069._Str_4262._Str_24335(_local_2.message);
        }

        private function _Str_24833(k:IMessageEvent):void
        {
            var _local_2:HotelWillCloseInMinutesMessageParser = (k as HotelWillCloseInMinutesEvent).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            this._notifications._Str_3069._Str_4262._Str_24270(_local_2.minutes);
        }

        private function _parser2(k:IMessageEvent):void
        {
            var _local_2:_Str_7315 = (k as _Str_6521).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            this._notifications._Str_3069._Str_4262._Str_23818(_local_2._Str_23709, _local_2.duration);
        }

        private function _Str_10317(k:IMessageEvent):void
        {
            var _local_2:HotelClosesAndWillOpenAtMessageParser = (k as HotelClosesAndWillOpenAtEvent).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            this._notifications._Str_3069._Str_4262._Str_24493(_local_2.openHour, _local_2.openMinute, _local_2.userThrownOutAtClose);
        }

        private function _Str_23488(k:IMessageEvent):void
        {
            var _local_2:HotelClosedAndOpensMessageParser = (k as HotelClosedAndOpensEvent).getParser();
            if (((_local_2 == null) || (this._notifications._Str_3069._Str_4262 == null)))
            {
                return;
            }
            this._notifications._Str_3069._Str_4262._Str_24317(_local_2.openHour, _local_2.openMinute);
        }

        private function _Str_24460(k:IMessageEvent):void
        {
            HabboWebTools.closeWebPageAndRestoreClient();
        }

        private function _Str_24729(k:_Str_9048):void
        {
            var _local_4:PetFigureData;
            var _local_5:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_7160 = k.getParser();
            this._notifications.localization.registerParameter("notifications.text.petlevel", "pet_name", _local_2.petName);
            this._notifications.localization.registerParameter("notifications.text.petlevel", "level", _local_2.level.toString());
            var _local_3:ILocalization = this._notifications.localization.getLocalizationRaw("notifications.text.petlevel");
            if (_local_3)
            {
                _local_4 = _local_2.figureData;
                _local_5 = this._notifications._Str_21924.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color);
                this._notifications._Str_3069._Str_2822(_local_3.value, NotificationType.PETLEVEL, _local_5);
            }
        }

        private function _Str_25804(k:PetBoughtNotificationEvent):void
        {
            var _local_3:ILocalization;
            var _local_4:_Str_2848;
            var _local_5:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:PetBoughtNotificationMessageParser = k.getParser();
            if (_local_2.gift)
            {
                _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.petbought");
            }
            else
            {
                _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.petreceived");
            }
            if (_local_3)
            {
                _local_4 = _local_2.pet;
                _local_5 = this._notifications._Str_21924.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color);
                this._notifications._Str_3069._Str_2822(_local_3.value, NotificationType.PETLEVEL, _local_5);
            }
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            this._notifications._Str_3069._Str_21530();
        }

        private function _Str_24393(k:IMessageEvent):void
        {
            var _local_2:_Str_6671 = (k as _Str_8665).getParser();
            var _local_3:String = _local_2._Str_3460;
            var _local_4:RegExp = /\\r/g;
            _local_3 = _local_3.replace(_local_4, "\r");
            this._notifications.windowManager.simpleAlert("${notifications.broadcast.title}", "", _local_3, "", "", null, FrankIllustration.NEUTRAL);
        }

        private function _Str_24546(k:_Str_8670):void
        {
            var _local_2:_Str_7117 = k.getParser();
            this._notifications._Str_10093(_local_2.type, _local_2.parameters);
        }

        private function _Str_18116(k:IMessageEvent):void
        {
            var _local_2:PetScratchFailedMessageParser = (k as PetScratchFailedEvent).getParser();
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "required_age", ("" + _local_2.currentAge));
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "avatar_age", ("" + _local_2.requiredAge));
            this._notifications.windowManager.alert("${error.title}", "${room.error.pets.respectfailed}", 0, this._Str_21745);
        }
		
		private function alertMessageHandler(k:IMessageEvent):void
		{
			var packet:SimpleAlertMessage = (k as SimpleAlertMessageParser).getParser();
			var titleMessage:String = "${notifications.broadcast.title}";
			
			if (packet.titleMessage)
			{
				titleMessage = packet.titleMessage;
			}
			this._notifications.windowManager.alert(titleMessage, packet.alertMessage, 0, this._Str_21745);
		}

        public function _Str_21745(k:_Str_2418, _arg_2:WindowEvent):void
        {
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) || (_arg_2.type == WindowEvent.WINDOW_EVENT_CANCEL)))
            {
                k.dispose();
            }
        }

        private function _Str_24449(k:_Str_8414):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:_Str_7739 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            if (_local_2._Str_19193 < 1)
            {
                return;
            }
            this._notifications._Str_3069._Str_25686(_local_2._Str_19193);
        }

        private function _Str_3241(k:UserObjectEvent):void
        {
            var _local_2:_Str_4139 = k.getParser();
            if (_local_2._Str_21338)
            {
                this._notifications._Str_3069._Str_24299(_local_2.id);
            }
        }

        private function _Str_18012(k:_Str_6160):void
        {
            var _local_2:_Str_5768 = k.getParser();
            if (_local_2.status == 1)
            {
                this._notifications._Str_3069._Str_23533();
            }
        }

        private function _Str_25493(k:_Str_9157):void
        {
            if (((!(k)) || (!(this._notifications.localization))))
            {
                return;
            }
            var _local_2:_Str_8077 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            var _local_3:Array = _local_2.products;
            if (((!(_local_3)) || (_local_3.length == 0)))
            {
                return;
            }
            var _local_4:_Str_2853 = (_local_3[0] as _Str_2853);
            if (!_local_4)
            {
                return;
            }
            var _local_5:String = this._notifications.localization.getLocalization("notifications.text.club_gift.received");
            var _local_6:BitmapData = this._notifications._Str_24642._Str_23662(_local_4.productType, _local_4._Str_6164, _local_4.extraParam);
            this._notifications._Str_3069._Str_2822(_local_5, NotificationType.INFO, _local_6);
        }

        private function _Str_17254(k:_Str_4508):void
        {
            var _local_2:String;
            var _local_3:BitmapData;
            if (k.change <= 0)
            {
                return;
            }
            switch (k.type)
            {
                case ActivityPointTypeEnum.LOYALTY:
                    _local_2 = this._notifications.localization.getLocalizationWithParams("notifications.text.loyalty.received", "", "amount", k.change);
                    _local_3 = (this._notifications.assets.getAssetByName("if_icon_diamond_png").content as BitmapData);
                    break;
                default:
                    return;
            }
            this._notifications._Str_3069._Str_2822(_local_2, NotificationType.INFO, _local_3.clone());
        }
    }
}
