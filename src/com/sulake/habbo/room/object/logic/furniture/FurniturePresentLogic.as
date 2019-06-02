package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectModelDataUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.data.MapStuffData;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObjectModelController;

    public class FurniturePresentLogic extends FurnitureLogic 
    {
        private static const MESSAGE:String = "MESSAGE";
        private static const PRODUCT_CODE:String = "PRODUCT_CODE";
        private static const EXTRA_PARAM:String = "EXTRA_PARAM";
        private static const PURCHASER_NAME:String = "PURCHASER_NAME";
        private static const PURCHASER_FIGURE:String = "PURCHASER_FIGURE";


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.PRESENT];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (((!(_local_2 == null)) && (!(_local_2.data == null))))
            {
                _local_2.data.writeRoomObjectModel(object.getModelController());
                this._Str_16576();
            }
            var _local_3:RoomObjectModelDataUpdateMessage = (k as RoomObjectModelDataUpdateMessage);
            if (_local_3 != null)
            {
                if (_local_3.numberKey == RoomObjectVariableEnum.FURNITURE_DISABLE_PICKING_ANIMATION)
                {
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_DISABLE_PICKING_ANIMATION, _local_3.numberValue);
                }
            }
        }

        private function _Str_16576():void
        {
            if (((object == null) || (object.getModelController() == null)))
            {
                return;
            }
            var k:MapStuffData = new MapStuffData();
            k.initializeFromRoomObjectModel(object.getModel());
            var _local_2:String = k.getValue(MESSAGE);
            var _local_3:String = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_DATA);
            if (((_local_2 == null) && (!(_local_3 == null))))
            {
                object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_DATA, _local_3.substr(1));
            }
            else
            {
                object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_DATA, k.getValue(MESSAGE));
            }
            this.setObjectVariable(RoomObjectVariableEnum.FURNITURE_TYPE_ID, k.getValue(PRODUCT_CODE));
            this.setObjectVariable(RoomObjectVariableEnum.FURNITURE_PURCHASER_NAME, k.getValue(PURCHASER_NAME));
            this.setObjectVariable(RoomObjectVariableEnum.FURNITURE_PURCHASER_FIGURE, k.getValue(PURCHASER_FIGURE));
        }

        private function setObjectVariable(k:String, _arg_2:String):void
        {
            if (_arg_2 != null)
            {
                object.getModelController().setString(k, _arg_2);
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
                case MouseEvent.ROLL_OVER:
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.MOUSE_BUTTON, object));
                    super.mouseEvent(k, _arg_2);
                    return;
                case MouseEvent.ROLL_OUT:
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.MOUSE_ARROW, object));
                    super.mouseEvent(k, _arg_2);
                    return;
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
                k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.PRESENT, object);
                eventDispatcher.dispatchEvent(k);
            }
        }

        override public function initialize(k:XML):void
        {
            var _local_3:IRoomObjectModelController;
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.particlesystems;
            if (((_local_2 == null) || (_local_2.length() == 0)))
            {
                return;
            }
            if (object != null)
            {
                _local_3 = object.getModelController();
                if (_local_3 != null)
                {
                    _local_3.setString(RoomObjectVariableEnum.FURNITURE_FIREWORKS_DATA, String(_local_2));
                }
            }
        }
    }
}
