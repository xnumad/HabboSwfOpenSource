package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.notifications.feed.view.content.IFeedEntity;

    public class StreamPane extends AbstractPane 
    {
        private var _list:IItemListWindow;

        public function StreamPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer)
        {
            super(k, _arg_2, _arg_3, AbstractPane.PANE_VIEW_LEVEL_FEED);
            this._list = (window.findChildByName("list") as IItemListWindow);
        }

        override public function dispose():void
        {
            this._list = null;
            super.dispose();
        }

        public function _Str_2822(k:IFeedEntity):void
        {
            this._list.addListItem(k.window);
        }
    }
}
