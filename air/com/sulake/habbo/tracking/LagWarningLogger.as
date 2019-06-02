//com.sulake.habbo.tracking.LagWarningLogger

package com.sulake.habbo.tracking{
    public class LagWarningLogger {

        private var _lastWarning:int;
        private var _warningCount:int;
        private var _habboTracking:HabboTracking;

        public function LagWarningLogger(k:HabboTracking);

        public function chatLagDetected(k:int):void;

        public function update(k:int):void;

        private function reportWarningsAsNeeded(k:int):void;

        private function get enabled():Boolean;

        private function get warningInterval():int;


    }
}//package com.sulake.habbo.tracking

