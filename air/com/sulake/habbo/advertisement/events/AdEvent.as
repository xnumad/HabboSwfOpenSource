//com.sulake.habbo.advertisement.events.AdEvent

package com.sulake.habbo.advertisement.events{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class AdEvent extends Event {

        public static const ROOM_AD_IMAGE_LOADED:String;
        public static const ROOM_AD_IMAGE_LOADING_FAILED:String;
        public static const ROOM_AD_SHOW:String;

        private var _image:BitmapData;
        private var _roomId:int;
        private var _imageUrl:String;
        private var _clickUrl:String;
        private var _adWarningL:BitmapData;
        private var _adWarningR:BitmapData;
        private var _objectId:int;
        private var _objectCategory:int;

        public function AdEvent(k:String, _arg_2:int, _arg_3:BitmapData=null, _arg_4:String="", _arg_5:String="", _arg_6:BitmapData=null, _arg_7:BitmapData=null, _arg_8:int=-1, _arg_9:int=-1, k0:Boolean=false, k1:Boolean=false);

        public function get image():BitmapData;

        public function get roomId():int;

        public function get imageUrl():String;

        public function get clickUrl():String;

        public function get adWarningL():BitmapData;

        public function get adWarningR():BitmapData;

        public function get objectId():int;

        public function get objectCategory():int;


    }
}//package com.sulake.habbo.advertisement.events

