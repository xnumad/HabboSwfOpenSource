package com.sulake.core.utils
{
    public class BrowserInfo 
    {
        public static const WIN:String = "win";
        public static const MAC:String = "mac";
        public static const SAFARI:String = "safari";
        public static const OPERA:String = "opera";
        public static const MSIE:String = "msie";
        public static const MOZILLA:String = "mozilla";
        public static const CHROME:String = "chrome";

        private var _platform:String = "undefined";
        private var _browser:String = "undefined";
        private var _version:String = "undefined";

        public function BrowserInfo(browsers:Object, platforms:Object, _arg_3:String)
        {
            var browser:String;
            var platform:String;
            super();
            if ((((!(browsers)) || (!(platforms))) || (!(_arg_3))))
            {
                return;
            }
            this._version = browsers.version;
            for (browser in browsers)
            {
                if (browser != "version")
                {
                    if (browsers[browser] == true)
                    {
                        this._browser = browser;
                        break;
                    }
                }
            }
            for (platform in platforms)
            {
                if (platforms[platform] == true)
                {
                    this._platform = platform;
                }
            }
        }

        public function get platform():String
        {
            return this._platform;
        }

        public function get browser():String
        {
            return this._browser;
        }

        public function get version():String
        {
            return this._version;
        }
    }
}
