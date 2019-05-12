package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IBitmapDataContainer;

    public interface IStaticBitmapWrapperWindow extends IWindow, IBitmapDataContainer 
    {
        function get assetUri():String;
        function set assetUri(_arg_1:String):void;
    }
}
