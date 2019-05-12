package com.sulake.habbo.ui.widget.furniture.video
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.vimeo.api.VimeoPlayer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.FurnitureVimeoDisplayWidgetHandler;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class VimeoDisplayWidget extends ConversionTrackingWidget 
    {
        private static const _Str_16140:String = "9a106b76302cbce891b714afdc6a0c93";

        private var _player:VimeoPlayer;
        private var _window:IWindowContainer;
        private var _roomObject:IRoomObject;

        public function VimeoDisplayWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_2844.widget = this;
        }

        private function get _Str_2844():FurnitureVimeoDisplayWidgetHandler
        {
            return _Str_2470 as FurnitureVimeoDisplayWidgetHandler;
        }

        override public function get mainWindow():IWindow
        {
            return this._window;
        }

        public function show(k:IRoomObject, _arg_2:Boolean, _arg_3:int):void
        {
            this._roomObject = k;
            this.createWindow(_arg_2, _arg_3);
            this._window.visible = true;
        }

        private function createWindow(k:Boolean, _arg_2:int):void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = (windowManager.buildFromXML(XML(assets.getAssetByName("vimeo_viewer_xml").content)) as IWindowContainer);
            this._window.findChildByName("video_id_editor").visible = k;
            this._window.findChildByName("video_wrapper").visible = (_arg_2 > 0);
            this._window.procedure = this._Str_2533;
            this._window.center();
            var _local_3:IDisplayObjectWrapper = IDisplayObjectWrapper(this._window.findChildByName("video_wrapper"));
            this._player = new VimeoPlayer(_Str_16140, _arg_2, _local_3.width, _local_3.height);
            _local_3.setDisplayObject(this._player);
            this._player.addEventListener(MouseEvent.MOUSE_UP, this._Str_11921);
            this._player.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_11921);
        }

        private function _Str_11921(k:MouseEvent):void
        {
            if (this._window != null)
            {
                DisplayObject(k.target).stage.dispatchEvent(k);
            }
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            this.hide(this._roomObject);
                            break;
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_RESIZE:
                    switch (_arg_2.name)
                    {
                        case "video_wrapper":
                            if (this._player != null)
                            {
                                this._player.setSize(_arg_2.width, _arg_2.height);
                            }
                            break;
                    }
                    return;
                case WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN:
                    if (WindowKeyboardEvent(k).charCode == 13)
                    {
                        _local_3 = int(this._window.findChildByName("video_id").caption);
                        this._Str_2844._Str_18970(this._roomObject, _local_3);
                        this._window.findChildByName("video_wrapper").visible = (_local_3 > 0);
                        this._player.loadVideo(_local_3);
                    }
                    return;
            }
        }

        public function hide(k:IRoomObject):void
        {
            if (this._roomObject != k)
            {
                return;
            }
            if (this._player != null)
            {
                this._player.destroy();
                this._player = null;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._roomObject = null;
        }
    }
}
