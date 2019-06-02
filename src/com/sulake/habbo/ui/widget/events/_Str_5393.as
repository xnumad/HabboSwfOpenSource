package com.sulake.habbo.ui.widget.events
{
    public class _Str_5393 extends RoomWidgetUpdateEvent 
    {
        public static const RWAIE_AVATAR_INFO:String = "RWAIE_AVATAR_INFO";

        private var _userId:int;
        private var _userName:String;
        private var _Str_3021:int;
        private var _Str_3947:Boolean;
        private var _Str_2775:int;

        public function _Str_5393(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWAIE_AVATAR_INFO, _arg_6, _arg_7);
            this._userId = k;
            this._userName = _arg_2;
            this._Str_3021 = _arg_3;
            this._Str_2775 = _arg_4;
            this._Str_3947 = _arg_5;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get _Str_2908():int
        {
            return this._Str_3021;
        }

        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get _Str_4330():Boolean
        {
            return this._Str_3947;
        }
    }
}
