//com.sulake.habbo.utils.gpu.PlatformData

package com.sulake.habbo.utils.gpu{
    import flash.display.Stage;

    public class PlatformData {

        private static const MAX_DYNAMIC_TEXTURE_DIMENSION_SD:int;
        private static const MAX_DYNAMIC_TEXTURE_DIMENSION_HD:int;
        private static const TABLET_SCREEN_MINIMUM_INCHES:Number;
        private static const ORIGINAL_DPI_IPHONE_RETINA:int;
        private static const ORIGINAL_DPI_IPAD_RETINA:int;
        private static var _dpi:int;
        private static var _scale:Number;

        public function PlatformData();

        public static function get isDeviceHD():Boolean;

        public static function get isLowMemoryDevice():Boolean;

        public static function smartScaleFactor():int;

        public static function get scale():Number;

        public static function evenScale(k:int):int;

        public static function get maxDynamicTextureDimension():int;

        public static function isTablet(k:Stage):Boolean;

        private static function calculateScale():Number;


    }
}//package com.sulake.habbo.utils.gpu

