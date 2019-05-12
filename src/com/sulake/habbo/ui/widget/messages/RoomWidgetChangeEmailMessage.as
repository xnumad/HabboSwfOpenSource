package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChangeEmailMessage extends RoomWidgetMessage 
    {
        public static const RWCEM_CHANGE_EMAIL:String = "rwcem_change_email";

        private var _Str_6877:String;

        public function RoomWidgetChangeEmailMessage(k:String)
        {
            super(RWCEM_CHANGE_EMAIL);
            this._Str_6877 = k;
        }

        public function get _Str_22654():String
        {
            return this._Str_6877;
        }
    }
}
