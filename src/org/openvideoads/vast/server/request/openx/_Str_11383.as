package org.openvideoads.vast.server.request.openx
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_11383 extends AdServerConfig 
    {
        public function _Str_11383(k:Object=null)
        {
            super("OpenX3", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__?__zones__&test=true";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return new CustomProperties();
        }
    }
}
