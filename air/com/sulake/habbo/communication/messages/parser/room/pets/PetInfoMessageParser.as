//com.sulake.habbo.communication.messages.parser.room.pets.PetInfoMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetInfoMessageParser implements IMessageParser {

        private var _petId:int;
        private var _name:String;
        private var _level:int;
        private var _maxLevel:int;
        private var _experience:int;
        private var _energy:int;
        private var _nutrition:int;
        private var _experienceRequiredToLevel:int;
        private var _maxEnergy:int;
        private var _maxNutrition:int;
        private var _respect:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _age:int;
        private var _breedId:int;
        private var _hasFreeSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _maxWellBeingSeconds:int;
        private var _remainingWellBeingSeconds:int;
        private var _remainingGrowingSeconds:int;
        private var _skillTresholds:Array;
        private var _accessRights:int;
        private var _rarityLevel:int;
        private var _hasBreedingPermission:Boolean;

        public function PetInfoMessageParser();

        public function get petId():int;

        public function get name():String;

        public function get level():int;

        public function get maxLevel():int;

        public function get experience():int;

        public function get energy():int;

        public function get nutrition():int;

        public function get experienceRequiredToLevel():int;

        public function get maxEnergy():int;

        public function get maxNutrition():int;

        public function get respect():int;

        public function get ownerId():int;

        public function get ownerName():String;

        public function get age():int;

        public function get breedId():int;

        public function get hasFreeSaddle():Boolean;

        public function get isRiding():Boolean;

        public function get canBreed():Boolean;

        public function get canHarvest():Boolean;

        public function get canRevive():Boolean;

        public function get maxWellBeingSeconds():int;

        public function get remainingWellBeingSeconds():int;

        public function get remainingGrowingSeconds():int;

        public function get skillTresholds():Array;

        public function get accessRights():int;

        public function get rarityLevel():int;

        public function get hasBreedingPermission():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

