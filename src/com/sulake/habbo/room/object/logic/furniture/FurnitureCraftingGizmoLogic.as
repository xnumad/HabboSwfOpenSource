package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureCraftingGizmoLogic extends FurnitureLogic 
    {


        override public function get widget():String
        {
            return RoomWidgetEnum.CRAFTING;
        }

        override public function useObject():void
        {
            super.useObject();
        }

        public function _Str_6210(k:int):void
        {
            if (object == null)
            {
                return;
            }
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX, k, false);
            }
        }
    }
}
