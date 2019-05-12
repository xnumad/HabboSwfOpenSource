package org.openvideoads.vast.overlay.button.skip
{
    import org.openvideoads.regions.config.CloseButtonConfig;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import org.openvideoads.vast.config.groupings.SkipAdConfig;

    public class LoadableImageSkipAdButton extends SkipAdRegionViewConfig 
    {
        public function LoadableImageSkipAdButton(k:SkipAdConfig=null)
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
                "image":new Loader(),
                "swf":null,
                "html":null
            });
            image.load(new URLRequest(k.image));
            image.x = 0;
            image.y = 0;
        }
    }
}
