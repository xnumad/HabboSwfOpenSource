package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage 
    {
        public static const RWCM_MESSAGE_SELECT_EFFECT:String = "RWCM_MESSAGE_SELECT_EFFECT";
        public static const RWCM_MESSAGE_UNSELECT_EFFECT:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
        public static const RWCM_MESSAGE_UNSELECT_ALL_EFFECTS:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";

        private var _effectType:int;

        public function RoomWidgetSelectEffectMessage(k:String, _arg_2:int=-1)
        {
            super(k);
            this._effectType = _arg_2;
        }

        public function get effectType():int
        {
            return this._effectType;
        }
    }
}
