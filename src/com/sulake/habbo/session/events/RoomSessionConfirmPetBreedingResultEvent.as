package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingResultEvent extends RoomSessionEvent 
    {
        public static const RSPFUE_CONFIRM_PET_BREEDING_RESULT:String = "RSPFUE_CONFIRM_PET_BREEDING_RESULT";

        private var _breedingNestStuffId:int;
        private var _result:int;

        public function RoomSessionConfirmPetBreedingResultEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RSPFUE_CONFIRM_PET_BREEDING_RESULT, k, _arg_4, _arg_5);
            this._breedingNestStuffId = _arg_2;
            this._result = _arg_3;
        }

        public function get breedingNestStuffId():int
        {
            return this._breedingNestStuffId;
        }

        public function get result():int
        {
            return this._result;
        }
    }
}
