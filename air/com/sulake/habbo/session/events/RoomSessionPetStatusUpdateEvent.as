//com.sulake.habbo.session.events.RoomSessionPetStatusUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetStatusUpdateEvent extends RoomSessionEvent {

        public static const PET_STATUS_UPDATE:String;

        private var _petId:int;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;

        public function RoomSessionPetStatusUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get petId():int;

        public function get canBreed():Boolean;

        public function get canHarvest():Boolean;

        public function get canRevive():Boolean;

        public function get hasBreedingPermission():Boolean;


    }
}//package com.sulake.habbo.session.events

