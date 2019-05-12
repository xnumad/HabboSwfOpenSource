package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;

    public class FurnitureVimeoLogic extends FurnitureLogic 
    {


        override public function get widget():String
        {
            return RoomWidgetEnum.VIMEO;
        }
    }
}
