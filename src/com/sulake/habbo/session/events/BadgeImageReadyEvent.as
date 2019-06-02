package com.sulake.habbo.session.events
{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class BadgeImageReadyEvent extends Event 
    {
        public static const BIRE_BADGE_IMAGE_READY:String = "BIRE_BADGE_IMAGE_READY";

        private var _badgeId:String;
        private var _image:BitmapData;

        public function BadgeImageReadyEvent(k:String, _arg_2:BitmapData, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(BIRE_BADGE_IMAGE_READY, _arg_3, _arg_4);
            this._badgeId = k;
            this._image = _arg_2;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get badgeImage():BitmapData
        {
            return this._image;
        }
    }
}
