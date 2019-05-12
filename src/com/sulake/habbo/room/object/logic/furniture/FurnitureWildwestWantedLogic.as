package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.FriendFurniEngravingWidgetTypeEnum;

    public class FurnitureWildwestWantedLogic extends FurnitureFriendFurniLogic 
    {


        override protected function get engravingDialogType():int
        {
            return FriendFurniEngravingWidgetTypeEnum._Str_15230;
        }
    }
}
