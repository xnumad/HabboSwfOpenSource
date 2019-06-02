package com.sulake.habbo.tracking
{
    import com.sulake.core.utils.debug.GarbageMonitor;
    import flash.system.Capabilities;
    import flash.external.ExternalInterface;
    import flash.utils.getTimer;
    import flash.system.System;
    import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;

    public class PerformanceTracker 
    {
        private var _counter:int = 0;
        private var _averageUpdateInterval:Number = 0;
        private var _userAgent:String = "";
        private var _flashVersion:String = "";
        private var _operatingSystem:String = "";
        private var _cpuArchitecture:String = "";
        private var _isDebugger:Boolean = false;
        private var _garbageMonitor:GarbageMonitor = null;
        private var _gcCount:int = 0;
        private var _slowUpdateCount:int = 0;
        private var _lastReport:int = 0;
        private var _reportCount:int = 0;
        private var _lastAverage:Number = 0;
        private var _habboTracking:HabboTracking;

        public function PerformanceTracker(k:HabboTracking)
        {
            this._habboTracking = k;
            this._flashVersion = Capabilities.version;
            this._operatingSystem = Capabilities.os;
            this._isDebugger = Capabilities.isDebugger;
            try
            {
                this._userAgent = ((ExternalInterface.available) ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown");
            }
            catch(e:Error)
            {
            }
            if (this._userAgent == null)
            {
                this._userAgent = "unknown";
            }
            this._garbageMonitor = new GarbageMonitor();
            this.updateGarbageMonitor();
            this._lastReport = getTimer();
        }

        private static function differenceInPercents(k:Number, _arg_2:Number):Number
        {
            if (k == _arg_2)
            {
                return 0;
            }
            var _local_3:Number = k;
            var _local_4:Number = _arg_2;
            if (_arg_2 > k)
            {
                _local_3 = _arg_2;
                _local_4 = k;
            }
            return 100 * (1 - (_local_4 / _local_3));
        }


        public function get flashVersion():String
        {
            return this._flashVersion;
        }

        public function get averageUpdateInterval():int
        {
            return this._averageUpdateInterval;
        }

        private function updateGarbageMonitor():Object
        {
            var _local_2:Object;
            var k:Array = this._garbageMonitor.list;
            if (((k == null) || (k.length == 0)))
            {
                _local_2 = new GarbageTester("tester");
                this._garbageMonitor.insert(_local_2, "tester");
                return _local_2;
            }
            return null;
        }

        public function update(k:uint, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:uint;
            var _local_7:Boolean;
            var _local_8:Number;
            if (this.isGarbageMonitored)
            {
                _local_4 = this.updateGarbageMonitor();
                if (_local_4 != null)
                {
                    this._gcCount++;
                    Logger.log("Garbage collection");
                }
            }
            var _local_3:Boolean;
            if (k > this.slowUpdateLimit)
            {
                this._slowUpdateCount++;
                _local_3 = true;
            }
            else
            {
                this._counter++;
                if (this._counter <= 1)
                {
                    this._averageUpdateInterval = k;
                }
                else
                {
                    _local_5 = Number(this._counter);
                    this._averageUpdateInterval = (((this._averageUpdateInterval * (_local_5 - 1)) / _local_5) + (Number(k) / _local_5));
                }
            }
            if ((((_arg_2 - this._lastReport) > (this.reportInterval * 1000)) && (this._reportCount < this.reportLimit)))
            {
                _local_6 = System.totalMemory;
                Logger.log((((("*** Performance tracker: average frame rate " + (1000 / this._averageUpdateInterval)) + "/s, system memory usage : ") + _local_6) + " bytes"));
                _local_7 = true;
                if (((this.useDistribution) && (this._reportCount > 0)))
                {
                    _local_8 = differenceInPercents(this._lastAverage, this._averageUpdateInterval);
                    if (_local_8 < this.meanDevianceLimit)
                    {
                        _local_7 = false;
                    }
                }
                this._lastReport = _arg_2;
                if (((_local_7) || (_local_3)))
                {
                    this._lastAverage = this._averageUpdateInterval;
                    this.sendReport(_arg_2);
                    this._reportCount++;
                }
            }
        }

        private function sendReport(k:int):void
        {
            var _local_2:int = (k / 1000);
            var _local_3:int = -1;
            var _local_4:int = (System.totalMemory / 0x0400);
            this._habboTracking.send(new PerformanceLogMessageComposer(_local_2, this._userAgent, this._flashVersion, this._operatingSystem, this._cpuArchitecture, this._isDebugger, _local_4, _local_3, this._gcCount, this._averageUpdateInterval, this._slowUpdateCount));
            this._gcCount = 0;
            this._averageUpdateInterval = 0;
            this._counter = 0;
            this._slowUpdateCount = 0;
        }

        private function get isGarbageMonitored():Boolean
        {
            return this._habboTracking.getBoolean("monitor.garbage.collection");
        }

        private function get slowUpdateLimit():int
        {
            return this._habboTracking.getInteger("performancetest.slowupdatelimit", 1000);
        }

        private function get reportInterval():int
        {
            return this._habboTracking.getInteger("performancetest.interval", 60);
        }

        private function get reportLimit():int
        {
            return this._habboTracking.getInteger("performancetest.reportlimit", 10);
        }

        private function get meanDevianceLimit():Number
        {
            return (this._habboTracking.propertyExists("performancetest.distribution.deviancelimit.percent")) ? Number(this._habboTracking.getProperty("performancetest.distribution.deviancelimit.percent")) : 10;
        }

        private function get useDistribution():Boolean
        {
            return this._habboTracking.getBoolean("performancetest.distribution.enabled");
        }
    }
}
