//com.sulake.habbo.tracking.LatencyTracker

package com.sulake.habbo.tracking{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;

    public class LatencyTracker implements IDisposable {

        private var _state:Boolean;
        private var _testId:int;
        private var _testInterval:int;
        private var _reportIndex:int;
        private var _reportDelta:int;
        private var _lastTestTime:int;
        private var _lastReportedLatency:int;
        private var _latencyValues:Array;
        private var _timeStampMap:Map;
        private var _habboTracking:HabboTracking;
        private var _latencyPingResponseMessageEvent:IMessageEvent;

        public function LatencyTracker(k:HabboTracking);

        public function dispose():void;

        public function init():void;

        public function update(k:uint, _arg_2:int):void;

        private function testLatency():void;

        private function onPingResponse(k:LatencyPingResponseMessageEvent):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.tracking

