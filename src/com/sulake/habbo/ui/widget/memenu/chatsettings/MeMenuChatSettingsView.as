package com.sulake.habbo.ui.widget.memenu.chatsettings
{
    import com.sulake.habbo.ui.widget.memenu.IMeMenuView;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStoreSettingsMessage;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MeMenuChatSettingsView implements IMeMenuView 
    {
        private var _widget:MeMenuWidget;
        private var _window:IWindowContainer;


        public function init(k:MeMenuWidget, _arg_2:String):void
        {
            this._widget = k;
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            var k:RoomWidgetStoreSettingsMessage = new RoomWidgetStoreSettingsMessage(RoomWidgetStoreSettingsMessage.RWSSM_STORE_CHAT);
            var _local_2:ICheckBoxWindow = (this._window.findChildByName("prefer_old_chat_checkbox") as ICheckBoxWindow);
            k._Str_12967 = ((!(_local_2 == null)) && (_local_2._Str_2365));
            this._widget.messageListener.processWidgetMessage(k);
            this._window.dispose();
            this._window = null;
            this._widget = null;
        }

        private function createWindow(k:String):void
        {
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("memenu_chat_settings") as XmlAsset);
            if (_local_2)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            }
            if (this._window == null)
            {
                throw (new Error("Failed to construct sound settings window from XML!"));
            }
            this._window.name = k;
            var _local_3:int;
            var _local_4:IWindow;
            while (_local_3 < this._window.numChildren)
            {
                _local_4 = this._window.getChildAt(_local_3);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_3++;
            }
            ICheckBoxWindow(this._window.findChildByName("prefer_old_chat_checkbox"))._Str_2365 = this._widget.handler.container.freeFlowChat.isDisabledInPreferences;
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "back_btn":
                    this._widget._Str_4568(MeMenuWidget.ME_MENU_SETTINGS_VIEW);
                    return;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_6111(k:String, _arg_2:int):void
        {
        }
    }
}
