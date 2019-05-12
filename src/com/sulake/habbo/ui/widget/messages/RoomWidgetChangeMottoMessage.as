package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage 
    {
        public static const RWVM_CHANGE_MOTTO_MESSAGE:String = "RWVM_CHANGE_MOTTO_MESSAGE";

        private var _motto:String;

        public function RoomWidgetChangeMottoMessage(k:String)
        {
            super(RWVM_CHANGE_MOTTO_MESSAGE);
            this._motto = k;
        }

        public function get motto():String
        {
            return this._motto;
        }
    }
}
