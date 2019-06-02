//com.sulake.habbo.avatar.structure.parts.PartDefinition

package com.sulake.habbo.avatar.structure.parts{
    public class PartDefinition {

        private var _setType:String;
        private var _flippedSetType:String;
        private var _removeSetType:String;
        private var _appendToFigure:Boolean;
        private var _staticId:int;

        public function PartDefinition(k:XML);

        public function hasStaticId():Boolean;

        public function get staticId():int;

        public function set staticId(k:int):void;

        public function get setType():String;

        public function get flippedSetType():String;

        public function get removeSetType():String;

        public function get appendToFigure():Boolean;

        public function set appendToFigure(k:Boolean):void;

        public function set flippedSetType(k:String):void;


    }
}//package com.sulake.habbo.avatar.structure.parts

