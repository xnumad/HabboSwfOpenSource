//com.sulake.room.utils.RoomEnterEffect

package com.sulake.room.utils{
    public class RoomEnterEffect {

        public static const STATE_NOT_INITIALIZED:int;
        public static const STATE_START_DELAY:int;
        public static const STATE_RUNNING:int;
        public static const STATE_OVER:int;
        private static var _state:int;
        private static var _visualizationOn:Boolean;
        private static var _currentDelta:Number;
        private static var _initializationTimeMs:int;
        private static var _startDelayMs:int;
        private static var _effectDurationMs:int;

        public function RoomEnterEffect();

        public static function init(k:int, _arg_2:int):void;

        public static function turnVisualizationOn():void;

        public static function turnVisualizationOff():void;

        public static function isVisualizationOn():Boolean;

        public static function isRunning():Boolean;

        public static function getDelta(k:Number=0, _arg_2:Number=1):Number;

        public static function get totalRunningTime():int;


    }
}//package com.sulake.room.utils

