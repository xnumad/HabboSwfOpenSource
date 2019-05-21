package com.sulake.room.utils
{
    import flash.utils.getTimer;

    public class RoomEnterEffect 
    {
        public static const STATE_NOT_INITIALIZED:int = 0;
        public static const STATE_START_DELAY:int = 1;
        public static const STATE_RUNNING:int = 2;
        public static const STATE_OVER:int = 3;
        private static var _state:int = STATE_NOT_INITIALIZED;//0
        private static var _visualizationOn:Boolean = false;
        private static var _currentDelta:Number;
        private static var _initializationTimeMs:int = 0;
        private static var _startDelayMs:int = (20 * 1000);//20000
        private static var _effectDurationMs:int = 2000;


        public static function init(k:int, _arg_2:int):void
        {
            _currentDelta = 0;
            _startDelayMs = k;
            _effectDurationMs = _arg_2;
            _initializationTimeMs = getTimer();
            _state = STATE_START_DELAY;
        }

        public static function turnVisualizationOn():void
        {
            if (((_state == STATE_NOT_INITIALIZED) || (_state == STATE_OVER)))
            {
                return;
            }
            var k:int = (getTimer() - _initializationTimeMs);
            if (k > (_startDelayMs + _effectDurationMs))
            {
                _state = STATE_OVER;
                return;
            }
            _visualizationOn = true;
            if (k < _startDelayMs)
            {
                _state = STATE_START_DELAY;
                return;
            }
            _state = STATE_RUNNING;
            _currentDelta = ((k - _startDelayMs) / _effectDurationMs);
        }

        public static function turnVisualizationOff():void
        {
            _visualizationOn = false;
        }

        public static function isVisualizationOn():Boolean
        {
            return (_visualizationOn) && (isRunning());
        }

        public static function isRunning():Boolean
        {
            if (((_state == STATE_START_DELAY) || (_state == STATE_RUNNING)))
            {
                return true;
            }
            return false;
        }

        public static function getDelta(k:Number=0, _arg_2:Number=1):Number
        {
            return Math.min(Math.max(_currentDelta, k), _arg_2);
        }

        public static function get totalRunningTime():int
        {
            return _startDelayMs + _effectDurationMs;
        }
    }
}
