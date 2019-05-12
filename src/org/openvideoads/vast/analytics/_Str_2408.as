package org.openvideoads.vast.analytics
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.config.groupings.analytics.AnalyticsConfigGroup;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.vast.schedule.ads.AdSlot;

    public class _Str_2408 extends Debuggable implements _Str_13591 
    {
        public static const IMPRESSIONS:String = "impressions";
        public static const ADCALLS:String = "adCalls";
        public static const TEMPLATE:String = "template";
        public static const ADSLOT:String = "adSlot";
        public static const PROGRESS:String = "progress";
        public static const CLICKS:String = "clicks";
        public static const VPAID:String = "vpaid";
        public static const ALL:String = "all";
        public static const LINEAR:String = "linear";
        public static const NONLINEAR:String = "nonLinear";
        public static const COMPANION:String = "companion";
        public static const _Str_19640:String = "non-interactive";
        public static const LOADED:String = "loaded";
        public static const FIRED:String = "fired";
        public static const COMPLETE:String = "complete";
        public static const ERROR:String = "error";
        public static const TIMEOUT:String = "timeout";
        public static const DEFERRED:String = "deferred";
        public static const FAILOVER:String = "failover";
        public static const START:String = "start";
        public static const STOP:String = "stop";
        public static const FIRSTQUARTILE:String = "firstQuartile";
        public static const MIDPOINT:String = "midpoint";
        public static const THIRDQUARTILE:String = "thirdQuartile";
        public static const PAUSE:String = "pause";
        public static const RESUME:String = "resume";
        public static const FULLSCREEN:String = "fullscreen";
        public static const MUTE:String = "mute";
        public static const UNMUTE:String = "unmute";
        public static const EXPAND:String = "expand";
        public static const COLLAPSE:String = "collapse";
        public static const USERACCEPTINVITATION:String = "userAcceptInvitation";
        public static const CLOSE:String = "close";
        public static const STARTED:String = "started";
        public static const STOPPED:String = "stopped";
        public static const LINEARCHANGE:String = "linearChange";
        public static const EXPANDEDCHANGE:String = "expandedChange";
        public static const REMAININGTIMECHANGE:String = "remainingTimeChange";
        public static const VOLUMECHANGE:String = "volumeChange";
        public static const PAUSED:String = "paused";
        public static const PLAYING:String = "playing";
        public static const VIDEOSTART:String = "videoStart";
        public static const VIDEOFIRSTQUARTILE:String = "videoFirstQuartile";
        public static const VIDEOMIDPOINT:String = "videoMidpoint";
        public static const VIDEOTHIRDQUARTILE:String = "videoThirdQuartile";
        public static const VIDEOCOMPLETE:String = "videoComplete";
        public static const SKIPPED:String = "skipped";
        public static const SKIPPABLESTATECHANGE:String = "skippableStateChange";
        public static const SIZECHANGE:String = "sizeChange";
        public static const DURATIONCHANGE:String = "durationChange";
        public static const ADINTERACTION:String = "adInteraction";
        public static const _Str_21975:String = "pre-roll";
        public static const _Str_21159:String = "mid-roll";
        public static const _Str_19626:String = "post-roll";

        public function _Str_2408(k:AnalyticsConfigGroup=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:AnalyticsConfigGroup):void
        {
            if (k != null)
            {
                if (k._Str_25296())
                {
                }
            }
        }

        public function _Str_7633(k:String, _arg_2:AdServerRequest, _arg_3:Boolean=false, _arg_4:*=null):void
        {
        }

        public function _Str_10768(k:String, _arg_2:*=null):void
        {
        }

        public function _Str_11038(k:String, _arg_2:AdSlot, _arg_3:*=null):void
        {
        }

        public function _Str_9754(k:String, _arg_2:AdSlot, _arg_3:*, _arg_4:*=null):void
        {
        }

        public function _Str_20536(k:String, _arg_2:AdSlot, _arg_3:*, _arg_4:*=null):void
        {
        }

        public function _Str_2689(k:String, _arg_2:AdSlot, _arg_3:*, _arg_4:*=null):void
        {
        }

        public function _Str_12452(k:String, _arg_2:AdSlot, _arg_3:*, _arg_4:*=null):void
        {
        }
    }
}
