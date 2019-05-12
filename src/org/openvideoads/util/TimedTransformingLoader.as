package org.openvideoads.util
{
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.ErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import flash.events.TimerEvent;
    import org.openvideoads.events._Str_5692;

    public class TimedTransformingLoader extends TransformingLoader 
    {
        protected var _Str_13620:int = -1;
        protected var _Str_2850:Timer = null;

        public function TimedTransformingLoader(k:Number=-1)
        {
            this._Str_13620 = k;
            addEventListener(Event.COMPLETE, this._Str_15779);
            addEventListener(ErrorEvent.ERROR, this._Str_15779);
            addEventListener(SecurityErrorEvent.SECURITY_ERROR, this._Str_15779);
            addEventListener(IOErrorEvent.IO_ERROR, this._Str_15779);
        }

        override public function load(k:URLRequest):void
        {
            if (this._Str_13620 > 0)
            {
                this._Str_8612();
            }
            super.load(k);
        }

        protected function _Str_15779(k:Event):void
        {
            if (this._Str_2850 != null)
            {
                this._Str_4743();
            }
        }

        protected function _Str_8612():void
        {
            if (this._Str_2850 != null)
            {
                this._Str_4743();
            }
            if (this._Str_13620 > 0)
            {
                this._Str_2850 = new Timer(this._Str_13620, 1);
                this._Str_2850.addEventListener(TimerEvent.TIMER, this._Str_17789);
                this._Str_2850.start();
            }
        }

        protected function _Str_4743():void
        {
            if (this._Str_2850 != null)
            {
                this._Str_2850.stop();
                this._Str_2850 = null;
            }
        }

        protected function _Str_17789(k:TimerEvent):void
        {
            this.close();
            this._Str_4743();
            dispatchEvent(new _Str_5692(_Str_5692._Str_5406));
        }
    }
}
