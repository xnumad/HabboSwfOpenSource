package com.sulake.habbo.session.events
{
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetInfoMessageParser;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetBreedingResultEvent extends RoomSessionEvent 
    {
        public static const RSPFUE_PET_BREEDING_RESULT:String = "RSPFUE_PET_BREEDING_RESULT";

        private var _resultData:PetInfoMessageParser;
        private var _otherResultData:PetInfoMessageParser;

        public function RoomSessionPetBreedingResultEvent(k:IRoomSession, _arg_2:PetInfoMessageParser, _arg_3:PetInfoMessageParser, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RSPFUE_PET_BREEDING_RESULT, k, _arg_4, _arg_5);
            this._resultData = _arg_2;
            this._otherResultData = _arg_3;
        }

        public function get _Str_3713():PetInfoMessageParser
        {
            return this._resultData;
        }

        public function get _Str_5840():PetInfoMessageParser
        {
            return this._otherResultData;
        }
    }
}
