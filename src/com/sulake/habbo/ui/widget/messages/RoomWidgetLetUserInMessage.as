package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetLetUserInMessage extends RoomWidgetMessage 
    {
        public static const RWLUIM_LET_USER_IN:String = "RWLUIM_LET_USER_IN";

        private var _userName:String;
        private var _canEnter:Boolean;

        public function RoomWidgetLetUserInMessage(k:String, _arg_2:Boolean)
        {
            super(RWLUIM_LET_USER_IN);
            this._userName = k;
            this._canEnter = _arg_2;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get _Str_23117():Boolean
        {
            return this._canEnter;
        }
    }
}
