package com.sulake.habbo.advertisement.events
{
    import flash.events.Event;

    public class InterstitialEvent extends Event 
    {
        public static const INTERSTITIAL_SHOW:String = "AE_INTERSTITIAL_SHOW";
        public static const INTERSTITIAL_NOT_SHOWN:String = "AE_INTERSTITIAL_NOT_SHOWN";
        public static const INTERSTITIAL_COMPLETE:String = "AE_INTERSTITIAL_COMPLETE";

        private var _status:String;

        public function InterstitialEvent(k:String, status:String=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._status = status;
        }

        public function get status():String
        {
            return this._status;
        }
    }
}
