package com.sulake.habbo.notifications
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class NotificationPopup 
    {
        private const _Str_24604:int = 20;

        private var _window:IFrameWindow;
        private var _localizationManager:IHabboLocalizationManager;
        private var _Str_3834:Array;

        public function NotificationPopup(k:Array, _arg_2:IAssetLibrary, _arg_3:IHabboWindowManager)
        {
            var _local_8:String;
            var _local_9:IWindowContainer;
            var _local_10:ITextWindow;
            super();
            if (((!(_arg_3)) || (!(_arg_2))))
            {
                return;
            }
            this._Str_3834 = k;
            var _local_4:XmlAsset = (_arg_2.getAssetByName("motd_notification_xml") as XmlAsset);
            if (_local_4 == null)
            {
                return;
            }
            this._window = (_arg_3.buildFromXML((_local_4.content as XML)) as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.procedure = this.eventHandler;
            this._window.center();
            var _local_5:XmlAsset = (_arg_2.getAssetByName("motd_notification_item_xml") as XmlAsset);
            if (_local_5 == null)
            {
                return;
            }
            var _local_6:IWindowContainer = (_arg_3.buildFromXML((_local_5.content as XML)) as IWindowContainer);
            var _local_7:IItemListWindow = (this._window.findChildByName("message_list") as IItemListWindow);
            for each (_local_8 in this._Str_3834)
            {
                _local_9 = (_local_6.clone() as IWindowContainer);
                _local_10 = (_local_9.findChildByName("message_text") as ITextWindow);
                _local_10.text = _local_8;
                _local_9.height = (_local_10.textHeight + this._Str_24604);
                _local_7.addListItem(_local_9);
            }
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._localizationManager = null;
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "close":
                case "header_button_close":
                    this.dispose();
                    return;
            }
        }
    }
}
