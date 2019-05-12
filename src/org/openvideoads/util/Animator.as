package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class Animator extends Debuggable 
    {
        protected var _Str_2529:Sprite = null;
        protected var _Str_2364:Timer = null;
        protected var _Str_20047:Number = 0;


        public function stop():void
        {
            if (this._Str_2364 != null)
            {
                this._Str_2364.stop();
                this._Str_2364 = null;
            }
        }

        public function fade(target:Sprite, properties:Object):void
        {
            if (target != null)
            {
                if (properties != null)
                {
                    if (this._Str_2364 != null)
                    {
                        this._Str_2364.stop();
                    }
                    this._Str_2529 = target;
                    this._Str_20047 = ((properties.alpha - target.alpha) / properties.times);
                    this._Str_2364 = new Timer(properties.rate, properties.times);
                    this._Str_2364.addEventListener(TimerEvent.TIMER, function onTimer (k:TimerEvent):void
                    {
                        _Str_2529.alpha = (_Str_2529.alpha + _Str_20047);
                    });
                    this._Str_2364.addEventListener(TimerEvent.TIMER_COMPLETE, function onTimerComplete (k:TimerEvent):void
                    {
                        _Str_2529.alpha = properties.alpha;
                        if (properties.onComplete != undefined)
                        {
                            properties.onComplete();
                        }
                    });
                    this._Str_2364.start();
                }
            }
        }
    }
}
