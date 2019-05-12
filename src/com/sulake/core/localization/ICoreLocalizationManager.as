package com.sulake.core.localization
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public interface ICoreLocalizationManager extends IUnknown 
    {
        function registerListener(_arg_1:String, _arg_2:ILocalizable):Boolean;
        function removeListener(_arg_1:String, _arg_2:ILocalizable):Boolean;
        function loadLocalizationFromURL(_arg_1:String):void;
        function hasLocalization(_arg_1:String):Boolean;
        function getLocalization(_arg_1:String, _arg_2:String=""):String;
        function updateLocalization(_arg_1:String, _arg_2:String):void;
        function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):String;
        function getLocalizationRaw(_arg_1:String):ILocalization;
        function getKeys():Array;
        function registerLocalizationDefinition(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String):void;
        function activateLocalizationDefinition(_arg_1:String):Boolean;
        function getLocalizationDefinitions():Map;
        function getLocalizationDefinition(_arg_1:String):ILocalizationDefinition;
        function getActiveLocalizationDefinition():ILocalizationDefinition;
        function printNonExistingKeys():void;
    }
}
