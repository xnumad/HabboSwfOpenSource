package org.openvideoads.vast.overlay.button.skip
{
    import org.openvideoads.regions.config.RegionViewConfig;

    public class SkipAdRegionViewConfig extends RegionViewConfig 
    {
        public function SkipAdRegionViewConfig(k:Object, _arg_2:Object)
        {
            var _local_3:Object = {};
            if (k == null)
            {
                _local_3 = _arg_2;
            }
            else
            {
                _local_3 = {
                    "id":((k.id != undefined) ? k.id : _arg_2.id),
                    "verticalAlign":((k.verticalAlign != undefined) ? k.verticalAlign : _arg_2.verticalAlign),
                    "horizontalAlign":((k.horizontalAlign != undefined) ? k.horizontalAlign : _arg_2.horizontalAlign),
                    "width":((k.width != undefined) ? k.width : _arg_2.width),
                    "height":((k.height != undefined) ? k.height : _arg_2.height),
                    "backgroundColor":((k.backgroundColor != undefined) ? k.backgroundColor : _arg_2.backgroundColor),
                    "clickable":((k.clickable != undefined) ? k.clickable : _arg_2.clickable),
                    "closeButton":((k.closeButton != undefined) ? k.closeButton : _arg_2.closeButton),
                    "keepAfterClick":((k.keepAfterClick != undefined) ? k.keepAfterClick : _arg_2.keepAfterClick),
                    "image":((k.image != undefined) ? k.image : _arg_2.image),
                    "swf":((k.swf != undefined) ? k.swf : _arg_2.swf),
                    "html":((k.html != undefined) ? k.html : _arg_2.html),
                    "autoHide":false
                }
                if (k.styleSheetAddress != undefined)
                {
                    _local_3.styleSheetAddress = k.styleSheetAddress;
                }
                if (k.style != undefined)
                {
                    _local_3.style = k.style;
                }
                if (k.border != undefined)
                {
                    _local_3.border = k.border;
                }
                if (k.borderRadius != undefined)
                {
                    _local_3.borderRadius = k.borderRadius;
                }
                if (k.borderWidth != undefined)
                {
                    _local_3.borderWidth = k.borderWidth;
                }
                if (k.borderColor != undefined)
                {
                    _local_3.borderColor = k.borderColor;
                }
                if (k.background != undefined)
                {
                    _local_3.background = k.background;
                }
                if (k.backgroundGradient != undefined)
                {
                    _local_3.backgroundGradient = k.backgroundGradient;
                }
                if (k.backgroundImage != undefined)
                {
                    _local_3.backgroundImage = k.backgroundImage;
                }
                if (k.backgroundRepeat != undefined)
                {
                    _local_3.backgroundRepeat = k.backgroundRepeat;
                }
                if (k.backgroundColor != undefined)
                {
                    _local_3.backgroundColor = k.backgroundColor;
                }
                if (k.opacity != undefined)
                {
                    _local_3.opacity = k.opacity;
                }
                if (k.padding != undefined)
                {
                    _local_3.padding = k.padding;
                }
                if (k.canScale != undefined)
                {
                    _local_3.canScale = k.canScale;
                }
                if (k.scaleRate != undefined)
                {
                    _local_3.scaleRate = k.scaleRate;
                }
                if (k.autoHide != undefined)
                {
                    _local_3.autoHide = k.autoHide;
                }
            }
            super(_local_3);
        }
    }
}
