package com.sulake.habbo.window
{
    import com.sulake.core.window.IWindow;

    public class _Str_7715 
    {
        private var _key:String;
        private var _window:IWindow;
        private var _style:int;

        public function _Str_7715(k:IWindow, _arg_2:String, _arg_3:int)
        {
            this._window = k;
            this._key = _arg_2;
            this._style = _arg_3;
        }

        public function get window():IWindow
        {
            return this._window;
        }

        public function set window(k:IWindow):void
        {
            this._window = k;
        }

        public function get key():String
        {
            return this._key;
        }

        public function set key(k:String):void
        {
            this._key = k;
        }

        public function get style():int
        {
            return this._style;
        }

        public function set style(k:int):void
        {
            this._style = k;
        }
    }
}
