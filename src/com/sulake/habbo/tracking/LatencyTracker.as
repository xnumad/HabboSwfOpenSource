package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
    import com.sulake.habbo.communication.messages.parser._Str_524._Str_7576;
    import com.sulake.habbo.communication.messages.incoming._Str_516.PongMessageParser;

    public class LatencyTracker implements IDisposable 
    {
        private var _state:Boolean = false;
        private var _testId:int = 0;
        private var _testInterval:int = 0;
        private var _reportIndex:int = 0;
        private var _reportDelta:int = 0;
        private var _lastTestTime:int = 0;
        private var _lastReportedLatency:int = 0;
        private var _latencyValues:Array;
        private var _timeStampMap:Map;
        private var _habboTracking:HabboTracking;

        public function LatencyTracker(k:HabboTracking)
        {
            this._habboTracking = k;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._state = false;
            if (this._timeStampMap != null)
            {
                this._timeStampMap.dispose();
                this._timeStampMap = null;
            }
            this._latencyValues = null;
            this._habboTracking = null;
        }

        public function init():void
        {
            this._testInterval = this._habboTracking.getInteger("latencytest.interval", 20000);
            this._reportIndex = this._habboTracking.getInteger("latencytest.report.index", 100);
            this._reportDelta = this._habboTracking.getInteger("latencytest.report.delta", 3);
            if (this._testInterval < 1)
            {
                return;
            }
            this._timeStampMap = new Map();
            this._latencyValues = [];
            this._state = true;
        }

        public function update(k:uint, _arg_2:int):void
        {
            if (!this._state)
            {
                return;
            }
            if ((_arg_2 - this._lastTestTime) > this._testInterval)
            {
                this.testLatency();
            }
        }

        private function testLatency():void
        {
            this._lastTestTime = getTimer();
            this._timeStampMap.add(this._testId, this._lastTestTime);
            this._habboTracking.send(new LatencyPingRequestMessageComposer(this._testId));
            this._testId++;
        }

        public function _Str_17172(k:PongMessageParser):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:LatencyPingReportMessageComposer;
            if (((this._timeStampMap == null) || (this._latencyValues == null)))
            {
                return;
            }
            var _local_2:_Str_7576 = k.getParser();
            var _local_3:int = this._timeStampMap.getValue(_local_2.requestId);
            this._timeStampMap.remove(_local_2.requestId);
            var _local_4:int = (getTimer() - _local_3);
            this._latencyValues.push(_local_4);
            if (((this._latencyValues.length == this._reportIndex) && (this._reportIndex > 0)))
            {
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = 0;
                _local_8 = 0;
                while (_local_8 < this._latencyValues.length)
                {
                    _local_5 = (_local_5 + this._latencyValues[_local_8]);
                    _local_8++;
                }
                _local_9 = (_local_5 / this._latencyValues.length);
                _local_8 = 0;
                while (_local_8 < this._latencyValues.length)
                {
                    if (this._latencyValues[_local_8] < (_local_9 * 2))
                    {
                        _local_6 = (_local_6 + this._latencyValues[_local_8]);
                        _local_7++;
                    }
                    _local_8++;
                }
                if (_local_7 == 0)
                {
                    this._latencyValues = [];
                    return;
                }
                _local_10 = (_local_6 / _local_7);
                if (((Math.abs((_local_9 - this._lastReportedLatency)) > this._reportDelta) || (this._lastReportedLatency == 0)))
                {
                    this._lastReportedLatency = _local_9;
                    _local_11 = new LatencyPingReportMessageComposer(_local_9, _local_10, this._latencyValues.length);
                    this._habboTracking.send(_local_11);
                }
                this._latencyValues = [];
            }
        }

        public function get disposed():Boolean
        {
            return this._habboTracking == null;
        }
    }
}
