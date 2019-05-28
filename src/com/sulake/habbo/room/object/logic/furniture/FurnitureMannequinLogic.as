package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.data.MapStuffData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectEvent;

    public class FurnitureMannequinLogic extends FurnitureLogic 
    {
        private static const GENDER:String = "GENDER";
        private static const FIGURE:String = "FIGURE";
        private static const OUTFIT_NAME:String = "OUTFIT_NAME";


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.MANNEQUIN];
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
        }

        private function _Str_16576():void
        {
            if (((object == null) || (object.getModelController() == null)))
            {
                return;
            }
            var k:MapStuffData = new MapStuffData();
            k.initializeFromRoomObjectModel(object.getModel());
            object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_GENDER, k.getValue(GENDER));
            object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_FIGURE, k.getValue(FIGURE));
            object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_NAME, k.getValue(OUTFIT_NAME));
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
                k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.MANNEQUIN, object);
                eventDispatcher.dispatchEvent(k);
            }
        }
    }
}
