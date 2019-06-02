//com.sulake.habbo.utils.CommunicationUtils

package com.sulake.habbo.utils{
    import flash.display.BitmapData;

    public class CommunicationUtils {

        public static const SOL_PROPERTY_ENVIRONMENT:String;
        public static const SOL_PROPERTY_LOGIN_NAME:String;
        public static const SOL_PROPERTY_PASSWORD:String;
        public static const SOL_PROPERTY_CHARACTER_ID:String;
        public static const SOL_PROPERTY_AUTO_LOGIN:String;
        public static const SOL_PROPERTY_MACHINE_ID:String;
        private static const SOL_ID:String;

        public function CommunicationUtils();

        public static function writeSOLProperty(k:String, _arg_2:Object):void;

        public static function readSOLProperty(k:String, _arg_2:Object=null):Object;

        public static function readSOLString(k:String, _arg_2:String=null):String;

        public static function readSOLBoolean(k:String, _arg_2:String=null):Boolean;

        public static function readSOLInteger(k:String, _arg_2:String=null):int;

        public static function decodeFromBitmap(k:BitmapData):String;

        public static function xor(k:String, _arg_2:String):String;

        public static function generateFingerprint():String;

        public static function generateRandomHexString(k:uint=16):String;

        public static function removeProtocol(k:String):String;


    }
}//package com.sulake.habbo.utils

