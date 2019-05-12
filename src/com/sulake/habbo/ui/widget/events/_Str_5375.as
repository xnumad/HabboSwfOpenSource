package com.sulake.habbo.ui.widget.events
{
    public class _Str_5375 extends RoomWidgetUpdateEvent 
    {
        public static const RWRBSLUE_SKILL_LIST:String = "RWRBSLUE_SKILL_LIST";

        private var _Str_2753:int;
        private var _Str_6548:Array;

        public function _Str_5375(k:int, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWRBSLUE_SKILL_LIST, _arg_3, _arg_4);
            this._Str_2753 = k;
            this._Str_6548 = _arg_2;
        }

        public function get _Str_10833():Array
        {
            return this._Str_6548;
        }

        public function get _Str_5455():int
        {
            return this._Str_2753;
        }
    }
}
