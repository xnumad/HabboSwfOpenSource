package com.sulake.habbo.ui.widget.events
{
    public class _Str_3549 extends RoomWidgetUpdateEvent 
    {
        public static const RWFRUE_SHOW_FRIEND_REQUEST:String = "RWFRUE_SHOW_FRIEND_REQUEST";
        public static const RWFRUE_HIDE_FRIEND_REQUEST:String = "RWFRUE_HIDE_FRIEND_REQUEST";

        private var _Str_2914:int;
        private var _userId:int;
        private var _userName:String;

        public function _Str_3549(k:String, _arg_2:int, _arg_3:int=0, _arg_4:String=null, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_2914 = _arg_2;
            this._userId = _arg_3;
            this._userName = _arg_4;
        }

        public function get requestId():int
        {
            return this._Str_2914;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
