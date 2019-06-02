package com.sulake.habbo.ui.widget.events
{
    public class _Str_3962 extends RoomWidgetUpdateEvent 
    {
        public static const RWPPBE_CONFIRM_PET_BREEDING_RESULT:String = "RWPPBE_CONFIRM_PET_BREEDING_RESULT";
        public static const _Str_5196:int = 0;
        public static const _Str_16705:int = 1;
        public static const _Str_18855:int = 2;
        public static const INVALID_NAME:int = 3;

        private var _Str_6143:int;
        private var _result:int;

        public function _Str_3962(k:int, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWPPBE_CONFIRM_PET_BREEDING_RESULT, _arg_3, _arg_4);
            this._Str_6143 = k;
            this._result = _arg_2;
        }

        public function get breedingNestStuffId():int
        {
            return this._Str_6143;
        }

        public function get result():int
        {
            return this._result;
        }
    }
}
