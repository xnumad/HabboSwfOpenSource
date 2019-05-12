package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDanceMessage extends RoomWidgetMessage 
    {
        public static const RWCM_MESSAGE_DANCE:String = "RWCM_MESSAGE_DANCE";
        public static const _Str_13814:int = 0;
        public static const _Str_17699:Array = [2, 3, 4];

        private var _style:int = 0;

        public function RoomWidgetDanceMessage(k:int)
        {
            super(RWCM_MESSAGE_DANCE);
            this._style = k;
        }

        public function get style():int
        {
            return this._style;
        }
    }
}
