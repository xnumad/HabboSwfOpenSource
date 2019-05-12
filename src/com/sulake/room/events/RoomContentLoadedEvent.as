package com.sulake.room.events
{
    import flash.events.Event;

    public class RoomContentLoadedEvent extends Event 
    {
        public static const RCLE_SUCCESS:String = "RCLE_SUCCESS";
        public static const RCLE_FAILURE:String = "RCLE_FAILURE";
        public static const RCLE_CANCEL:String = "RCLE_CANCEL";

        private var _contentType:String;

        public function RoomContentLoadedEvent(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._contentType = _arg_2;
        }

        public function get contentType():String
        {
            return this._contentType;
        }
    }
}
