package com.sulake.habbo.ui.widget.events
{
    public class _Str_5436 extends RoomWidgetUpdateEvent 
    {
        public static const RWSWPUE_OPEN_EDITOR:String = "RWSWPUE_OPEN_EDITOR";

        private var _Str_2319:int;
        private var _location:String;
        private var _Str_3796:String;

        public function _Str_5436(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_2319 = _arg_2;
            this._location = _arg_3;
            this._Str_3796 = _arg_4;
        }

        public function get location():String
        {
            return this._location;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get objectType():String
        {
            return this._Str_3796;
        }
    }
}
