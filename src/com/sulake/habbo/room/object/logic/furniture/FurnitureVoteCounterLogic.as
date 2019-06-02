package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.data.VoteResultStuffData;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.utils.getTimer;

    public class FurnitureVoteCounterLogic extends FurnitureMultistateLogic 
    {
        private static const UPDATE_INTERVAL:int = 33;
        private static const MAX_UPDATE_TIME:int = 1000;

        private var _total:int = 0;
        private var _lastUpdate:int = 0;
        private var _updateInterval:int = 33;


        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:VoteResultStuffData;
            super.processUpdateMessage(k);
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                _local_3 = (_local_2.data as VoteResultStuffData);
                if (_local_3 != null)
                {
                    this.updateTotal(_local_3.result);
                }
            }
        }

        private function get currentTotal():int
        {
            return int(object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_VOTE_COUNTER_COUNT));
        }

        private function updateTotal(k:int):void
        {
            var _local_2:int;
            this._total = k;
            if (this._lastUpdate == 0)
            {
                object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_VOTE_COUNTER_COUNT, k);
                this._lastUpdate = getTimer();
                return;
            }
            if (this._total != this.currentTotal)
            {
                _local_2 = Math.abs((this._total - this.currentTotal));
                if ((_local_2 * UPDATE_INTERVAL) > MAX_UPDATE_TIME)
                {
                    this._updateInterval = (MAX_UPDATE_TIME / _local_2);
                }
                else
                {
                    this._updateInterval = UPDATE_INTERVAL;
                }
                this._lastUpdate = getTimer();
            }
        }

        override public function update(k:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            super.update(k);
            if (object != null)
            {
                if (((!(this.currentTotal == this._total)) && (k >= (this._lastUpdate + this._updateInterval))))
                {
                    _local_2 = (k - this._lastUpdate);
                    _local_3 = (_local_2 / this._updateInterval);
                    _local_4 = 1;
                    if (this._total < this.currentTotal)
                    {
                        _local_4 = -1;
                    }
                    if (_local_3 > (_local_4 * (this._total - this.currentTotal)))
                    {
                        _local_3 = (_local_4 * (this._total - this.currentTotal));
                    }
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_VOTE_COUNTER_COUNT, (this.currentTotal + (_local_4 * _local_3)));
                    this._lastUpdate = (k - (_local_2 - (_local_3 * this._updateInterval)));
                }
            }
        }
    }
}
