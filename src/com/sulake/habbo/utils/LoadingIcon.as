package com.sulake.habbo.utils
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IIconWindow;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class LoadingIcon implements IDisposable 
    {
        private static const _Str_11404:Array = [23, 24, 25, 26];

        private var _timer:Timer;
        private var _icon:IIconWindow;
        private var _frameIndex:int;

        public function LoadingIcon()
        {
            this._timer = new Timer(160);
            super();
            this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
        }

        public function dispose():void
        {
            if (this._timer)
            {
                this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
                this._timer.stop();
                this._timer = null;
            }
            this._icon = null;
        }

        public function get disposed():Boolean
        {
            return this._timer == null;
        }

        public function _Str_15221(k:IIconWindow, _arg_2:Boolean):void
        {
            this._icon = k;
            this._icon.visible = _arg_2;
            if (_arg_2)
            {
                this._icon.style = _Str_11404[this._frameIndex];
                this._timer.start();
            }
            else
            {
                this._timer.stop();
            }
        }

        private function onTimer(k:Event):void
        {
            if (this._icon == null)
            {
                return;
            }
            this._frameIndex++;
            if (this._frameIndex >= _Str_11404.length)
            {
                this._frameIndex = 0;
            }
            this._icon.style = _Str_11404[this._frameIndex];
        }
    }
}
