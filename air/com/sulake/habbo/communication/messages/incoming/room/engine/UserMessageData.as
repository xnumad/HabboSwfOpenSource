//com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    public class UserMessageData {

        public static const USER_SEX_MALE:String;
        public static const USER_SEX_FEMALE:String;

        private var _roomIndex:int;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int;
        private var _name:String;
        private var _userType:int;
        private var _sex:String;
        private var _figure:String;
        private var _custom:String;
        private var _achievementScore:int;
        private var _webID:int;
        private var _groupID:String;
        private var _groupStatus:int;
        private var _groupName:String;
        private var _subType:String;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _rarityLevel:int;
        private var _hasSaddle:Boolean;
        private var _isRiding:Boolean;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;
        private var _petLevel:int;
        private var _petPosture:String;
        private var _botSkills:Array;
        private var _isModerator:Boolean;
        private var _isReadOnly:Boolean;

        public function UserMessageData(k:int);

        public function setReadOnly():void;

        public function get roomIndex():int;

        public function get x():Number;

        public function set x(k:Number):void;

        public function get y():Number;

        public function set y(k:Number):void;

        public function get z():Number;

        public function set z(k:Number):void;

        public function get dir():int;

        public function set dir(k:int):void;

        public function get name():String;

        public function set name(k:String):void;

        public function get userType():int;

        public function set userType(k:int):void;

        public function get sex():String;

        public function set sex(k:String):void;

        public function get figure():String;

        public function set figure(k:String):void;

        public function get custom():String;

        public function set custom(k:String):void;

        public function get achievementScore():int;

        public function set achievementScore(k:int):void;

        public function get webID():int;

        public function set webID(k:int):void;

        public function get groupID():String;

        public function set groupID(k:String):void;

        public function get groupName():String;

        public function set groupName(k:String):void;

        public function get groupStatus():int;

        public function set groupStatus(k:int):void;

        public function get subType():String;

        public function set subType(k:String):void;

        public function get ownerId():int;

        public function set ownerId(k:int):void;

        public function get ownerName():String;

        public function set ownerName(k:String):void;

        public function get rarityLevel():int;

        public function set rarityLevel(k:int):void;

        public function get hasSaddle():Boolean;

        public function set hasSaddle(k:Boolean):void;

        public function get isRiding():Boolean;

        public function set isRiding(k:Boolean):void;

        public function get canBreed():Boolean;

        public function set canBreed(k:Boolean):void;

        public function get canHarvest():Boolean;

        public function set canHarvest(k:Boolean):void;

        public function get canRevive():Boolean;

        public function set canRevive(k:Boolean):void;

        public function get hasBreedingPermission():Boolean;

        public function set hasBreedingPermission(k:Boolean):void;

        public function get petLevel():int;

        public function set petLevel(k:int):void;

        public function get petPosture():String;

        public function set petPosture(k:String):void;

        public function get botSkills():Array;

        public function set botSkills(k:Array):void;

        public function get isModerator():Boolean;

        public function set isModerator(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

