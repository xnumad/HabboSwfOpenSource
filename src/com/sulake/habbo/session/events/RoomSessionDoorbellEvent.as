package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDoorbellEvent extends RoomSessionEvent 
    {
        public static const RSDE_DOORBELL:String = "RSDE_DOORBELL";
        public static const REJECTED:String = "RSDE_REJECTED";
        public static const RSDE_ACCEPTED:String = "RSDE_ACCEPTED";

        private var _userName:String = "";

        public function RoomSessionDoorbellEvent(k:String, _arg_2:IRoomSession, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_2, _arg_4, _arg_5);
            this._userName = _arg_3;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
