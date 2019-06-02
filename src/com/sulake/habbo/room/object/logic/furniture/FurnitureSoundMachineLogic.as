package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSoundMachineLogic extends FurnitureMultistateLogic 
    {
        private var _disposeEventsAllowed:Boolean;
        private var _isInitialized:Boolean = false;
        private var _currentState:int = -1;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectFurnitureActionEvent.SOUND_MACHINE_START, RoomObjectFurnitureActionEvent.SOUND_MACHINE_STOP, RoomObjectFurnitureActionEvent.SOUND_MACHINE_DISPOSE, RoomObjectFurnitureActionEvent.SOUND_MACHINE_INIT];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function dispose():void
        {
            this._Str_18894();
            super.dispose();
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:RoomObjectDataUpdateMessage;
            var _local_3:int;
            super.processUpdateMessage(k);
            if (object == null)
            {
                return;
            }
            if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
            {
                if (!this._isInitialized)
                {
                    this.requestInitialize();
                }
                _local_2 = (k as RoomObjectDataUpdateMessage);
                if (_local_2 == null)
                {
                    return;
                }
                _local_3 = object.getState(0);
                if (_local_3 != this._currentState)
                {
                    this._currentState = _local_3;
                    if (_local_3 == 1)
                    {
                        this._Str_5930();
                    }
                    else
                    {
                        if (_local_3 == 0)
                        {
                            this._Str_18998();
                        }
                    }
                }
            }
        }

        private function requestInitialize():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            this._disposeEventsAllowed = true;
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.SOUND_MACHINE_INIT, object);
            eventDispatcher.dispatchEvent(k);
            this._isInitialized = true;
        }

        private function _Str_5930():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            this._disposeEventsAllowed = true;
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.SOUND_MACHINE_START, object);
            eventDispatcher.dispatchEvent(k);
        }

        private function _Str_18998():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.SOUND_MACHINE_STOP, object);
            eventDispatcher.dispatchEvent(k);
        }

        private function _Str_18894():void
        {
            if (!this._disposeEventsAllowed)
            {
                return;
            }
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.SOUND_MACHINE_DISPOSE, object);
            eventDispatcher.dispatchEvent(k);
        }
    }
}
