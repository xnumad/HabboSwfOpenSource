//com.sulake.core.localization.LocalizationDefinition

package com.sulake.core.localization{
    public class LocalizationDefinition implements ILocalizationDefinition {

        private var _languageCode:String;
        private var _countryCode:String;
        private var _encoding:String;
        private var _name:String;
        private var _url:String;

        public function LocalizationDefinition(k:String, _arg_2:String, _arg_3:String);

        public function get id():String;

        public function get languageCode():String;

        public function get countryCode():String;

        public function get encoding():String;

        public function get name():String;

        public function get url():String;


    }
}//package com.sulake.core.localization

