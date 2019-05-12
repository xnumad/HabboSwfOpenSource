package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureCrackableLogic extends FurnitureLogic 
    {
        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            if (object == null)
            {
                return;
            }
            if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
            {
                object.getModelController().setString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM, RoomWidgetEnumItemExtradataParameter.CRACKABLE_FURNI);
            }
        }
    }
}
