package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserBadgesEvent extends RoomSessionEvent 
    {
        public static const RSUBE_BADGES:String = "RSUBE_BADGES";

        private var _userId:int = 0;
        private var _badges:Array;

        public function RoomSessionUserBadgesEvent(k:IRoomSession, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            this._badges = [];
            super(RSUBE_BADGES, k, _arg_4, _arg_5);
            this._userId = _arg_2;
            this._badges = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get badges():Array
        {
            return this._badges;
        }
    }
}
