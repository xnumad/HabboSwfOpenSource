package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class TabUtils 
    {


        public static function _Str_2972(k:IStaticBitmapWrapperWindow, _arg_2:Boolean):void
        {
            var _local_3:String = k.assetUri.replace("_on", "");
            k.assetUri = ((_arg_2) ? _local_3 : (_local_3 + "_on"));
        }
    }
}
