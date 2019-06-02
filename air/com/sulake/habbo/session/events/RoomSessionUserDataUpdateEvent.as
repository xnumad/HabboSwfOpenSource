//com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent

package com.sulake.habbo.session.events{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.IUserData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserDataUpdateEvent extends RoomSessionEvent {

        public static const USER_DATA_UPDATED:String;

        private var _addedUsers:Vector.<IUserData>;

        public function RoomSessionUserDataUpdateEvent(k:IRoomSession, _arg_2:Vector.<IUserData>, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get addedUsers():Vector.<IUserData>;


    }
}//package com.sulake.habbo.session.events

