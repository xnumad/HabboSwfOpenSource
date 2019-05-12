package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window.IWindowContainer;

    public class StatusPane extends AbstractPane 
    {
        private static const MINIMIZE_TOGGLE:String = "minimize_toggle";
        private static const NOTIFICATION_FEED_BUTTON:String = "notification_feed_button";
        private static const STREAM_FEED_BUTTON:String = "stream_feed_button";

        public function StatusPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer)
        {
            super(k, _arg_2, _arg_3, AbstractPane.PANE_VIEW_LEVEL_BASE);
            window.findChildByName(MINIMIZE_TOGGLE).addEventListener(WindowMouseEvent.CLICK, this._Str_15286);
            window.findChildByName(NOTIFICATION_FEED_BUTTON).addEventListener(WindowMouseEvent.CLICK, this._Str_23102);
            window.findChildByName(STREAM_FEED_BUTTON).addEventListener(WindowMouseEvent.CLICK, this._Str_22735);
        }

        override public function dispose():void
        {
            if (window)
            {
                window.findChildByName(MINIMIZE_TOGGLE).removeEventListener(WindowMouseEvent.CLICK, this._Str_15286);
                window.findChildByName(NOTIFICATION_FEED_BUTTON).removeEventListener(WindowMouseEvent.CLICK, this._Str_15286);
                (window.findChildByName(STREAM_FEED_BUTTON)(WindowMouseEvent.CLICK, this._Str_15286));
            }
        }

        private function _Str_15286(k:WindowMouseEvent):void
        {
            _Str_2439.toggleMinimized();
        }

        private function _Str_23102(k:WindowMouseEvent):void
        {
            _Str_2439.switchToPane(NotificationView.PANE_NOTIFICATIONS);
        }

        private function _Str_22735(k:WindowMouseEvent):void
        {
            _Str_2439.switchToPane(NotificationView.PANE_STREAM);
        }
    }
}
