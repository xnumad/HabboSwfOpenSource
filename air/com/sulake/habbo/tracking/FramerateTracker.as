//com.sulake.habbo.tracking.FramerateTracker

package com.sulake.habbo.tracking{
    public class FramerateTracker {

        private var _lastReport:int;
        private var _updateCounter:int;
        private var _averageUpdateInterval:Number;
        private var _eventCounter:int;
        private var _habboTracking:HabboTracking;

        public function FramerateTracker(k:HabboTracking);

        public function get frameRate():int;

        public function trackUpdate(k:uint, _arg_2:int):void;


    }
}//package com.sulake.habbo.tracking

