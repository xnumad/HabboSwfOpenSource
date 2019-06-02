//com.sulake.habbo.session.PetInfo

package com.sulake.habbo.session{
    public class PetInfo implements IPetInfo {

        private var _petId:int;
        private var _level:int;
        private var _levelMax:int;
        private var _experience:int;
        private var _experienceMax:int;
        private var _energy:int;
        private var _energyMax:int;
        private var _nutrition:int;
        private var _nutritionMax:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _respect:int;
        private var _age:int;
        private var _breedId:int;
        private var _hasFreeSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _skillTresholds:Array;
        private var _accessRights:int;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _maxWellBeingSeconds:int;
        private var _remainingWellBeingSeconds:int;
        private var _remainingGrowingSeconds:int;
        private var _rarityLevel:int;
        private var _hasBreedingPermission:Boolean;
        private var _adultLevel:int;

        public function PetInfo();

        public function get petId():int;

        public function get level():int;

        public function get levelMax():int;

        public function get experience():int;

        public function get experienceMax():int;

        public function get energy():int;

        public function get energyMax():int;

        public function get nutrition():int;

        public function get nutritionMax():int;

        public function get ownerId():int;

        public function get ownerName():String;

        public function get respect():int;

        public function get age():int;

        public function get breedId():int;

        public function get hasFreeSaddle():Boolean;

        public function get isRiding():Boolean;

        public function get skillTresholds():Array;

        public function get accessRights():int;

        public function get canBreed():Boolean;

        public function get canHarvest():Boolean;

        public function get canRevive():Boolean;

        public function get rarityLevel():int;

        public function set petId(k:int):void;

        public function set level(k:int):void;

        public function set levelMax(k:int):void;

        public function set experience(k:int):void;

        public function set experienceMax(k:int):void;

        public function set energy(k:int):void;

        public function set energyMax(k:int):void;

        public function set nutrition(k:int):void;

        public function set nutritionMax(k:int):void;

        public function set ownerId(k:int):void;

        public function set ownerName(k:String):void;

        public function set respect(k:int):void;

        public function set age(k:int):void;

        public function set breedId(k:int):void;

        public function set hasFreeSaddle(k:Boolean):void;

        public function set isRiding(k:Boolean):void;

        public function set skillTresholds(k:Array):void;

        public function set accessRights(k:int):void;

        public function set canBreed(k:Boolean):void;

        public function set canHarvest(k:Boolean):void;

        public function set canRevive(k:Boolean):void;

        public function get maxWellBeingSeconds():int;

        public function set maxWellBeingSeconds(k:int):void;

        public function get remainingWellBeingSeconds():int;

        public function set remainingWellBeingSeconds(k:int):void;

        public function get remainingGrowingSeconds():int;

        public function set remainingGrowingSeconds(k:int):void;

        public function set rarityLevel(k:int):void;

        public function get hasBreedingPermission():Boolean;

        public function set hasBreedingPermission(k:Boolean):void;

        public function get adultLevel():int;


    }
}//package com.sulake.habbo.session

