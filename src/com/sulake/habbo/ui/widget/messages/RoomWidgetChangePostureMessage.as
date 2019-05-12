package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChangePostureMessage extends RoomWidgetMessage 
    {
        public static const RWCPM_MESSAGE_CHANGE_POSTURE:String = "RWCPM_MESSAGE_CHANGE_POSTURE";
        public static const _Str_1553:int = 0;
        public static const _Str_2016:int = 1;

        private var _posture:int = 0;

        public function RoomWidgetChangePostureMessage(k:int)
        {
            super(RWCPM_MESSAGE_CHANGE_POSTURE);
            this._posture = k;
        }

        public function get posture():int
        {
            return this._posture;
        }
    }
}
