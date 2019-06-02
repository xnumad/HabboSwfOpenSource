//com.sulake.habbo.avatar.pets.PetFigureData

package com.sulake.habbo.avatar.pets{
    public class PetFigureData {

        private var _typeId:int;
        private var _paletteId:int;
        private var _color:int;
        private var _customParts:Array;
        private var _customLayerIds:Array;
        private var _customPartIds:Array;
        private var _customPaletteIds:Array;
        private var _headOnly:Boolean;

        public function PetFigureData(k:String);

        public function get typeId():int;

        public function get paletteId():int;

        public function get color():int;

        public function get customLayerIds():Array;

        public function get customPartIds():Array;

        public function get customPaletteIds():Array;

        public function get customParts():Array;

        public function getCustomPart(k:int):PetCustomPart;

        public function get hasCustomParts():Boolean;

        public function get headOnly():Boolean;

        public function get figureString():String;

        private function getCustomData(k:String):Array;

        private function getCustomLayerIds(k:Array):Array;

        private function getCustomPartIds(k:Array):Array;

        private function getCustomPaletteIds(k:Array):Array;

        private function getTypeId(k:String):int;

        private function getPaletteId(k:String):int;

        private function getColor(k:String):int;

        private function getHeadOnly(k:String):Boolean;


    }
}//package com.sulake.habbo.avatar.pets

