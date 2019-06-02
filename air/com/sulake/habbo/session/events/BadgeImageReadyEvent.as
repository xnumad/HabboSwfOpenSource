//com.sulake.habbo.session.events.BadgeImageReadyEvent

package com.sulake.habbo.session.events{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class BadgeImageReadyEvent extends Event {

        public static const BADGE_READY:String;

        private var _badgeId:String;
        private var _image:BitmapData;

        public function BadgeImageReadyEvent(k:String, _arg_2:BitmapData, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get badgeId():String;

        public function get badgeImage():BitmapData;


    }
}//package com.sulake.habbo.session.events

