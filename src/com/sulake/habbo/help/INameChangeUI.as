package com.sulake.habbo.help
{
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;

    public interface INameChangeUI 
    {
        function get localization():IHabboLocalizationManager;
        function get assets():IAssetLibrary;
        function get myName():String;
        function buildXmlWindow(_arg_1:String, _arg_2:uint=1):IWindow;
        function checkName(_arg_1:String):void;
        function changeName(_arg_1:String):void;
        function showView():void;
        function hideView():void;
    }
}
