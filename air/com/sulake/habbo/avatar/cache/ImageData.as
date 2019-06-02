//com.sulake.habbo.avatar.cache.ImageData

package com.sulake.habbo.avatar.cache{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.geom.ColorTransform;

    public class ImageData {

        private var _bitmap:BitmapData;
        private var _rect:Rectangle;
        private var _regPoint:Point;
        private var _flipH:Boolean;
        private var _colorTransform:ColorTransform;
        private var _name:String;
        private var _offsetRect:Rectangle;

        public function ImageData(k:BitmapData, _arg_2:Rectangle, _arg_3:Point, _arg_4:Boolean, _arg_5:ColorTransform, _arg_6:String);

        public function dispose():void;

        public function get bitmap():BitmapData;

        public function get rect():Rectangle;

        public function get regPoint():Point;

        public function get flipH():Boolean;

        public function get colorTransform():ColorTransform;

        public function get offsetRect():Rectangle;


    }
}//package com.sulake.habbo.avatar.cache

