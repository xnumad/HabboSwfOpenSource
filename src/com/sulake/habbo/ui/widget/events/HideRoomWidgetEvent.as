package com.sulake.habbo.ui.widget.events
{
    import flash.events.Event;

    public class HideRoomWidgetEvent extends Event
    {
        public static const HRWE_HIDE_ROOM_WIDGET:String = "hrwe_hide_room_widget";

        private var _widgetType:String;

        public function HideRoomWidgetEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(HRWE_HIDE_ROOM_WIDGET, _arg_2, _arg_3);
            this._widgetType = k;
        }

        public function get widgetType():String
        {
            return this._widgetType;
        }
    }
}
