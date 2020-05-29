package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage 
    {
        public static const RWPOM_OPEN_PRESENT:String = "RWPOM_OPEN_PRESENT";

        private var _objectId:int;

        public function RoomWidgetPresentOpenMessage(k:String, _arg_2:int)
        {
            super(k);
            this._objectId = _arg_2;
        }

        public function get objectId():int
        {
            return this._objectId;
        }
    }
}
