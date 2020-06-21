package com.sulake.habbo.session
{
    public class RoomUserData
    {
        private var _roomObjectId:int = -1;
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
        private var _petLevel:int = 0;
        private var _rarityLevel:int = 0;
        private var _hasSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;
        private var _botSkills:Array;
        private var _botSkillData:Array;
        private var _isModerator:Boolean;

        public function RoomUserData(k:int)
        {
            this._roomObjectId = k;
        }

        public function get roomObjectId():int
        {
            return this._roomObjectId;
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

        public function get sex():String
        {
            return this._sex;
        }

        public function set sex(k:String):void
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

        public function get groupID():String
        {
            return this._groupID;
        }

        public function set groupID(k:String):void
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

        public function get groupStatus():int
        {
            return this._groupStatus;
        }

        public function set groupStatus(k:int):void
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

        public function get hasSaddle():Boolean
        {
            return this._hasSaddle;
        }

        public function set hasSaddle(k:Boolean):void
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
            return this._canRevive;
        }

        public function set canRevive(k:Boolean):void
        {
            this._canRevive = k;
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._hasBreedingPermission;
        }

        public function set hasBreedingPermission(k:Boolean):void
        {
            this._hasBreedingPermission = k;
        }

        public function get petLevel():int
        {
            return this._petLevel;
        }

        public function set petLevel(k:int):void
        {
            this._petLevel = k;
        }

        public function get botSkills():Array
        {
            return this._botSkills;
        }

        public function set botSkills(k:Array):void
        {
            this._botSkills = k;
        }

        public function get botSkillData():Array
        {
            return this._botSkillData;
        }

        public function set botSkillData(k:Array):void
        {
            this._botSkillData = k;
        }

        public function get isModerator():Boolean
        {
            return this._isModerator;
        }

        public function set isModerator(k:Boolean):void
        {
            this._isModerator = k;
        }
    }
}
