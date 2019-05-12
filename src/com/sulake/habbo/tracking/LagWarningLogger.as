package com.sulake.habbo.tracking
{
    import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;

    public class LagWarningLogger 
    {
        private var _lastWarning:int;
        private var _warningCount:int;
        private var _habboTracking:HabboTracking;

        public function LagWarningLogger(k:HabboTracking)
        {
            this._habboTracking = k;
        }

        public function _Str_13181(k:int):void
        {
            if (((!(this.enabled)) || (this._Str_22094 <= 0)))
            {
                return;
            }
            this._warningCount++;
            this._Str_21304(k);
        }

        public function update(k:int):void
        {
            this._Str_21304(k);
        }

        private function _Str_21304(k:int):void
        {
            var _local_2:LagWarningReportMessageComposer;
            if (this._warningCount == 0)
            {
                return;
            }
            if (((this._lastWarning == 0) || ((k - this._lastWarning) > this._Str_22094)))
            {
                _local_2 = new LagWarningReportMessageComposer(this._warningCount);
                this._habboTracking.send(_local_2);
                this._lastWarning = k;
                this._warningCount = 0;
            }
        }

        private function get enabled():Boolean
        {
            return this._habboTracking.getBoolean("lagWarningLog.enabled");
        }

        private function get _Str_22094():int
        {
            return this._habboTracking.getInteger("lagWarningLog.interval.seconds", 10) * 1000;
        }
    }
}
