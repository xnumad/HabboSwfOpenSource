package com.sulake.habbo.ui.widget.events
{
    public class _Str_4828 extends RoomWidgetUpdateEvent 
    {
        public static const RWPIUE_PET_STATUS_UPDATE:String = "RWPIUE_PET_STATUS_UPDATE";

        private var _Str_2388:int;
        private var _Str_3101:Boolean;
        private var _Str_3297:Boolean;
        private var _Str_3284:Boolean;
        private var _Str_3095:Boolean;

        public function _Str_4828(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RWPIUE_PET_STATUS_UPDATE, _arg_6, _arg_7);
            this._Str_2388 = k;
            this._Str_3101 = _arg_2;
            this._Str_3297 = _arg_3;
            this._Str_3284 = _arg_4;
            this._Str_3095 = _arg_5;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get canBreed():Boolean
        {
            return this._Str_3101;
        }

        public function get canHarvest():Boolean
        {
            return this._Str_3297;
        }

        public function get canRevive():Boolean
        {
            return this._Str_3284;
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._Str_3095;
        }
    }
}
