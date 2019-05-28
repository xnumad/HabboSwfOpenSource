package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.events.RoomObjectDataRequestEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureYoutubeLogic extends FurnitureLogic 
    {


        override public function get widget():String
        {
            return RoomWidgetEnum.YOUTUBE;
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectDataRequestEvent.RODRE_URL_PREFIX]);
        }

        override public function update(k:int):void
        {
            super.update(k);
            if (!object.getModel().hasString(RoomObjectVariableEnum.SESSION_URL_PREFIX))
            {
                eventDispatcher.dispatchEvent(new RoomObjectDataRequestEvent(RoomObjectDataRequestEvent.RODRE_URL_PREFIX, object));
            }
        }
    }
}
