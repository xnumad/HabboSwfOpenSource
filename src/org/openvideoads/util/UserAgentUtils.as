package org.openvideoads.util
{
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class UserAgentUtils 
    {


        private static function getUA():String
        {
            var k:String;
            if (ExternalInterface.available)
            {
                try
                {
                    k = ExternalInterface.call("function getBrowser(){return navigator.userAgent;}");
                    if (((!(k == null)) && (k.indexOf("Firefox") >= 0)))
                    {
                        return "FIREFOX";
                    }
                    if (((!(k == null)) && (k.indexOf("Safari") >= 0)))
                    {
                        return "SAFARI";
                    }
                    if (((!(k == null)) && (k.indexOf("MSIE") >= 0)))
                    {
                        return "IE";
                    }
                    if (((!(k == null)) && (k.indexOf("Opera") >= 0)))
                    {
                        return "OPERA";
                    }
                }
                catch(e:Error)
                {
                }
            }
            return "UNDEFINED";
        }

        public static function _Str_2826(k:String, _arg_2:String="_blank", _arg_3:String=""):void
        {
            var _local_4:String = UserAgentUtils.getUA();
            switch (_local_4)
            {
                case "IE":
                    ExternalInterface.call((((((("function setWMWindow() {window.open('" + k) + "', '") + _arg_2) + "', '") + _arg_3) + "');}"));
                    return;
                case "FIREFOX":
                case "SAFARI":
                case "OPERA":
                default:
                    navigateToURL(new URLRequest(k), _arg_2);
            }
        }
    }
}
