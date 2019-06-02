//com.sulake.habbo.session.events.RoomSessionNestBreedingSuccessEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionNestBreedingSuccessEvent extends RoomSessionEvent {

        public static const NEST_BREEDING_SUCCESS:String;

        private var _rarityCategory:int;
        private var _petId:int;

        public function RoomSessionNestBreedingSuccessEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get rarityCategory():int;

        public function get petId():int;


    }
}//package com.sulake.habbo.session.events

