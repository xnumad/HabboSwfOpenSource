package org.openvideoads.vpaid
{
    import flash.events.Event;

    public class _Str_2291 extends Event 
    {
        public static const AdLoaded:String = "AdLoaded";
        public static const AdStarted:String = "AdStarted";
        public static const AdStopped:String = "AdStopped";
        public static const AdLinearChange:String = "AdLinearChange";
        public static const AdExpandedChange:String = "AdExpandedChange";
        public static const AdRemainingTimeChange:String = "AdRemainingTimeChange";
        public static const AdVolumeChange:String = "AdVolumeChange";
        public static const AdImpression:String = "AdImpression";
        public static const AdVideoStart:String = "AdVideoStart";
        public static const AdVideoFirstQuartile:String = "AdVideoFirstQuartile";
        public static const AdVideoMidpoint:String = "AdVideoMidpoint";
        public static const AdVideoThirdQuartile:String = "AdVideoThirdQuartile";
        public static const AdVideoComplete:String = "AdVideoComplete";
        public static const AdClickThru:String = "AdClickThru";
        public static const AdUserAcceptInvitation:String = "AdUserAcceptInvitation";
        public static const AdUserMinimize:String = "AdUserMinimize";
        public static const AdUserClose:String = "AdUserClose";
        public static const AdPaused:String = "AdPaused";
        public static const AdPlaying:String = "AdPlaying";
        public static const AdLog:String = "AdLog";
        public static const AdError:String = "AdError";
        public static const AdSkipped:String = "AdSkipped";
        public static const AdSizeChange:String = "AdSizeChange";
        public static const AdSkippableStateChange:String = "AdSkippableStateChange";
        public static const AdDurationChange:String = "AdDurationChange";
        public static const AdInteraction:String = "AdInteraction";

        private var _data:Object = null;

        public function _Str_2291(k:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            if ((_arg_2 is String))
            {
                this._data = {"message":_arg_2};
            }
            else
            {
                this._data = _arg_2;
            }
        }

        public function get data():Object
        {
            return this._data;
        }
    }
}
