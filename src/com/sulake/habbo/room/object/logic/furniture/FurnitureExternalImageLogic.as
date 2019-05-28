package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureExternalImageLogic extends FurnitureMultistateLogic 
    {


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.STICKIE, RoomObjectFurnitureActionEvent.STICKIE];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function get widget():String
        {
            return RoomWidgetEnum.EXTERNAL_IMAGE;
        }

        override public function initialize(k:XML):void
        {
            var _local_3:XML;
            var _local_4:String;
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.mask;
            if (_local_2.length() > 0)
            {
                _local_3 = _local_2[0];
                if (XMLValidator.checkRequiredAttributes(_local_3, ["type"]))
                {
                    _local_4 = _local_3.@type;
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_USES_PLANE_MASK, 1, true);
                    object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_PLANE_MASK_TYPE, _local_4, true);
                }
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            if (object == null)
            {
                return;
            }
            switch (k.type)
            {
                case MouseEvent.DOUBLE_CLICK:
                    useObject();
                    return;
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }
    }
}
