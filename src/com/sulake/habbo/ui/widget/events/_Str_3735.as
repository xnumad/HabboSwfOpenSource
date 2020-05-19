package com.sulake.habbo.ui.widget.events
{
    public class _Str_3735 extends RoomWidgetUpdateEvent 
    {
        public static const RWONE_TYPE:String = "RWONE_TYPE";

        private var _userId:int;
        private var _category:int;
        private var _userName:String;
        private var _userType:int;
        private var _roomIndex:int;

        public function _Str_3735(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int)
        {
            this._userId = k;
            this._category = _arg_2;
            this._userName = _arg_3;
            this._userType = _arg_4;
            this._roomIndex = _arg_5;
            super(RWONE_TYPE, false, false);
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get userType():int
        {
            return this._userType;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }
    }
}
