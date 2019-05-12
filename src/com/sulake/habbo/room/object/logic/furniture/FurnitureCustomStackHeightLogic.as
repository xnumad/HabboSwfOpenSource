package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureCustomStackHeightLogic extends FurnitureMultistateLogic 
    {


        override public function get widget():String
        {
            return RoomWidgetEnum.CUSTOM_STACK_HEIGHT;
        }

        override public function initialize(k:XML):void
        {
            super.initialize(k);
            if (((!(object == null)) && (!(object.getModelController() == null))))
            {
                object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_ALWAYS_STACKABLE, 1);
            }
        }
    }
}
