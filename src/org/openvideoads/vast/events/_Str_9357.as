package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.schedule.ads.AdSlot;

    public class _Str_9357 extends Event 
    {
        public static const _Str_7412:String = "schedule-non-linear";

        protected var _Str_3267:AdSlot = null;

        public function _Str_9357(k:String, _arg_2:AdSlot, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._Str_3267 = _arg_2;
        }

        public function set adSlot(k:AdSlot):void
        {
            this._Str_3267 = k;
        }

        public function get adSlot():AdSlot
        {
            return this._Str_3267;
        }
    }
}
