package com.sulake.habbo.notifications.feed
{
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.notifications.feed.view.content.FeedEntity;
    import com.sulake.habbo.notifications.feed.view.pane.AbstractPane;
    import com.sulake.habbo.notifications.FeedVisibilityEnum;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.notifications.feed.view.pane.NotificationsPane;
    import com.sulake.habbo.notifications.feed.view.pane.StreamPane;
    import com.sulake.habbo.notifications.feed.view.pane.InfoPane;
    import com.sulake.habbo.notifications.feed.view.pane.SettingsPane;
    import com.sulake.habbo.notifications.feed.view.pane.StatusPane;
    import com.sulake.habbo.notifications.feed.view.pane.IPane;
    import com.sulake.habbo.notifications.feed.view.content.IFeedEntity;

    public class NotificationView 
    {
        public static const PANE_FEEDS:String = "pane_feeds";
        public static const PANE_NOTIFICATIONS:String = "pane_notifications";
        public static const PANE_STREAM:String = "pane_stream";
        public static const PANE_SETTINGS:String = "pane_settings";
        public static const PANE_INFO:String = "pane_info";
        public static const PANE_STATUS:String = "pane_status";
        private static const SETTINGS_TOGGLE:String = "settings_toggle";
        private static const INFO_TOGGLE:String = "info_toggle";

        private var _stateController:StateController;
        private var _component:HabboNotifications;
        private var _controller:NotificationController;
        private var _window:IWindowContainer;
        private var _views:Map;

        public function NotificationView(k:NotificationController, _arg_2:HabboNotifications)
        {
            this._controller = k;
            this._component = _arg_2;
            this._stateController = new StateController();
            FeedEntity._Str_23222(this.windowManager, this.assets, this.localization, k);
            this.setupUserInterface();
            this.closePaneLevel(AbstractPane.PANE_VIEW_LEVEL_MODAL);
            this.switchToPane(PANE_NOTIFICATIONS);
            this.setVisibilityState(FeedVisibilityEnum.VIEW_STATE_MINIMIZED);
        }

        public function dispose():void
        {
            var k:IDisposable;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._views)
            {
                for each (k in this._views)
                {
                    k.dispose();
                }
                this._views.dispose();
                this._views = null;
            }
            FeedEntity._Str_23840();
            this._controller = null;
            this._stateController = null;
            this._component = null;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._component.windowManager;
        }

        public function get assets():IAssetLibrary
        {
            return this._component.assets;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._component.localization;
        }

        public function get controller():NotificationController
        {
            return this._controller;
        }

        private function setupUserInterface():void
        {
            if (this._window)
            {
                return;
            }
            this._window = (this._component.windowManager.buildFromXML((this._component.assets.getAssetByName("feed_display_xml").content as XML)) as IWindowContainer);
            this._window.height = this._window.desktop.height;
            this._window.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_MOVE);
            this._window.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH);
            this._window.findChildByName(SETTINGS_TOGGLE).addEventListener(WindowMouseEvent.CLICK, this.onSettingsToggle);
            this._window.findChildByName(INFO_TOGGLE).addEventListener(WindowMouseEvent.CLICK, this.onInfoToggle);
            this._views = new Map();
            this._views.add(PANE_NOTIFICATIONS, new NotificationsPane(PANE_NOTIFICATIONS, this, (this._window.findChildByName(PANE_NOTIFICATIONS) as IWindowContainer)));
            this._views.add(PANE_STREAM, new StreamPane(PANE_STREAM, this, (this._window.findChildByName(PANE_STREAM) as IWindowContainer)));
            this._views.add(PANE_INFO, new InfoPane(PANE_INFO, this, (this._window.findChildByName(PANE_INFO) as IWindowContainer)));
            this._views.add(PANE_SETTINGS, new SettingsPane(PANE_SETTINGS, this, (this._window.findChildByName(PANE_SETTINGS) as IWindowContainer)));
            this._views.add(PANE_STATUS, new StatusPane(PANE_STATUS, this, (this._window.findChildByName(PANE_STATUS) as IWindowContainer)));
        }

        public function toggleMinimized():void
        {
            switch (this._stateController.currentState())
            {
                case FeedVisibilityEnum.VIEW_STATE_MAXIMIZED:
                    this.setVisibilityState(FeedVisibilityEnum.VIEW_STATE_MINIMIZED);
                    return;
                case FeedVisibilityEnum.VIEW_STATE_MINIMIZED:
                    this.setVisibilityState(FeedVisibilityEnum.VIEW_STATE_MAXIMIZED);
                    return;
            }
        }

        public function setVisibilityState(k:int):void
        {
            var _local_3:IWindowContainer;
            var _local_2:int = this._stateController.requestState(k);
            switch (_local_2)
            {
                case FeedVisibilityEnum.VIEW_STATE_HIDDEN:
                    this._window.x = this._window.desktop.width;
                    this._window.visible = false;
                    return;
                case FeedVisibilityEnum.VIEW_STATE_MINIMIZED:
                    this._window.visible = true;
                    _local_3 = (this._window.findChildByName("main_view") as IWindowContainer);
                    this._window.x = (this._window.desktop.width - (this._window.width - _local_3.width));
                    return;
                case FeedVisibilityEnum.VIEW_STATE_MAXIMIZED:
                    this._window.visible = true;
                    this._window.x = (this._window.desktop.width - this._window.width);
                    return;
            }
        }

        public function setViewEnabled(k:Boolean):void
        {
            this._stateController.setEnabled(k);
            this.setVisibilityState(this._stateController.currentState());
        }

        public function setGameMode(k:Boolean):void
        {
            this._stateController.setGameMode(k);
            this.setVisibilityState(this._stateController.currentState());
        }

        public function switchToPane(k:String):void
        {
            var _local_2:IPane = this._views.getValue(k);
            if (!_local_2)
            {
                return;
            }
            this.closePaneLevel(_local_2._Str_16687);
            _local_2.isVisible = true;
        }

        public function closePaneLevel(k:int):void
        {
            var _local_2:AbstractPane;
            for each (_local_2 in this._views)
            {
                if (_local_2._Str_16687 == k)
                {
                    _local_2.isVisible = false;
                }
            }
        }

        public function addNotificationFeedItem(k:int, _arg_2:IFeedEntity):void
        {
            (this._views.getValue(PANE_NOTIFICATIONS) as NotificationsPane).addItem(k, _arg_2);
        }

        public function addStreamFeedItem(k:IFeedEntity):void
        {
            (this._views.getValue(PANE_STREAM) as StreamPane).addItem(k);
        }

        public function removeStreamItems():void
        {
        }

        private function onSettingsToggle(k:WindowMouseEvent):void
        {
            var _local_2:IPane = (this._views.getValue(PANE_SETTINGS) as IPane);
            if (_local_2)
            {
                if (_local_2.isVisible)
                {
                    this.closePaneLevel(AbstractPane.PANE_VIEW_LEVEL_MODAL);
                }
                else
                {
                    this.switchToPane(PANE_SETTINGS);
                }
            }
        }

        private function onInfoToggle(k:WindowMouseEvent):void
        {
            var _local_2:IPane = (this._views.getValue(PANE_INFO) as IPane);
            if (_local_2)
            {
                if (_local_2.isVisible)
                {
                    this.closePaneLevel(AbstractPane.PANE_VIEW_LEVEL_MODAL);
                }
                else
                {
                    this.switchToPane(PANE_INFO);
                }
            }
        }
    }
}
