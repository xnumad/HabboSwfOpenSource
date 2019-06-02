//com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetFigureData {

        private var _typeId:int;
        private var _paletteId:int;
        private var _color:String;
        private var _breedId:int;
        private var _customPartCount:int;
        private var _customParts:Array;

        public function PetFigureData(k:IMessageDataWrapper);

        public function get typeId():int;

        public function get paletteId():int;

        public function get color():String;

        public function get breedId():int;

        public function get figureString():String;

        public function get customParts():Array;

        public function get customPartCount():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

