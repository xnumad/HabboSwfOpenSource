package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView;
    import com.sulake.habbo.toolbar.memenu.chatsettings.MeMenuChatSettingsView;
    import com.sulake.core.assets.XmlAsset;
    import flash.external.ExternalInterface;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class MeMenuSettingsMenuView 
    {
        private var _widget:MeMenuNewController;
        private var _window:IWindowContainer;
        private var _toolbarView:ToolbarView;
        private var _meMenuSoundSettings:MeMenuSoundSettingsView;
        private var _memenuChatSettings:MeMenuChatSettingsView;


        public function init(k:MeMenuNewController, _arg_2:ToolbarView):void
        {
            this._toolbarView = _arg_2;
            this._widget = k;
            this.createWindow();
        }

        public function dispose():void
        {
            if (this._meMenuSoundSettings != null)
            {
                this._meMenuSoundSettings.dispose();
                this._meMenuSoundSettings = null;
            }
            if (this._memenuChatSettings != null)
            {
                this._memenuChatSettings.dispose();
                this._memenuChatSettings = null;
            }
            this._widget = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        private function createWindow():void
        {
            var k:XmlAsset = (this._widget.toolbar.assets.getAssetByName("me_menu_settings_menu_xml") as XmlAsset);
            if (k)
            {
                this._window = (this._widget.toolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            }
            if (this._window == null)
            {
                throw (new Error("Failed to construct settings window from XML!"));
            }
            this._window.procedure = this.eventHandler;
            this._window.x = (this._toolbarView.window.width + 10);
            this._window.y = (this._toolbarView.window.bottom - this._window.height);
            if (((!(ExternalInterface.available)) || (!(this._widget.toolbar.getProperty("has.identity") == "1"))))
            {
                this._window.findChildByName("character_settings").disable();
            }
            else
            {
                this._window.findChildByName("identity_text").visible = false;
            }
            this._window.findChildByName("chat_settings").visible = true;
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "character_settings":
                    HabboWebTools.openAvatars();
                    return;
                case "sound_settings":
                    this._meMenuSoundSettings = new MeMenuSoundSettingsView();
                    this._meMenuSoundSettings.init(this, this._toolbarView);
                    this._window.visible = false;
                    return;
                case "chat_settings":
                    this._memenuChatSettings = new MeMenuChatSettingsView();
                    this._memenuChatSettings.init(this, this._toolbarView);
                    return;
                case "back":
                    this._widget.window.visible = true;
                    this.dispose();
                    return;
            }
        }

        public function _Str_6111(k:String, _arg_2:int):void
        {
        }

        public function get widget():MeMenuNewController
        {
            return this._widget;
        }
    }
}

