package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetBreedingEvent extends RoomWidgetUpdateEvent
    {
        public static const TYPE_START:int = 0;
        public static const TYPE_CANCEL:int = 1;
        public static const TYPE_ACCEPT:int = 2;
        public static const TYPE_REQUEST:int = 3;
        public static const PET_BREEDING:String = "RWPPBE_PET_BREEDING_";

        private var _state:int;
        private var _ownPetId:int;
        private var _otherPetId:int;

        public function RoomWidgetPetBreedingEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(PET_BREEDING, k, _arg_2);
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
            return this._ownPetId;
        }

        public function set ownPetId(k:int):void
        {
            this._ownPetId = k;
        }

        public function get otherPetId():int
        {
            return this._otherPetId;
        }

        public function set otherPetId(k:int):void
        {
            this._otherPetId = k;
        }
    }
}
