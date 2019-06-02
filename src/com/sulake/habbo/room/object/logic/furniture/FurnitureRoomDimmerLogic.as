package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureRoomDimmerLogic extends FurnitureLogic 
    {
        private var _roomColorUpdated:Boolean = false;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectWidgetRequestEvent.DIMMER, RoomObjectWidgetRequestEvent.WIDGET_REMOVE_DIMMER, RoomObjectDimmerStateUpdateEvent.DIMMER_STATE];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.DIMMER, object);
                eventDispatcher.dispatchEvent(k);
            }
        }

        override public function dispose():void
        {
            var k:RoomObjectDimmerStateUpdateEvent;
            var _local_2:uint;
            var _local_3:int;
            var _local_4:RoomObjectEvent;
            if (this._roomColorUpdated)
            {
                if (((!(eventDispatcher == null)) && (!(object == null))))
                {
                    if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
                    {
                        _local_2 = 0xFFFFFF;
                        _local_3 = 0xFF;
                        k = new RoomObjectDimmerStateUpdateEvent(object, 0, 1, 1, _local_2, _local_3);
                        eventDispatcher.dispatchEvent(k);
                        _local_4 = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.WIDGET_REMOVE_DIMMER, object);
                        eventDispatcher.dispatchEvent(_local_4);
                    }
                    this._roomColorUpdated = false;
                }
            }
            super.dispose();
        }

        private function dispatchColorUpdateEvent(k:String):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:uint;
            var _local_8:int;
            var _local_9:RoomObjectDimmerStateUpdateEvent;
            if (k == null)
            {
                return;
            }
            var _local_2:Array = k.split(",");
            if (_local_2.length >= 5)
            {
                _local_3 = this.readState(k);
                _local_4 = parseInt(_local_2[1]);
                _local_5 = parseInt(_local_2[2]);
                _local_6 = _local_2[3];
                _local_7 = parseInt(_local_6.substr(1), 16);
                _local_8 = parseInt(_local_2[4]);
                if (_local_3 == 0)
                {
                    _local_7 = 0xFFFFFF;
                    _local_8 = 0xFF;
                }
                if (((!(eventDispatcher == null)) && (!(object == null))))
                {
                    _local_9 = new RoomObjectDimmerStateUpdateEvent(object, _local_3, _local_4, _local_5, _local_7, _local_8);
                    eventDispatcher.dispatchEvent(_local_9);
                    this._roomColorUpdated = true;
                }
            }
        }

        private function readState(k:String):int
        {
            var _local_3:int;
            if (k == null)
            {
                return 0;
            }
            var _local_2:Array = k.split(",");
            if (_local_2.length >= 5)
            {
                _local_3 = (parseInt(_local_2[0]) - 1);
                return _local_3;
            }
            return 0;
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:int;
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                if (_local_2.data != null)
                {
                    if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
                    {
                        this.dispatchColorUpdateEvent(_local_2.data.getLegacyString());
                    }
                    _local_3 = this.readState(_local_2.data.getLegacyString());
                    _local_2 = new RoomObjectDataUpdateMessage(_local_3, _local_2.data);
                    super.processUpdateMessage(_local_2);
                }
                return;
            }
            super.processUpdateMessage(k);
        }

        override public function update(k:int):void
        {
            var _local_2:String;
            super.update(k);
            if (((!(object == null)) && (!(object.getModelController() == null))))
            {
                if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
                {
                    _local_2 = object.getModelController().getString(RoomObjectVariableEnum.FURNITURE_DATA);
                    if (((!(_local_2 == null)) && (_local_2.length > 0)))
                    {
                        object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_DATA, "");
                        this.dispatchColorUpdateEvent(_local_2);
                    }
                }
            }
        }
    }
}
