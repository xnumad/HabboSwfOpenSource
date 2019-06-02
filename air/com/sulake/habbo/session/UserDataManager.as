//com.sulake.habbo.session.UserDataManager

package com.sulake.habbo.session{
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.connection.IConnection;

    public class UserDataManager implements IUserDataManager {

        private static const TYPE_USER:int;
        private static const TYPE_PET:int;
        private static const TYPE_BOT:int;
        private static const TYPE_RENTABLE_BOT:int;

        private var _userDataByType:Map;
        private var _userDataByRoomIndex:Map;
        private var _userBadges:Map;
        private var _cachedUserIds:Vector.<IUserData>;
        private var _userHistory:Vector.<IUserData>;
        private var _connection:IConnection;

        public function UserDataManager();

        public function dispose():void;

        public function set connection(k:IConnection):void;

        public function getUserData(k:int):IUserData;

        public function getUserDataByType(k:int, _arg_2:int):IUserData;

        public function getUserDataByIndex(k:int):IUserData;

        public function getUserDataByName(k:String):IUserData;

        public function getUserBadges(k:int):Array;

        public function setUserData(k:IUserData):void;

        public function removeUserDataByRoomIndex(k:int):void;

        public function setUserBadges(k:int, _arg_2:Array):void;

        public function updateFigure(k:int, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean):void;

        public function updatePetLevel(k:int, _arg_2:int):void;

        public function updatePetBreedingStatus(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean):void;

        public function updateCustom(k:int, _arg_2:String):void;

        public function updateAchievementScore(k:int, _arg_2:int):void;

        public function updateNameByIndex(k:int, _arg_2:String):void;

        public function getPetUserData(k:int):IUserData;

        public function getRentableBotUserData(k:int):IUserData;

        public function requestPetInfo(k:int):void;

        public function getAllUsers():Vector.<IUserData>;

        public function userHistory():Vector.<IUserData>;


    }
}//package com.sulake.habbo.session

