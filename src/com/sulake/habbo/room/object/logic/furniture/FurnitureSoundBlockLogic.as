package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSoundBlockLogic extends FurnitureMultistateLogic 
    {
        private static const HIGHEST_SEMITONE:int = 12;
        private static const LOWEST_SEMITONE:int = -12;
        private static const STATE_UNINITIALIZED:int = -1;

        private var _state:int = -1;
        private var _sampleId:int = -1;
        private var _noPitch:Boolean = false;
        private var _lastLocZ:Number = 0;


        override public function dispose():void
        {
            if (this._state != -1)
            {
                eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent(RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_DISPOSED, object, this._sampleId));
            }
            super.dispose();
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectSamplePlaybackEvent.ROPSPE_PLAY_SAMPLE, RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_DISPOSED, RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_INITIALIZED];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function initialize(k:XML):void
        {
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.sound;
            if (_local_2.length() == 0)
            {
                return;
            }
            var _local_3:XMLList = k.sound.sample;
            if (_local_3.length() == 0)
            {
                return;
            }
            this._sampleId = int(_local_3.@id);
            this._noPitch = Boolean((_local_3.@nopitch == "true"));
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_SOUNDBLOCK_RELATIVE_ANIMATION_SPEED, 1);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            var _local_2:IVector3d = object.getLocation();
            var _local_3:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_3 != null)
            {
                if (((this._state == STATE_UNINITIALIZED) && (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)))
                {
                    this._lastLocZ = _local_2.z;
                    eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent(RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_INITIALIZED, object, this._sampleId, this._Str_17428(_local_2.z)));
                }
                if (((!(this._state == STATE_UNINITIALIZED)) && (!(_local_2 == null))))
                {
                    if (this._lastLocZ != _local_2.z)
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent(RoomObjectSamplePlaybackEvent.ROPSPE_CHANGE_PITCH, object, this._sampleId, this._Str_17428(_local_2.z)));
                        this._lastLocZ = _local_2.z;
                    }
                }
                if ((((!(this._state == STATE_UNINITIALIZED)) && (!(_local_3.state == this._state))) && (!(_local_2 == null))))
                {
                    this._Str_18183(_local_2.z);
                }
                this._state = _local_3.state;
            }
        }

        private function _Str_18183(k:Number):void
        {
            var _local_2:Number = this._Str_17428(k);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_SOUNDBLOCK_RELATIVE_ANIMATION_SPEED, _local_2);
            eventDispatcher.dispatchEvent(new RoomObjectSamplePlaybackEvent(RoomObjectSamplePlaybackEvent.ROPSPE_PLAY_SAMPLE, object, this._sampleId, _local_2));
        }

        private function _Str_17428(k:Number):Number
        {
            var _local_2:int = (k * 2);
            if (_local_2 > HIGHEST_SEMITONE)
            {
                _local_2 = Math.min(0, (LOWEST_SEMITONE + ((_local_2 - HIGHEST_SEMITONE) - 1)));
            }
            return (this._noPitch) ? 1 : Math.pow(2, (_local_2 / 12));
        }
    }
}
