//com.sulake.core.localization.Localization

package com.sulake.core.localization{
    import flash.utils.Dictionary;

    public class Localization implements ILocalization {

        private var _value:String;
        private var _parameters:Dictionary;
        private var _listeners:Array;

        public function Localization(k:String=null);

        public function get isInitialized():Boolean;

        public function get value():String;

        public function get raw():String;

        public function setValue(k:String):void;

        public function registerListener(k:ILocalizable):void;

        public function removeListener(k:ILocalizable):void;

        public function registerParameter(k:String, _arg_2:String, _arg_3:String="%"):void;

        public function updateListeners():void;

        private function fillParameterValues():String;


    }
}//package com.sulake.core.localization

