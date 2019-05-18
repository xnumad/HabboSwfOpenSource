package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.toolbar.extensions._Str_402._Str_8732;
    import com.sulake.habbo.toolbar.extensions._Str_402._Str_8732;
    import com.sulake.habbo.toolbar.extensions._Str_402._Str_6491;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class SettingsExtension implements IDisposable 
    {
        private static const _Str_2942:int = 3;
        private static const _Str_5133:int = 7;

        private var _toolbar:HabboToolbar;
        private var _window:IWindowContainer;
        private var _buttons:Vector.<IWindow>;
        private var _disposed:Boolean = false;

        public function SettingsExtension(k:HabboToolbar)
        {
            this._buttons = new Vector.<IWindow>();
            super();
            this._toolbar = k;
            this._window = (this._toolbar.windowManager.buildFromXML((k.assets.getAssetByName("settings_xml").content as XML)) as IWindowContainer);
            this._window.procedure = this._Str_2533;
            this._Str_16134("avatar_settings", this._toolbar.localization.getLocalization("widget.memenu.settings.character", "avatar settings"));
            this._Str_16134("sound", this._toolbar.localization.getLocalization("widget.memenu.settings.audio", "sound settings"));
            this._Str_16134("chat", this._toolbar.localization.getLocalization("widget.memenu.settings.other", "other settings"));
            k.extensionView.attachExtension(ToolbarDisplayExtensionIds.SETTINGS, this._window, ExtensionFixedSlotsEnum._Str_17467);
            this._window.visible = false;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._toolbar = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_16134(k:String, _arg_2:String):void
        {
            var _local_3:IWindowContainer = (this._toolbar.windowManager.buildFromXML((this._toolbar.assets.getAssetByName("setting_category_xml").content as XML)) as IWindowContainer);
            this._window.addChild(_local_3);
            _local_3.findChildByName("button_label").caption = _arg_2;
            if (this._buttons.length > 0)
            {
                _local_3.y = (this._buttons[(this._buttons.length - 1)].bottom + _Str_2942);
            }
            else
            {
                _local_3.y = _Str_5133;
            }
            _local_3.x = _Str_5133;
            _local_3.name = k;
            _local_3.procedure = this._Str_2533;
            this._buttons.push(_local_3);
            this._window.height = (this._buttons[(this._buttons.length - 1)].bottom + _Str_5133);
        }

        private function _Str_24026():void
        {
            var k:_Str_6491 = new _Str_6491(this._toolbar);
            var _local_2:IWindowContainer = this._toolbar.windowManager.getDesktop(1);
            _local_2.addChild(k.window);
            k.window.x = ((_local_2.width - k.window.width) - 200);
        }

        private function _Str_24638():void
        {
            var k:_Str_8732 = new _Str_8732(this._toolbar);
            var _local_2:IWindowContainer = this._toolbar.windowManager.getDesktop(1);
            _local_2.addChild(k.window);
            k.window.x = ((_local_2.width - k.window.width) - 200);
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "avatar_settings":
                    HabboWebTools.openAvatars();
                    this._toolbar._Str_14261();
                    return;
                case "sound":
                    this._Str_24026();
                    this._toolbar._Str_14261();
                    return;
                case "chat":
                    this._Str_24638();
                    this._toolbar._Str_14261();
                    return;
            }
        }
    }
}
