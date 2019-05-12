package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetRoomChangedEvent extends Event 
    {
        public function CatalogWidgetRoomChangedEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(CatalogWidgetEvent.ROOM_CHANGED, k, _arg_2);
        }
    }
}
