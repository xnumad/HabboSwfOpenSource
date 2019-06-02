package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetPetInfostandUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const PET_INFO:String = "RWPIUE_PET_INFO";

        private var _level:int;
        private var _maximumLevel:int;
        private var _experience:int;
        private var _levelExperienceGoal:int;
        private var _energy:int;
        private var _maximumEnergy:int;
        private var _happyness:int;
        private var _maximumHappyness:int;
        private var _Str_3973:int;
        private var _respect:int;
        private var _age:int;
        private var _name:String;
        private var _id:int;
        private var _image:BitmapData;
        private var _Str_6689:int;
        private var _Str_20932:int;
        private var _Str_10121:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _Str_11149:Boolean;
        private var _Str_2775:int;
        private var _unknownRarityLevel:int;
        private var _saddle:Boolean;
        private var _rider:Boolean;
        private var _breedable:Boolean;
        private var _Str_4460:Array;
        private var _publiclyRideable:int;
        private var _fullyGrown:Boolean;
        private var _dead:Boolean;
        private var _rarityLevel:int;
        private var _maximumTimeToLive:int;
        private var _remainingTimeToLive:int;
        private var _remainingGrowTime:int;
        private var _publiclyBreedable:Boolean;

        public function RoomWidgetPetInfostandUpdateEvent(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:BitmapData, _arg_6:Boolean, _arg_7:int, _arg_8:String, _arg_9:int, _arg_10:int, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            super(RoomWidgetPetInfostandUpdateEvent.PET_INFO, _arg_11, _arg_12);
            this._Str_6689 = k;
            this._Str_20932 = _arg_2;
            this._name = _arg_3;
            this._id = _arg_4;
            this._image = _arg_5;
            this._Str_10121 = _arg_6;
            this._ownerId = _arg_7;
            this._ownerName = _arg_8;
            this._Str_2775 = _arg_9;
            this._unknownRarityLevel = _arg_10;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_4355():int
        {
            return this._Str_6689;
        }

        public function get _Str_14767():int
        {
            return this._Str_20932;
        }

        public function get _Str_5175():Boolean
        {
            return this._Str_10121;
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
            return this._Str_11149;
        }

        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get age():int
        {
            return this._age;
        }

        public function get unknownRarityLevel():int
        {
            return this._unknownRarityLevel;
        }

        public function get saddle():Boolean
        {
            return this._saddle;
        }

        public function get rider():Boolean
        {
            return this._rider;
        }

        public function get breedable():Boolean
        {
            return this._breedable;
        }

        public function get fullyGrown():Boolean
        {
            return this._fullyGrown;
        }

        public function get dead():Boolean
        {
            return this._dead;
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function get _Str_3307():Array
        {
            return this._Str_4460;
        }

        public function get publiclyRideable():int
        {
            return this._publiclyRideable;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get maximumLevel():int
        {
            return this._maximumLevel;
        }

        public function get experience():int
        {
            return this._experience;
        }

        public function get levelExperienceGoal():int
        {
            return this._levelExperienceGoal;
        }

        public function get energy():int
        {
            return this._energy;
        }

        public function get maximumEnergy():int
        {
            return this._maximumEnergy;
        }

        public function get happyness():int
        {
            return this._happyness;
        }

        public function get maximumHappyness():int
        {
            return this._maximumHappyness;
        }

        public function get _Str_2985():int
        {
            return this._Str_3973;
        }

        public function get respect():int
        {
            return this._respect;
        }

        public function set level(k:int):void
        {
            this._level = k;
        }

        public function set maximumLevel(k:int):void
        {
            this._maximumLevel = k;
        }

        public function set experience(k:int):void
        {
            this._experience = k;
        }

        public function set levelExperienceGoal(k:int):void
        {
            this._levelExperienceGoal = k;
        }

        public function set energy(k:int):void
        {
            this._energy = k;
        }

        public function set maximumEnergy(k:int):void
        {
            this._maximumEnergy = k;
        }

        public function set happyness(k:int):void
        {
            this._happyness = k;
        }

        public function set maximumHappyness(k:int):void
        {
            this._maximumHappyness = k;
        }

        public function set _Str_2985(k:int):void
        {
            this._Str_3973 = k;
        }

        public function set _Str_5114(k:Boolean):void
        {
            this._Str_11149 = k;
        }

        public function set respect(k:int):void
        {
            this._respect = k;
        }

        public function set age(k:int):void
        {
            this._age = k;
        }

        public function set saddle(k:Boolean):void
        {
            this._saddle = k;
        }

        public function set rider(k:Boolean):void
        {
            this._rider = k;
        }

        public function set breedable(k:Boolean):void
        {
            this._breedable = k;
        }

        public function set _Str_3307(k:Array):void
        {
            this._Str_4460 = k;
        }

        public function set publiclyRideable(k:int):void
        {
            this._publiclyRideable = k;
        }

        public function set fullyGrown(k:Boolean):void
        {
            this._fullyGrown = k;
        }

        public function set dead(k:Boolean):void
        {
            this._dead = k;
        }

        public function set rarityLevel(k:int):void
        {
            this._rarityLevel = k;
        }

        public function get maximumTimeToLive():int
        {
            return this._maximumTimeToLive;
        }

        public function set maximumTimeToLive(k:int):void
        {
            this._maximumTimeToLive = k;
        }

        public function get remainingTimeToLive():int
        {
            return this._remainingTimeToLive;
        }

        public function set remainingTimeToLive(k:int):void
        {
            this._remainingTimeToLive = k;
        }

        public function get remainingGrowTime():int
        {
            return this._remainingGrowTime;
        }

        public function set remainingGrowTime(k:int):void
        {
            this._remainingGrowTime = k;
        }

        public function get publiclyBreedable():Boolean
        {
            return this._publiclyBreedable;
        }

        public function set publiclyBreedable(k:Boolean):void
        {
            this._publiclyBreedable = k;
        }
    }
}
