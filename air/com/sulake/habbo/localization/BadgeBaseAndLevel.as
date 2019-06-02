//com.sulake.habbo.localization.BadgeBaseAndLevel

package com.sulake.habbo.localization{
    public class BadgeBaseAndLevel {

        private var _base:String;
        private var _level:int;

        public function BadgeBaseAndLevel(k:String);

        private function isNumber(k:String):Boolean;

        public function get base():String;

        public function get level():int;

        public function set level(k:int):void;

        public function get badgeId():String;


    }
}//package com.sulake.habbo.localization

