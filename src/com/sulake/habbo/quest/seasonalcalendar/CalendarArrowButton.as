package com.sulake.habbo.quest.seasonalcalendar
{
    import flash.geom.Point;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class CalendarArrowButton 
    {
        public static const _Str_14486:int = 0;
        public static const _Str_13915:int = 1;
        public static const _Str_7947:int = 0;
        public static const _Str_4158:int = 1;
        public static const _Str_11423:int = 2;
        private static const _Str_13665:Point = new Point(1, 1);

        private var _window:IBitmapWrapperWindow;
        private var _callback:Function;
        private var _state:int = 0;
        private var _pressed:Boolean = false;
        private var _initialLocation:Point;
        private var _bitmapInactive:BitmapData;
        private var _bitmapActive:BitmapData;
        private var _bitmapHilite:BitmapData;

        public function CalendarArrowButton(k:IAssetLibrary, _arg_2:IBitmapWrapperWindow, _arg_3:int, _arg_4:Function)
        {
            this._window = _arg_2;
            this._window.procedure = this.procedure;
            this._callback = _arg_4;
            switch (_arg_3)
            {
                case _Str_14486:
                    this._bitmapActive = BitmapData(k.getAssetByName("arrow_back_active").content).clone();
                    this._bitmapInactive = BitmapData(k.getAssetByName("arrow_back_inactive").content).clone();
                    this._bitmapHilite = BitmapData(k.getAssetByName("arrow_back_hilite").content).clone();
                    break;
                case _Str_13915:
                    this._bitmapActive = BitmapData(k.getAssetByName("arrow_next_active").content).clone();
                    this._bitmapInactive = BitmapData(k.getAssetByName("arrow_next_inactive").content).clone();
                    this._bitmapHilite = BitmapData(k.getAssetByName("arrow_next_hilite").content).clone();
                    break;
            }
            this._initialLocation = new Point(this._window.x, this._window.y);
            this.updateWindow();
        }

        public function dispose():void
        {
            this._bitmapActive = null;
            this._bitmapHilite = null;
            this._bitmapInactive = null;
            this._window.procedure = null;
            this._window = null;
            this._callback = null;
        }

        public function activate():void
        {
            if (((!(this._state == _Str_4158)) && (!(this._state == _Str_11423))))
            {
                this._state = _Str_4158;
            }
            this.updateWindow();
        }

        public function deactivate():void
        {
            this._state = _Str_7947;
            this.updateWindow();
        }

        public function _Str_21953():Boolean
        {
            return this._state == _Str_7947;
        }

        private function updateWindow():void
        {
            switch (this._state)
            {
                case _Str_7947:
                    this._window.bitmap = this._bitmapInactive;
                    break;
                case _Str_11423:
                    this._window.bitmap = this._bitmapHilite;
                    break;
                case _Str_4158:
                    this._window.bitmap = this._bitmapActive;
                    break;
            }
            if (this._pressed)
            {
                this._window.x = (this._initialLocation.x + _Str_13665.x);
                this._window.y = (this._initialLocation.y + _Str_13665.y);
            }
            else
            {
                this._window.position = this._initialLocation;
            }
        }

        private function procedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((k as WindowMouseEvent) != null)
            {
                switch (k.type)
                {
                    case WindowMouseEvent.OVER:
                        if (this._state != _Str_7947)
                        {
                            this._state = _Str_11423;
                        }
                        break;
                    case WindowMouseEvent.OUT:
                        if (this._state != _Str_7947)
                        {
                            this._state = _Str_4158;
                        }
                        break;
                    case WindowMouseEvent.DOWN:
                        this._pressed = true;
                        break;
                    case WindowMouseEvent.UP:
                    case WindowMouseEvent.UP_OUTSIDE:
                        this._pressed = false;
                        break;
                }
                this.updateWindow();
                this._callback(k, _arg_2);
            }
        }
    }
}

