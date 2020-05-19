package com.sulake.habbo.userclassification
{
    public class UserClassificationData 
    {
        public static var PILLAR_CLASSIFICATION:uint = 1;
        public static var NEW_USER_CLASSIFICATION:uint = 2;
        public static var WHALE_CLASSIFICATION:uint = 3;
        public static var PAYING_USER_CLASSIFICATION:uint = 4;

        private var _userId:int;
        private var _username:String;
        private var _classType:String;

        public function UserClassificationData(k:int, _arg_2:String, _arg_3:String)
        {
            this._userId = k;
            this._username = _arg_2;
            this._classType = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get username():String
        {
            return this._username;
        }

        public function get classType():String
        {
            return this._classType;
        }

        public function toString():String
        {
            return ((((("[" + this._userId) + ", ") + this._username) + "] [") + this._classType) + "]";
        }
    }
}
