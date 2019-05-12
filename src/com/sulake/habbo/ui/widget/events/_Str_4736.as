package com.sulake.habbo.ui.widget.events
{
    public class _Str_4736 extends RoomWidgetUpdateEvent 
    {
        public static const RWPBRE_PET_BREEDING_RESULT:String = "RWPBRE_PET_BREEDING_RESULT";

        private var _Str_3111:_Str_3801;
        private var _resultData2:_Str_3801;

        public function _Str_4736(k:_Str_3801, _arg_2:_Str_3801, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWPBRE_PET_BREEDING_RESULT, _arg_3, _arg_4);
            this._Str_3111 = k;
            this._resultData2 = _arg_2;
        }

        public function get _Str_3713():_Str_3801
        {
            return this._Str_3111;
        }

        public function get resultData2():_Str_3801
        {
            return this._resultData2;
        }
    }
}
