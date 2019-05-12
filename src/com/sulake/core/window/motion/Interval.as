package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;
    import flash.utils.getTimer;

    public class Interval extends Motion 
    {
        private var _startTimeMs:int;
        private var _duration:int;

        public function Interval(k:IWindow, _arg_2:int)
        {
            super(k);
            _complete = false;
            this._duration = _arg_2;
        }

        public function get duration():int
        {
            return this._duration;
        }

        override public function start():void
        {
            super.start();
            _complete = false;
            this._startTimeMs = getTimer();
        }

        override public function tick(k:int):void
        {
			super.tick(k);
            var _local_2:Number = (Number((k - this._startTimeMs)) / Number(this._duration));
            if (_local_2 < 1)
            {
                update(_local_2);
            }
            else
            {
                update(1);
                _complete = true;
            }
        }
    }
}
