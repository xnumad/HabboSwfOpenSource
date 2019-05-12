package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.window.IWindowContainer;

    public class InfoPane extends AbstractPane 
    {
        public function InfoPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer)
        {
            super(k, _arg_2, _arg_3, AbstractPane.PANE_VIEW_LEVEL_MODAL);
            (window.findChildByName("info_ok") as IContainerButtonWindow).addEventListener(WindowMouseEvent.CLICK, this._Str_19389);
        }

        override public function dispose():void
        {
            var k:IContainerButtonWindow;
            super.dispose();
            if (window)
            {
                k = (window.findChildByName("info_ok") as IContainerButtonWindow);
                if (k)
                {
                    k.removeEventListener(WindowMouseEvent.CLICK, this._Str_19389);
                    k = null;
                }
            }
        }

        private function _Str_19389(k:WindowMouseEvent):void
        {
            _Str_2439.closePaneLevel(AbstractPane.PANE_VIEW_LEVEL_MODAL);
        }
    }
}
