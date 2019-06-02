package com.sulake.habbo.ui.widget.events
{
    public class _Str_3919 extends RoomWidgetUpdateEvent 
    {
        public static const _Str_18166:int = 0;
        public static const _Str_16941:int = 1;
        public static const _Str_17835:int = 2;
        public static const _Str_16930:int = 3;
        public static const RWPPBE_PET_BREEDING_:String = "RWPPBE_PET_BREEDING_";

        private var _state:int;
        private var _Str_6614:int;
        private var _Str_6649:int;

        public function _Str_3919(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(RWPPBE_PET_BREEDING_, k, _arg_2);
        }

        public function get state():int
        {
            return this._state;
        }

        public function set state(k:int):void
        {
            this._state = k;
        }

        public function get ownPetId():int
        {
            return this._Str_6614;
        }

        public function set ownPetId(k:int):void
        {
            this._Str_6614 = k;
        }

        public function get otherPetId():int
        {
            return this._Str_6649;
        }

        public function set otherPetId(k:int):void
        {
            this._Str_6649 = k;
        }
    }
}
