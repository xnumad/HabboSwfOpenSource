package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDimmerPresetsEvent extends RoomSessionEvent 
    {
        public static const RSDPE_PRESETS:String = "RSDPE_PRESETS";

        private var _selectedPresetId:int = 0;
        private var _presets:Array;

        public function RoomSessionDimmerPresetsEvent(k:String, _arg_2:IRoomSession, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this._presets = new Array();
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function get _Str_6226():int
        {
            return this._selectedPresetId;
        }

        public function get _Str_10888():int
        {
            return this._presets.length;
        }

        public function set _Str_6226(k:int):void
        {
            this._selectedPresetId = k;
        }

        public function storePreset(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:RoomSessionDimmerPresetsEventPresetItem = new RoomSessionDimmerPresetsEventPresetItem(k, _arg_2, _arg_3, _arg_4);
            this._presets[(k - 1)] = _local_5;
        }

        public function getPreset(k:int):RoomSessionDimmerPresetsEventPresetItem
        {
            if (((k < 0) || (k >= this._presets.count)))
            {
                return null;
            }
            return this._presets[k];
        }
    }
}
