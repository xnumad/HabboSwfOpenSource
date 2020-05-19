package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class UserMessageData 
    {
        public static const USER_SEX_MALE:String = "M";
        public static const USER_SEX_FEMALE:String = "F";

        private var _roomIndex:int = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int = 0;
        private var _name:String = "";
        private var _userType:int = 0;
        private var _sex:String = "";
        private var _figure:String = "";
        private var _custom:String = "";
        private var _activityPoints:int;
        private var _id:int = 0;
        private var _groupID:String = "";
        private var _groupStatus:int = 0;
        private var _groupName:String = "";
        private var _subType:String = "";
        private var _ownerId:int = 0;
        private var _ownerName:String;
        private var _rarityLevel:int;
        private var _hasSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;
        private var _petLevel:int = 0;
        private var _petPosture:String = "";
        private var _botSkills:Array;
        private var _isModerator:Boolean;
        private var _isReadOnly:Boolean = false;

        public function UserMessageData(k:int)
        {
            this._roomIndex = k;
        }

        public function setReadOnly():void
        {
            this._isReadOnly = true;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function set x(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._x = k;
            }
        }

        public function get y():Number
        {
            return this._y;
        }

        public function set y(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._y = k;
            }
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set z(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._z = k;
            }
        }

        public function get dir():int
        {
            return this._dir;
        }

        public function set dir(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._dir = k;
            }
        }

        public function get name():String
        {
            return this._name;
        }

        public function set name(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._name = k;
            }
        }

        public function get userType():int
        {
            return this._userType;
        }

        public function set userType(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._userType = k;
            }
        }

        public function get sex():String
        {
            return this._sex;
        }

        public function set sex(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._sex = k;
            }
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function set figure(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._figure = k;
            }
        }

        public function get custom():String
        {
            return this._custom;
        }

        public function set custom(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._custom = k;
            }
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function set activityPoints(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._activityPoints = k;
            }
        }

        public function get id():int
        {
            return this._id;
        }

        public function set id(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._id = k;
            }
        }

        public function get groupID():String
        {
            return this._groupID;
        }

        public function set groupID(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._groupID = k;
            }
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function set groupName(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._groupName = k;
            }
        }

        public function get groupStatus():int
        {
            return this._groupStatus;
        }

        public function set groupStatus(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._groupStatus = k;
            }
        }

        public function get subType():String
        {
            return this._subType;
        }

        public function set subType(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._subType = k;
            }
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._ownerId = k;
            }
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._ownerName = k;
            }
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function set rarityLevel(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._rarityLevel = k;
            }
        }

        public function get hasSaddle():Boolean
        {
            return this._hasSaddle;
        }

        public function set hasSaddle(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._hasSaddle = k;
            }
        }

        public function get isRiding():Boolean
        {
            return this._isRiding;
        }

        public function set isRiding(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._isRiding = k;
            }
        }

        public function get canBreed():Boolean
        {
            return this._canBreed;
        }

        public function set canBreed(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._canBreed = k;
            }
        }

        public function get canHarvest():Boolean
        {
            return this._canHarvest;
        }

        public function set canHarvest(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._canHarvest = k;
            }
        }

        public function get canRevive():Boolean
        {
            return this._canRevive;
        }

        public function set canRevive(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._canRevive = k;
            }
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._hasBreedingPermission;
        }

        public function set hasBreedingPermission(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._hasBreedingPermission = k;
            }
        }

        public function get petLevel():int
        {
            return this._petLevel;
        }

        public function set petLevel(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._petLevel = k;
            }
        }

        public function get petPosture():String
        {
            return this._petPosture;
        }

        public function set petPosture(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._petPosture = k;
            }
        }

        public function get botSkills():Array
        {
            return this._botSkills;
        }

        public function set botSkills(k:Array):void
        {
            this._botSkills = k;
        }

        public function get isModerator():Boolean
        {
            return this._isModerator;
        }

        public function set isModerator(k:Boolean):void
        {
            if (!this._isReadOnly)
            {
                this._isModerator = k;
            }
        }
    }
}
