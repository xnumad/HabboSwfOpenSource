package com.sulake.habbo.ui.widget.events
{
    public class _Str_4624 extends RoomWidgetUpdateEvent 
    {
        public static const RWPPBE_CONFIRM_PET_BREEDING_:String = "RWPPBE_CONFIRM_PET_BREEDING_";

        private var _nestId:int;
        private var _pet1:_Str_3575;
        private var _pet2:_Str_3575;
        private var _rarityCategories:Array;
        private var _resultPetTypeId:int;

        public function _Str_4624(k:int, _arg_2:_Str_3575, _arg_3:_Str_3575, _arg_4:Array, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWPPBE_CONFIRM_PET_BREEDING_, _arg_6, _arg_7);
            this._nestId = k;
            this._pet1 = _arg_2;
            this._pet2 = _arg_3;
            this._rarityCategories = _arg_4;
            this._resultPetTypeId = _arg_5;
        }

        public function get rarityCategories():Array
        {
            return this._rarityCategories;
        }

        public function get nestId():int
        {
            return this._nestId;
        }

        public function get pet1():_Str_3575
        {
            return this._pet1;
        }

        public function get pet2():_Str_3575
        {
            return this._pet2;
        }

        public function get resultPetTypeId():int
        {
            return this._resultPetTypeId;
        }
    }
}
