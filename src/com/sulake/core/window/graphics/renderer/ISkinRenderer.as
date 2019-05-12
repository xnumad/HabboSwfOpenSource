package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public interface ISkinRenderer extends IDisposable 
    {
        function get name():String;
        function parse(_arg_1:IAsset, _arg_2:XMLList, _arg_3:IAssetLibrary):void;
        function draw(_arg_1:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void;
        function isStateDrawable(_arg_1:uint):Boolean;
        function _Str_20341(_arg_1:ISkinLayout):ISkinLayout;
        function _Str_22665(_arg_1:String):ISkinLayout;
        function _Str_22572(_arg_1:ISkinLayout):ISkinLayout;
        function _Str_22661(_arg_1:uint):ISkinLayout;
        function _Str_21977(_arg_1:uint, _arg_2:String):void;
        function _Str_19884(_arg_1:uint):void;
        function _Str_23297(_arg_1:uint):Boolean;
        function _Str_21576(_arg_1:ISkinTemplate):ISkinTemplate;
        function _Str_23196(_arg_1:String):ISkinTemplate;
        function _Str_22597(_arg_1:ISkinTemplate):ISkinTemplate;
        function _Str_25215(_arg_1:uint):ISkinTemplate;
        function _Str_19639(_arg_1:uint, _arg_2:String):void;
        function _Str_21934(_arg_1:uint):void;
        function _Str_25392(_arg_1:uint):Boolean;
    }
}
