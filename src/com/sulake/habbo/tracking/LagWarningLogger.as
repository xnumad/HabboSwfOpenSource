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
            if (((!(this.enabled)) || (this.warningInterval <= 0)))
            {
                return;
            }
            this._warningCount++;
            this.reportWarningsAsNeeded(k);
        }

        public function update(k:int):void
        {
            this.reportWarningsAsNeeded(k);
        }

        private function reportWarningsAsNeeded(k:int):void
        {
            var _local_2:LagWarningReportMessageComposer;
            if (this._warningCount == 0)
            {
                return;
            }
            if (((this._lastWarning == 0) || ((k - this._lastWarning) > this.warningInterval)))
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

        private function get warningInterval():int
        {
            return this._habboTracking.getInteger("lagWarningLog.interval.seconds", 10) * 1000;
        }
    }
}
