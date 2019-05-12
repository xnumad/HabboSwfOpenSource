package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;

    public class BottomBackgroundBorder implements IDisposable 
    {
        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;

        public function BottomBackgroundBorder(k:HabboToolbar)
        {
            this._window = (k.windowManager.buildFromXML((k.assets.getAssetByName("bottom_background_border_xml").content as XML)) as IWindowContainer);
            this._window.procedure = this._Str_3061;
            this._Str_3714();
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_PARENT_RESIZED)
            {
                this._Str_3714();
            }
        }

        private function _Str_3714():void
        {
            this._window.position = new Point(-10, (this._window.desktop.height - (this._window.height - 3)));
            this._window.width = (this._window.desktop.width + 20);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
