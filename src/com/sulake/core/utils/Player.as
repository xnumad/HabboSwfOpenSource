package com.sulake.core.utils
{
    import flash.system.Capabilities;

    public class Player 
    {
        private static var _majorVersion:int;
        private static var _majorRevision:int;
        private static var _operatingSystem:String;

        {
            init();
        }


        public static function get majorVersion():int
        {
            return _majorVersion;
        }

        public static function get majorRevision():int
        {
            return _majorRevision;
        }

        public static function get operatingSystem():String
        {
            return _operatingSystem;
        }

        private static function init():void
        {
            var data:Array = Capabilities.version.split(" ");
            var version:Array = data[1].split(",");
            _operatingSystem = data[0];
            _majorVersion = parseInt(version[0]);
            _majorRevision = parseInt(version[1]);
        }
    }
}
