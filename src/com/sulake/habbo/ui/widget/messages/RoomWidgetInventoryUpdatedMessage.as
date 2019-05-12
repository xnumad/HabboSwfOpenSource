package com.sulake.habbo.ui.widget.messages
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class RoomWidgetInventoryUpdatedMessage extends RoomWidgetUpdateEvent 
    {
        public static const RWIUM_INVENTORY_UPDATED:String = "RWIUM_INVENTORY_UPDATED";

        public function RoomWidgetInventoryUpdatedMessage(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
