//com.sulake.habbo.session.events.RoomSessionEvent

package com.sulake.habbo.session.events{
    import flash.events.Event;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionEvent extends Event {

        public static const SESSION_CREATED:String;
        public static const SESSION_STARTED:String;
        public static const SESSION_ENDED:String;
        public static const SESSION_ROOM_DATA:String;

        private var _session:IRoomSession;
        private var _openLandingPage:Boolean;

        public function RoomSessionEvent(k:String, _arg_2:IRoomSession, _arg_3:Boolean=true, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get session():IRoomSession;

        public function get openLandingPage():Boolean;


    }
}//package com.sulake.habbo.session.events

