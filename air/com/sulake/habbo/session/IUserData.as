//com.sulake.habbo.session.IUserData

package com.sulake.habbo.session{
    public /*dynamic*/ interface IUserData {

        function get roomObjectId():int;
        function get name():String;
        function get sortableName():String;
        function get custom():String;
        function get achievementScore():int;
        function get type():int;
        function get figure():String;
        function get sex():String;
        function get groupID():String;
        function get groupStatus():int;
        function get groupName():String;
        function get webID():int;
        function get ownerId():int;
        function get ownerName():String;
        function get rarityLevel():int;
        function get hasSaddle():Boolean;
        function get isRiding():Boolean;
        function get canBreed():Boolean;
        function get canHarvest():Boolean;
        function get canRevive():Boolean;
        function get hasBreedingPermission():Boolean;
        function get petLevel():int;
        function get botSkills():Array;
        function get isModerator():Boolean;
        function set figure(k:String):void;
        function set name(k:String):void;
        function set sex(k:String):void;
        function set custom(k:String):void;
        function set achievementScore(k:int):void;
        function set groupID(k:String):void;
        function set groupName(k:String):void;
        function set ownerId(k:int):void;
        function set ownerName(k:String):void;
        function set rarityLevel(k:int):void;
        function set hasSaddle(k:Boolean):void;
        function set isRiding(k:Boolean):void;
        function set canBreed(k:Boolean):void;
        function set canHarvest(k:Boolean):void;
        function set canRevive(k:Boolean):void;
        function set hasBreedingPermission(k:Boolean):void;
        function set petLevel(k:int):void;
        function set botSkills(k:Array):void;
        function set isModerator(k:Boolean):void;

    }
}//package com.sulake.habbo.session

