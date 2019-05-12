package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.notifications.feed.FeedSettings;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class SettingsPane extends AbstractPane 
    {
        public function SettingsPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer)
        {
            super(k, _arg_2, _arg_3, AbstractPane.PANE_VIEW_LEVEL_MODAL);
            this._Str_21774();
            window.procedure = this._Str_25027;
        }

        override public function dispose():void
        {
            super.dispose();
        }

        private function _Str_21774():void
        {
            var k:FeedSettings = _Str_2439.controller.getSettings();
            k._Str_22647();
        }

        public function _Str_25027(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:FeedSettings;
            var _local_4:int;
            var _local_5:String;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = _Str_2439.controller.getSettings();
                for each (_local_5 in _arg_2.tags)
                {
                    switch (_local_5)
                    {
                        case "ME":
                            _local_4 = FeedSettings._Str_15660;
                            break;
                        case "HOTEL":
                            _local_4 = FeedSettings._Str_14828;
                            break;
                        case "FRIENDS":
                            _local_4 = FeedSettings._Str_14283;
                            break;
                    }
                    _local_3._Str_24684(_local_4);
                }
                this._Str_21774();
            }
        }
    }
}
