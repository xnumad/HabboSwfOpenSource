package com.sulake.core.window.motion
{
    import flash.utils.getTimer;

    public class Wait extends Motion 
    {
        private var _startTimeMs:int;
        private var _waitTimeMs:int;

        public function Wait(k:int)
        {
            super(null);
            this._waitTimeMs = k;
        }

        override public function get running():Boolean
        {
            return _running;
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
            _complete = ((k - this._startTimeMs) >= this._waitTimeMs);
            if (_complete)
            {
                stop();
            }
        }
    }
}
