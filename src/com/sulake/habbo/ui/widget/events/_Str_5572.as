package com.sulake.habbo.ui.widget.events
{
    public class _Str_5572 extends RoomWidgetUpdateEvent 
    {
        public static const RWDSUE_DIMMER_STATE:String = "RWDSUE_DIMMER_STATE";

        private var _state:int;
        private var _Str_6356:int;
        private var _Str_3770:int;
        private var _color:uint;
        private var _Str_3486:int;

        public function _Str_5572(k:int, _arg_2:int, _arg_3:int, _arg_4:uint, _arg_5:uint, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWDSUE_DIMMER_STATE, _arg_6, _arg_7);
            this._state = k;
            this._Str_6356 = _arg_2;
            this._Str_3770 = _arg_3;
            this._color = _arg_4;
            this._Str_3486 = _arg_5;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get _Str_14686():int
        {
            return this._Str_6356;
        }

        public function get _Str_6815():int
        {
            return this._Str_3770;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_5123():uint
        {
            return this._Str_3486;
        }
    }
}
