//com.sulake.habbo.tracking.PerformanceTracker

package com.sulake.habbo.tracking{
    import com.sulake.core.utils.debug.GarbageMonitor;

    public class PerformanceTracker {

        private var _counter:int;
        private var _averageUpdateInterval:Number = 0;
        private var _userAgent:String;
        private var _flashVersion:String;
        private var _operatingSystem:String;
        private var _cpuArchitecture:String;
        private var _isDebugger:Boolean;
        private var _garbageMonitor:GarbageMonitor;
        private var _gcCount:int;
        private var _slowUpdateCount:int;
        private var _lastReport:int;
        private var _reportCount:int;
        private var _lastAverage:Number = 0;
        private var _habboTracking:HabboTracking;

        public function PerformanceTracker(k:HabboTracking);

        private static function differenceInPercents(k:Number, _arg_2:Number):Number;


        public function get flashVersion():String;

        public function get averageUpdateInterval():int;

        private function updateGarbageMonitor():Object;

        public function update(k:uint, _arg_2:int):void;

        private function sendReport(k:int):void;

        private function get isGarbageMonitored():Boolean;

        private function get slowUpdateLimit():int;

        private function get reportInterval():int;

        private function get reportLimit():int;

        private function get meanDevianceLimit():Number;

        private function get useDistribution():Boolean;


    }
}//package com.sulake.habbo.tracking

