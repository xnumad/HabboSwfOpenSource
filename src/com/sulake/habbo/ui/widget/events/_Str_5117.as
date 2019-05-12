package com.sulake.habbo.ui.widget.events
{
    public class _Str_5117 extends RoomWidgetUpdateEvent 
    {
        public static const RWARTDUE_TROPHY_DATA:String = "RWARTDUE_TROPHY_DATA";

        private var _color:Number;
        private var _name:String;
        private var _date:String;
        private var _message:String;
        private var _Str_3918:int;

        public function _Str_5117(k:String, _arg_2:Number, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_7, _arg_8);
            this._color = _arg_2;
            this._name = _arg_3;
            this._date = _arg_4;
            this._message = _arg_5;
            this._Str_3918 = _arg_6;
        }

        public function get color():Number
        {
            return this._color;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get date():String
        {
            return this._date;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get _Str_16299():int
        {
            return this._Str_3918;
        }
    }
}
