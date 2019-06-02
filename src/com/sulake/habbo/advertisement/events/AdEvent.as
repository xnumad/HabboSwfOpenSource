package com.sulake.habbo.advertisement.events
{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class AdEvent extends Event 
    {
        public static const ROOM_AD_IMAGE_LOADED:String = "AE_ROOM_AD_IMAGE_LOADED";
        public static const ROOM_AD_IMAGE_LOADING_FAILED:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
        public static const ROOM_AD_SHOW:String = "AE_ROOM_AD_SHOW";

        private var _image:BitmapData;
        private var _roomId:int;
        private var _imageUrl:String;
        private var _clickUrl:String;
        private var _adWarningL:BitmapData;
        private var _adWarningR:BitmapData;
        private var _objectId:int;
        private var _objectCategory:int;

        public function AdEvent(k:String, roomId:int, image:BitmapData=null, imageUrl:String="", clickUrl:String="", adWarningL:BitmapData=null, adWarningR:BitmapData=null, objectId:int=-1, objectCategory:int=-1, _arg_10:Boolean=false, _arg_11:Boolean=false)
        {
            super(k, _arg_10, _arg_11);
            this._image = image;
            this._roomId = roomId;
            this._imageUrl = imageUrl;
            this._clickUrl = clickUrl;
            this._adWarningL = adWarningL;
            this._adWarningR = adWarningR;
            this._objectId = objectId;
            this._objectCategory = objectCategory;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get imageUrl():String
        {
            return this._imageUrl;
        }

        public function get clickUrl():String
        {
            return this._clickUrl;
        }

        public function get adWarningL():BitmapData
        {
            return this._adWarningL;
        }

        public function get adWarningR():BitmapData
        {
            return this._adWarningR;
        }

        public function get objectId():int
        {
            return this._objectId;
        }

        public function get objectCategory():int
        {
            return this._objectCategory;
        }
    }
}
