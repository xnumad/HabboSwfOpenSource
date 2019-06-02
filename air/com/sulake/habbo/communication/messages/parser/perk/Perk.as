//com.sulake.habbo.communication.messages.parser.perk.Perk

package com.sulake.habbo.communication.messages.parser.perk{
    public class Perk {

        private var _code:String;
        private var _isAllowed:Boolean;
        private var _errorMessage:String;

        public function Perk();

        public function get code():String;

        public function set code(k:String):void;

        public function get isAllowed():Boolean;

        public function set isAllowed(k:Boolean):void;

        public function get errorMessage():String;

        public function set errorMessage(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.parser.perk

