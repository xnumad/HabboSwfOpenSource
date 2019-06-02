package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage 
    {
        public static const RWDPM_PREVIEW_DIMMER_PRESET:String = "RWDPM_PREVIEW_DIMMER_PRESET";

        private var _color:uint;
        private var _brightness:int;
        private var _bgOnly:Boolean;

        public function RoomWidgetDimmerPreviewMessage(k:uint, _arg_2:int, _arg_3:Boolean)
        {
            super(RWDPM_PREVIEW_DIMMER_PRESET);
            this._color = k;
            this._brightness = _arg_2;
            this._bgOnly = _arg_3;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_5123():int
        {
            return this._brightness;
        }

        public function get bgOnly():Boolean
        {
            return this._bgOnly;
        }
    }
}
