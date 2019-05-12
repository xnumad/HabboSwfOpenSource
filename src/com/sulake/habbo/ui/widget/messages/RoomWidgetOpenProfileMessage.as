package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenProfileMessage extends RoomWidgetMessage 
    {
        public static const RWOPEM_OPEN_USER_PROFILE:String = "RWOPEM_OPEN_USER_PROFILE";

        private var _userId:int;
        private var _trackingLocation:String;

        public function RoomWidgetOpenProfileMessage(k:String, _arg_2:int, _arg_3:String)
        {
            super(k);
            this._userId = _arg_2;
            this._trackingLocation = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_22577():String
        {
            return this._trackingLocation;
        }
    }
}
