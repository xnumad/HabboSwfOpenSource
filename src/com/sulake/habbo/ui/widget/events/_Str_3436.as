package com.sulake.habbo.ui.widget.events
{
    public class _Str_3436 extends RoomWidgetUpdateEvent 
    {
        public static const RWDE_RINGING:String = "RWDE_RINGING";
        public static const REJECTED:String = "RWDE_REJECTED";
        public static const RWDE_ACCEPTED:String = "RWDE_ACCEPTED";

        private var _userName:String = "";

        public function _Str_3436(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._userName = _arg_2;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
