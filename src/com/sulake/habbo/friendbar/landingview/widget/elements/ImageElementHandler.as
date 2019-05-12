package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class ImageElementHandler implements IElementHandler 
    {


        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            var _local_5:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_arg_2);
            var _local_6:String = ("${image.library.url}" + _arg_3[1]);
            _local_5.assetUri = _local_6;
            _local_5.x = int(_arg_3[2]);
        }

        public function refresh():void
        {
        }
    }
}
