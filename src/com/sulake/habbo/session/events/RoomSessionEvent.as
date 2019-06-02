package com.sulake.habbo.session.events
{
    import flash.events.Event;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionEvent extends Event 
    {
        public static const CREATED:String = "RSE_CREATED";
        public static const STARTED:String = "RSE_STARTED";
        public static const ENDED:String = "RSE_ENDED";
        public static const ROOM_DATA:String = "RSE_ROOM_DATA";

        private var _session:IRoomSession;
        private var _openLandingPage:Boolean;

        public function RoomSessionEvent(k:String, session:IRoomSession, _arg_3:Boolean=true, bubbles:Boolean=false, cancellable:Boolean=false)
        {
            super(k, bubbles, cancellable);
            this._session = session;
            this._openLandingPage = _arg_3;
        }

        public function get session():IRoomSession
        {
            return this._session;
        }

        public function get openLandingPage():Boolean
        {
            return this._openLandingPage;
        }
    }
}
