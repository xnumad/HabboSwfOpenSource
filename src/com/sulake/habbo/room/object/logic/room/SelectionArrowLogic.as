package com.sulake.habbo.room.object.logic.room
{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectVisibilityUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class SelectionArrowLogic extends ObjectLogicBase 
    {


        override public function initialize(k:XML):void
        {
            var _local_2:IRoomObjectModelController;
            if (object != null)
            {
                _local_2 = object.getModelController();
                if (_local_2 != null)
                {
                    _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, 1);
                    object.setState(1, 0);
                }
            }
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            var _local_2:RoomObjectVisibilityUpdateMessage = (k as RoomObjectVisibilityUpdateMessage);
            if (_local_2 != null)
            {
                if (_local_2.type == RoomObjectVisibilityUpdateMessage.ROVUM_ENABLED)
                {
                    if (object != null)
                    {
                        object.setState(0, 0);
                    }
                }
                else
                {
                    if (_local_2.type == RoomObjectVisibilityUpdateMessage.ROVUM_DISABLED)
                    {
                        if (object != null)
                        {
                            object.setState(1, 0);
                        }
                    }
                }
            }
        }
    }
}
