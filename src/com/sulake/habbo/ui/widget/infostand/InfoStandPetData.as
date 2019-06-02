package com.sulake.habbo.ui.widget.infostand
{
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfostandUpdateEvent;

    public class InfoStandPetData 
    {
        private var _level:int;
        private var _levelMax:int;
        private var _experience:int;
        private var _experienceMax:int;
        private var _energy:int;
        private var _energyMax:int;
        private var _nutrition:int;
        private var _nutritionMax:int;
        private var _petRespect:int;
        private var _name:String = "";
        private var _petId:int = -1;
        private var _type:int;
        private var _race:int;
        private var _image:BitmapData;
        private var _isOwnPet:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _canRemovePet:Boolean;
        private var _roomIndex:int;
        private var _age:int;
        private var _breedId:int;
        private var _skillTresholds:Array;
        private var _accessRights:int;
        private var _rarityLevel:int;
        private var _hasBreedingPermission:Boolean;
        private var _maxWellBeingSeconds:int;
        private var _remainingWellBeingSeconds:int;
        private var _remainingGrowingSeconds:int;


        public function get name():String
        {
            return this._name;
        }

        public function get id():int
        {
            return this._petId;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get race():int
        {
            return this._race;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get _Str_5175():Boolean
        {
            return this._isOwnPet;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get _Str_5114():Boolean
        {
            return this._canRemovePet;
        }

        public function get age():int
        {
            return this._age;
        }

        public function get unknownRarityLevel():int
        {
            return this._breedId;
        }

        public function get _Str_3307():Array
        {
            return this._skillTresholds;
        }

        public function get publiclyRideable():int
        {
            return this._accessRights;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get _Str_4276():int
        {
            return this._levelMax;
        }

        public function get experience():int
        {
            return this._experience;
        }

        public function get _Str_4095():int
        {
            return this._experienceMax;
        }

        public function get energy():int
        {
            return this._energy;
        }

        public function get _Str_3966():int
        {
            return this._energyMax;
        }

        public function get happyness():int
        {
            return this._nutrition;
        }

        public function get _Str_4448():int
        {
            return this._nutritionMax;
        }

        public function get _Str_6943():int
        {
            return this._petRespect;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function get maximumTimeToLive():int
        {
            return this._maxWellBeingSeconds;
        }

        public function get remainingTimeToLive():int
        {
            return this._remainingWellBeingSeconds;
        }

        public function get remainingGrowTime():int
        {
            return this._remainingGrowingSeconds;
        }

        public function get publiclyBreedable():Boolean
        {
            return this._hasBreedingPermission;
        }

        public function _Str_5479(k:RoomWidgetPetInfostandUpdateEvent):void
        {
            this._name = k.name;
            this._petId = k.id;
            this._type = k._Str_4355;
            this._race = k._Str_14767;
            this._image = k.image;
            this._isOwnPet = k._Str_5175;
            this._ownerId = k.ownerId;
            this._ownerName = k.ownerName;
            this._canRemovePet = k._Str_5114;
            this._level = k.level;
            this._levelMax = k.maximumLevel;
            this._experience = k.experience;
            this._experienceMax = k.levelExperienceGoal;
            this._energy = k.energy;
            this._energyMax = k.maximumEnergy;
            this._nutrition = k.happyness;
            this._nutritionMax = k.maximumHappyness;
            this._petRespect = k.respect;
            this._roomIndex = k.roomIndex;
            this._age = k.age;
            this._breedId = k.unknownRarityLevel;
            this._skillTresholds = k._Str_3307;
            this._accessRights = k.publiclyRideable;
            this._maxWellBeingSeconds = k.maximumTimeToLive;
            this._remainingWellBeingSeconds = k.remainingTimeToLive;
            this._remainingGrowingSeconds = k.remainingGrowTime;
            this._rarityLevel = k.rarityLevel;
            this._hasBreedingPermission = k.publiclyBreedable;
        }
    }
}
