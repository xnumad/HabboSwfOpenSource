package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.schedule.ads.AdSlot;

    public class _Str_2333 extends Event 
    {
        public static const _Str_18913:String = "ova-vpaid-linear-loading";
        public static const _Str_16423:String = "nl-loading";
        public static const _Str_16473:String = "ova-vpaid-linear-loaded";
        public static const _Str_13330:String = "ova-vpaid-nl-loaded";
        public static const _Str_16657:String = "ova-vpaid-linear-impression";
        public static const _Str_15304:String = "ova-vpaid-nl-impression";
        public static const _Str_17321:String = "ova-vpaid-linear-start";
        public static const _Str_17593:String = "ova-vpaid-linear-complete";
        public static const _Str_18409:String = "ova-vpaid-linear-error";
        public static const _Str_19033:String = "ova-vpaid-linear-linear-change";
        public static const _Str_18146:String = "ova-vpaid-linear-expanded-change";
        public static const _Str_16922:String = "ova-vpaid-linear-time-change";
        public static const _Str_14757:String = "ova-vpaid-nl-start";
        public static const _Str_15573:String = "ova-vpaid-nl-complete";
        public static const _Str_14364:String = "ova-vpaid-nl-error";
        public static const _Str_15816:String = "ova-vpaid-nl-linear-change";
        public static const _Str_14288:String = "ova-vpaid-nl-expanded-change";
        public static const _Str_13294:String = "ova-vpaid-nl-time-change";
        public static const _Str_14526:String = "ova-video-ad-start";
        public static const _Str_15420:String = "ova-video-ad-first-quartile";
        public static const _Str_12528:String = "ova-video-ad-midpoint";
        public static const _Str_15164:String = "ova-video-ad-third-quartile";
        public static const _Str_14824:String = "ova-video-ad-complete";
        public static const _Str_18603:String = "ova-linear-click-thru";
        public static const _Str_13941:String = "ova-vpaid-nl-click-thru";
        public static const _Str_18117:String = "ova-vpaid-linear-user-accept-invitation";
        public static const _Str_16665:String = "ova-vpaid-linear-user-minimize";
        public static const _Str_16340:String = "ova-vpaid-linear-user-close";
        public static const _Str_15854:String = "ova-vpaid-nl-user-accept-invitation";
        public static const _Str_13270:String = "ova-vpaid-nl-user-minimize";
        public static const _Str_13997:String = "ova-vpaid-nl-user-close";
        public static const _Str_15390:String = "ova-vpaid-linear-volume-change";
        public static const _Str_15728:String = "ova-vpaid-nl-volume-change";
        public static const _Str_4456:String = "ova-vpaid-skipped";
        public static const _Str_6020:String = "ova-vpaid-skippable-state-change";
        public static const _Str_5704:String = "ova-vpaid-size-change";
        public static const _Str_5647:String = "ova-vpaid-duration-change";
        public static const _Str_5708:String = "ova-vpaid-ad-interaction";
        public static const _Str_12726:String = "ova-vpaid-ad-log";

        protected var _data:* = null;
        protected var _Str_3267:AdSlot = null;

        public function _Str_2333(k:String, _arg_2:AdSlot, _arg_3:*=null, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._Str_3267 = _arg_2;
            this._data = _arg_3;
        }

        public function get adSlot():AdSlot
        {
            return this._Str_3267;
        }

        public function _Str_13568():Boolean
        {
            return !(this._data == null);
        }

        public function get data():*
        {
            return this._data;
        }

        override public function clone():Event
        {
            return new _Str_2333(type, this.adSlot, this.data, bubbles, cancelable);
        }
    }
}
