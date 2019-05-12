package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetMessage 
    {
        public static const RWM_MESSAGE_TEST:String = "RWM_MESSAGE_TEST";

        private var _type:String = "";

        public function RoomWidgetMessage(k:String)
        {
            this._type = k;
        }

        public function get type():String
        {
            return this._type;
        }
    }
}
