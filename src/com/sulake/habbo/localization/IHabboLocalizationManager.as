package com.sulake.habbo.localization
{
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public interface IHabboLocalizationManager extends ICoreLocalizationManager, IUnknown 
    {
        function getLocalizationWithParams(_arg_1:String, _arg_2:String="", ... _args):String;
        function _Str_21551(_arg_1:String, _arg_2:String="", _arg_3:Map=null):String;
        function _Str_18132(_arg_1:String):String;
        function _Str_23690(_arg_1:String, _arg_2:int):String;
        function _Str_16142(_arg_1:String):String;
        function _Str_21634(_arg_1:String):String;
        function getBadgeName(_arg_1:String):String;
        function getBadgeDesc(_arg_1:String):String;
        function _Str_20202(_arg_1:String, _arg_2:int):void;
        function _Str_18179(_arg_1:String):String;
    }
}
