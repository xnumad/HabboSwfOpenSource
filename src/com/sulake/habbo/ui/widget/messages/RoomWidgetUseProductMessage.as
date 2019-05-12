package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetUseProductMessage extends RoomWidgetMessage 
    {
        public static const RWUPM_PET_PRODUCT:String = "RWUPM_PET_PRODUCT";
        public static const MONSTERPLANT_SEED:String = "RWUPM_MONSTERPLANT_SEED";

        private var _roomObjectId:int = 0;
        private var _petId:int = -1;

        public function RoomWidgetUseProductMessage(k:String, _arg_2:int, _arg_3:int=-1)
        {
            super(k);
            this._roomObjectId = _arg_2;
            this._petId = _arg_3;
        }

        public function get _Str_2713():int
        {
            return this._roomObjectId;
        }

        public function get _Str_2508():int
        {
            return this._petId;
        }
    }
}
