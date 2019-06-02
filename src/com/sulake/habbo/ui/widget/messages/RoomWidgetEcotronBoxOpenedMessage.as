package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage 
    {
        public static const RWEBOM_ECOTRONBOX_OPENED:String = "RWEBOM_ECOTRONBOX_OPENED";

        private var _itemType:String;
        private var _classId:int;

        public function RoomWidgetEcotronBoxOpenedMessage(k:String, _arg_2:String, _arg_3:int)
        {
            super(k);
            this._itemType = _arg_2;
            this._classId = _arg_3;
        }

        public function get _Str_2887():String
        {
            return this._itemType;
        }

        public function get classId():int
        {
            return this._classId;
        }
    }
}
