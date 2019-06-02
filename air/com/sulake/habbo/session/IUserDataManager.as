//com.sulake.habbo.session.IUserDataManager

package com.sulake.habbo.session{
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface IUserDataManager {

        function setUserData(k:IUserData):void;
        function getUserData(k:int):IUserData;
        function getUserDataByType(k:int, _arg_2:int):IUserData;
        function getUserDataByIndex(k:int):IUserData;
        function getUserDataByName(k:String):IUserData;
        function getUserBadges(k:int):Array;
        function removeUserDataByRoomIndex(k:int):void;
        function setUserBadges(k:int, _arg_2:Array):void;
        function updateFigure(k:int, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean):void;
        function updatePetLevel(k:int, _arg_2:int):void;
        function updatePetBreedingStatus(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean):void;
        function updateCustom(k:int, _arg_2:String):void;
        function updateAchievementScore(k:int, _arg_2:int):void;
        function updateNameByIndex(k:int, _arg_2:String):void;
        function getPetUserData(k:int):IUserData;
        function getRentableBotUserData(k:int):IUserData;
        function requestPetInfo(k:int):void;
        function getAllUsers():Vector.<IUserData>;
        function userHistory():Vector.<IUserData>;

    }
}//package com.sulake.habbo.session

