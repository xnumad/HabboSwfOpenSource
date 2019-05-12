package com.sulake.habbo.ui.widget.events
{
    public class _Str_5907 extends RoomWidgetUpdateEvent 
    {
        public static const RWBIUE_HABBO_CLUB:String = "RWBIUE_HABBO_CLUB";

        private var _Str_22208:int = 0;
        private var _Str_21908:int = 0;
        private var _Str_20357:int = 0;
        private var _Str_21522:Boolean = false;
        private var _clubLevel:int;

        public function _Str_5907(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWBIUE_HABBO_CLUB, _arg_6, _arg_7);
            this._Str_22208 = k;
            this._Str_21908 = _arg_2;
            this._Str_20357 = _arg_3;
            this._Str_21522 = _arg_4;
            this._clubLevel = _arg_5;
        }

        public function get _Str_19392():int
        {
            return this._Str_22208;
        }

        public function get _Str_23037():int
        {
            return this._Str_21908;
        }

        public function get _Str_24579():int
        {
            return this._Str_20357;
        }

        public function get _Str_23338():Boolean
        {
            return this._Str_21522;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }
    }
}
