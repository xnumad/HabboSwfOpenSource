package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_GET_BADGE_IMAGE:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";

        private var _badgeId:String = "";

        public function RoomWidgetGetBadgeImageMessage(k:String)
        {
            super(RWGOI_MESSAGE_GET_BADGE_IMAGE);
            this._badgeId = k;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }
    }
}
