package org.openvideoads.vast.server.request.liverail
{
    import org.openvideoads.vast.server.config.AdServerConfig;

    public class _Str_10743 extends AdServerConfig 
    {
        public function _Str_10743(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("Liverail", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__";
        }
    }
}
