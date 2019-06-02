//com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetBreedingResultData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetBreedingResultEvent extends RoomSessionEvent {

        public static const PET_BREEDING_RESULT:String;

        private var _resultData:PetBreedingResultData;
        private var _otherResultData:PetBreedingResultData;

        public function RoomSessionPetBreedingResultEvent(k:IRoomSession, _arg_2:PetBreedingResultData, _arg_3:PetBreedingResultData, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get resultData():PetBreedingResultData;

        public function get otherResultData():PetBreedingResultData;


    }
}//package com.sulake.habbo.session.events

