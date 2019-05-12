package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage 
    {
        public static const RWRTSM_ROOM_TAG_SEARCH:String = "RWRTSM_ROOM_TAG_SEARCH";

        private var _tag:String = "";

        public function RoomWidgetRoomTagSearchMessage(k:String)
        {
            super(RWRTSM_ROOM_TAG_SEARCH);
            this._tag = k;
        }

        public function get tag():String
        {
            return this._tag;
        }
    }
}
