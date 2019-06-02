//com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPropertyUpdateEvent extends RoomSessionEvent {

        public static const ALLOW_PETS:String;

        public function RoomSessionPropertyUpdateEvent(k:String, _arg_2:IRoomSession, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.session.events

