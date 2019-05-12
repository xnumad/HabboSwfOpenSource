package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7533 implements IMessageParser 
    {
        private var _id:int;
        private var _name:String;
        private var _level:int;
        private var _maximumLevel:int;
        private var _experience:int;
        private var _energy:int;
        private var _happyness:int;
        private var _levelExperienceGoal:int;
        private var _maximumEnergy:int;
        private var _maximumHappyness:int;
        private var _respect:int;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _age:int;
        private var _rarityLevel:int;
        private var _saddle:Boolean;
        private var _rider:Boolean;
        private var _breedable:Boolean;
        private var _fullyGrown:Boolean;
        private var _dead:Boolean;
        private var _maximumTimeToLive:int;
        private var _remainingTimeToLive:int;
        private var _remainingGrowTime:int;
        private var _Str_4460:Array;
        private var _publiclyRideable:int;
        private var _unknownRarity:int;
        private var _publiclyBreedable:Boolean;


        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
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

        public function get energy():int
        {
            return this._energy;
        }

        public function get happyness():int
        {
            return this._happyness;
        }

        public function get levelExperienceGoal():int
        {
            return this._levelExperienceGoal;
        }

        public function get maximumEnergy():int
        {
            return this._maximumEnergy;
        }

        public function get maximumHappyness():int
        {
            return this._maximumHappyness;
        }

        public function get respect():int
        {
            return this._respect;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get age():int
        {
            return this._age;
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
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

        public function get maximumTimeToLive():int
        {
            return this._maximumTimeToLive;
        }

        public function get remainingTimeToLive():int
        {
            return this._remainingTimeToLive;
        }

        public function get remainingGrowTime():int
        {
            return this._remainingGrowTime;
        }

        public function get _Str_3307():Array
        {
            return this._Str_4460;
        }

        public function get publiclyRideable():int
        {
            return this._publiclyRideable;
        }

        public function get unknownRarity():int
        {
            return this._unknownRarity;
        }

        public function get publiclyBreedable():Boolean
        {
            return this._publiclyBreedable;
        }

        public function flush():Boolean
        {
            this._id = -1;
            this._Str_4460 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._id = k.readInteger();
            this._name = k.readString();
            this._level = k.readInteger();
            this._maximumLevel = k.readInteger();
            this._experience = k.readInteger();
            this._levelExperienceGoal = k.readInteger();
            this._energy = k.readInteger();
            this._maximumEnergy = k.readInteger();
            this._happyness = k.readInteger();
            this._maximumHappyness = k.readInteger();
            this._respect = k.readInteger();
            this._ownerId = k.readInteger();
            this._age = k.readInteger();
            this._ownerName = k.readString();
            this._rarityLevel = k.readInteger();
            this._saddle = k.readBoolean();
            this._rider = k.readBoolean();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_4460.push(k.readInteger());
                _local_3++;
            }
            this._Str_4460.sort(Array.NUMERIC);
            this._publiclyRideable = k.readInteger();
            this._breedable = k.readBoolean();
            this._fullyGrown = k.readBoolean();
            this._dead = k.readBoolean();
            this._unknownRarity = k.readInteger();
            this._maximumTimeToLive = k.readInteger();
            this._remainingTimeToLive = k.readInteger();
            this._remainingGrowTime = k.readInteger();
            this._publiclyBreedable = k.readBoolean();
            return true;
        }
    }
}
