package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRequestBotForceOpenContextMenuEvent extends RoomWidgetUpdateEvent 
    {
        public static const OPEN:String = "RWRBFOCME_OPEN";

        private var _Str_2753:int;

        public function RoomWidgetRequestBotForceOpenContextMenuEvent(k:int)
        {
            this._Str_2753 = k;
            super(OPEN);
        }

        public function get _Str_5455():int
        {
            return this._Str_2753;
        }
    }
}
