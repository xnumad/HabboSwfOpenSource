package com.sulake.core.utils
{
    import flash.system.Capabilities;

    public class PlayerVersionCheck 
    {
        private static var _majorVersion:int;
        private static var _minorVersion:int;
        private static var _isParsed:Boolean;


        public static function isVersionAtLeast(major:int, minor:int):Boolean
        {
            if (major < PlayerVersionCheck.majorVersion)
            {
                return true;
            }
            if (((major == PlayerVersionCheck.majorVersion) && (minor <= PlayerVersionCheck.minorVersion)))
            {
                return true;
            }
            return false;
        }

        public static function get majorVersion():int
        {
            parseVersion();
            return _majorVersion;
        }

        public static function get minorVersion():int
        {
            parseVersion();
            return _minorVersion;
        }

        private static function parseVersion():void
        {
            if (_isParsed)
            {
                return;
            }
            var version:Array = Capabilities.version.split(" ");
            var majMin:Array = version[1].split(",");
            _majorVersion = ((majMin.length >= 1) ? parseInt(majMin[0]) : 0);
            _minorVersion = ((majMin.length >= 2) ? parseInt(majMin[1]) : 0);
            _isParsed = true;
        }
    }
}
