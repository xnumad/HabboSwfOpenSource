package com.sulake.habbo.ui.widget.events
{
    public class _Str_6843 extends RoomWidgetUpdateEvent 
    {
        public static const RWCERE_CHANGE_EMAIL_RESULT:String = "rwcere_change_email_result";

        private var _result:int;

        public function _Str_6843(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(RWCERE_CHANGE_EMAIL_RESULT, _arg_2, _arg_3);
            this._result = k;
        }

        public function get result():int
        {
            return this._result;
        }
    }
}
