package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_OPEN_CATALOG:String = "RWGOI_MESSAGE_OPEN_CATALOG";
        public static const RWOCM_CLUB_MAIN:String = "RWOCM_CLUB_MAIN";
        public static const RWOCM_PIXELS:String = "RWOCM_PIXELS";
        public static const RWOCM_CREDITS:String = "RWOCM_CREDITS";
        public static const RWOCM_SHELLS:String = "RWOCM_SHELLS";

        private var _pageKey:String = "";

        public function RoomWidgetOpenCatalogMessage(k:String)
        {
            super(RWGOI_MESSAGE_OPEN_CATALOG);
            this._pageKey = k;
        }

        public function get _Str_23670():String
        {
            return this._pageKey;
        }
    }
}
