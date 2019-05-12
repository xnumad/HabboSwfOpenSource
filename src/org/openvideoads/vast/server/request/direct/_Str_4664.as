package org.openvideoads.vast.server.request.direct
{
    import org.openvideoads.vast.server.config.AdServerConfig;

    public class _Str_4664 extends AdServerConfig 
    {
        public function _Str_4664(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("Direct", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__";
        }
    }
}
