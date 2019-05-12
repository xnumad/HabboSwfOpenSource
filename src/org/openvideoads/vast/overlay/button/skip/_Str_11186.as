package org.openvideoads.vast.overlay.button.skip
{
    import org.openvideoads.regions.config.CloseButtonConfig;
    import org.openvideoads.vast.config.groupings.SkipAdConfig;

    public class _Str_11186 extends SkipAdRegionViewConfig 
    {
        public function _Str_11186(k:SkipAdConfig=null)
        {
            super(k.region, {
                "id":"reserved-skip-ad-button-image",
                "verticalAlign":5,
                "horizontalAlign":"right",
                "width":((k.width > 0) ? k.width : 70),
                "height":((k.height > 0) ? k.height : 20),
                "backgroundColor":"transparent",
                "clickable":true,
                "closeButton":new CloseButtonConfig({"enabled":false}),
                "keepAfterClick":false,
                "image":null,
                "swf":null,
                "html":k.html
            });
        }
    }
}
