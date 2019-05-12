package com.sulake.habbo.ui.widget.furniture.placeholder
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class PlaceholderView 
    {
        private var _assetLibrary:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _window:IWindowContainer;

        public function PlaceholderView(k:IAssetLibrary, _arg_2:IHabboWindowManager)
        {
            this._assetLibrary = k;
            this._windowManager = _arg_2;
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function _Str_19572():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._Str_15155();
            }
            else
            {
                this._Str_3360();
            }
        }

        public function _Str_3360():void
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            if (this._window == null)
            {
                return;
            }
            this._window.visible = true;
            this._window.x = 200;
        }

        private function createWindow():void
        {
            var k:XmlAsset = (this._assetLibrary.getAssetByName("placeholder") as XmlAsset);
            if (((k == null) || (k.content == null)))
            {
                return;
            }
            this._window = (this._windowManager.createWindow("habbohelp_window", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.NULL, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(-300, 300, 10, 10), null) as IWindowContainer);
            this._window.buildFromXML((k.content as XML));
            this._window.tags.push("habbo_help_window");
            this._window.background = true;
            this._window.color = 33554431;
            var _local_2:IWindow = this._window.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.procedure = this._Str_3046;
            }
        }

        public function _Str_15155():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_15155();
        }
    }
}
