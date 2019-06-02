//com.sulake.habbo.avatar.AvatarImageBodyPartContainer

package com.sulake.habbo.avatar{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class AvatarImageBodyPartContainer {

        private var _image:BitmapData;
        private var _regPoint:Point;
        private var _offset:Point;
        private var _isCacheable:Boolean;

        public function AvatarImageBodyPartContainer(k:BitmapData, _arg_2:Point, _arg_3:Boolean);

        public function get isCacheable():Boolean;

        public function dispose():void;

        public function set image(k:BitmapData):void;

        public function get image():BitmapData;

        public function get regPoint():Point;

        public function set offset(k:Point):void;

        private function cleanPoints():void;


    }
}//package com.sulake.habbo.avatar

