package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFriendRequestEvent extends RoomSessionEvent 
    {
        public static const RSFRE_FRIEND_REQUEST:String = "RSFRE_FRIEND_REQUEST";

        private var _requestId:int = 0;
        private var _userId:int = 0;
        private var _userName:String;

        public function RoomSessionFriendRequestEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(RSFRE_FRIEND_REQUEST, k, _arg_5, _arg_6);
            this._requestId = _arg_2;
            this._userId = _arg_3;
            this._userName = _arg_4;
        }

        public function get requestId():int
        {
            return this._requestId;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
