//com.sulake.core.utils.FontEnum

package com.sulake.core.utils{
    import flash.text.Font;

    public class FontEnum {

        private static const _systemFonts:Map;
        private static const _embeddedFonts:Map;
        private static var _init:Boolean;

        public function FontEnum();

        public static function isSystemFont(k:String):Boolean;

        public static function isEmbeddedFont(k:String):Boolean;

        public static function get systemFonts():Map;

        public static function get embeddedFonts():Map;

        public static function registerFont(k:Class):Font;

        private static function init():void;

        public static function refresh():void;


    }
}//package com.sulake.core.utils

