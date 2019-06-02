//com.sulake.core.window.components.IBitmapWrapperWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IBitmapWrapperWindow extends IWindow {

        function set bitmap(k:BitmapData):void;
        function get bitmap():BitmapData;
        function get bitmapAssetName():String;
        function set bitmapAssetName(k:String):void;
        function set disposesBitmap(k:Boolean):void;
        function get disposesBitmap():Boolean;

    }
}//package com.sulake.core.window.components

