package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfostandUpdateEvent;

    public class PetInfoData 
    {
        public var age:int = 0;
        public var rarityLevel:int = 0;
        public var _Str_5114:Boolean = false;
        public var energy:int = 0;
        public var maximumEnergy:int = 0;
        public var experience:int = 0;
        public var levelExperienceGoal:int = 0;
        public var id:int = 0;
        public var _Str_5175:Boolean = false;
        public var level:int = 0;
        public var maximumLevel:int = 0;
        public var name:String = "";
        public var happyness:int = 0;
        public var maximumHappyness:int = 0;
        public var ownerId:int = 0;
        public var ownerName:String = "";
        public var _Str_14767:int = 0;
        public var respect:int = 0;
        public var _Str_2985:int = 0;
        public var _Str_4355:int = 0;
        public var saddle:Boolean = false;
        public var rider:Boolean = false;
        public var breedable:Boolean = false;
        public var fullyGrown:Boolean = false;
        public var dead:Boolean = false;
        public var _Str_3307:Array;
        public var publiclyRideable:int = 0;
        public var maximumTimeToLive:int = 0;
        public var remainingTimeToLive:int = 0;
        public var remainingGrowTime:int = 0;
        public var publiclyBreedable:Boolean = false;

        public function PetInfoData()
        {
            this._Str_3307 = [];
            super();
        }

        public function populate(k:RoomWidgetPetInfostandUpdateEvent):void
        {
            this.age = k.age;
            this.rarityLevel = k.rarityLevel;
            this._Str_5114 = k._Str_5114;
            this.energy = k.energy;
            this.maximumEnergy = k.maximumEnergy;
            this.experience = k.experience;
            this.levelExperienceGoal = k.levelExperienceGoal;
            this.id = k.id;
            this._Str_5175 = k._Str_5175;
            this.level = k.level;
            this.maximumLevel = k.maximumLevel;
            this.name = k.name;
            this.happyness = k.happyness;
            this.maximumHappyness = k.maximumHappyness;
            this.ownerId = k.ownerId;
            this.ownerName = k.ownerName;
            this._Str_14767 = k._Str_14767;
            this.respect = k.respect;
            this._Str_2985 = k._Str_2985;
            this._Str_4355 = k._Str_4355;
            this.saddle = k.saddle;
            this.rider = k.rider;
            this.breedable = k.breedable;
            this.dead = k.dead;
            this.fullyGrown = k.fullyGrown;
            this._Str_3307 = k._Str_3307;
            this.publiclyRideable = k.publiclyRideable;
            this.maximumTimeToLive = k.maximumTimeToLive;
            this.remainingTimeToLive = k.remainingTimeToLive;
            this.remainingGrowTime = k.remainingGrowTime;
            this.publiclyBreedable = k.publiclyBreedable;
        }
    }
}
