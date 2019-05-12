package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPlayListModificationMessage extends RoomWidgetMessage 
    {
        public static const RWPLAM_ADD_TO_PLAYLIST:String = "RWPLAM_ADD_TO_PLAYLIST";
        public static const RWPLAM_REMOVE_FROM_PLAYLIST:String = "RWPLAM_REMOVE_FROM_PLAYLIST";

        private var _diskId:int;
        private var _slotNumber:int;

        public function RoomWidgetPlayListModificationMessage(k:String, _arg_2:int=-1, _arg_3:int=-1)
        {
            super(k);
            this._slotNumber = _arg_2;
            this._diskId = _arg_3;
        }

        public function get _Str_5848():int
        {
            return this._diskId;
        }

        public function get _Str_20440():int
        {
            return this._slotNumber;
        }
    }
}
