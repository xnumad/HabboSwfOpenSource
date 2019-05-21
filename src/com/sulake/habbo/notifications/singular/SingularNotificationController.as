package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.core.utils.Map;
	import com.sulake.habbo.notifications.singular.HabboNotificationItemStyle;
	import com.sulake.habbo.notifications.singular.HabboNotificationItem;
	import com.sulake.habbo.notifications.singular.HabboAlertDialogManager;
	import com.sulake.habbo.notifications.singular.SafetyLockedNotification;
	import com.sulake.habbo.notifications.singular.ClubGiftNotification;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.XMLVariableParser;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.notifications.NotificationType;
    import com.sulake.room.utils.RoomEnterEffect;

    public class SingularNotificationController implements IUpdateReceiver 
    {
        private static const _Str_19032:int = 5000;

        private var _notifications:HabboNotifications;
        private var _notificationQueue:Array;
        private var _styleConfiguration:Map;
        private var _notificationViewManager:HabboNotificationViewManager;
        private var _alertDialogManager:HabboAlertDialogManager;
        private var _moderationDisclaimerShown:Boolean;
        private var _clubGiftNotification:ClubGiftNotification;
        private var _safetyLockedNotification:SafetyLockedNotification;
        private var _achievementNotifications:Dictionary;
        private var _moderationDelayTimer:Timer;
        private var _isDisposed:Boolean;

        public function SingularNotificationController(k:HabboNotifications)
        {
            var _local_5:int;
            var _local_6:Map;
            var _local_7:BitmapDataAsset;
            var _local_8:BitmapData;
            super();
            this._notifications = k;
            this._notificationQueue = new Array();
            this._styleConfiguration = new Map();
            this._achievementNotifications = new Dictionary();
            this._alertDialogManager = new HabboAlertDialogManager(this._notifications.windowManager, this._notifications.localization, this._notifications._Str_2602);
            var _local_2:IAsset = this._notifications.assetLibrary.getAssetByName("habbo_notifications_config_xml");
            var _local_3:XmlAsset = XmlAsset(_local_2);
            if (_local_3 != null)
            {
                XMLVariableParser.parseVariableList(XML(_local_3.content).children(), this._styleConfiguration);
            }
            var _local_4:Map = this._styleConfiguration["styles"];
            if (_local_4 != null)
            {
                _local_5 = 0;
                while (_local_5 < _local_4.length)
                {
                    _local_6 = _local_4.getWithIndex(_local_5);
                    if (_local_6["icon"] != null)
                    {
                        _local_7 = (this._notifications.assetLibrary.getAssetByName(_local_6["icon"]) as BitmapDataAsset);
                        _local_8 = (_local_7.content as BitmapData);
                        _local_6["icon"] = _local_8;
                    }
                    _local_5++;
                }
            }
            this._notificationViewManager = new HabboNotificationViewManager(this._notifications, this._notifications.assetLibrary, this._notifications.windowManager, this._notifications._Str_9496, this._styleConfiguration["styles"], this._styleConfiguration["view"]);
            this._notifications.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this._Str_23023);
            this._notifications.registerUpdateReceiver(this, 2);
        }

        public function get _Str_4262():HabboAlertDialogManager
        {
            return this._alertDialogManager;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            if (this._moderationDelayTimer)
            {
                this._moderationDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_18481);
                this._moderationDelayTimer = null;
            }
            if (this._notificationViewManager != null)
            {
                this._notificationViewManager.dispose();
                this._notificationViewManager = null;
            }
            if (this._alertDialogManager != null)
            {
                this._alertDialogManager.dispose();
                this._alertDialogManager = null;
            }
            if (this._clubGiftNotification != null)
            {
                this._clubGiftNotification.dispose();
                this._clubGiftNotification = null;
            }
            if (this._safetyLockedNotification != null)
            {
                this._safetyLockedNotification.dispose();
                this._safetyLockedNotification = null;
            }
            if (this._notifications != null)
            {
                this._notifications.removeUpdateReceiver(this);
                this._notifications = null;
            }
            this._isDisposed = true;
        }

        public function update(k:uint):void
        {
            var _local_2:HabboNotificationItem;
            if (((this._notificationViewManager._Str_19647()) && (this._notificationQueue.length > 0)))
            {
                _local_2 = this._Str_25643();
                if (!this._notificationViewManager._Str_16969(_local_2))
                {
                    _local_2.dispose();
                }
            }
        }

        public function _Str_2822(k:String, _arg_2:String, _arg_3:BitmapData, _arg_4:String=null, _arg_5:String=null, _arg_6:String=null):int
        {
            if (this._notifications.disabled)
            {
                return 0;
            }
            var _local_7:Map = this._styleConfiguration["styles"];
            if (_local_7 == null)
            {
                return 0;
            }
            var _local_8:Map = _local_7[_arg_2];
            if (_local_8 == null)
            {
                return 0;
            }
            var _local_9:HabboNotificationItemStyle = new HabboNotificationItemStyle(_local_8, _arg_3, _arg_4, true, _arg_5);
            if (_arg_6)
            {
                _local_9.internalLink = _arg_6;
            }
            var _local_10:HabboNotificationItem = new HabboNotificationItem(k, _local_9, this);
            this._notificationQueue.push(_local_10);
            return this._notificationQueue.length;
        }

        private function _Str_25643():HabboNotificationItem
        {
            var k:Array = this._notificationQueue.splice(0, 1);
            return k[0] as HabboNotificationItem;
        }

        public function _Str_15846(k:String, _arg_2:String):void
        {
            this._notifications.localization.registerParameter("soundmachine.notification.playing", "songname", k);
            this._notifications.localization.registerParameter("soundmachine.notification.playing", "songauthor", _arg_2);
            var _local_3:ILocalization = this._notifications.localization.getLocalizationRaw("soundmachine.notification.playing");
            if (_local_3)
            {
                this._Str_2822(_local_3.value, NotificationType.SOUNDMACHINE, null);
            }
        }

        public function _Str_22352(k:String):void
        {
            this._notifications.createLinkEvent(k);
        }

        private function _Str_18481(k:TimerEvent):void
        {
            this._moderationDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_18481);
            this._moderationDelayTimer = null;
            this._Str_21530();
        }

        public function _Str_21530():void
        {
            var k:String;
            if (RoomEnterEffect.isRunning())
            {
                if (this._moderationDelayTimer == null)
                {
                    this._moderationDelayTimer = new Timer((RoomEnterEffect.totalRunningTime + _Str_19032), 1);
                    this._moderationDelayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_18481);
                    this._moderationDelayTimer.start();
                }
            }
            else
            {
                if (!this._moderationDisclaimerShown)
                {
                    k = this._notifications.localization.getLocalization("mod.chatdisclaimer", "NA");
                    this._Str_2822(k, NotificationType.INFO, null);
                    this._moderationDisclaimerShown = true;
                    Logger.log(("DISPLAYED MOD INFO: " + k));
                }
            }
        }

        public function _Str_25686(k:int):void
        {
            if (((this._clubGiftNotification) && (this._clubGiftNotification.visible)))
            {
                return;
            }
            this._clubGiftNotification = new ClubGiftNotification(k, this._notifications.assets, this._notifications.windowManager, this._notifications.catalog, this._notifications._Str_9496);
        }

        public function _Str_24299(k:int):void
        {
            if (((this._safetyLockedNotification) && (this._safetyLockedNotification.visible)))
            {
                return;
            }
            this._safetyLockedNotification = new SafetyLockedNotification(k, this._notifications.assets, this._notifications.windowManager, this._notifications.catalog, this._notifications._Str_9496);
        }

        public function _Str_23533():void
        {
            if (!this._safetyLockedNotification)
            {
                return;
            }
            this._safetyLockedNotification.dispose();
        }

        private function _Str_23023(k:BadgeImageReadyEvent):void
        {
            if (((!(k == null)) && (!(this._notificationViewManager == null))))
            {
                this._notificationViewManager._Str_18673(k);
            }
        }
    }
}
