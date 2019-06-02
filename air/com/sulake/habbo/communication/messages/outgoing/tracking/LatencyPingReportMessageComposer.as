//com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer

package com.sulake.habbo.communication.messages.outgoing.tracking{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class LatencyPingReportMessageComposer implements IMessageComposer {

        private var _averagePing:int;
        private var _clearedAveragePing:int;
        private var _pingCount:int;

        public function LatencyPingReportMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.tracking

