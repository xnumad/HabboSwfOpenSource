package com.sulake.core.window.motion
{
    public class EaseOut extends EaseRate 
    {
        public function EaseOut(k:Interval, _arg_2:Number)
        {
            super(k, _arg_2);
        }

        public override function update(k:Number):void
        {
            _interval.update(Math.pow(k, (1 / _Str_21638)));
        }
    }
}
