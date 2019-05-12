package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.model.LinearVideoAd;

    public class _Str_4041 extends Event 
    {
        public static const _Str_6644:String = "linear-ad-started";
        public static const COMPLETE:String = "linear-ad-complete";
        public static const _Str_4456:String = "linear-ad-skipped";
        public static const _Str_16178:String = "linear-ad-click-through";

        protected var _Str_3267:AdSlot = null;

        public function _Str_4041(k:String, _arg_2:AdSlot, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._Str_3267 = _arg_2;
        }

        public function set adSlot(k:AdSlot):void
        {
            this._Str_3267 = k;
        }

        public function get ad():LinearVideoAd
        {
            return this.linearVideoAd;
        }

        public function get linearVideoAd():LinearVideoAd
        {
            if (this._Str_3267 != null)
            {
                return this._Str_3267.videoAd.linearVideoAd;
            }
            return null;
        }
    }
}
