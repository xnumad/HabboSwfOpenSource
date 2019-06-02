//com.sulake.habbo.session.events.RoomSessionPetBreedingEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetBreedingEvent extends RoomSessionEvent {

        public static const PET_BREEDING:String;

        private var _state:int;
        private var _ownPetId:int;
        private var _otherPetId:int;

        public function RoomSessionPetBreedingEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get state():int;

        public function get ownPetId():int;

        public function get otherPetId():int;


    }
}//package com.sulake.habbo.session.events

