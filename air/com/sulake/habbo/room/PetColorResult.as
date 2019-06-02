//com.sulake.habbo.room.PetColorResult

package com.sulake.habbo.room{
    public class PetColorResult {

        private static const COLOR_TAGS:Array;

        private var _breed:int;
        private var _tag:String;
        private var _id:String;
        private var _primaryColor:int;
        private var _secondaryColor:int;
        private var _isMaster:Boolean;
        private var _layerTags:Array;

        public function PetColorResult(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean, _arg_7:Array);

        public function get primaryColor():int;

        public function get secondaryColor():int;

        public function get breed():int;

        public function get tag():String;

        public function get id():String;

        public function get isMaster():Boolean;

        public function get layerTags():Array;


    }
}//package com.sulake.habbo.room

