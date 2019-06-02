//com.sulake.habbo.communication.messages.parser.inventory.pets.PetData

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetData {

        private var _id:int;
        private var _name:String;
        private var _figureData:PetFigureData;
        private var _level:int;

        public function PetData(k:IMessageDataWrapper);

        public function get id():int;

        public function get name():String;

        public function get typeId():int;

        public function get paletteId():int;

        public function get color():String;

        public function get breedId():int;

        public function get customPartCount():int;

        public function get figureString():String;

        public function get figureData():PetFigureData;

        public function get level():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

