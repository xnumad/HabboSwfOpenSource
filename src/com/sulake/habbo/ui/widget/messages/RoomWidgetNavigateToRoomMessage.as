package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetNavigateToRoomMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_NAVIGATE_TO_ROOM:String = "RWGOI_MESSAGE_NAVIGATE_TO_ROOM";
        public static const RWGOI_MESSAGE_NAVIGATE_HOME:String = "RWGOI_MESSAGE_NAVIGATE_HOME";

        private var _roomId:int;

        public function RoomWidgetNavigateToRoomMessage(k:String, _arg_2:int=-1)
        {
            super(k);
            this._roomId = _arg_2;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
