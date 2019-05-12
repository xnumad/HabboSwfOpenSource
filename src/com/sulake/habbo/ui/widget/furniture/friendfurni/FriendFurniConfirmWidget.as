package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.ui.handler.FriendFurniConfirmWidgetHandler;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class FriendFurniConfirmWidget extends ConversionTrackingWidget 
    {
        private var _stuffId:int = -1;
        private var _window:IFrameWindow;
        private var _otherLockedContainerHeight:int = -1;

        public function FriendFurniConfirmWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_14761.widget = this;
        }

        override public function dispose():void
        {
            this._stuffId = -1;
            this._Str_2669();
            super.dispose();
        }

        override public function get mainWindow():IWindow
        {
            return this._window;
        }

        public function open(k:int, _arg_2:Boolean):void
        {
            if ((((this._window) && (this._window.visible)) && (!(this._stuffId == -1))))
            {
                this._Str_14761._Str_17138(this._stuffId, false);
                this._Str_2669();
            }
            this._stuffId = k;
            this.createWindow();
            if (!_arg_2)
            {
                this._window.findChildByName("other_locked_container").height = 0;
            }
            else
            {
                this._window.findChildByName("other_locked_container").height = this._otherLockedContainerHeight;
                this._window.findChildByName("message").visible = false;
            }
            this.mainWindow.visible = true;
        }

        public function close(k:int):void
        {
            if (k == this._stuffId)
            {
                this._Str_2669();
            }
        }

        public function _Str_25728(k:int):void
        {
            if (((!(this._window == null)) && (k == this._stuffId)))
            {
                IStaticBitmapWrapperWindow(this._window.findChildByName("lock")).assetUri = "${image.library.url}furniextras/locked_image.png";
                this._window.findChildByName("message").visible = true;
            }
        }

        private function createWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(windowManager.buildFromXML(XML(assets.getAssetByName("lock_confirm_xml").content)));
            this._window.procedure = this._Str_2533;
            this._otherLockedContainerHeight = this._window.findChildByName("other_locked_container").height;
            this._window.center();
        }

        private function _Str_2669():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function get _Str_14761():FriendFurniConfirmWidgetHandler
        {
            return FriendFurniConfirmWidgetHandler(_Str_2470);
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "cancel_button":
                        this._Str_14761._Str_17138(this._stuffId, false);
                        this._Str_2669();
                        return;
                    case "confirm_button":
                        this._Str_14761._Str_17138(this._stuffId, true);
                        this._Str_2669();
                        return;
                }
            }
        }
    }
}
