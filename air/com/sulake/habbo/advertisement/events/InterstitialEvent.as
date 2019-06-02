//com.sulake.habbo.advertisement.events.InterstitialEvent

package com.sulake.habbo.advertisement.events{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class InterstitialEvent extends Event {

        public static const INTERSTITIAL_SHOW:String;
        public static const INTERSTITIAL_COMPLETE:String;

        private var _image:BitmapData;
        private var _clickURL:String;
        private var _videoURL:String;

        public function InterstitialEvent(k:String, _arg_2:BitmapData=null, _arg_3:String="", _arg_4:String="", _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get image():BitmapData;

        public function get clickURL():String;

        public function get videoURL():String;


    }
}//package com.sulake.habbo.advertisement.events

