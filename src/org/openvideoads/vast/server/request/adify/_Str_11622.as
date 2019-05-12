package org.openvideoads.vast.server.request.adify
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_11622 extends AdServerConfig 
    {
        public function _Str_11622(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("Adify", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__/ad?enc=__enc__&asId=__zone__&sf=__sf__&ct=__ct__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "enc":"4",
                "sf":"0",
                "ct":"256"
            }));
        }
    }
}
