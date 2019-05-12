package org.openvideoads.vast.server.request.openx
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_10391 extends AdServerConfig 
    {
        public function _Str_10391(k:Object=null)
        {
            super("OpenX", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__?script=__script__&zones=__zones__&nz=__nz__&source=__source__&r=__r__&block=__block__&format=__format__&charset=__charset__&__target__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "script":"bannerTypeHtml:vastInlineBannerTypeHtml:vastInlineHtml",
                "nz":"1",
                "source":"",
                "r":"__random-number__",
                "block":"__allow-duplicates-as-binary__",
                "format":"vast",
                "charset":"UTF-8"
            }));
        }
    }
}
