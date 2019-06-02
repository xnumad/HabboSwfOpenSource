package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectEvent;

    public class FurnitureStickieLogic extends FurnitureLogic 
    {


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.STICKIE, RoomObjectFurnitureActionEvent.STICKIE];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function initialize(k:XML):void
        {
            super.initialize(k);
            this.setColorIndexFromItemData();
            if (object != null)
            {
                object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_IS_STICKIE, "");
            }
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:RoomObjectWidgetRequestEvent;
            super.processUpdateMessage(k);
            if ((k is RoomObjectItemDataUpdateMessage))
            {
                _local_2 = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.STICKIE, object);
                if (_local_2 != null)
                {
                    eventDispatcher.dispatchEvent(_local_2);
                }
            }
            this.setColorIndexFromItemData();
        }

        protected function setColorIndexFromItemData():void
        {
            var k:String;
            var _local_2:Array;
            var _local_3:int;
            if (object != null)
            {
                k = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_DATA);
                _local_2 = new Array("9CCEFF", "FF9CFF", "9CFF9C", "FFFF33");
                _local_3 = _local_2.indexOf(k);
                if (_local_3 < 0)
                {
                    _local_3 = 3;
                }
                object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_COLOR, (_local_3 + 1));
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
                    this.useObject();
                    return;
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                k = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.STICKIE, object);
                eventDispatcher.dispatchEvent(k);
            }
        }
    }
}
