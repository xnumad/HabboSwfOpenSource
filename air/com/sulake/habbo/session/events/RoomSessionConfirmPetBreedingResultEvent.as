//com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingResultEvent extends RoomSessionEvent {

        public static const CONFIRM_PET_BREEDING_RESULT:String;

        private var _breedingNestStuffId:int;
        private var _result:int;

        public function RoomSessionConfirmPetBreedingResultEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get breedingNestStuffId():int;

        public function get result():int;


    }
}//package com.sulake.habbo.session.events

