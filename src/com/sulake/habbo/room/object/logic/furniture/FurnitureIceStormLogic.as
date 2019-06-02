package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.data.LegacyStuffData;

    public class FurnitureIceStormLogic extends FurnitureMultistateLogic 
    {
        private var _nextState:int = 0;
        private var _nextStateExtra:Number = 0;
        private var _nextStateTimeStamp:int = 0;


        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                this._Str_9796(_local_2);
                return;
            }
            super.processUpdateMessage(k);
        }

        private function _Str_9796(k:RoomObjectDataUpdateMessage):void
        {
            var _local_4:LegacyStuffData;
            var _local_2:int = (k.state / 1000);
            var _local_3:int = (k.state % 1000);
            if (_local_3 == 0)
            {
                this._nextStateTimeStamp = 0;
                _local_4 = new LegacyStuffData();
                _local_4.setString(String(_local_2));
                k = new RoomObjectDataUpdateMessage(_local_2, _local_4, k._Str_2794);
                super.processUpdateMessage(k);
            }
            else
            {
                this._nextState = _local_2;
                this._nextStateExtra = k._Str_2794;
                this._nextStateTimeStamp = (lastUpdateTime + _local_3);
            }
        }

        override public function update(k:int):void
        {
            var _local_2:LegacyStuffData;
            var _local_3:RoomObjectDataUpdateMessage;
            if (((this._nextStateTimeStamp > 0) && (k >= this._nextStateTimeStamp)))
            {
                this._nextStateTimeStamp = 0;
                _local_2 = new LegacyStuffData();
                _local_2.setString(String(this._nextState));
                _local_3 = new RoomObjectDataUpdateMessage(this._nextState, _local_2, this._nextStateExtra);
                super.processUpdateMessage(_local_3);
            }
            super.update(k);
        }
    }
}
