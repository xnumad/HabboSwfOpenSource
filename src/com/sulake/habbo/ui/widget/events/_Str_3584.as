package com.sulake.habbo.ui.widget.events
{
    public class _Str_3584 extends RoomWidgetUpdateEvent 
    {
        public static const RWCCUE_SHOW_GENDER_SELECTION:String = "RWCCUE_SHOW_GENDER_SELECTION";
        public static const RWCCUE_SHOW_CLOTHING_EDITOR:String = "RWCCUE_SHOW_CLOTHING_EDITOR";

        private var _Str_2319:int = -1;
        private var _Str_3014:int = -1;
        private var _roomId:int = -1;

        public function _Str_3584(k:String, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_2319 = _arg_2;
            this._Str_3014 = _arg_3;
            this._roomId = _arg_4;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get objectCategory():int
        {
            return this._Str_3014;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
