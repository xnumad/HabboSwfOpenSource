package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetEcotronBoxOpenMessage extends RoomWidgetMessage 
    {
        public static const RWEBOM_OPEN_ECOTRONBOX:String = "RWEBOM_OPEN_ECOTRONBOX";

        private var _objectId:int;

        public function RoomWidgetEcotronBoxOpenMessage(k:String, _arg_2:int)
        {
            super(k);
            this._objectId = _arg_2;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }
    }
}
