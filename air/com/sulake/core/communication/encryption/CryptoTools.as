//com.sulake.core.communication.encryption.CryptoTools

package com.sulake.core.communication.encryption{
    import flash.utils.ByteArray;

    public class CryptoTools {

        public function CryptoTools();

        public static function byteArrayToString(k:ByteArray):String;

        public static function stringToByteArray(k:String):ByteArray;

        public static function byteArrayToHexString(k:ByteArray, _arg_2:Boolean=false):String;

        public static function hexStringToByteArray(k:String):ByteArray;

        public static function BigIntegerToRadix(k:ByteArray, _arg_2:uint=16):String;


    }
}//package com.sulake.core.communication.encryption

