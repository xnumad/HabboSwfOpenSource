package org.openvideoads.vast.server.request.adform
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_12178 extends AdServerConfig 
    {
        public function _Str_12178(k:Object=null)
        {
            this.oneAdPerRequest = true;
            super("Adform", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__/?bn=__zone__&ord=__timestamp__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return new CustomProperties({"api-address":"http://track.adform.net/serving/videoad"});
        }
    }
}
