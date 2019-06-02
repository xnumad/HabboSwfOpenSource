package com.sulake.habbo.ui.widget.events
{
    public class _Str_4863 extends RoomWidgetUpdateEvent 
    {
        public static const RWSDUE_STICKIE_DATA:String = "RWSDUE_STICKIE_DATA";

        private var _Str_2319:int = -1;
        private var _Str_3796:String;
        private var _text:String;
        private var _Str_3062:String;
        private var _controller:Boolean;

        public function _Str_4863(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_7, _arg_8);
            this._Str_2319 = _arg_2;
            this._Str_3796 = _arg_3;
            this._text = _arg_4;
            this._Str_3062 = _arg_5;
            this._controller = _arg_6;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get objectType():String
        {
            return this._Str_3796;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get _Str_10471():String
        {
            return this._Str_3062;
        }

        public function get controller():Boolean
        {
            return this._controller;
        }
    }
}
