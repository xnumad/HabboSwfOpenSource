package com.sulake.habbo.ui.widget.events
{
    public class _Str_9531 extends RoomWidgetUpdateEvent 
    {
        public static const RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED:String = "RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED";
        public static const ICON_TYPE_ME_MENU:String = "ICON_TYPE_ME_MENU";
        public static const ICON_TYPE_ROOM_INFO:String = "ICON_TYPE_ROOM_INFO";

        private var _Str_22092:String;
        private var _active:Boolean = false;

        public function _Str_9531(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWUE_REQUEST_ME_MENU_TOOLBAR_CLICKED, _arg_3, _arg_4);
            this._Str_22092 = k;
            this._active = _arg_2;
        }

        public function get active():Boolean
        {
            return this._active;
        }

        public function get _Str_25981():String
        {
            return this._Str_22092;
        }
    }
}
