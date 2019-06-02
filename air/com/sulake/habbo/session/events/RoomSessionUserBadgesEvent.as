//com.sulake.habbo.session.events.RoomSessionUserBadgesEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserBadgesEvent extends RoomSessionEvent {

        public static const USER_BADGES:String;

        private var _userId:int;
        private var _badges:Array;

        public function RoomSessionUserBadgesEvent(k:IRoomSession, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get userId():int;

        public function get badges():Array;


    }
}//package com.sulake.habbo.session.events

