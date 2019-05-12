package com.sulake.habbo.session.events
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserDataUpdateEvent extends RoomSessionEvent 
    {
        public static const RSUDUE_USER_DATA_UPDATED:String = "rsudue_user_data_updated";

        private var _addedUsers:Vector.<RoomUserData>;

        public function RoomSessionUserDataUpdateEvent(k:IRoomSession, _arg_2:Vector.<RoomUserData>, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RSUDUE_USER_DATA_UPDATED, k, _arg_3, _arg_4);
            this._addedUsers = _arg_2;
        }

        public function get _Str_24272():Vector.<RoomUserData>
        {
            return this._addedUsers;
        }
    }
}
