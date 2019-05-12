package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;

    public interface IBitmapWrapperWindow extends IWindow 
    {
        function set bitmap(_arg_1:BitmapData):void;
        function get bitmap():BitmapData;
        function get bitmapAssetName():String;
        function set bitmapAssetName(_arg_1:String):void;
        function set disposesBitmap(_arg_1:Boolean):void;
        function get disposesBitmap():Boolean;
    }
}
