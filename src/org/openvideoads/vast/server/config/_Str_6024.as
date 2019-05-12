package org.openvideoads.vast.server.config
{
    import org.openvideoads.vast.server.request.adify._Str_11622;
    import org.openvideoads.vast.server.request.adform._Str_12178;
    import org.openvideoads.vast.server.request.adtech._Str_9861;
    import org.openvideoads.vast.server.request.doubleclick._Str_10632;
    import org.openvideoads.vast.server.request.direct._Str_4664;
    import org.openvideoads.vast.server.request.injected._Str_6762;
    import org.openvideoads.vast.server.request.lightningcast._Str_10009;
    import org.openvideoads.vast.server.request.liverail._Str_10743;
    import org.openvideoads.vast.server.request.oas._Str_10867;
    import org.openvideoads.vast.server.request.oasis._Str_10310;
    import org.openvideoads.vast.server.request.openx._Str_10391;
    import org.openvideoads.vast.server.request.openx._Str_11383;

    public class _Str_6024 
    {
        public static const ADFORM:String = "ADFORM";
        public static const ADIFY:String = "ADIFY";
        public static const ADTECH:String = "ADTECH";
        public static const DART:String = "DART";
        public static const DIRECT:String = "DIRECT";
        public static const INJECT:String = "INJECT";
        public static const LIGHTNINGCAST:String = "LIGHTNINGCAST";
        public static const LIVERAIL:String = "LIVERAIL";
        public static const OAS:String = "OAS";
        public static const OASIS:String = "OASIS";
        public static const AD_SERVER_OPENX_V2:String = "OPENX";
        public static const AD_SERVER_OPENX_V3:String = "OPENX3";


        public static function _Str_5664(k:String):AdServerConfig
        {
            switch (k.toUpperCase())
            {
                case ADIFY:
                    return new _Str_11622();
                case ADFORM:
                    return new _Str_12178();
                case ADTECH:
                    return new _Str_9861();
                case DART:
                    return new _Str_10632();
                case DIRECT:
                    return new _Str_4664();
                case INJECT:
                    return new _Str_6762();
                case LIGHTNINGCAST:
                    return new _Str_10009();
                case LIVERAIL:
                    return new _Str_10743();
                case OAS:
                    return new _Str_10867();
                case OASIS:
                    return new _Str_10310();
                case AD_SERVER_OPENX_V2:
                    return new _Str_10391();
                case AD_SERVER_OPENX_V3:
                    return new _Str_11383();
                default:
                    return new _Str_4664();
            }
        }
    }
}
