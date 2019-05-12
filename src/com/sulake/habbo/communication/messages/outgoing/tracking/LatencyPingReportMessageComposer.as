package com.sulake.habbo.communication.messages.outgoing.tracking
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LatencyPingReportMessageComposer implements IMessageComposer 
    {
        private var _averagePing:int;
        private var _clearedAveragePing:int;
        private var _pingCount:int;

        public function LatencyPingReportMessageComposer(k:int, _arg_2:int, _arg_3:int)
        {
            this._averagePing = k;
            this._clearedAveragePing = _arg_2;
            this._pingCount = _arg_3;
        }

        public function getMessageArray():Array
        {
            return [this._averagePing, this._clearedAveragePing, this._pingCount];
        }

        public function dispose():void
        {
        }
    }
}
