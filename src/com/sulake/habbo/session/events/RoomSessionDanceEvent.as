package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDanceEvent extends RoomSessionEvent 
    {
        public static const RSDE_DANCE:String = "RSDE_DANCE";

        private var _userId:int;
        private var _danceStyle:int;

        public function RoomSessionDanceEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RSDE_DANCE, k, _arg_4, _arg_5);
            this._userId = _arg_2;
            this._danceStyle = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_8263():int
        {
            return this._danceStyle;
        }
    }
}
