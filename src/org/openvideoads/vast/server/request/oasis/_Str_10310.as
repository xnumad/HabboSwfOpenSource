package org.openvideoads.vast.server.request.oasis
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_10310 extends AdServerConfig 
    {
        public function _Str_10310(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("OASIS", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__?s=__zone__&w=__w__&h=__h__&k=__k__&t=__t__&cb=__random-number__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "w":"1",
                "h":"1",
                "k":"",
                "t":"_blank"
            }));
        }
    }
}
