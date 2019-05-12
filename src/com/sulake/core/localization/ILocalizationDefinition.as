package com.sulake.core.localization
{
    public interface ILocalizationDefinition 
    {
        function get id():String;
        function get languageCode():String;
        function get countryCode():String;
        function get encoding():String;
        function get name():String;
        function get url():String;
    }
}
