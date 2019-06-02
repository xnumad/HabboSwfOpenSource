//com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IPetInfo;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetInfoUpdateEvent extends RoomSessionEvent {

        public static const PET_INFO:String;

        private var _petInfo:IPetInfo;

        public function RoomSessionPetInfoUpdateEvent(k:IRoomSession, _arg_2:IPetInfo, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get petInfo():IPetInfo;


    }
}//package com.sulake.habbo.session.events

