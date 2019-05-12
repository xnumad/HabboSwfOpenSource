package org.openvideoads.vast.events
{
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.config.groupings.AdSlotRegionConfig;
    import flash.events.MouseEvent;
    import org.openvideoads.vast.model.NonLinearVideoAd;
    import flash.events.Event;

    public class _Str_2833 extends _Str_4535 
    {
        public static const _Str_3831:String = "display-overlay";
        public static const _Str_2703:String = "hide-overlay";
        public static const _Str_19712:String = "display-non-overlay";
        public static const _Str_21603:String = "hide-non-overlay";
        public static const _Str_16841:String = "overlay-clicked";
        public static const _Str_18947:String = "overlay-close-clicked";
        public static const FLASH:String = "flash";
        public static const _Str_15057:String = "html5";

        protected var _Str_3267:AdSlot = null;
        protected var _Str_2442:AdSlotRegionConfig = null;
        protected var _Str_6489:MouseEvent = null;

        public function _Str_2833(k:String, _arg_2:NonLinearVideoAd, _arg_3:AdSlot, _arg_4:AdSlotRegionConfig=null, _arg_5:MouseEvent=null, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(k, _arg_2, _arg_6, _arg_7);
            this._Str_3267 = _arg_3;
            this._Str_2442 = _arg_4;
            this._Str_6489 = _arg_5;
        }

        public function get adSlot():AdSlot
        {
            return this._Str_3267;
        }

        public function get region():AdSlotRegionConfig
        {
            return this._Str_2442;
        }

        public function set _Str_13787(k:MouseEvent):void
        {
            this._Str_6489 = k;
        }

        public function get _Str_13787():MouseEvent
        {
            return this._Str_6489;
        }

        public function get displayMode():String
        {
            if (this._Str_2442 != null)
            {
                return this._Str_2442.displayMode;
            }
            return _Str_2833.FLASH;
        }

        override public function clone():Event
        {
            return new _Str_2833(type, nonLinearVideoAd, this._Str_3267, this._Str_2442, this._Str_6489, bubbles, cancelable);
        }

        override public function toString():String
        {
            if (nonLinearVideoAd != null)
            {
                return (((((((((((("resourceType: " + nonLinearVideoAd.resourceType) + ", ") + "creativeType: ") + nonLinearVideoAd.creativeType) + ", ") + "displayMode; ") + this.displayMode) + ", ") + "width: ") + nonLinearVideoAd.width) + ", ") + "height: ") + nonLinearVideoAd.height;
            }
            return "no ad";
        }
    }
}
