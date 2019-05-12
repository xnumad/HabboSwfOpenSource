package org.openvideoads.vast.server.request.doubleclick
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_10632 extends AdServerConfig 
    {
        public function _Str_10632(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("DART", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__/pfadx/__site__;kw=__redirect__;sz=__size__;ord=__zone__;dcmt=__dcmt__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "size":"460x360",
                "dcmt":"text/html"
            }));
        }
    }
}
