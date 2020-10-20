package com.sulake.habbo.notifications
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
	import com.sulake.habbo.communication.messages.incoming.notifications.SimpleAlertMessageParser;
	import com.sulake.habbo.communication.messages.incoming.notifications.SimpleAlertMessageEvent;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.RoomUserRespect;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboBroadcastMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.ClubGiftNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.UserBannedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelClosesAndWillOpenAtEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetReceivedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.OpenConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.MOTDNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.PetLevelNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RoomMessageNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.RestoreClientMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.AccountSafetyLockStatusChangeMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.InfoFeedEnableMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftSelectedEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.MaintenanceStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorCautionEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.NotificationDialogMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelWillCloseInMinutesEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetScratchFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelClosedAndOpensEvent;
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import com.sulake.habbo.communication.messages.parser.notifications.MOTDNotificationParser;
    import com.sulake.habbo.notifications.NotificationPopup;
    import flash.utils.getTimer;
    import com.sulake.habbo.notifications.feed.FeedSettings;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;
    import flash.display.BitmapData;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomMessageNotificationMessageParser;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModerationCautionParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.UserBannedMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability.HotelWillCloseInMinutesMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability.MaintenanceStatusMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosesAndWillOpenAtMessageParser;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosedAndOpensMessageParser;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.habbo.communication.messages.parser.notifications.PetLevelNotificationParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.Pet;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetReceivedMessageParser;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboBroadcastMessageParser;
    import com.sulake.habbo.window.enum.FrankIllustration;
    import com.sulake.habbo.communication.messages.parser.notifications.NotificationDialogMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetScratchFailedMessageParser;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.communication.messages.parser.notifications.ClubGiftNotificationParser;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.communication.messages.parser.users.AccountSafetyLockStatusChangeMessageParser;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftSelectedParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
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
            this.addMessageEvent(new RoomUserRespect(this.onRespectNotification));
            this.addMessageEvent(new HabboBroadcastMessageEvent(this.onBroadcastMessageEvent));
            this.addMessageEvent(new HabboAchievementNotificationMessageEvent(this.onLevelUp));
            this.addMessageEvent(new ClubGiftNotificationEvent(this.onClubGiftNotification));
            this.addMessageEvent(new ModeratorMessageEvent(this.onModMessageEvent));
            this.addMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onActivityPointNotification));
            this.addMessageEvent(new UserBannedMessageEvent(this.onUserBannedMessageEvent));
            this.addMessageEvent(new HotelClosesAndWillOpenAtEvent(this.onHotelClosed));
            this.addMessageEvent(new PetReceivedMessageEvent(this.onPetReceived));
            this.addMessageEvent(new OpenConnectionMessageEvent(this.onRoomEnter));
            this.addMessageEvent(new MOTDNotificationEvent(this.onMOTD));
            this.addMessageEvent(new RecyclerFinishedEvent(this.onRecyclerFinished));
            this.addMessageEvent(new PetLevelNotificationEvent(this.onPetLevelNotification));
            this.addMessageEvent(new RoomMessageNotificationMessageEvent(this.onRoomMessagesNotification));
            this.addMessageEvent(new RestoreClientMessageEvent(this.onRestoreClientMessageEvent));
            this.addMessageEvent(new AccountSafetyLockStatusChangeMessageEvent(this.onAccountSafetyLockStatusChanged));
            this.addMessageEvent(new InfoFeedEnableMessageEvent(this.onInfoFeedEnable));
            this.addMessageEvent(new UserObjectEvent(this.onUserObject));
            this.addMessageEvent(new ClubGiftSelectedEvent(this.onClubGiftSelected));
            this.addMessageEvent(new MaintenanceStatusMessageEvent(this.onHotelMaintenance));
            this.addMessageEvent(new ModeratorCautionEvent(this.onModCautionEvent));
            this.addMessageEvent(new NotificationDialogMessageEvent(this.onNotificationDialogMessageEvent));
            this.addMessageEvent(new HotelWillCloseInMinutesEvent(this.onHotelClosing));
            this.addMessageEvent(new PetScratchFailedEvent(this.onPetRespectFailed));
            this.addMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            this.addMessageEvent(new HotelClosedAndOpensEvent(this.onLoginFailedHotelClosed));
			this.addMessageEvent(new SimpleAlertMessageEvent(this.alertMessageHandler));
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

        private function useNotificationFeed():Boolean
        {
            return this._notifications.getBoolean("notification.feed.enabled");
        }

        private function useNotifications():Boolean
        {
            return this._notifications.getBoolean("notification.items.enabled");
        }

        internal function onMOTD(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_5:GenericNotificationItemData;
            var _local_2:MOTDNotificationEvent = (k as MOTDNotificationEvent);
            var _local_3:MOTDNotificationParser = (_local_2.getParser() as MOTDNotificationParser);
            if (((_local_3.messages) && (_local_3.messages.length > 0)))
            {
                if (this.useNotifications())
                {
                    new NotificationPopup(_local_3.messages, this._notifications.assetLibrary, this._notifications.windowManager);
                }
                if (this.useNotificationFeed())
                {
                    for each (_local_4 in _local_3.messages)
                    {
                        _local_5 = new GenericNotificationItemData();
                        _local_5.title = _local_4;
                        _local_5.timeStamp = getTimer();
                        this._notifications.feedController.addFeedItem(FeedSettings.FEED_SECTION_NOTIFICATIONS, _local_5);
                    }
                }
            }
        }

        private function onLevelUp(k:IMessageEvent):void
        {
            var _local_2:HabboAchievementNotificationMessageEvent = (k as HabboAchievementNotificationMessageEvent);
            var _local_3:HabboAchievementNotificationMessageParser = _local_2.getParser();
            var _local_4:String = this._notifications.localization.getLocalization("achievements.levelup.desc", "");
            var _local_5:String = this._notifications.localization.getBadgeName(_local_3.data.badgeCode);
            var _local_6:BitmapData = this._notifications.sessionDataManager.requestBadgeImage(_local_3.data.badgeCode);
            this._notifications.singularController.addItem(((_local_4 + " ") + _local_5), NotificationType.ACHIEVEMENT, _local_6, null, _local_3.data.badgeCode, ("questengine/achievements/" + _local_3.data.category));
        }

        internal function onRespectNotification(k:IMessageEvent):void
        {
            var _local_3:ILocalization;
            var _local_4:ILocalization;
            var _local_2:RoomUserRespect = (k as RoomUserRespect);
            if (this._notifications.sessionDataManager.userId == _local_2.userId)
            {
                this._notifications.localization.registerParameter("notifications.text.respect.2", "count", String(_local_2.respectTotal));
                _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.respect.1");
                _local_4 = this._notifications.localization.getLocalizationRaw("notifications.text.respect.2");
                if (_local_3)
                {
                    this._notifications.singularController.addItem(_local_3.value, NotificationType.RESPECT, null);
                }
                if (_local_4)
                {
                    this._notifications.singularController.addItem(_local_4.value, NotificationType.RESPECT, null);
                }
            }
        }

        private function onRoomMessagesNotification(k:RoomMessageNotificationMessageEvent):void
        {
            var _local_3:ILocalization;
            var _local_2:RoomMessageNotificationMessageParser = k.getParser();
            var _local_4:String = NotificationType.ROOMMESSAGESPOSTED;
            this._notifications.localization.registerParameter("notifications.text.room.messages.posted", "room_name", _local_2.roomName);
            this._notifications.localization.registerParameter("notifications.text.room.messages.posted", "messages_count", _local_2._Str_25507.toString());
            _local_3 = this._notifications.localization.getLocalizationRaw("notifications.text.room.messages.posted");
            var _local_5:BitmapDataAsset = (this._notifications.assets.getAssetByName("if_icon_temp_png") as BitmapDataAsset);
            var _local_6:BitmapData = (_local_5.content as BitmapData);
            if (_local_3)
            {
                this._notifications.singularController.addItem(_local_3.value, _local_4, _local_6.clone());
            }
        }

        private function onRecyclerFinished(k:IMessageEvent):void
        {
            var _local_2:RecyclerFinishedMessageParser = (k as RecyclerFinishedEvent).getParser();
            if (((_local_2 == null) || (!(_local_2.recyclerFinishedStatus == RecyclerFinishedEvent._Str_15052))))
            {
                return;
            }
            var _local_3:ILocalization = this._notifications.localization.getLocalizationRaw("notifications.text.recycle.ok");
            if (_local_3)
            {
                this._notifications.singularController.addItem(_local_3.value, NotificationType.RECYCLEROK, null);
            }
            Logger.log("[HabboNotifications] recycle ok");
        }

        private function onInfoFeedEnable(k:IMessageEvent):void
        {
            var _local_2:InfoFeedEnableMessageEvent = (k as InfoFeedEnableMessageEvent);
            if (_local_2 != null)
            {
                this._notifications.disabled = (!(_local_2.enabled));
            }
        }

        private function onModCautionEvent(k:IMessageEvent):void
        {
            var _local_3:GenericNotificationItemData;
            var _local_2:ModerationCautionParser = (k as ModeratorCautionEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            if (this.useNotifications())
            {
                this._notifications.singularController.alertDialogManager.handleModeratorCaution(_local_2.message, _local_2.url);
            }
            if (this.useNotificationFeed())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3._Str_15192 = _local_2.url;
                _local_3.buttonCaption = _local_2.url;
                _local_3.timeStamp = getTimer();
                this._notifications.feedController.addFeedItem(FeedSettings.FEED_SECTION_NOTIFICATIONS, _local_3);
            }
        }

        private function onModMessageEvent(k:IMessageEvent):void
        {
            var _local_3:GenericNotificationItemData;
            var _local_2:ModeratorMessageParser = (k as ModeratorMessageEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            if (this.useNotifications())
            {
                this._notifications.singularController.alertDialogManager.handleModeratorMessage(_local_2.message, _local_2.url);
            }
            if (this.useNotificationFeed())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3._Str_15192 = _local_2.url;
                _local_3.buttonCaption = _local_2.url;
                _local_3.timeStamp = getTimer();
                this._notifications.feedController.addFeedItem(FeedSettings.FEED_SECTION_NOTIFICATIONS, _local_3);
            }
        }

        private function onUserBannedMessageEvent(k:IMessageEvent):void
        {
            var _local_2:UserBannedMessageParser = (k as UserBannedMessageEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            this._notifications.singularController.alertDialogManager.handleUserBannedMessage(_local_2.message);
        }

        private function onHotelClosing(k:IMessageEvent):void
        {
            var _local_2:HotelWillCloseInMinutesMessageParser = (k as HotelWillCloseInMinutesEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            this._notifications.singularController.alertDialogManager.handleHotelClosingMessage(_local_2.minutes);
        }

        private function onHotelMaintenance(k:IMessageEvent):void
        {
            var _local_2:MaintenanceStatusMessageParser = (k as MaintenanceStatusMessageEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            this._notifications.singularController.alertDialogManager.handleHotelMaintenanceMessage(_local_2.minutesUntilMaintenance, _local_2.duration);
        }

        private function onHotelClosed(k:IMessageEvent):void
        {
            var _local_2:HotelClosesAndWillOpenAtMessageParser = (k as HotelClosesAndWillOpenAtEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            this._notifications.singularController.alertDialogManager.handleHotelClosedMessage(_local_2.openHour, _local_2.openMinute, _local_2.userThrownOutAtClose);
        }

        private function onLoginFailedHotelClosed(k:IMessageEvent):void
        {
            var _local_2:HotelClosedAndOpensMessageParser = (k as HotelClosedAndOpensEvent).getParser();
            if (((_local_2 == null) || (this._notifications.singularController.alertDialogManager == null)))
            {
                return;
            }
            this._notifications.singularController.alertDialogManager.handleLoginFailedHotelClosedMessage(_local_2.openHour, _local_2.openMinute);
        }

        private function onRestoreClientMessageEvent(k:IMessageEvent):void
        {
            HabboWebTools.closeWebPageAndRestoreClient();
        }

        private function onPetLevelNotification(k:PetLevelNotificationEvent):void
        {
            var _local_4:PetFigureData;
            var _local_5:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:PetLevelNotificationParser = k.getParser();
            this._notifications.localization.registerParameter("notifications.text.petlevel", "pet_name", _local_2.petName);
            this._notifications.localization.registerParameter("notifications.text.petlevel", "level", _local_2.level.toString());
            var _local_3:ILocalization = this._notifications.localization.getLocalizationRaw("notifications.text.petlevel");
            if (_local_3)
            {
                _local_4 = _local_2.figureData;
                _local_5 = this._notifications.petImageUtility.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color);
                this._notifications.singularController.addItem(_local_3.value, NotificationType.PETLEVEL, _local_5);
            }
        }

        private function onPetReceived(k:PetReceivedMessageEvent):void
        {
            var _local_3:ILocalization;
            var _local_4:Pet;
            var _local_5:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:PetReceivedMessageParser = k.getParser();
            if (_local_2.boughtAsGift)
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
                _local_5 = this._notifications.petImageUtility.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color);
                this._notifications.singularController.addItem(_local_3.value, NotificationType.PETLEVEL, _local_5);
            }
        }

        private function onRoomEnter(k:IMessageEvent):void
        {
            this._notifications.singularController.showModerationDisclaimer();
        }

        private function onBroadcastMessageEvent(k:IMessageEvent):void
        {
            var _local_2:HabboBroadcastMessageParser = (k as HabboBroadcastMessageEvent).getParser();
            var _local_3:String = _local_2._Str_3460;
            var _local_4:RegExp = /\\r/g;
            _local_3 = _local_3.replace(_local_4, "\r");
            this._notifications.windowManager.simpleAlert("${notifications.broadcast.title}", "", _local_3, "", "", null, FrankIllustration.NEUTRAL);
        }

        private function onNotificationDialogMessageEvent(k:NotificationDialogMessageEvent):void
        {
            var _local_2:NotificationDialogMessageParser = k.getParser();
            this._notifications.showNotification(_local_2.type, _local_2.parameters);
        }

        private function onPetRespectFailed(k:IMessageEvent):void
        {
            var _local_2:PetScratchFailedMessageParser = (k as PetScratchFailedEvent).getParser();
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "required_age", ("" + _local_2.currentAge));
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "avatar_age", ("" + _local_2.requiredAge));
            this._notifications.windowManager.alert("${error.title}", "${room.error.pets.respectfailed}", 0, this.onAlert);
        }
		
		private function alertMessageHandler(k:IMessageEvent):void
		{
			var packet:SimpleAlertMessageParser = (k as SimpleAlertMessageEvent).getParser();
			var titleMessage:String = "${notifications.broadcast.title}";
			
			if (packet.titleMessage)
			{
				titleMessage = packet.titleMessage;
			}
			this._notifications.windowManager.alert(titleMessage, packet.alertMessage, 0, this.onAlert);
		}

        public function onAlert(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) || (_arg_2.type == WindowEvent.WINDOW_EVENT_CANCEL)))
            {
                k.dispose();
            }
        }

        private function onClubGiftNotification(k:ClubGiftNotificationEvent):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:ClubGiftNotificationParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            if (_local_2.numGifts < 1)
            {
                return;
            }
            this._notifications.singularController.showClubGiftNotification(_local_2.numGifts);
        }

        private function onUserObject(k:UserObjectEvent):void
        {
            var _local_2:UserObjectMessageParser = k.getParser();
            if (_local_2.accountSafetyLocked)
            {
                this._notifications.singularController.showSafetyLockedNotification(_local_2.id);
            }
        }

        private function onAccountSafetyLockStatusChanged(k:AccountSafetyLockStatusChangeMessageEvent):void
        {
            var _local_2:AccountSafetyLockStatusChangeMessageParser = k.getParser();
            if (_local_2.status == 1)
            {
                this._notifications.singularController.hideSafetyLockedNotification();
            }
        }

        private function onClubGiftSelected(k:ClubGiftSelectedEvent):void
        {
            if (((!(k)) || (!(this._notifications.localization))))
            {
                return;
            }
            var _local_2:ClubGiftSelectedParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            var _local_3:Array = _local_2.products;
            if (((!(_local_3)) || (_local_3.length == 0)))
            {
                return;
            }
            var _local_4:CatalogPageMessageProductData = (_local_3[0] as CatalogPageMessageProductData);
            if (!_local_4)
            {
                return;
            }
            var _local_5:String = this._notifications.localization.getLocalization("notifications.text.club_gift.received");
            var _local_6:BitmapData = this._notifications.productImageUtility._Str_23662(_local_4.productType, _local_4.furniClassId, _local_4.extraParam);
            this._notifications.singularController.addItem(_local_5, NotificationType.INFO, _local_6);
        }

        private function onActivityPointNotification(k:HabboActivityPointNotificationMessageEvent):void
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
            this._notifications.singularController.addItem(_local_2, NotificationType.INFO, _local_3.clone());
        }
    }
}
