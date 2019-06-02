package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetDimmerUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const RWDUE_PRESETS:String = "RWDUE_PRESETS";
        public static const RWDUE_HIDE:String = "RWDUE_HIDE";

        private var _selectedPresetId:int = 0;
        private var _presets:Array;

        public function RoomWidgetDimmerUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            this._presets = new Array();
            super(k, _arg_2, _arg_3);
        }

        public function get _Str_6226():int
        {
            return this._selectedPresetId;
        }

        public function get _Str_10888():int
        {
            return this._presets.length;
        }

        public function get _Str_8447():Array
        {
            return this._presets;
        }

        public function set _Str_6226(k:int):void
        {
            this._selectedPresetId = k;
        }

        public function storePreset(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:_Str_6094 = new _Str_6094(k, _arg_2, _arg_3, _arg_4);
            this._presets[(k - 1)] = _local_5;
        }

        public function getPreset(k:int):_Str_6094
        {
            if (((k < 0) || (k >= this._presets.count)))
            {
                return null;
            }
            return this._presets[k];
        }
    }
}
