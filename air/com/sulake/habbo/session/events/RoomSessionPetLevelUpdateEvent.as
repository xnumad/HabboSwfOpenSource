//com.sulake.habbo.session.events.RoomSessionPetLevelUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetLevelUpdateEvent extends RoomSessionEvent {

        public static const PET_LEVEL_UPDATE:String;

        private var _petId:int;
        private var _level:int;

        public function RoomSessionPetLevelUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get petId():int;

        public function get level():int;


    }
}//package com.sulake.habbo.session.events

