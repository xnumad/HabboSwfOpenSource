//com.sulake.habbo.session.IPetInfo

package com.sulake.habbo.session{
    public /*dynamic*/ interface IPetInfo {

        function get petId():int;
        function get level():int;
        function get levelMax():int;
        function get experience():int;
        function get experienceMax():int;
        function get energy():int;
        function get energyMax():int;
        function get nutrition():int;
        function get nutritionMax():int;
        function get ownerId():int;
        function get ownerName():String;
        function get respect():int;
        function get age():int;
        function get breedId():int;
        function get hasFreeSaddle():Boolean;
        function get isRiding():Boolean;
        function get canBreed():Boolean;
        function get canHarvest():Boolean;
        function get canRevive():Boolean;
        function get rarityLevel():int;
        function get skillTresholds():Array;
        function get accessRights():int;
        function get maxWellBeingSeconds():int;
        function get remainingWellBeingSeconds():int;
        function get remainingGrowingSeconds():int;
        function get hasBreedingPermission():Boolean;
        function get adultLevel():int;

    }
}//package com.sulake.habbo.session

