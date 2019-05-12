package com.sulake.core.localization
{
    public class LocalizationDefinition implements ILocalizationDefinition 
    {
        private var _languageCode:String;
        private var _countryCode:String;
        private var _encoding:String;
        private var _name:String;
        private var _url:String;

        public function LocalizationDefinition(definition:String, name:String, url:String)
        {
            var values:Array = definition.split("_");
            this._languageCode = values[0];
            var lanEncode:Array = String(values[1]).split(".");
            this._countryCode = lanEncode[0];
            this._encoding = lanEncode[1];
            this._name = name;
            this._url = url;
        }

        public function get id():String
        {
            return (((this._languageCode + "_") + this._countryCode) + ".") + this._encoding;
        }

        public function get languageCode():String
        {
            return this._languageCode;
        }

        public function get countryCode():String
        {
            return this._countryCode;
        }

        public function get encoding():String
        {
            return this._encoding;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get url():String
        {
            return this._url;
        }
    }
}
