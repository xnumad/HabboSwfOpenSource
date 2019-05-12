package com.sulake.core.utils
{
    import flash.utils.setTimeout;
    import flash.system.System;
    import flash.utils.getTimer;
    import com.sulake.core.Core;

    public class PurgeTrigger 
    {
        private static var _softPurgeTriggerMegaBytes:uint = 300;
        private static var _hardPurgeTriggerMegaBytes:uint = 400;
        private static var _frequencyMilliSeconds:uint = (60 * 1000);//60000
        private static var _running:Boolean = false;


        public static function get softPurgeTriggerMegaBytes():uint
        {
            return _softPurgeTriggerMegaBytes;
        }

        public static function set softPurgeTriggerMegaBytes(k:uint):void
        {
            _softPurgeTriggerMegaBytes = k;
        }

        public static function get hardPurgeTriggerMegaBytes():uint
        {
            return _hardPurgeTriggerMegaBytes;
        }

        public static function set hardPurgeTriggerMegaBytes(limit:uint):void
        {
            _hardPurgeTriggerMegaBytes = Math.max(limit, _softPurgeTriggerMegaBytes);
        }

        public static function get frequencyMilliSeconds():uint
        {
            return _frequencyMilliSeconds;
        }

        public static function set frequencyMilliSeconds(limit:uint):void
        {
            _frequencyMilliSeconds = limit;
        }

        public static function get running():Boolean
        {
            return _running;
        }

        protected static function get isMemoryDataAvailable():Boolean
        {
            return (Player.majorVersion > 10) || ((Player.majorVersion == 10) && (Player.majorRevision >= 1));
        }

        public static function start():void
        {
            if (!_running)
            {
                if (!isMemoryDataAvailable)
                {
                    _frequencyMilliSeconds = (_frequencyMilliSeconds * 2);
                    _softPurgeTriggerMegaBytes = 0;
                    _hardPurgeTriggerMegaBytes = int.MAX_VALUE;
                }
                setTimeout(onInterval, _frequencyMilliSeconds);
                _running = true;
            }
        }

        public static function stop():void
        {
            if (_running)
            {
                _running = false;
            }
        }

        public static function trigger():void
        {
            var timer:int;
            var _local_4:Number;
            var k:Object = System;
            var _local_2:Number = ((isMemoryDataAvailable) ? (((k.totalMemory - k.freeMemory) / 0x0400) / 0x0400) : (softPurgeTriggerMegaBytes + 1));
            if (_local_2 > softPurgeTriggerMegaBytes)
            {
                timer = getTimer();
                Core.purge();
                _local_4 = ((isMemoryDataAvailable) ? (((k.totalMemory - k.freeMemory) / 0x0400) / 0x0400) : 0);
                if (_local_4 > _hardPurgeTriggerMegaBytes)
                {
                    triggerGC();
                }
            }
        }

        public static function triggerGC():void
        {
            System.pauseForGCIfCollectionImminent(0.25);
        }

        private static function onInterval():void
        {
            if (_running)
            {
                trigger();
                setTimeout(onInterval, _frequencyMilliSeconds);
            }
        }
    }
}
