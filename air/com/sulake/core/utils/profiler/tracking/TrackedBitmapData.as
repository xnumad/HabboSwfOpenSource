//com.sulake.core.utils.profiler.tracking.TrackedBitmapData

package com.sulake.core.utils.profiler.tracking{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class TrackedBitmapData extends BitmapData {

        public static const MAX_SIZE:int;
        public static const MAX_WIDTH:int;
        public static const MAX_HEIGHT:int;
        public static const MIN_SIZE:int;
        public static const MIN_WIDTH:int;
        public static const MIN_HEIGHT:int;
        private static var _numInstances:uint;
        private static var _allocatedByteCount:uint;
        private static const ZERO_POINT:Point;

        private var _owner:Object;
        private var _disposed:Boolean;

        public function TrackedBitmapData(k:*, _arg_2:int, _arg_3:int, _arg_4:Boolean=true, _arg_5:uint=0xFFFFFFFF);

        public static function get numInstances():uint;

        public static function get allocatedByteCount():uint;


        override public function dispose():void;

        override public function clone():BitmapData;


    }
}//package com.sulake.core.utils.profiler.tracking

