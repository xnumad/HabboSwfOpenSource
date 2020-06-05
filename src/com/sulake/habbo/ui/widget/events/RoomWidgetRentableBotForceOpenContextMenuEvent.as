package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentableBotForceOpenContextMenuEvent extends RoomWidgetUpdateEvent
    {
        public static const OPEN:String = "RWRBFOCME_OPEN";

        private var _botId:int;

        public function RoomWidgetRentableBotForceOpenContextMenuEvent(k:int)
        {
            this._botId = k;
            super(OPEN);
        }

        public function get botId():int
        {
            return this._botId;
        }
    }
}
