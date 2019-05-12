package com.sulake.habbo.campaign.calendar
{
    import com.sulake.core.window.IWindow;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class CalendarItemWiggle 
    {
        private static const _Str_16741:int = 80;
        private static const _Str_14575:int = 10;
        private static const _Str_18522:int = 40;
        private static const _Str_9823:int = 7;

        private var _window:IWindow;
        private var _timer:Timer;
        private var _direction:int;
        private var _counter:int;
        private var _initialY:int;

        public function CalendarItemWiggle(k:IWindow)
        {
            if (!k)
            {
                return;
            }
            this._window = k;
            this._initialY = k.y;
            k.y = (k.y - _Str_14575);
            this._direction = 1;
            this._timer = new Timer(_Str_16741);
            this._timer.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
            this._timer.start();
        }

        private function onTimerEvent(k:TimerEvent):void
        {
            if (!this._window)
            {
                this.dispose();
            }
            var _local_2:Number = (_Str_14575 * ((_Str_9823 - this._counter) / _Str_9823));
            var _local_3:Number = (Math.abs((this._window.y - this._initialY)) / _local_2);
            var _local_4:Number = (Math.max(2, (Math.sin(_local_3) * _Str_18522)) * this._direction);
            this._window.y = (this._window.y + _local_4);
            if (this._direction > 0)
            {
                if (this._window.y > this._initialY)
                {
                    this._direction = (this._direction * -1);
                    this._window.y = this._initialY;
                    this._counter++;
                }
            }
            else
            {
                if (this._window.y <= (this._initialY - _local_2))
                {
                    this._direction = (this._direction * -1);
                    this._window.y = (this._initialY - _local_2);
                    this._counter++;
                }
            }
            if (this._counter >= _Str_9823)
            {
                this.dispose();
            }
        }

        private function dispose():void
        {
            this._window.y = this._initialY;
            this._window = null;
            this._timer.reset();
            this._timer = null;
        }
    }
}
