package org.openvideoads.vast.server.request.oas
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_10867 extends AdServerConfig 
    {
        public function _Str_10867(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("OAS", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__/__sitepage__/__random-number__@__listpos__?__target__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return new CustomProperties({"target":""});
        }
    }
}
