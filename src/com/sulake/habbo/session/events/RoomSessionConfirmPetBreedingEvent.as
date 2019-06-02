package com.sulake.habbo.session.events
{
    import com.sulake.habbo.communication.messages.incoming.room.pets._Str_3763;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingEvent extends RoomSessionEvent 
    {
        public static const RSPFUE_CONFIRM_PET_BREEDING:String = "RSPFUE_CONFIRM_PET_BREEDING";

        private var _nestId:int;
        private var _pet1:_Str_3763;
        private var _pet2:_Str_3763;
        private var _rarityCategories:Array;
        private var _resultPetTypeId:int;

        public function RoomSessionConfirmPetBreedingEvent(k:IRoomSession, _arg_2:int, _arg_3:_Str_3763, _arg_4:_Str_3763, _arg_5:Array, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(RSPFUE_CONFIRM_PET_BREEDING, k, _arg_7, _arg_8);
            this._nestId = _arg_2;
            this._pet1 = _arg_3;
            this._pet2 = _arg_4;
            this._rarityCategories = _arg_5;
            this._resultPetTypeId = _arg_6;
        }

        public function get rarityCategories():Array
        {
            return this._rarityCategories;
        }

        public function get nestId():int
        {
            return this._nestId;
        }

        public function get pet1():_Str_3763
        {
            return this._pet1;
        }

        public function get pet2():_Str_3763
        {
            return this._pet2;
        }

        public function get resultPetTypeId():int
        {
            return this._resultPetTypeId;
        }
    }
}
