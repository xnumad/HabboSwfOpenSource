package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSpamWallPostItFinishEditingMessage extends RoomWidgetMessage 
    {
        public static const RWSWPFEE_SEND_POSTIT_DATA:String = "RWSWPFEE_SEND_POSTIT_DATA";

        private var _objectId:int;
        private var _location:String;
        private var _text:String;
        private var _colorHex:String;

        public function RoomWidgetSpamWallPostItFinishEditingMessage(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String)
        {
            super(k);
            this._objectId = _arg_2;
            this._location = _arg_3;
            this._text = _arg_4;
            this._colorHex = _arg_5;
        }

        public function get location():String
        {
            return this._location;
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
