//com.sulake.habbo.session.events.RoomSessionFriendRequestEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFriendRequestEvent extends RoomSessionEvent {

        public static const FRIEND_REQUEST:String;

        private var _requestId:int;
        private var _userId:int;
        private var _userName:String;

        public function RoomSessionFriendRequestEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get requestId():int;

        public function get userId():int;

        public function get userName():String;


    }
}//package com.sulake.habbo.session.events

