package com.sulake.habbo.ui.widget.events
{
    public class _Str_5393 extends RoomWidgetUpdateEvent 
    {
        public static const RWAIE_AVATAR_INFO:String = "RWAIE_AVATAR_INFO";

        private var _userId:int;
        private var _userName:String;
        private var _userType:int;
        private var _allowNameChange:Boolean;
        private var _roomIndex:int;

        public function _Str_5393(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWAIE_AVATAR_INFO, _arg_6, _arg_7);
            this._userId = k;
            this._userName = _arg_2;
            this._userType = _arg_3;
            this._roomIndex = _arg_4;
            this._allowNameChange = _arg_5;
        }

        public function get userId():int
        {
            return this._userId;
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

        public function get allowNameChange():Boolean
        {
            return this._allowNameChange;
        }
    }
}
