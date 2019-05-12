package com.sulake.habbo.help
{
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;

    public interface INameChangeUI 
    {
        function get localization():IHabboLocalizationManager;
        function get assets():IAssetLibrary;
        function get _Str_16619():String;
        function _Str_12245(_arg_1:String, _arg_2:uint=1):IWindow;
        function checkName(_arg_1:String):void;
        function _Str_20431(_arg_1:String):void;
        function _Str_4731():void;
        function _Str_5574():void;
    }
}
