package com.sulake.core.window.services
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.events.WindowEvent;
    import flash.events.TimerEvent;

    public class GestureAgentService implements IGestureAgentService, IDisposable 
    {
        private var _disposed:Boolean = false;
        protected var _Str_5527:Boolean;
        protected var window:IWindow;
        protected var _timer:Timer;
        protected var _Str_829:uint = 0;
        protected var _callback:Function;
        protected var _Str_5257:int;
        protected var _Str_4979:int;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this.end(this.window);
            this._disposed = true;
        }

        public function begin(k:IWindow, _arg_2:Function, _arg_3:uint, _arg_4:int, _arg_5:int):IWindow
        {
            this._Str_829 = _arg_3;
            var _local_6:IWindow = this.window;
            if (this.window != null)
            {
                this.end(this.window);
            }
            if (((k) && (!(k.disposed))))
            {
                this.window = k;
                this.window.addEventListener(WindowEvent.WINDOW_EVENT_DESTROYED, this._Str_10813);
                this._callback = _arg_2;
                this._Str_5527 = true;
                this._Str_5257 = _arg_4;
                this._Str_4979 = _arg_5;
                this._timer = new Timer(40, 0);
                this._timer.addEventListener(TimerEvent.TIMER, this.operate);
                this._timer.start();
            }
            return _local_6;
        }

        protected function operate(k:TimerEvent):void
        {
            this._Str_5257 = (this._Str_5257 * 0.75);
            this._Str_4979 = (this._Str_4979 * 0.75);
            if (((Math.abs(this._Str_5257) <= 1) && (Math.abs(this._Str_4979) <= 1)))
            {
                this.end(this.window);
            }
            else
            {
                if (this._callback != null)
                {
                    this._callback(this._Str_5257, this._Str_4979);
                }
            }
        }

        public function end(k:IWindow):IWindow
        {
            var _local_2:IWindow = this.window;
            if (this._timer)
            {
                this._timer.stop();
                this._timer.removeEventListener(TimerEvent.TIMER, this.operate);
                this._timer = null;
            }
            if (this._Str_5527)
            {
                if (this.window == k)
                {
                    if (!this.window.disposed)
                    {
                        this.window.removeEventListener(WindowEvent.WINDOW_EVENT_DESTROYED, this._Str_10813);
                    }
                    this.window = null;
                    this._Str_5527 = false;
                }
            }
            return _local_2;
        }

        private function _Str_10813(k:WindowEvent):void
        {
            this.end(this.window);
        }
    }
}
