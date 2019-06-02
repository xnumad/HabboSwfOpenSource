package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.events.RoomObjectFloorHoleEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureFloorHoleLogic extends FurnitureMultistateLogic 
    {
        private static const STATE_HOLE:int = 0;

        private var _currentState:int = -1;
        private var _currentLoc:Vector3d = null;


        override public function dispose():void
        {
            if (this._currentState == STATE_HOLE)
            {
                eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent(RoomObjectFloorHoleEvent.ROFHO_REMOVE_HOLE, object));
            }
            super.dispose();
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectFloorHoleEvent.ROFHO_ADD_HOLE, RoomObjectFloorHoleEvent.ROFHO_REMOVE_HOLE];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:RoomObjectDataUpdateMessage;
            var _local_3:IVector3d;
            var _local_4:int;
            super.processUpdateMessage(k);
            if (object != null)
            {
                _local_2 = (k as RoomObjectDataUpdateMessage);
                if (_local_2 != null)
                {
                    _local_4 = object.getState(0);
                    this.handleStateUpdate(_local_4);
                }
                _local_3 = object.getLocation();
                if (this._currentLoc == null)
                {
                    this._currentLoc = new Vector3d();
                }
                else
                {
                    if (((!(_local_3.x == this._currentLoc.x)) || (!(_local_3.y == this._currentLoc.y))))
                    {
                        if (this._currentState == STATE_HOLE)
                        {
                            if (eventDispatcher != null)
                            {
                                eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent(RoomObjectFloorHoleEvent.ROFHO_ADD_HOLE, object));
                            }
                        }
                    }
                }
                this._currentLoc.assign(_local_3);
            }
        }

        private function handleStateUpdate(k:int):void
        {
            if (k != this._currentState)
            {
                if (eventDispatcher != null)
                {
                    if (k == STATE_HOLE)
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent(RoomObjectFloorHoleEvent.ROFHO_ADD_HOLE, object));
                    }
                    else
                    {
                        if (this._currentState == STATE_HOLE)
                        {
                            eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent(RoomObjectFloorHoleEvent.ROFHO_REMOVE_HOLE, object));
                        }
                    }
                }
                this._currentState = k;
            }
        }

        private function handleAutomaticStateUpdate():void
        {
            var _local_2:IRoomObjectModel;
            var _local_3:Number;
            var _local_4:int;
            var k:IRoomObject = object;
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX);
                    if (!isNaN(_local_3))
                    {
                        _local_4 = _local_3;
                        _local_4 = (_local_4 % 2);
                        this.handleStateUpdate(_local_4);
                    }
                }
            }
        }

        override public function update(k:int):void
        {
            super.update(k);
            this.handleAutomaticStateUpdate();
        }
    }
}
