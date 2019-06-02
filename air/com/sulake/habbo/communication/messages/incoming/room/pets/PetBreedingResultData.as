//com.sulake.habbo.communication.messages.incoming.room.pets.PetBreedingResultData

package com.sulake.habbo.communication.messages.incoming.room.pets{
    public class PetBreedingResultData {

        private var _stuffId:int;
        private var _classId:int;
        private var _productCode:String;
        private var _userId:int;
        private var _userName:String;
        private var _rarityLevel:int;
        private var _hasMutation:Boolean;

        public function PetBreedingResultData(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:Boolean);

        public function get stuffId():int;

        public function get classId():int;

        public function get productCode():String;

        public function get userId():int;

        public function get userName():String;

        public function get rarityLevel():int;

        public function get hasMutation():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

