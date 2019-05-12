package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage 
    {
        public static const RWSUM_STICKIE_SEND_UPDATE:String = "RWSUM_STICKIE_SEND_UPDATE";
        public static const RWSUM_STICKIE_SEND_DELETE:String = "RWSUM_STICKIE_SEND_DELETE";

        private var _objectId:int;
        private var _text:String;
        private var _colorHex:String;

        public function RoomWidgetStickieSendUpdateMessage(k:String, _arg_2:int, _arg_3:String="", _arg_4:String="")
        {
            super(k);
            this._objectId = _arg_2;
            this._text = _arg_3;
            this._colorHex = _arg_4;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get _Str_10471():String
        {
            return this._colorHex;
        }
    }
}
