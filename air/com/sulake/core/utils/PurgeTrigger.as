//com.sulake.core.utils.PurgeTrigger

package com.sulake.core.utils{
    public class PurgeTrigger {

        private static var _softPurgeTriggerMegaBytes:uint;
        private static var _hardPurgeTriggerMegaBytes:uint;
        private static var _frequencyMilliSeconds:uint;
        private static var _running:Boolean;

        public function PurgeTrigger();

        public static function get softPurgeTriggerMegaBytes():uint;

        public static function set softPurgeTriggerMegaBytes(k:uint):void;

        public static function get hardPurgeTriggerMegaBytes():uint;

        public static function set hardPurgeTriggerMegaBytes(k:uint):void;

        public static function get frequencyMilliSeconds():uint;

        public static function set frequencyMilliSeconds(k:uint):void;

        public static function get isRunning():Boolean;

        protected static function get isMemoryDataAvailable():Boolean;

        public static function start():void;

        public static function stop():void;

        public static function trigger():void;

        public static function triggerGC():void;

        private static function onInterval():void;


    }
}//package com.sulake.core.utils

