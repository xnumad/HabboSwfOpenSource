package com.sulake.habbo.userclassification
{
    public class _Str_6854 
    {
        public static var _Str_21259:uint = 1;
        public static var _Str_21838:uint = 2;
        public static var _Str_21043:uint = 3;
        public static var _Str_21904:uint = 4;

        private var _userId:int;
        private var _username:String;
        private var _Str_17257:String;

        public function _Str_6854(k:int, _arg_2:String, _arg_3:String)
        {
            this._userId = k;
            this._username = _arg_2;
            this._Str_17257 = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get username():String
        {
            return this._username;
        }

        public function get _Str_25450():String
        {
            return this._Str_17257;
        }

        public function toString():String
        {
            return ((((("[" + this._userId) + ", ") + this._username) + "] [") + this._Str_17257) + "]";
        }
    }
}
