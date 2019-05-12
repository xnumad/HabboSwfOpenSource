package com.sulake.core.window.services
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.DisplayObject;
    import com.sulake.core.window.WindowController;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.sulake.core.window.events.WindowEvent;

    public class WindowMouseOperator implements IDisposable 
    {
        protected var _Str_2302:DisplayObject;
        protected var window:WindowController;
        protected var _Str_5527:Boolean;
        protected var _Str_588:Point;
        protected var _Str_3282:Point;
        protected var _Str_3368:Point;
        protected var _Str_829:uint;
        private var _disposed:Boolean = false;

        public function WindowMouseOperator(k:DisplayObject)
        {
            this._Str_2302 = k;
            this._Str_3368 = new Point();
            this._Str_3282 = new Point();
            this._Str_588 = new Point();
            this._Str_5527 = false;
            this._Str_829 = 0;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this.end(this.window);
            this._Str_588 = null;
            this._Str_3282 = null;
            this._Str_3368 = null;
            this._Str_2302 = null;
            this._disposed = true;
        }

        public function begin(k:IWindow, _arg_2:uint=0):IWindow
        {
            this._Str_829 = _arg_2;
            var _local_3:IWindow = this.window;
            if (this.window != null)
            {
                this.end(this.window);
            }
            if (((k) && (!(k.disposed))))
            {
                this._Str_2302.addEventListener(MouseEvent.MOUSE_DOWN, this.handler, false);
                this._Str_2302.addEventListener(MouseEvent.MOUSE_UP, this.handler, false);
                this._Str_2302.addEventListener(Event.ENTER_FRAME, this.handler);
                this._Str_3282.x = this._Str_2302.mouseX;
                this._Str_3282.y = this._Str_2302.mouseY;
                this.window = WindowController(k);
                this.getMousePositionRelativeTo(k, this._Str_3282, this._Str_588);
                this.window.addEventListener(WindowEvent.WINDOW_EVENT_DESTROYED, this.clientWindowDestroyed);
                this._Str_5527 = true;
            }
            return _local_3;
        }

        public function end(k:IWindow):IWindow
        {
            var _local_2:IWindow = this.window;
            if (this._Str_5527)
            {
                if (this.window == k)
                {
                    this._Str_2302.removeEventListener(MouseEvent.MOUSE_DOWN, this.handler, false);
                    this._Str_2302.removeEventListener(MouseEvent.MOUSE_UP, this.handler, false);
                    this._Str_2302.removeEventListener(Event.ENTER_FRAME, this.handler);
                    if (!this.window.disposed)
                    {
                        this.window.removeEventListener(WindowEvent.WINDOW_EVENT_DESTROYED, this.clientWindowDestroyed);
                    }
                    this.window = null;
                    this._Str_5527 = false;
                }
            }
            return _local_2;
        }

        protected function handler(k:Event):void
        {
            var _local_2:MouseEvent;
            if (this._Str_5527)
            {
                if (k.type == Event.ENTER_FRAME)
                {
                    if (this.window.disposed)
                    {
                        this.end(this.window);
                    }
                    else
                    {
                        if (((!(this._Str_3282.x == this._Str_2302.mouseX)) || (!(this._Str_3282.y == this._Str_2302.mouseY))))
                        {
                            this.operate(this._Str_2302.mouseX, this._Str_2302.mouseY);
                            this._Str_3282.x = this._Str_2302.mouseX;
                            this._Str_3282.y = this._Str_2302.mouseY;
                        }
                    }
                    return;
                }
                _local_2 = (k as MouseEvent);
                if (_local_2 != null)
                {
                    switch (_local_2.type)
                    {
                        case MouseEvent.MOUSE_UP:
                            this.end(this.window);
                            return;
                    }
                }
            }
        }

        public function operate(k:int, _arg_2:int):void
        {
            this._Str_3282.x = k;
            this._Str_3282.y = _arg_2;
            this.getMousePositionRelativeTo(this.window, this._Str_3282, this._Str_3368);
            this.window.offset((this._Str_3368.x - this._Str_588.x), (this._Str_3368.y - this._Str_588.y));
        }

        private function clientWindowDestroyed(k:WindowEvent):void
        {
            this.end(this.window);
        }

        protected function getMousePositionRelativeTo(k:IWindow, _arg_2:Point, _arg_3:Point):void
        {
            k.getGlobalPosition(_arg_3);
            _arg_3.x = (_arg_2.x - _arg_3.x);
            _arg_3.y = (_arg_2.y - _arg_3.y);
        }
    }
}
