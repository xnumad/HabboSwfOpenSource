//com.sulake.habbo.session.events.RoomSessionDanceEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDanceEvent extends RoomSessionEvent {

        public static const DANCE:String;

        private var _userId:int;
        private var _danceStyle:int;

        public function RoomSessionDanceEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get userId():int;

        public function get danceStyle():int;


    }
}//package com.sulake.habbo.session.events

