//com.sulake.habbo.session.events.RoomSessionDoorbellEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDoorbellEvent extends RoomSessionEvent {

        public static const DOORBELL:String;
        public static const REJECTED:String;
        public static const ACCEPTED:String;

        private var _userName:String;

        public function RoomSessionDoorbellEvent(k:String, _arg_2:IRoomSession, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get userName():String;


    }
}//package com.sulake.habbo.session.events

