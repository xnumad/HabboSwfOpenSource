package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class FurnitureGroupForumTerminalLogic extends FurnitureGuildCustomizedLogic 
    {


        override protected function openContextMenu():void
        {
        }

        override protected function updateGuildId(k:String):void
        {
            super.updateGuildId(k);
            object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_INTERNAL_LINK, ("groupforum/" + k));
        }

        override public function useObject():void
        {
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.INERNAL_LINK, object));
            }
            super.useObject();
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectWidgetRequestEvent.INERNAL_LINK]);
        }
    }
}
