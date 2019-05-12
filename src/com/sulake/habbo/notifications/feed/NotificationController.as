package com.sulake.habbo.notifications.feed
{
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.habbo.notifications.feed.view.content.EntityFactory;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.notifications.feed.view.content.IFeedEntity;
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import com.sulake.habbo.utils.HabboWebTools;

    public class NotificationController 
    {
        private var _component:HabboNotifications;
        private var _baseView:NotificationView;
        private var _settings:FeedSettings;
        private var _entityFactory:EntityFactory;

        public function NotificationController(k:HabboNotifications)
        {
            this._component = k;
            this._settings = new FeedSettings(this);
            this._baseView = new NotificationView(this, k);
            this._entityFactory = new EntityFactory();
            this._component.roomSessionManager.events.addEventListener(RoomSessionEvent.CREATED, this.onRoomSessionEventHandler);
            this._component.roomSessionManager.events.addEventListener(RoomSessionEvent.STARTED, this.onRoomSessionEventHandler);
            this._component.roomSessionManager.events.addEventListener(RoomSessionEvent.ENDED, this.onRoomSessionEventHandler);
        }

        public function dispose():void
        {
            if (this._baseView)
            {
                this._baseView.dispose();
                this._baseView = null;
            }
            this._component.roomSessionManager.events.removeEventListener(RoomSessionEvent.CREATED, this.onRoomSessionEventHandler);
            this._component.roomSessionManager.events.removeEventListener(RoomSessionEvent.STARTED, this.onRoomSessionEventHandler);
            this._component.roomSessionManager.events.removeEventListener(RoomSessionEvent.ENDED, this.onRoomSessionEventHandler);
            this._component = null;
            if (this._settings)
            {
                this._settings.dispose();
                this._settings = null;
            }
            if (this._entityFactory)
            {
                this._entityFactory.dispose();
                this._entityFactory = null;
            }
        }

        private function onRoomSessionEventHandler(k:RoomSessionEvent):void
        {
            switch (k.type)
            {
                case RoomSessionEvent.CREATED:
                case RoomSessionEvent.STARTED:
                case RoomSessionEvent.ENDED:
                    if (this._baseView)
                    {
                        this._baseView._Str_17368(k.session.isGameSession);
                    }
                    return;
            }
        }

        public function _Str_23337(k:Boolean):void
        {
            if (this._baseView)
            {
                this._baseView._Str_22882(k);
            }
        }

        public function getSettings():FeedSettings
        {
            return this._settings;
        }

        public function _Str_23011():void
        {
        }

        public function _Str_18026(k:int, _arg_2:GenericNotificationItemData):void
        {
            var _local_3:IFeedEntity = this._entityFactory._Str_23084(_arg_2);
            this._baseView._Str_23809(k, _local_3);
        }

        public function _Str_25651(k:String):void
        {
            if (k.indexOf("http") == 0)
            {
                HabboWebTools.openWebPage(k);
            }
        }
    }
}
