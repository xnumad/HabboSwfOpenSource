package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPlayListPlayStateMessage extends RoomWidgetMessage 
    {
        public static const RWPLPS_TOGGLE_PLAY_PAUSE:String = "RWPLPS_TOGGLE_PLAY_PAUSE";

        private var _furniId:int;
        private var _position:int;

        public function RoomWidgetPlayListPlayStateMessage(k:String, _arg_2:int, _arg_3:int=-1)
        {
            super(k);
            this._furniId = _arg_2;
            this._position = _arg_3;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get position():int
        {
            return this._position;
        }
    }
}
