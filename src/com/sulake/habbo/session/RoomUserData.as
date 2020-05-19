package com.sulake.habbo.session
{
    public class RoomUserData
    {
        private var _Str_11596:int = -1;
        private var _name:String = "";
        private var _type:int = 0;
        private var _sex:String = "";
        private var _figure:String = "";
        private var _custom:String = "";
        private var _activityPoints:int;
        private var _id:int = 0;
        private var _groupID:String = "";
        private var _groupStatus:int = 0;
        private var _groupName:String = "";
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _Str_12413:int = 0;
        private var _rarityLevel:int = 0;
        private var _hasSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _Str_3284:Boolean;
        private var _Str_3095:Boolean;
        private var _Str_3986:Array;
        private var _Str_20085:Array;
        private var _Str_9831:Boolean;

        public function RoomUserData(k:int)
        {
            this._Str_11596 = k;
        }

        public function get _Str_2713():int
        {
            return this._Str_11596;
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function set activityPoints(k:int):void
        {
            this._activityPoints = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get type():int
        {
            return this._type;
        }

        public function set type(k:int):void
        {
            this._type = k;
        }

        public function get _Str_3344():String
        {
            return this._sex;
        }

        public function set _Str_3344(k:String):void
        {
            this._sex = k;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function set figure(k:String):void
        {
            this._figure = k;
        }

        public function get custom():String
        {
            return this._custom;
        }

        public function set custom(k:String):void
        {
            this._custom = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get _Str_4592():String
        {
            return this._groupID;
        }

        public function set _Str_4592(k:String):void
        {
            this._groupID = k;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function set groupName(k:String):void
        {
            this._groupName = k;
        }

        public function get _Str_7043():int
        {
            return this._groupStatus;
        }

        public function set _Str_7043(k:int):void
        {
            this._groupStatus = k;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function set rarityLevel(k:int):void
        {
            this._rarityLevel = k;
        }

        public function get _Str_4799():Boolean
        {
            return this._hasSaddle;
        }

        public function set _Str_4799(k:Boolean):void
        {
            this._hasSaddle = k;
        }

        public function get isRiding():Boolean
        {
            return this._isRiding;
        }

        public function set isRiding(k:Boolean):void
        {
            this._isRiding = k;
        }

        public function get canBreed():Boolean
        {
            return this._canBreed;
        }

        public function set canBreed(k:Boolean):void
        {
            this._canBreed = k;
        }

        public function get canHarvest():Boolean
        {
            return this._canHarvest;
        }

        public function set canHarvest(k:Boolean):void
        {
            this._canHarvest = k;
        }

        public function get canRevive():Boolean
        {
            return this._Str_3284;
        }

        public function set canRevive(k:Boolean):void
        {
            this._Str_3284 = k;
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._Str_3095;
        }

        public function set hasBreedingPermission(k:Boolean):void
        {
            this._Str_3095 = k;
        }

        public function get _Str_3897():int
        {
            return this._Str_12413;
        }

        public function set _Str_3897(k:int):void
        {
            this._Str_12413 = k;
        }

        public function get _Str_2899():Array
        {
            return this._Str_3986;
        }

        public function set _Str_2899(k:Array):void
        {
            this._Str_3986 = k;
        }

        public function get _Str_7594():Array
        {
            return this._Str_20085;
        }

        public function set _Str_7594(k:Array):void
        {
            this._Str_20085 = k;
        }

        public function get isModerator():Boolean
        {
            return this._Str_9831;
        }

        public function set isModerator(k:Boolean):void
        {
            this._Str_9831 = k;
        }
    }
}
