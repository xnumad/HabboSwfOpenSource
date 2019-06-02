//com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.communication.messages.incoming.room.pets.BreedingPetInfo;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingEvent extends RoomSessionEvent {

        public static const CONFIRM_PET_BREEDING:String;

        private var _nestId:int;
        private var _pet1:BreedingPetInfo;
        private var _pet2:BreedingPetInfo;
        private var _rarityCategories:Array;
        private var _resultPetTypeId:int;

        public function RoomSessionConfirmPetBreedingEvent(k:IRoomSession, _arg_2:int, _arg_3:BreedingPetInfo, _arg_4:BreedingPetInfo, _arg_5:Array, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get rarityCategories():Array;

        public function get nestId():int;

        public function get pet1():BreedingPetInfo;

        public function get pet2():BreedingPetInfo;

        public function get resultPetTypeId():int;


    }
}//package com.sulake.habbo.session.events

