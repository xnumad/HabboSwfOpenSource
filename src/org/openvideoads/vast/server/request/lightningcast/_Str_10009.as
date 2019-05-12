package org.openvideoads.vast.server.request.lightningcast
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_10009 extends AdServerConfig 
    {
        public function _Str_10009(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("Lightningcast", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__?ver=__ver__&nwid=__nwid__&content=__content__&level=__level__&format=__format__&uid=__uid__&regions=__regions__&crlen=__crlen__&resp=__resp__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "api-address":"http://web.lightningcast.net/servlets/getPlaylist",
                "version":"2.0",
                "nwid":"",
                "level":"",
                "format":"",
                "uid":"",
                "regions":"",
                "crlen":"t",
                "resp":"VAST"
            }));
        }
    }
}
