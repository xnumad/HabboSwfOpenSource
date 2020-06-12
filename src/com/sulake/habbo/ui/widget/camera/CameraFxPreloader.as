package com.sulake.habbo.ui.widget.camera
{
    import flash.utils.Dictionary;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.BitmapData;
    import flash.net.URLRequest;
    import flash.display.Bitmap;

    public class CameraFxPreloader 
    {
        private static var ASSETS:Dictionary;
        private static var instance:CameraFxPreloader;
        private static var _urls:Array;
        private static var _baseUrl:String;

        private var _Str_582:Loader;
        private var _Str_21277:Boolean = false;

        public function CameraFxPreloader()
        {
            this._Str_582 = new Loader();
            this._Str_582.contentLoaderInfo.addEventListener(Event.COMPLETE, this._Str_22779);
            this._Str_582.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this._Str_22357);
            this._Str_17534();
        }

        public static function init(k:String, _arg_2:Array):void
        {
            if (!instance)
            {
                ASSETS = new Dictionary();
                _baseUrl = k;
                _urls = _arg_2;
                instance = new (CameraFxPreloader)();
            }
        }

        public static function _Str_25462():Boolean
        {
            return (instance != null) ? instance._Str_21277 : false;
        }

        public static function getImage(k:String):BitmapData
        {
            return (ASSETS != null) ? ASSETS[k] : null;
        }


        private function _Str_17534():void
        {
            var k:String;
            if (_urls.length > 0)
            {
                k = (((_baseUrl + "Habbo-Stories/") + _urls[0]) + ".png");
                this._Str_582.load(new URLRequest(k));
            }
            else
            {
                this._Str_21277 = true;
            }
        }

        private function _Str_22779(k:Event):void
        {
            ASSETS[_urls.shift()] = Bitmap(this._Str_582.content).bitmapData.clone();
            this._Str_17534();
        }

        private function _Str_22357(k:Event):void
        {
            Logger.log(("Camera Fx preloading failed for " + this._Str_582.contentLoaderInfo.loaderURL));
            _urls.shift();
            this._Str_17534();
        }
    }
}
