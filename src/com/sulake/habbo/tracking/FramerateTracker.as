package com.sulake.habbo.tracking
{
    public class FramerateTracker 
    {
        private var _lastReport:int;
        private var _updateCounter:int;
        private var _averageUpdateInterval:Number;
        private var _eventCounter:int;
        private var _habboTracking:HabboTracking;

        public function FramerateTracker(k:HabboTracking)
        {
            this._habboTracking = k;
        }

        public function get frameRate():int
        {
            return Math.round((1000 / this._averageUpdateInterval));
        }

        public function trackUpdate(k:uint, _arg_2:int):void
        {
            var _local_3:Number;
            this._updateCounter++;
            if (this._updateCounter == 1)
            {
                this._averageUpdateInterval = k;
                this._lastReport = _arg_2;
            }
            else
            {
                _local_3 = Number(this._updateCounter);
                this._averageUpdateInterval = (((this._averageUpdateInterval * (_local_3 - 1)) / _local_3) + (Number(k) / _local_3));
            }
            if ((_arg_2 - this._lastReport) >= (this._habboTracking.getInteger("tracking.framerate.reportInterval.seconds", 300) * 1000))
            {
                this._updateCounter = 0;
                if (this._eventCounter < this._habboTracking.getInteger("tracking.framerate.maximumEvents", 5))
                {
                    this._habboTracking.trackGoogle("performance", "averageFramerate", this.frameRate);
                    this._eventCounter++;
                    this._lastReport = _arg_2;
                }
            }
        }
    }
}
