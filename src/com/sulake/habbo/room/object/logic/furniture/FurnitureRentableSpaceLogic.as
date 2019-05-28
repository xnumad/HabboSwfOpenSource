package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.events.RoomObjectDataRequestEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureRentableSpaceLogic extends FurnitureLogic 
    {


        override public function get widget():String
        {
            return RoomWidgetEnum.RENTABLESPACE;
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectDataRequestEvent.RODRE_CURRENT_USER_ID]);
        }

        override public function update(k:int):void
        {
            super.update(k);
            if (!object.getModel().hasNumber(RoomObjectVariableEnum.SESSION_CURRENT_USER_ID))
            {
                eventDispatcher.dispatchEvent(new RoomObjectDataRequestEvent(RoomObjectDataRequestEvent.RODRE_CURRENT_USER_ID, object));
            }
            var _local_2:IRoomObjectModel = object.getModel();
            var _local_3:String = _local_2.getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA).getValue("renterId");
            var _local_4:Number = _local_2.getNumber(RoomObjectVariableEnum.SESSION_CURRENT_USER_ID);
            if (_local_3 != null)
            {
                if (Number(_local_3) == _local_4)
                {
                    object.setState(2, 0);
                }
                else
                {
                    object.setState(1, 0);
                }
            }
            else
            {
                object.setState(0, 0);
            }
        }
    }
}
