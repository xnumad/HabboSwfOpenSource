package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureMultiheightLogic extends FurnitureMultistateLogic 
    {


        override public function initialize(k:XML):void
        {
            super.initialize(k);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_IS_VARIABLE_HEIGHT, 1, true);
        }
    }
}
