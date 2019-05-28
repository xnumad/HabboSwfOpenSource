package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomObjectEvent;

    public class FurniturePetCustomizationLogic extends FurnitureLogic 
    {


        override public function getEventTypes():Array
        {
            var k:Array = [];
            k.push(RoomObjectWidgetRequestEvent.PET_PRODUCT_MENU);
            return getAllEventTypes(super.getEventTypes(), k);
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
                    this.useObject();
                    return;
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            if (object == null)
            {
                return;
            }
            if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
            {
                object.getModelController().setString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM, RoomWidgetEnumItemExtradataParameter.USABLE_PRODUCT);
            }
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.PET_PRODUCT_MENU, object);
                eventDispatcher.dispatchEvent(k);
            }
        }
    }
}
