package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class _Str_3072 extends RoomWidgetUpdateEvent 
    {
        public static const RWEBDUE_PACKAGEINFO:String = "RWEBDUE_PACKAGEINFO";
        public static const RWEBDUE_CONTENTS:String = "RWEBDUE_CONTENTS";

        private var _Str_2319:int = -1;
        private var _text:String;
        private var _Str_6880:String;
        private var _controller:Boolean;
        private var _Str_12168:BitmapData;

        public function _Str_3072(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:BitmapData=null, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_7, _arg_8);
            this._Str_2319 = _arg_2;
            this._text = _arg_3;
            this._Str_6880 = _arg_4;
            this._controller = _arg_5;
            this._Str_12168 = _arg_6;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get controller():Boolean
        {
            return this._controller;
        }

        public function get _Str_11625():BitmapData
        {
            return this._Str_12168;
        }

        public function get _Str_17878():String
        {
            return this._Str_6880;
        }
    }
}
