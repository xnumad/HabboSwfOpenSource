//com.sulake.habbo.avatareditor.view.Outfit

package com.sulake.habbo.avatareditor.view{
    import starling.events.EventDispatcher;

    public class Outfit extends EventDispatcher {

        private var _isClubLayout:Boolean;
        private var _figure:String;
        private var _gender:String;
        private var _slotId:int;
        private var _saveMode:Boolean;

        public function Outfit(k:Boolean, _arg_2:String, _arg_3:String, _arg_4:int);

        public function get isClubLayout():Boolean;

        public function get figure():String;

        public function get gender():String;

        public function get slotId():int;

        public function set figure(k:String):void;

        public function set gender(k:String):void;

        public function get saveMode():Boolean;

        public function set saveMode(k:Boolean):void;


    }
}//package com.sulake.habbo.avatareditor.view

