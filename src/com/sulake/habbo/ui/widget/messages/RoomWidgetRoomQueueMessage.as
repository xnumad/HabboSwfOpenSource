package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRoomQueueMessage extends RoomWidgetMessage 
    {
        public static const RWRQM_EXIT_QUEUE:String = "RWRQM_EXIT_QUEUE";
        public static const RWRQM_CHANGE_TO_VISITOR_QUEUE:String = "RWRQM_CHANGE_TO_VISITOR_QUEUE";
        public static const RWRQM_CHANGE_TO_SPECTATOR_QUEUE:String = "RWRQM_CHANGE_TO_SPECTATOR_QUEUE";
        public static const RWRQM_CLUB_LINK:String = "RWRQM_CLUB_LINK";

        public function RoomWidgetRoomQueueMessage(k:String)
        {
            super(k);
        }
    }
}
