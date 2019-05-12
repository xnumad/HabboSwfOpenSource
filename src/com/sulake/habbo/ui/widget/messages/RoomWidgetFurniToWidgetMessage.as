package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetFurniToWidgetMessage extends RoomWidgetMessage 
    {
        public static const RWFWM_MESSAGE_REQUEST_CREDITFURNI:String = "RWFWM_MESSAGE_REQUEST_CREDITFURNI";
        public static const RWFWM_MESSAGE_REQUEST_STICKIE:String = "RWFWM_MESSAGE_REQUEST_STICKIE";
        public static const RWFWM_MESSAGE_REQUEST_PRESENT:String = "RWFWM_MESSAGE_REQUEST_PRESENT";
        public static const RWFWM_MESSAGE_REQUEST_TROPHY:String = "RWFWM_MESSAGE_REQUEST_TROPHY";
        public static const RWFWM_MESSAGE_REQUEST_TEASER:String = "RWFWM_MESSAGE_REQUEST_TEASER";
        public static const RWFWM_MESSAGE_REQUEST_ECOTRONBOX:String = "RWFWM_MESSAGE_REQUEST_ECOTRONBOX";
        public static const RWFWM_MESSAGE_REQUEST_DIMMER:String = "RWFWM_MESSAGE_REQUEST_DIMMER";
        public static const RWFWM_MESSAGE_REQUEST_PLACEHOLDER:String = "RWFWM_MESSAGE_REQUEST_PLACEHOLDER";
        public static const RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE:String = "RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE";
        public static const RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR:String = "RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR";
        public static const RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING";
        public static const RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED";
        public static const RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING";

        private var _id:int = 0;
        private var _category:int = 0;
        private var _roomId:int = 0;

        public function RoomWidgetFurniToWidgetMessage(k:String, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(k);
            this._id = _arg_2;
            this._category = _arg_3;
            this._roomId = _arg_4;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
