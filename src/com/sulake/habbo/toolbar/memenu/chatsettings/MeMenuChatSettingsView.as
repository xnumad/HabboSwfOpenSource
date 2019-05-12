package com.sulake.habbo.toolbar.memenu.chatsettings
{
    import com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MeMenuChatSettingsView 
    {
        private var _widget:MeMenuSettingsMenuView;
        private var _window:IWindowContainer;
        private var _toolbarView:ToolbarView;


        public function init(k:MeMenuSettingsMenuView, _arg_2:ToolbarView):void
        {
            this._widget = k;
            this._toolbarView = _arg_2;
            this.createWindow();
        }

        public function dispose():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:ICheckBoxWindow = (this._window.findChildByName("prefer_old_chat_checkbox") as ICheckBoxWindow);
            this._widget.window.visible = true;
            this._widget.widget.toolbar.freeFlowChat.isDisabledInPreferences = ((!(k == null)) && (k._Str_2365));
            this._window.dispose();
            this._window = null;
            this._widget = null;
        }

        private function createWindow():void
        {
            var k:XmlAsset = (this._widget.widget.toolbar.assets.getAssetByName("me_menu_chat_settings_xml") as XmlAsset);
            this._window = (this._widget.widget.toolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            this._window.x = (this._toolbarView.window.width + 10);
            this._window.y = (this._toolbarView.window.bottom - this._window.height);
            this._widget.window.visible = false;
            var _local_2:int;
            var _local_3:IWindow;
            while (_local_2 < this._window.numChildren)
            {
                _local_3 = this._window.getChildAt(_local_2);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_2++;
            }
            ICheckBoxWindow(this._window.findChildByName("prefer_old_chat_checkbox"))._Str_2365 = this._widget.widget.toolbar.freeFlowChat.isDisabledInPreferences;
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "back_btn":
                    this.dispose();
                    return;
                case "prefer_old_chat_checkbox":
                    this._widget.widget.toolbar.freeFlowChat.isDisabledInPreferences = ICheckBoxWindow(this._window.findChildByName("prefer_old_chat_checkbox"))._Str_2365;
                    if (!this._widget.widget.toolbar.freeFlowChat.isDisabledInPreferences)
                    {
                        if (this._widget.widget.toolbar._Str_12052._Str_10612 != null)
                        {
                            this._widget.widget.toolbar._Str_12052._Str_10612.setDisplayObject(this._widget.widget.toolbar.freeFlowChat.displayObject);
                        }
                    }
                    else
                    {
                        this._widget.widget.toolbar.freeFlowChat.clear();
                    }
                    return;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }
    }
}
