//com.sulake.core.utils.Player

package com.sulake.core.utils{
    public class Player {

        private static var _majorVersion:int;
        private static var _majorRevision:int;
        private static var _operatingSystem:String;

        public function Player();

        public static function get majorVersion():int;

        public static function get majorRevision():int;

        public static function get operatingSystem():String;

        private static function init():void;


    }
}//package com.sulake.core.utils

