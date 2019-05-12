package org.openvideoads.vast.overlay.button.skip
{
    import flash.display.Bitmap;
    import org.openvideoads.regions.config.CloseButtonConfig;
    import org.openvideoads.vast.config.groupings.SkipAdConfig;

    public class _Str_12074 extends SkipAdRegionViewConfig 
    {
        public function _Str_12074(k:SkipAdConfig=null)
        {
            var _local_2:Bitmap;
            super(k.region, {
                "id":"reserved-skip-ad-button-image",
                "verticalAlign":5,
                "horizontalAlign":"right",
                "width":70,
                "height":20,
                "backgroundColor":"transparent",
                "clickable":true,
                "closeButton":new CloseButtonConfig({"enabled":false}),
                "keepAfterClick":false,
                "image":_local_2,
                "swf":null,
                "html":null
            });
        }
    }
}
