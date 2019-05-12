package com.sulake.habbo.ui.widget.events
{
    public class _Str_4624 extends RoomWidgetUpdateEvent 
    {
        public static const RWPPBE_CONFIRM_PET_BREEDING_:String = "RWPPBE_CONFIRM_PET_BREEDING_";

        private var _Str_5743:int;
        private var _pet1:_Str_3575;
        private var _pet2:_Str_3575;
        private var _Str_4447:Array;
        private var _Str_6321:int;

        public function _Str_4624(k:int, _arg_2:_Str_3575, _arg_3:_Str_3575, _arg_4:Array, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWPPBE_CONFIRM_PET_BREEDING_, _arg_6, _arg_7);
            this._Str_5743 = k;
            this._pet1 = _arg_2;
            this._pet2 = _arg_3;
            this._Str_4447 = _arg_4;
            this._Str_6321 = _arg_5;
        }

        public function get _Str_10346():Array
        {
            return this._Str_4447;
        }

        public function get _Str_12369():int
        {
            return this._Str_5743;
        }

        public function get pet1():_Str_3575
        {
            return this._pet1;
        }

        public function get pet2():_Str_3575
        {
            return this._pet2;
        }

        public function get _Str_16867():int
        {
            return this._Str_6321;
        }
    }
}
