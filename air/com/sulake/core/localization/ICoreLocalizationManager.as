//com.sulake.core.localization.ICoreLocalizationManager

package com.sulake.core.localization{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface ICoreLocalizationManager extends IUnknown {

        function registerListener(k:String, _arg_2:ILocalizable):Boolean;
        function removeListener(k:String, _arg_2:ILocalizable):Boolean;
        function loadLocalizationFromURL(k:String):void;
        function hasLocalization(k:String):Boolean;
        function getLocalization(k:String, _arg_2:String=""):String;
        function updateLocalization(k:String, _arg_2:String):void;
        function registerParameter(k:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):String;
        function getLocalizationRaw(k:String):ILocalization;
        function getKeys():Array;
        function registerLocalizationDefinition(k:String, _arg_2:String, _arg_3:String, _arg_4:String):void;
        function activateLocalizationDefinition(k:String):Boolean;
        function getLocalizationDefinitions():Map;
        function getLocalizationDefinition(k:String):ILocalizationDefinition;
        function getActiveLocalizationDefinition():ILocalizationDefinition;
        function printNonExistingKeys():void;

    }
}//package com.sulake.core.localization

