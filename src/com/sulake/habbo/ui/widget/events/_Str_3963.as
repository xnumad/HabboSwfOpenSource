package com.sulake.habbo.ui.widget.events
{
    public class _Str_3963 extends RoomWidgetUpdateEvent 
    {
        public static const RWSUE_SETTINGS:String = "RWSUE_SETTINGS";

        private var _Str_9898:Number;
        private var _Str_2909:Number;
        private var _Str_2933:Number;

        public function _Str_3963(k:String, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_9898 = _arg_4;
            this._Str_2909 = _arg_3;
            this._Str_2933 = _arg_2;
        }

        public function get _Str_16610():Number
        {
            return this._Str_9898;
        }

        public function get _Str_3488():Number
        {
            return this._Str_2909;
        }

        public function get _Str_3410():Number
        {
            return this._Str_2933;
        }
    }
}
