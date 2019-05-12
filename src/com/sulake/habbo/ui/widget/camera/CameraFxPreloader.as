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
        private static var _Str_2787:Dictionary;
        private static var _Str_1644:CameraFxPreloader;
        private static var _Str_3518:Array;
        private static var _Str_4567:String;

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
            if (!_Str_1644)
            {
                _Str_2787 = new Dictionary();
                _Str_4567 = k;
                _Str_3518 = _arg_2;
                _Str_1644 = new (CameraFxPreloader)();
            }
        }

        public static function _Str_25462():Boolean
        {
            return (_Str_1644 != null) ? _Str_1644._Str_21277 : false;
        }

        public static function getImage(k:String):BitmapData
        {
            return (_Str_2787 != null) ? _Str_2787[k] : null;
        }


        private function _Str_17534():void
        {
            var k:String;
            if (_Str_3518.length > 0)
            {
                k = (((_Str_4567 + "Habbo-Stories/") + _Str_3518[0]) + ".png");
                this._Str_582.load(new URLRequest(k));
            }
            else
            {
                this._Str_21277 = true;
            }
        }

        private function _Str_22779(k:Event):void
        {
            _Str_2787[_Str_3518.shift()] = Bitmap(this._Str_582.content).bitmapData.clone();
            this._Str_17534();
        }

        private function _Str_22357(k:Event):void
        {
            Logger.log(("Camera Fx preloading failed for " + this._Str_582.contentLoaderInfo.loaderURL));
            _Str_3518.shift();
            this._Str_17534();
        }
    }
}
