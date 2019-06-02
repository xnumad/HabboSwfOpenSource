package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.notifications.feed.view.content.IFeedEntity;
    import com.sulake.habbo.notifications.feed.FeedSettings;

    public class NotificationsPane extends AbstractPane 
    {
        private static const LIST:String = "list";
        private static const LIST_URGENT:String = "list_urgent";
        private static const LIST_ACTIONS:String = "list_actions";
        private static const LIST_PERSISTENT:String = "list_persistent";
        private static const LIST_NOTIFICATIONS:String = "list_notifications";

        private var _list:IItemListWindow;

        public function NotificationsPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer)
        {
            super(k, _arg_2, _arg_3, AbstractPane.PANE_VIEW_LEVEL_FEED);
            this._Str_22512();
        }

        override public function dispose():void
        {
            this._list = null;
            super.dispose();
        }

        private function _Str_22512():void
        {
            this._list = (window.findChildByName(LIST) as IItemListWindow);
        }

        public function _Str_2822(k:int, _arg_2:IFeedEntity):void
        {
            var _local_3:IItemListWindow = this._Str_23056(k);
            _local_3.addListItemAt(_arg_2.window, 0);
        }

        private function _Str_23056(k:int):IItemListWindow
        {
            var _local_2:String;
            switch (k)
            {
                case FeedSettings._Str_17770:
                    _local_2 = LIST_URGENT;
                    break;
                case FeedSettings._Str_16008:
                    _local_2 = LIST_ACTIONS;
                    break;
                case FeedSettings._Str_16132:
                    _local_2 = LIST_PERSISTENT;
                    break;
                case FeedSettings._Str_9534:
                    _local_2 = LIST_NOTIFICATIONS;
                    break;
            }
            return this._list.getListItemByName(_local_2) as IItemListWindow;
        }
    }
}
