package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetConversionPointMessage extends RoomWidgetMessage 
    {
        public static const RWCPM_CONVERSION_POINT:String = "RWCPM_CONVERSION_POINT";

        private var _category:String;
        private var _pointType:String;
        private var _action:String;
        private var _extraString:String;
        private var _extraInt:int;

        public function RoomWidgetConversionPointMessage(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String="", _arg_6:int=0)
        {
            super(k);
            this._category = _arg_2;
            this._pointType = _arg_3;
            this._action = _arg_4;
            this._extraString = ((_arg_5) ? _arg_5 : "");
            this._extraInt = ((_arg_6) ? _arg_6 : 0);
        }

        public function get category():String
        {
            return this._category;
        }

        public function get _Str_23854():String
        {
            return this._pointType;
        }

        public function get action():String
        {
            return this._action;
        }

        public function get _Str_22656():String
        {
            return this._extraString;
        }

        public function get _Str_24399():int
        {
            return this._extraInt;
        }
    }
}
