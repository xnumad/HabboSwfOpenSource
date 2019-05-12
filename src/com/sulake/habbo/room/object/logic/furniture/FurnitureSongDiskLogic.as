package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSongDiskLogic extends FurnitureLogic 
    {


        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:String;
            var _local_3:int;
            super.processUpdateMessage(k);
            if (object == null)
            {
                return;
            }
            if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
            {
                _local_2 = object.getModelController().getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                _local_3 = int(_local_2);
                object.getModelController().setString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM, (RoomWidgetEnumItemExtradataParameter.SONGDISK + _local_3));
            }
        }
    }
}
