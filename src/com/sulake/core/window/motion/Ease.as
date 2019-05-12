package com.sulake.core.window.motion
{
    public class Ease extends Interval 
    {
        protected var _interval:Interval;

        public function Ease(k:Interval)
        {
            super(k.target, k.duration);
            this._interval = k;
        }

        public override function start():void
        {
            super.start();
            this._interval.start();
        }

        public override function update(k:Number):void
        {
            super.update(k);
            this._interval.update(k);
        }

        public override function stop():void
        {
            super.stop();
            this._interval.stop();
        }
    }
}
