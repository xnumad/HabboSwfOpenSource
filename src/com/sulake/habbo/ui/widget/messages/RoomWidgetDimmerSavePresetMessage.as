package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage 
    {
        public static const RWSDPM_SAVE_PRESET:String = "RWSDPM_SAVE_PRESET";

        private var _presetNumber:int;
        private var _effectTypeId:int;
        private var _color:uint;
        private var _brightness:int;
        private var _apply:Boolean;

        public function RoomWidgetDimmerSavePresetMessage(k:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean)
        {
            super(RWSDPM_SAVE_PRESET);
            this._presetNumber = k;
            this._effectTypeId = _arg_2;
            this._color = _arg_3;
            this._brightness = _arg_4;
            this._apply = _arg_5;
        }

        public function get _Str_25037():int
        {
            return this._presetNumber;
        }

        public function get _Str_24446():int
        {
            return this._effectTypeId;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_5123():int
        {
            return this._brightness;
        }

        public function get apply():Boolean
        {
            return this._apply;
        }
    }
}
