//com.sulake.habbo.tablet.catalog.viewer.PageLocalization

package com.sulake.habbo.tablet.catalog.viewer{
    import flash.utils.Dictionary;

    public class PageLocalization implements IPageLocalization {

        public static const HEADER_IMAGE:String;
        public static const HEADER_ICON:String;
        public static const HEADER_TITLE:String;
        public static const HEADER_DESCRIPTION:String;
        private static const DEFAULT_TEXT_FIELDS:Array;
        private static const DEFAULT_IMAGE_FIELDS:Array;
        private static const LAYOUTS_IMAGE_FIELDS:Dictionary;
        private static const LAYOUTS_TEXT_FIELDS:Dictionary;
        private static const LAYOUT_LINKS:Dictionary;

        private var _images:Array;
        private var _texts:Array;

        public function PageLocalization(k:Array, _arg_2:Array);

        public function get imageCount():int;

        public function get textCount():int;

        public function dispose():void;

        public function hasLinks(k:String):Boolean;

        public function getLinks(k:String):Array;

        public function getTextElementName(k:int, _arg_2:String):String;

        public function getImageElementName(k:int, _arg_2:String):String;

        public function getTextElementContent(k:int):String;

        public function getImageElementContent(k:int):String;

        public function getColorUintFromText(k:int):uint;


    }
}//package com.sulake.habbo.tablet.catalog.viewer

