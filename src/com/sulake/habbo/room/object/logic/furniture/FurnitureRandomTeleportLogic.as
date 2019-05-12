package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.ui.widget.enums.ContextMenuType;

    public class FurnitureRandomTeleportLogic extends FurnitureMultistateLogic 
    {


        override public function get contextMenu():String
        {
            return ContextMenuType.RANDOM_TELEPORT;
        }
    }
}
