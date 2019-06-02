//com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetFigureUpdateEvent extends RoomSessionEvent {

        public static const PET_FIGURE_UPDATE:String;

        private var _petId:int;
        private var _figure:String;

        public function RoomSessionPetFigureUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get petId():int;

        public function get figure():String;


    }
}//package com.sulake.habbo.session.events

