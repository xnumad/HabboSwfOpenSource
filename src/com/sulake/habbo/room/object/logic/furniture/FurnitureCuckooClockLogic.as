package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.events.RoomObjectPlaySoundIdEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureCuckooClockLogic extends FurnitureMultistateLogic 
    {
        private var _state:int = -1;
        private var _loc:IVector3d;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND_AT_PITCH];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(k);
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                if (((!(this._state == -1)) && (!(_local_2.state == this._state))))
                {
                    this._Str_18183(this._loc.z);
                }
                this._state = _local_2.state;
            }
            else
            {
                this._loc = k.loc;
            }
        }

        private function _Str_18183(k:Number):void
        {
            var _local_2:Number = Math.pow(2, (k - 1.2));
            eventDispatcher.dispatchEvent(new RoomObjectPlaySoundIdEvent(RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND_AT_PITCH, object, "FURNITURE_cuckoo_clock", _local_2));
        }
    }
}
