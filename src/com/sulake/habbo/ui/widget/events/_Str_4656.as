package com.sulake.habbo.ui.widget.events
{
    public class _Str_4656 extends RoomWidgetUpdateEvent 
    {
        public static const RWPUE_CREDIT_BALANCE:String = "RWPUE_CREDIT_BALANCE";
        public static const RWPUE_PIXEL_BALANCE:String = "RWPUE_PIXEL_BALANCE";
        public static const RWPUE_SHELL_BALANCE:String = "RWPUE_SHELL_BALANCE";

        private var _balance:int;

        public function _Str_4656(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._balance = _arg_2;
        }

        public function get balance():int
        {
            return this._balance;
        }
    }
}
