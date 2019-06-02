package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetFriendRequestMessage extends RoomWidgetMessage 
    {
        public static const RWFRM_ACCEPT:String = "RWFRM_ACCEPT";
        public static const RWFRM_DECLINE:String = "RWFRM_DECLINE";

        private var _requestId:int = 0;

        public function RoomWidgetFriendRequestMessage(k:String, _arg_2:int=0)
        {
            super(k);
            this._requestId = _arg_2;
        }

        public function get requestId():int
        {
            return this._requestId;
        }
    }
}
