package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.utils.getTimer;

    public class FurnitureScoreLogic extends FurnitureLogic 
    {
        private static const UPDATE_INTERVAL:int = 50;
        private static const MAX_UPDATE_TIME:int = 3000;

        private var _Str_3295:int = 0;
        private var _Str_5063:int = 0;
        private var _Str_3464:int = 50;


        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                this._Str_25381(_local_2.state);
                return;
            }
            super.processUpdateMessage(k);
        }

        private function _Str_25381(k:int):void
        {
            var _local_3:int;
            this._Str_3295 = k;
            var _local_2:int = object.getState(0);
            if (this._Str_3295 != _local_2)
            {
                _local_3 = (this._Str_3295 - _local_2);
                if (_local_3 < 0)
                {
                    _local_3 = -(_local_3);
                }
                if ((_local_3 * UPDATE_INTERVAL) > MAX_UPDATE_TIME)
                {
                    this._Str_3464 = (MAX_UPDATE_TIME / _local_3);
                }
                else
                {
                    this._Str_3464 = UPDATE_INTERVAL;
                }
                this._Str_5063 = getTimer();
            }
        }

        override public function update(k:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            super.update(k);
            if (object != null)
            {
                _local_2 = object.getState(0);
                if (((!(_local_2 == this._Str_3295)) && (k >= (this._Str_5063 + this._Str_3464))))
                {
                    _local_3 = (k - this._Str_5063);
                    _local_4 = (_local_3 / this._Str_3464);
                    _local_5 = 1;
                    if (this._Str_3295 < _local_2)
                    {
                        _local_5 = -1;
                    }
                    if (_local_4 > (_local_5 * (this._Str_3295 - _local_2)))
                    {
                        _local_4 = (_local_5 * (this._Str_3295 - _local_2));
                    }
                    object.setState((_local_2 + (_local_5 * _local_4)), 0);
                    this._Str_5063 = (k - (_local_3 - (_local_4 * this._Str_3464)));
                }
            }
        }
    }
}
