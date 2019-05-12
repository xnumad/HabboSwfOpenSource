package com.sulake.habbo.session
{
    import flash.display.BitmapData;

    public class BadgeInfo 
    {
        private var _image:BitmapData;
        private var _placeHolder:Boolean;

        public function BadgeInfo(k:BitmapData, _arg_2:Boolean)
        {
            this._image = k;
            this._placeHolder = _arg_2;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get placeHolder():Boolean
        {
            return this._placeHolder;
        }
    }
}
